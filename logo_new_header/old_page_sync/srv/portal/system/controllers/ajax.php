<?php defined('SYSPATH') OR die('No direct access allowed.');

abstract class Ajax_Controller extends Main_Controller{

    // Do not allow to run in production
    const ALLOW_PRODUCTION = FALSE;
           
    protected $request;
    protected $db;
    
    
    protected $defLang;
    
    /**
    * Конструктор
    */
	public function __construct()
	{
		parent::__construct();
        
        $this->request = new Request;
        
        if ( ! is_object($this->db))
        {
            // Load the default database
            $this->db = Database::instance('default');
        }        

        Kohana::auto_load('Language'); 
		$arrLang = Language::getLangData();   
        $arrTmp = array_keys($arrLang);      
        $this->defLang = $arrTmp[0];
        
	}

    /**
    * Підключення javascript модуля
    */
    public function index() {   	
        include(DOCROOT . 'js/modules/'.Router::$controller.'.js');
    }
    
    /**
    * Виклик неіснуючого методу
    */
    public function __call($method, $arguments) {
        //echo $method." - ";
        // By defining a __call method, all pages routed to this controller
        // that result in 404 errors will be handled by this method, instead of
        // being displayed as "Page Not Found" errors.
    }

    /**
     * Метод викликається при забороні доступа до дії контролера
     *
     */
    public function accessDenied(){
    	echo $this->request->jsonResponse(FALSE, 'Доступ до даної дії заборонений');
    	
    }
}