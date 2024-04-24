<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Ext helper class.
 *
 * @package    Core
 * @author     Oleh Zamkovyi <oleh.zam@gmail.com>
 */
class view_hash_Core {

   
	/**
	 * Провірка актуальності шаблонів і ресурсів
	 *
	 * @param string $currentNickLang - псевдонім потосної мови
	 */
    public static function check($currentNickLang) {
        
        $db = Database::instance();
        $listModules = $db->select('m_id, m_nickname, th_folder, th_id')->from('modules, themes')->where('m_type', "'front'")->where('m_status',1)->orderby(array('th_id' => 'asc'))->get();
    	

       // $dir = APPPATH.'views';            
       $dir = Kohana::config('templates.default.template_root');
       
		$themePath = $dir . $db->select('th_folder')->from('themes')
			->join('lang', 'lang.th_id', "themes.th_id and lang.l_langnick = '" . $currentNickLang . "'", 'INNER')->get()->current()->th_folder;

		$arrHash = array();
		if(file_exists($themePath . '/hash.txt')){
			$arrHash = unserialize(file_get_contents($themePath . '/hash.txt'));
			
		}
		$arrHash['TEMPLATES'] = (isset($arrHash['TEMPLATES']) && is_array($arrHash['TEMPLATES']) ? $arrHash['TEMPLATES'] : array());
		$arrHash['TEMPLATE_RESOURCES'] = (isset($arrHash['TEMPLATE_RESOURCES']) && is_array($arrHash['TEMPLATE_RESOURCES']) ? $arrHash['TEMPLATE_RESOURCES'] : array());
		
		
		//створення файлів шаблонів
		$query = Database::instance()->query("select tpl_id, th_folder||'/'||tpl_path as f_path, tpl_hash
				from templates
				inner join lang on lang.th_id=templates.th_id and lang.l_langnick='$currentNickLang' 
				inner join themes on themes.th_id=templates.th_id");


		
		foreach ($query->result() as $row){
			if(!isset($arrHash['TEMPLATES'][$row->f_path]) || $arrHash['TEMPLATES'][$row->f_path] != $row->tpl_hash || !file_exists(Kohana::config('templates.default.template_root') . $row->f_path)){    				    				
				self::create_dir($dir, substr($row->f_path, 1));
				file_put_contents($dir . $row->f_path, 
					$db->select('tpl_data')->from('templates')->where('tpl_id', $row->tpl_id)->get()->current()->tpl_data);
				
				$arrHash['TEMPLATES'][$row->f_path] = md5_file($dir . $row->f_path);
				
			}
			
		}
		
		
		//створення файлів ресурсів шаблонів
		$query = Database::instance()->query("select distinct tr.tr_id, th_folder||'/'||tr.tr_path as f_path, tr.tr_hash
			from template_resources tr
			inner join template_resources_link trl on trl.tr_id=tr.tr_id  
			inner join templates on templates.tpl_id=trl.tpl_id
			inner join lang on lang.th_id=templates.th_id and lang.l_langnick='$currentNickLang' 
			inner join themes on themes.th_id=templates.th_id");
		
		$dir_resource = Kohana::config('templates.default.files_path');
		
		foreach ($query->result() as $row){
			if(!isset($arrHash['TEMPLATE_RESOURCES'][$row->f_path]) || $arrHash['TEMPLATE_RESOURCES'][$row->f_path] != $row->tr_hash || !file_exists(Kohana::config('templates.default.files_path') . $row->f_path)){
				
				self::create_dir($dir_resource, substr($row->f_path, 1));
				
				file_put_contents($dir_resource . $row->f_path, 
					$db->select('tr_data')->from('template_resources')->where('tr_id', $row->tr_id)->get()->current()->tr_data);
				
				$arrHash['TEMPLATE_RESOURCES'][$row->f_path] = md5_file($dir_resource . $row->f_path);
				
			}
			
		}
		
		
			
		//створення файлу хеш файлу
		file_put_contents($themePath . '/hash.txt', serialize($arrHash));
		
    	

    }
    
    
    /**
     * Створення дир шаблонів
     *
     * @param string $startDir - коренева дир шаблонів
     * * @param string $themePath - шлях до файла теми
     */
    private static function create_dir($startDir, $themePath) {
		$dirs = explode('/', $themePath);
		for($i = 0; $i < count($dirs)-1; $i++ )
		{
			$startDir = $startDir.'/'.$dirs[$i];

            if (substr_count($startDir, '/') == 1) $startDir = APPPATH.'views'.$startDir;
			if (!file_exists($startDir))
				mkdir($startDir);
		}    	
    	
    	
    }
    
    
    
    /**
     * Завантаження шаблонів і ресурсів в БД
     *
     * @param int - ідентифыіатор теми оновлення
     */
    public static function upload_db($th_id) {
        
        $rootUploadTPL = DOCROOT . 'upload_template/tpl/';
        $rootUploadResources = DOCROOT . 'upload_template/resource/';
        
    	$db = Database::instance();

		//очистка таблиць зв"язаних с шаблонами для вибранної теми
		$db->query("delete from templates WHERE th_id = $th_id");
		
		    		    		
		$listModules = $db->select('m_id, m_nickname, th_folder, th_id')
		  ->from("modules, (select * from themes where th_id=$th_id)")
		  ->where('m_type', "'front'")
		  ->where('m_status',1)
		  ->orderby(array('th_id' => 'asc'))->get();
		
		foreach ($listModules->result() as $module){
			$dirModules = $rootUploadTPL . $module->m_nickname . '/';
			//Завантаження шаблонів (TEMPLATES)
			$arrTemplateIDs = array();
			if (is_dir($dirModules)) {
			    if ($dh = opendir($dirModules)) {				    	
			        while (($file = readdir($dh)) !== false) {
                        
			        	if (!in_array($file, array(".", "..", "/", ".svn"))) {

			        		$arrTemplates = array(
			        			'tpl_nickname' => $file, 
			        			'tpl_name' => $file, 
			        			'tpl_description' => $file, 
			        			'tpl_data' => file_get_contents($dirModules . $file), 
			        			'tpl_path' => $module->m_nickname . '/' . $file, 
			        			'tpl_hash' => md5_file($dirModules . $file),
			        			'th_id' => $module->th_id
			        		);
			        		$tpl_id = $db->insert('templates', $arrTemplates)->insert_id();
			        		$arrTemplateIDs[] = $tpl_id;				        		
			        		$db->insert('modules_templates', array('m_id' => $module->m_id, 'tpl_id' => $tpl_id));
			        		
			        	}
			            
			        }
			        closedir($dh);
			    }
			}    	
			
			
			//Завантаження ресурсів (TEMPLATE_RESOURCES)
			$dirResources = $rootUploadResources . $module->m_nickname . '/';
			if (is_dir($dirResources)) {
			    if ($dh = opendir($dirResources)) {				    	
			        while (($file = readdir($dh)) !== false) {
			        	if (!in_array($file, array(".", "..", "/", ".svn"))) {
			        		if(!is_file($dirResources.$file)){
			        			continue;
			        			
			        		}

			        		$tmpExt = explode('.',$file);
			        		$ext = strtolower($tmpExt[count($tmpExt)-1]);				        		
			        		$typeResource = 'other';
			        		switch ($ext){
			        			case 'css': 
			        				$typeResource = 'css'; 
			        				break;
			        				
			        			case 'js': 
			        				$typeResource = 'javascript'; 
			        				break;				        								        				
			        				
			        			default:	
			        				$typeResource = 'img'; 
			        			
			        		}
			        		
			        		
			        		
			        		
			        		$arrResource = array(
			        			'tr_nickname' => $file, 
			        			'tr_name' => $file, 
			        			'tr_description' => $file, 
			        			'tr_type' => $typeResource,
			        			'tr_data' => file_get_contents($dirResources . $file), 
			        			'tr_path' => $module->m_nickname . '/' . $file, 
			        			'tr_hash' => md5_file($dirResources . $file)
			        		);
			        		$tr_id = $db->insert('template_resources', $arrResource)->insert_id();
			        		
			        		//привязка ресурса до шаблона
			        		foreach ($arrTemplateIDs as $item){
			        			$db->insert('template_resources_link', array('tpl_id' => $item, 'tr_id' => $tr_id));
			        			
			        			
			        		}
			        		
			        	}
			            
			        }
			        closedir($dh);
			    }
			}    	

		}
		    	
    	
    }
    
    
     /**
     * Удаление все шаблонов с диска
     *
     */
    public static function del_tpl() {
    	$db = Database::instance();
    	
    	
		$listModules = $db->select('m_id, m_nickname, th_folder, th_id')->from('modules, themes')->where('m_type', "'front'")->where('m_status',1)->orderby(array('th_id' => 'asc'))->get();
		foreach ($listModules->result() as $module){
			$dirModules = Kohana::config('templates.default.template_root') . $module->th_folder . (substr($module->th_folder,-1) != '/' ? '/' : '') . $module->m_nickname . '/';
			//Завантаження шаблонів (TEMPLATES)
			$arrTemplateIDs = array();
			if (is_dir($dirModules)) {
			    if ($dh = opendir($dirModules)) {				    	
			        while (($file = readdir($dh)) !== false) {
                        
			        	if (!in_array($file, array(".", "..", "/", ".svn"))) {
			        		unlink($dirModules . $file);
			        		
			        	}
			            
			        }
			        closedir($dh);
			    }
			}    	    	
    	
    	
  	  }
  	  if(file_exists(Kohana::config('templates.default.template_root') . $module->th_folder .'/hash.txt')){
  	  	unlink(Kohana::config('templates.default.template_root') . $module->th_folder .'/hash.txt');
  	  }
  	  
    }
    
    
    

} // End ext