<?php


class Lustratv_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();

       // $this->view->front = false;
        $this->view("lustratv_subsite/main_lustratv");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

 public function index(){ 
     return true;
 }


    
}
