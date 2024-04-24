<?php


class Newscenter_Controller extends Main_Page_Controller {
    
     public function __construct() {
        parent::__construct();

       // $this->view->front = false;
        $this->view("news_subsite/main_newscenter");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

 public function index(){ 
     return true;
 }

    
    
}
