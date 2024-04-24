<?php defined('SYSPATH') OR die('No direct access allowed.');


/**
 * Налаштування сайту
 *
 */
class Configsaver_core {

	
	/**
	 * Диреторія конфігураційних файлів
	 *
	 * string
	 */
	const config_dir = 'config';
	
	private $db;

	public function __construct(){
        if ( ! is_object($this->db))
        {
            // Load the default database
            $this->db = Database::instance();
        }


	}
	
	public function recreateFrontend(){
		$resultConfig = $this->db->select('mc_name, mc_hash')->from('module_config')->get();
		foreach ($resultConfig->result() as $row){
			$fileName = APPPATH . self::config_dir . '/' . $row->mc_name . ".php";

		
			if(!file_exists($fileName) || md5_file($fileName) != $row->mc_hash){
				$this->createConfigFile($row->mc_name);
				
			}
			
		}
	    
		
	}
	
	
	/**
	 * Сформувати файли конфігурації
	 *
	 */
	public function createConfigFile($nameTemplate = null){
		Kohana::auto_load('Resource_db');
		
        $tpl = new Template;
        
		$tpl->register_resource("db", array(&$this, "tpl_resource_db_source",
		                                     "tpl_resource_db_timestamp",
		                                     "tpl_resource_db_secure",
		                                     "tpl_resource_db_trusted"));        

		
		 $this->db->select('*')->from('module_config_value')->orderby(array('mc_name'=>'asc'));
		 if(!is_null($nameTemplate)){
		 	$this->db->where('mc_name', "'" . $nameTemplate . "'");
		 	
		 	
		 }

		   
		                                     
		$queryVar = $this->db->get();
		$nCount = $this->db->count_last_query();		
		$lastTamplateName = '';
		$nRow = 0;
		foreach ($queryVar->result() as $row){
			$nRow++;
			
			if(!empty($lastTamplateName) && $lastTamplateName != $row->mc_name){
				$this->saveConfig($lastTamplateName, $tpl->fetch("db:" . $lastTamplateName));
				$tpl->clear_all_assign();
			}

			
			$tpl->assign($row->mv_name, $row->mv_value);						
			$lastTamplateName = $row->mc_name;
		}
		
		if(!empty($lastTamplateName)){			
			$this->saveConfig($lastTamplateName, $tpl->fetch("db:" . $lastTamplateName));
			
			
		}
		
	}
	
	

	/**
	 * Опис методів ресурсу для роботи з БД
	 *
	 * @param string $tpl_name - назва шаблону
	 * @param string $tpl_source - ресурс шаблону
	 * @param object $smarty - об"єкт шаблонізатора
	 * @return boolean
	 */
	public function tpl_resource_db_source($tpl_name, &$tpl_source, &$smarty){		
		$query = $this->db->select('mc_template')->from('module_config')->where('mc_name',"'" . $tpl_name . "'")->get()->current();
		
		if(is_object($query)){
			$tpl_source = $query->mc_template;
			return true;
			
		}	else {
			return;
			
		}
		
	}	
	//не використувується
	public  function tpl_resource_db_timestamp($tpl_name, &$tpl_timestamp, &$smarty){
		return true;
	}
	//не використувується
	public function tpl_resource_db_secure($tpl_name, &$smarty){
	    return true;
	}
	//не використувується
	public function tpl_resource_db_trusted($tpl_name, &$smarty){
	    
	}	
	
	

	/**
	 * Запис в файл налаштувань
	 *
	 * @param string $configName - Назва налаштувань
	 * @param string $dataFile - значення 
	 */
	private function saveConfig($configName, $dataFile){
		$fileName = APPPATH . self::config_dir . '/' . $configName . ".php";
				
		if(file_exists($fileName)){
			unlink($fileName);
			
		}
		file_put_contents($fileName, $dataFile);
		chmod($fileName, 0666);		
		
		$this->db->update('module_config', array('mc_hash' => md5($dataFile)), "mc_name = '" . $configName . "'");
	}	 	
	
	
	
	

  
}
?>