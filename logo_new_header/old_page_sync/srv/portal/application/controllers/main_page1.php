<?php
/**
 * Контролер головної сторінки
 *
 */
class Main_Page_Controller extends Front_Controller {

    /**
    * Редірект на посторінковий вивід
    */
    public function __call($method, $arguments)
    {             	
        self::index();
    }
    	
    
	
}