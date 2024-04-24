<?php

class Privileges_Core {

	/**
	 * Створення хешу пароля
	 *
	 */
	const hashPassword = 'md5';	
	
	
	/**
	 * Диреторія контролерів
	 *
	 * @var string
	 */
	const  controllerDir = 'controllers';	
	
	
	
	/**
	 * Об"єкт БД
	 *
	 * @var object
	 */
	private $db;
	
	
	/**
	 * Об'єкт кешатора
	 *
	 * @var object
	 */
	private $cache;
	

	
	/**
	 * Конструктор
	 *
	 */
	public function __construct(){
		$this->db = Database::instance();
		$this->cache = Cache::instance();

	}
	
	
	
	/**
	 * Перевірка прав доступа до методу
	 *
	 * @param string $methodName - назва методу
	 * @return bool
	 */
	public function isMethodAllow($methodName){
		$allPriv = $this->getAllPriv();		
		
		$checkNick = self::getControllerNick(Router::$controller_path) . '.' . strtolower($methodName);				
		if(!isset($allPriv[$checkNick])){ //Метод не контролюється			
			return true;
			
		}	else {

			
			$arrUser = $this->getSession();		
			if(is_null($arrUser)){
				return false;
			}	else {
				return in_array($checkNick,$arrUser['allow_action']);
					
			}
		}
		
	}

	/**
	 * Перевірка прав доступа до модуля
	 *
	 * @param string $moduleName - назва модуля
	 * @return bool
	 */	
	public function isModuleAllow($moduleName){
		$allPriv = $this->getAllPriv();		
		
		$arrAllModules = array();
		foreach ($allPriv as $key => $val){
			$arrAllModules[substr($key,0, strrpos($key, '.'))] = substr($key,0, strrpos($key, '.'));
			
		}

		$arrAllowModules = array();		
		$arrUser = $this->getSession();	
				
		if(is_null($arrUser)){
			return false;
			
		}
		
		$arrUserAllow = $arrUser['allow_action'];			
		foreach ($arrUserAllow as $key){
			$arrAllowModules[substr($key,0, strrpos($key, '.'))] = substr($key,0, strrpos($key, '.'));
		}		
		
		return !(isset($arrAllModules[$moduleName]) && !isset($arrAllowModules[$moduleName]));
		
		
	}
	
	/**
	 * Логування метода
	 *
	 * @param string $methodName - назва методу
	 * @return boolean
	 */	
	public function methodLogs($methodName){
		$allPriv = $this->getAllPriv();		
		$checkNick = self::getControllerNick(Router::$controller_path) . '.' . strtolower($methodName);		
		
		if(isset($allPriv[$checkNick]) && $allPriv[$checkNick]['ma_logs'] == 1){
			$db = Database::instance();
			$sessData = $this->getSession();
			if(is_null($sessData)){
				return false;
				
			}
			
			$input = Input::instance();
			
			$arSave = array('u_id'=> $sessData['u_id'], 
							'ma_id'=>$allPriv[$checkNick]['ma_id'],
							'sl_ip'=>$input->ip_address());
							
			$db->insert('system_logs', $arSave);			
			return true;
			
		}	else {
			return false;
			
		}
		
	}
	
	
	
	
	
	
	
