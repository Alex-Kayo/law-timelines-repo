<?php


class Formedia_Controller extends Main_Page_Controller {
    
     public function __construct() {
        parent::__construct();

        $this->view("formedia_subsite/main_formedia");
    }

 public function index(){

     $this->view->faq_media=$this->model->FindBySeoFullText('news',  'faq_media',  $this->siteLang, 10);
     $this->view->press_team=$this->model->FindBySeo('news',  'pressteam',  $this->siteLang, 8);

//var_dump($this->view->press_team); die();

     return true;
 }

    
    
}
