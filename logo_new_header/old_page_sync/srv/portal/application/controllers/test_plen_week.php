<?php

defined('SYSPATH') OR die('No direct access allowed.');

class Test_plen_week_Controller extends Template_Controller {

    private $modelp;
    
     public function __construct() {
        parent::__construct();
        $this->modelp = new Plenar_week_Model();
        
    }
    
    public function index() {
        $this->view("../test");
        
    $pwd = "TO_DATE('" . date('Y.m.d', strtotime('20.01.2019')) . "', 'YYYY.MM.DD')";
        $pw_data = $this->modelp->get_week_date($pwd);
     //   var_dump($pw_data);
     //   die();
     
  
$this->view->planar_week = $pw_data;

//  $plan_week = $pweek;
    //var_dump($plen_week);
    }

}

