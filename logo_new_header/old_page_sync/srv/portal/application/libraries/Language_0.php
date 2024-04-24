<?php

/**
 * Багатомовність
 *
 */
class Language_Core {
	

    public static function getPrefix(){
        $result = '';
        if (Kohana::config('locale.det_lang') == 2 && Kohana::config('locale.language.0') != Kohana::config('locale.default_lang')){
        	$result = '/' . Kohana::config('locale.language.0');        	
        }  	
        return $result;
     }   
   
	/**
	 * Визначення і встановлення мови сайту
	 *
	 */
	public static function applyLang(){				
        $arrLang = self::getLangData();         
        $applyLang = Kohana::config('locale.default_lang');
       
        if(Kohana::config('locale.det_lang') == 1){//Визначення мови з назви сайту (ua.rads.gov.ua, ru.rads.gov.ua)
        	if (preg_match('~^[a-z]{2}(?=[.])~i', $_SERVER["SERVER_NAME"], $matches)){
	    		if(!array_key_exists(strtolower($matches[0]), $arrLang)){
	    			Event::run('system.404'); //мова задана невірно
	    			
	    		}        		
        		$applyLang = strtolower($matches[0]);	    		
        		
        	}
        	
        	
        }	elseif (Kohana::config('locale.det_lang') == 2){//Визначення мови з стрічки запиту rads.gov.ua/ua/news, rads.gov.ua/ua/news

			if (preg_match('~^[a-z]{2}(?=/|$)~i', Router::$current_uri, $matches)){
	    		if(!array_key_exists(strtolower($matches[0]), $arrLang)){
	    			Event::run('system.404'); //мова задана невірно
	    			
	    		}
	
	    		$applyLang = strtolower($matches[0]);	    		
				Router::$current_uri = substr(Router::$current_uri, 3);        		
				if (empty(Router::$current_uri)) {
					Router::$current_uri = Kohana::config('routes._default');
				}
				
	        }	        
        	
        		
        }

       
		//Збереження поточних налаштувань
		self::setLocale($applyLang, $arrLang[$applyLang]['l_fullname']);
                
		
	}
	
	/**
	 * Встановлення локалі
	 *
	 * @param string $langNick - псевдонім мови
	 * @param string $langFullName - повна назва мови
	 */
	 public static function setLocale($langNick, $langFullName=''){
		setlocale(LC_ALL, $langNick.'.UTF-8');
		Kohana::config_set('locale.language', array($langNick, (strlen($langFullName)>0 ? $langFullName : $langNick)));	 	
	 	
	 	
	 }
	
	
    /**
     * Доступні мови
     *
     * @return array
     */
    public static function getLangData(){
    	$cache = Cache::instance();
    	$db = Database::instance();
    	
    //   $langData = ''; //! mirs
        $langData = $cache->get('lang');
        if(!$langData){
        	$langData = array();        	
	        $lang = $db->select('l.*, th.th_folder')
					   ->from('lang l')
					   ->join('themes th', 'l.th_id', 'th.th_id', 'INNER')
					   ->where('l_status',1)
					   ->orderby(array('l_index'=>'asc'))
					   ->get();          	
							 
			foreach ($lang->result(false) as $row)	{
				$langData[strtolower($row['l_langnick'])] = $row;
				
			}    	
        	$cache->set('lang', $langData, null, 0);
        }
    	return $langData;
    }	
    
    /**
     * Повертає масив мов для шаблона
     *
     * @return array
     */
    public static function getLangSelector(){    	
        
        
        $arrLang = self::getLangData();
        
        $rowSelector = count($arrLang)-1;
        $resultData = array();                
        foreach ($arrLang as $row) {

	    switch (Kohana::config('locale.det_lang')) {

		case 1:
		    if ($row['l_langnick'] === Kohana::config('locale.default_lang')) { //Мова позамовчуванню
			$resultData[] = array('anchor' => url::base(),
			    'name' => $row['l_shortname'],
			    'langnick' => $row['l_langnick'],
			    'active' => ($row['l_langnick'] == Kohana::config('locale.language.0') ? 1 : 0));
		    } else {
			$resultData[] = array('anchor' => str_replace(Kohana::config('core.site_domain', TRUE), $row['l_langnick'] . '.' . Kohana::config('core.site_domain', TRUE), url::base()),
			    'name' => $row['l_shortname'],
			    'langnick' => $row['l_langnick'],
			    'active' => ($row['l_langnick'] == Kohana::config('locale.language.0') ? 1 : 0));
		    }
		    break;

		case 2:
		    if ($row['l_langnick'] === Kohana::config('locale.default_lang')) { //Мова позамовчуванню
			$resultData[] = array('anchor' => '/',
			    'name' => $row['l_shortname'],
			    'langnick' => $row['l_langnick'],
			    'active' => ($row['l_langnick'] == Kohana::config('locale.language.0') ? 1 : 0));
		    } else {
			$resultData[] = array('anchor' => '/' . $row['l_langnick'],
			    'name' => $row['l_shortname'],
			    'langnick' => $row['l_langnick'],
			    'active' => ($row['l_langnick'] == Kohana::config('locale.language.0') ? 1 : 0));
		    }
		    break;
	    }
	}

	array_multisort($resultData, SORT_NUMERIC, SORT_DESC);
	return  array_reverse($resultData); //!mirs
    	
    }

}
?>