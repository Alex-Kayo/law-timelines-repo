<?php defined('SYSPATH') OR die('No direct access allowed.');

class Pg_foreign_Controller extends Front_Controller {
    
   public $mass = 'Тут буде динамічна інформація';
    
    
    
    public function __construct() {
        parent::__construct();
        $this->view('other_pg/pg_foreign_show');
        $this->view->mass = $this->mass;
       } 
    
    function index()  {
        
    }
    
    function oool()  {
        $this->view->mass = 'Інформація з методу oool';
    }
    
}