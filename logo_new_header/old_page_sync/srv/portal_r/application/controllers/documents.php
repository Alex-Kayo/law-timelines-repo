<?php defined('SYSPATH') OR die('No direct access allowed.');

class Documents_Controller extends Front_Controller {

    /**
    * Редірект на посторінковий вивід
    */
    public function __call($method, $arguments)
    {   
        self::index();
    }    
}