	/**
	 * Повернути дані сесії в вигляді масива
	 * 
	 * @param boolean cookieStart - стартовати сесію через cookie
	 * 
 	 * @return array | null
	 *
	 */
	public function getSession($cookieStart = false){		
		$session = Session::instance();	
			
		$users = $this->getUsersData();

		if($cookieStart){
			$hash = self::hashPassword;
			$cLogin = cookie::get('login', null, true);	
			$cUID = cookie::get('uid', null, true);	
			
			if(strlen($cLogin) > 0 && strlen($cUID) > 0 && isset($users[$cLogin]) && $hash($users[$cLogin]['u_id']) === $cUID){
				$session->set('login', $users[$cLogin]['u_login']);
				return $users[$cLogin];				
			}
		}
				
		$varLogin = $session->get('login');
		if(strlen($varLogin) == 0 || (strlen($varLogin) > 0 && !isset($users[$varLogin]))){
			return null;
			
		}	else {
			return $users[$varLogin];	
			
		}
	}
	
	
 	/**
 	 * Встановити нову сесію
 	 *
 	 * @param string $login
 	 * @param string $password
 	 * @return string - повідомлення про помилку при невдалому логівунні
 	 */
 	public function setSession($login, $password){
 		$session = Session::instance();	
 		
 		
 		if(strlen($login) == 0  || strlen($password) == 0){
 			return 'Не заданий логін або пароль';
 			
 		}
 		$users = $this->getUsersData(); 		
 		$hash = self::hashPassword;
 		
 		$input = Input::instance();
 		$ipAddr = $input->ip_address();
 		
 		
 		//Кеш невдалого логування
 		$badAuth = $this->cache->get(Kohana::config('privileges.cache_id_bad_auth'));
		if(!$badAuth){ 
			$badAuth = array();	
			
		}	else { //Перевірка чи не заблокований юзер
						
			if(isset($badAuth[$ipAddr]) && isset($badAuth[$ipAddr]['expire_time'])){

				if($badAuth[$ipAddr]['expire_time'] > time()){				
					return 'Користувач тимчасово заблокований';
					
				}	else {
					unset($badAuth[$ipAddr]['expire_time']);
					unset($badAuth[$ipAddr]['count_bad_login']);
					$this->cache->set(Kohana::config('privileges.cache_id_bad_auth'), $badAuth, null, 0);					
					
				}
				
			}
			

		}
		
 		if(isset($users[trim($login)]) && $users[trim($login)]['u_password'] === $hash(trim($password)) && $users[trim($login)]['u_status'] == 1){
 			$session->set('login', $users[trim($login)]['u_login']); 	
 			unset($badAuth[$ipAddr]);
 			$this->cache->set(Kohana::config('privileges.cache_id_bad_auth'), $badAuth, null, 0);
 			return;
 			
 		}	else { 			
 			if(isset($badAuth[$ipAddr]['count_bad_login'])){
 				$badAuth[$ipAddr]['count_bad_login']++;
 				
 			}	else {
 				$badAuth[$ipAddr]['count_bad_login'] = 1;
 				
 			}
 			
 			if($badAuth[$ipAddr]['count_bad_login'] > Kohana::config('privileges.block_bad_auth.count_bad_login')){
 				$badAuth[$ipAddr]['expire_time'] = time() + Kohana::config('privileges.block_bad_auth.time_block');
 				
 				//Надіслати попередження поштою
 				if(Kohana::config('privileges.block_bad_auth.send_mail') && strlen(Kohana::config('other.email_site_admin') > 0)){
 					
					$message = " Блокування користувача при багаторазовому підборі пароля (IP: {$ipAddr})";
					email::send(Kohana::config('other.email_site_admin'), 'auth@vr.gov.ua', 'Блокування авторизації', $message, TRUE);					
					
 				}
 				
 				$this->cache->set(Kohana::config('privileges.cache_id_bad_auth'), $badAuth, null, 0);
 				return 'Користувач тимчасово заблокований';
 				
 			} 			
 			$this->cache->set(Kohana::config('privileges.cache_id_bad_auth'), $badAuth, null, 0);
 			return 'Невірний логін або пароль (залишилось ' . (Kohana::config('privileges.block_bad_auth.count_bad_login') - $badAuth[$ipAddr]['count_bad_login'] + 1) . ' спроби(а))';
 			
 		}
 		
 	}	
 	
 	
 	/**
 	 * Створення Cookie для існуючої сесії
 	 *
 	 * @return boolean
 	 */
 	public function createCookie(){
 		$arrSession = $this->getSession();
 		if(!is_null($arrSession)){	
			$hash = self::hashPassword; 			
			cookie::set('login', $arrSession['u_login']);	
			cookie::set('uid', $hash($arrSession['u_id']));	
			
 		}
 		
 	}
 	
 	
 	
	
 	
 	/**
 	 * Видалення сесії
 	 *
 	 */
	public function destroySession(){
		$session = Session::instance();
		$session->delete('login');
		$session->destroy();
		cookie::delete('login');
		cookie::delete('uid');
		
	}
 	
 	
	/**
	 * Визначення ніку контролера
	 *
	 * @param string $fullPath - шлях до контролера
	 * @return string 
	 */
 	public function getControllerNick($fullPath){
 		$resultData = '';
 		
 		$startContr = stripos($fullPath, self::controllerDir);
 		if($startContr === false){
 			return $resultData;
 			
 		}
 		
 		$resultData = substr($fullPath, $startContr + strlen(self::controllerDir) + 1);
 		$resultData = substr($resultData, 0, strlen($resultData) - strlen(EXT));
 		$resultData = strtolower(str_replace('/', '.', $resultData));
 		return $resultData;
 	}	
	
	
	/**
	 * Повернути дані по користувачам з привелегіями
	 * 
	 * @return array
	 */
 	private function getUsersData(){
		$users = $this->cache->get(Kohana::config('privileges.cache_id_users'));
		if(!$users){ //Створення кешу даних по користувачам
			$users = array();			
			$query = $this->db->select('*')
							  ->from('users')
							  ->get();
													
			foreach ($query->result(false) as $row){			
				$users[$row['u_login']] = $row;
				$users[$row['u_login']]['allow_action']  = array();
				
			}
			
			$query = $this->db->select('*')
							  ->from('v_users_priv')
							  ->get();

			foreach ($query->result() as $row){			
				$users[$row->u_login]['allow_action'][] = $row->checknick;
				
			}
		
			
			$this->cache->set(Kohana::config('privileges.cache_id_users'), $users, null, 0);
		}	
		return  $users;	 	
 	 	
 	}

 	
 	/**
 	 * Повертає всі привелеї
 	 *
 	 * @return array
 	 */
 	private function getAllPriv(){
		$allPriv = $this->cache->get(Kohana::config('privileges.cache_id_allpriv'));
		if(!$allPriv){ //Створення кешу модулів з правами
			$allPriv = array();
			
			$query = $this->db->select('*')
						      ->from('v_all_priv')
						      ->get();

			foreach ($query->result() as $row){
				$allPriv[$row->checknick] = array('ma_logs' => $row->ma_logs,
												  'ma_id' => $row->ma_id);
				
			}
			
			$this->cache->set(Kohana::config('privileges.cache_id_allpriv'), $allPriv, null, 0);
		}	 		
 		return $allPriv;
 		
 	}
 	
 	
}

?>