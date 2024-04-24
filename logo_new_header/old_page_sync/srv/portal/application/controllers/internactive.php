<?php


class Internactive_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();

       // $this->view->front = false;
        $this->view("internactive_subsite/main_internactive");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

 public function index(){ 
     return true;
 }


    
}
