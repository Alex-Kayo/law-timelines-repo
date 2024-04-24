<?php defined('SYSPATH') OR die('No direct access allowed.');

class Video_Controller extends Front_Controller {   

	public function __construct(){
		parent::__construct();	
		
		$this->view->front = false;
		
	}
	
    /**
    * Редірект на посторінковий вивід
    */
    public function __call($method, $arguments)
    {              
            self::index();
    }
    
    
}
