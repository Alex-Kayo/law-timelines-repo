<?php


class Adminter_ustr_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();
         Kohana::show_404();
       // $this->view->front = false;
        $this->view("adminter_ustr_subsite/main_adminter_ustr");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

 public function index(){ 
     return true;
 }


    
}
