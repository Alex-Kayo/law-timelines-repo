<?php

/**
 * Робота з ресурсами
 *
 */
class Resource_Core {
	
	/**
	 * Розширення мета-файла при блокуванні
	 *
	 */
	const locExstension = 'lock';
	
	
	
	
	/**
	 * Об"єкт класу DB
	 *
	 * @var object
	 */
	private $db;
	

	/**
	 * Конструктор класу
	 *
	 */
	public function __construct(){
		$this->db = Database::instance();

		set_time_limit(0);    	
	}
	
	
	/**
	 * Кешування ресурсів
	 *
	 * @param string $sourceName - назва ресурса $config['source']
	 * @param number $id - id ресурса 
	 * 
	 */
	public function base_cached($sourceName, $dirSave, $id){
		$sourceName = strtolower($sourceName);
		$dirSave = strtolower($dirSave);

    	$arrSource = Kohana::config('resource.source');
    	if(!isset($arrSource[$sourceName])){
    		Event::run('system.404');
    		
    	}		    	

		if(!is_dir(Kohana::config('resource.res_directory') . $dirSave)){
			Event::run('system.404');	
			
		}

		if(strlen($id) == 0){
			Event::run('system.404');	
			
		}
	

    	// Kohana::config('resource.meta_directory') .
    	$nameLockFile =  md5($id);

    	//Перевірка чи файл заблокований (проводиться кешування)
    	if($this->isLocked($nameLockFile)){
    		Event::run('system.404');
    		
    	}
    
    	if(!$this->setLock($nameLockFile)){
    		Event::run('system.404');
    		
    	}    	
    	
   	
    	//Kohana::config('resource.res_directory') . (strlen($dirSave)>0?$dirSave . "/" : "")
    	if(is_numeric($id)){
	    	$strSQL = "SELECT " . $arrSource[$sourceName]['field_lob'] . " as lob_data,".
	    		" '". Kohana::config('resource.res_directory') . $dirSave . (strlen($dirSave) > 0 && substr($dirSave, -1) != '/' ? '/' :'') ."'||to_char(" .$arrSource[$sourceName]['field_id'] . ")||'.'||".$arrSource[$sourceName]['field_type'] . " as file_name" .
	    		" FROM " . $arrSource[$sourceName]['table']. 
	    		" WHERE " . $arrSource[$sourceName]['field_id'] ."=" .$id;
    	}	else {
	    	$strSQL = "SELECT " . $arrSource[$sourceName]['field_lob'] . " as lob_data,".
	    		" '". Kohana::config('resource.res_directory') . $dirSave . (strlen($dirSave) > 0 && substr($dirSave, -1) != '/' ? '/' :'') ."'||" .$arrSource[$sourceName]['field_id'] . "||'.'||".$arrSource[$sourceName]['field_type'] . " as file_name" .
	    		" FROM " . $arrSource[$sourceName]['table']. 
	    		" WHERE " . $arrSource[$sourceName]['field_id'] ."='" . $id . "'";    		
    		
    		
    	}
    	$arrSaveFile = 	$this->db->lobQueryToFile($strSQL, 'lob_data', 'file_name');
    	if(count($arrSaveFile) == 0){
    		$this->setLock($nameLockFile, false); 
    		Event::run('system.404');
    		
    	}
    	
    	//Запустити пост-функцію обробки файла
    	if(isset($arrSource[$sourceName]['post_function']) && strlen($arrSource[$sourceName]['post_function']) > 0){    		
    		call_user_func($arrSource[$sourceName]['post_function'], $arrSaveFile[0]);
    		
    	}
    	
    	$this->setLock($nameLockFile, false);    	
    	
    	$this->print_file($arrSaveFile[0]);
		
    	
    	
	}
	
	
	
	
	/**
	 * Кешування ресурсів IM
	 *
	 * @param string $path - шлях до ресурсу
	 * @param string $filename - назва файлу
	 */
	public function im_cached($path, $filename){		
		$path = strtolower($path);
		$filename = strtolower($filename);
		               
		if(strlen($filename) == 0){
			Event::run('system.404');	
			
		}		
		
    	$nameLockFile =  md5($path . '/' . $filename);
    	// var_dump($nameLockFile); die();
    	//Перевірка чи файл заблокований (проводиться кешування)
    	if($this->isLocked($nameLockFile)){
          //  var_dump(1); die();
    		Event::run('system.404');
    		
    	}
    
    	if(!$this->setLock($nameLockFile)){
         //   var_dump(1); die();
    		Event::run('system.404');
    		
    	} 
    	
    	$strSQL = "SELECT im_content as lob_data,".
    		" '". DOCROOT . "' || im_path || '/' || im_name as file_name" .
    		" FROM im " . 
    		" WHERE im_path = '" . $path . "' AND im_name ='" . $filename . "'" .
    		" AND im_type=1" ;
    		//  var_dump($strSQL); die();
    	$arrSaveFile = 	$this->db->lobQueryToFile($strSQL, 'lob_data', 'file_name');
    	
    	if(count($arrSaveFile) == 0){
    		$this->setLock($nameLockFile, false); 
    		Event::run('system.404');
    		
    	}    		
    	
        $this->setLock($nameLockFile, false);    	
    	$this->print_file($arrSaveFile[0]);
	}
	
	
	
	/**
	 * Print file
	 *
	 * @param string $filename - Назва файла
	 */
	private function print_file($filename){
		$type = substr($filename,strrpos($filename,'.')+1);
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control:");
        header("Cache-Control: public");
        header('Content-Description: Resource Transfer');
        header("Content-Type: " . Kohana::config('mimes.' . $type . '.0'));
        header("Content-Transfer-Encoding: binary");
		header("Content-Length: " . filesize($filename));		

		print file_get_contents($filename);
		flush();		
	}
	
	
	
	
	
	/**
	 * Перевірка чи файл заблокований 
	 *
	 * @param string $nameLockFile - назва файлу блокування
	 * 
	 * @return boolean
	 */
	private function isLocked($nameLockFile){
		$lockFile = Kohana::config('resource.lock_directory') . '/' . $nameLockFile;
          //     var_dump($lockFile); die();
		if(file_exists($lockFile)){
			$expireTime = unserialize(file_get_contents($lockFile));
			if($expireTime < time()){
				unlink($lockFile);
				return false;
			}			
			return true;
			
		}	else {
			return false;
			
		} 		
		
	}
	

	/**
	 * Блокування файлу на час створення кешу
	 *
	 * @param string $nameLockFile - назва файлу блокування
	 * @param bool $flagBlock - признак блокування (true - блокувати, false - розблокувати)
	 * 
	 * @return boolean
	 */
	private function setLock($nameLockFile, $flagBlock=true){
		if(($flagBlock && $this->isLocked($nameLockFile)) || (!$flagBlock && !$this->isLocked($nameLockFile)) ){
			return false;
			
		}	
		
		$lockFile = Kohana::config('resource.lock_directory') . '/' . $nameLockFile;
		
		if($flagBlock){
			$expireTime = time() + Kohana::config('resource.max_lock_time');
			file_put_contents($lockFile, serialize($expireTime));			
	        chmod($lockFile, 0666);    
	        
		}  else {
			unlink($lockFile); 
			
			
		}
		//var_dump(true); die();
        return true;
           		
	} 	
	
	
	

	
}

?>