<?php


class Contact_page_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();

       // $this->view->front = false;
        $this->view("contact_page_subsite/contact_page");
        $this->view->show_block_news = true;
     //   self::mainPageBlockBuilder();
        
    }

 public function index(){ 
     return true;
 }


    
}
