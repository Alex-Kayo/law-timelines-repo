<?php


class Infres_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();

       // $this->view->front = false;
        $this->model = new Main_mod_Model();
        $this->view("infres_subsite/main_infres");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

 
 public function index(){ 
     $SeoAppointments = "inf_petition";
 
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
                     
        }
     $this->view->inf_petition=$this->model->FindBySeo('news',  $SeoAppointments,  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->biblinfres=$this->model->FindBySeo('news',  'biblinfres',  $this->siteLang, $mainPageCount['tsk_topnews']);
      
     
     return true;
 }
  
  
      
}
