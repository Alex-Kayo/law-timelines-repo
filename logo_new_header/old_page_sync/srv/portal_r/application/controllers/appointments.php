<?php


class Appointments_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();

       // $this->view->front = false;
        $this->model = new Main_mod_Model();
        $this->view("appointments_subsite/main_appointments");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

// public function appointments(){ 
 public function index(){ 
     $SeoAppointments = "adv_appoint";
//     $SeoAppointments = "notice9skl";
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
       //    $this->count_NatoFixNews = $mainPageCount['nato_fix_news'];
       //      $this->count_NatoSesionNews = $mainPageCount['nato_sesion_news'];
        }
     $this->view->adv_appoint=$this->model->FindBySeo('documents',  $SeoAppointments,  $this->siteLang, $mainPageCount['tsk_topnews']);
//     $this->view->notice9skl=$this->model->FindBySeo('news',   $this->siteLang, 18);
     
     return true;
 }
 public function actual_appntm (){
       $this->view("appointments_subsite/actual_appntm");
//        $SeoAppointments1 = "actual_app_position" ; 
//        $SeoAppointments2 = "adv_main_committee";          
           
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
        }
     $this->view->actual_app_position=$this->model->FindBySeo('documents',  "actual_app_position",  $this->siteLang, $mainPageCount['tsk_topnews']);
      $this->view->adv_main_committee=$this->model->FindBySeo('documents',  "adv_main_committee",  $this->siteLang, $mainPageCount['tsk_topnews']);
         
 
 return true;
 }
  
  
 public function candidates_appntm (){
       $this->view("appointments_subsite/candidates_appntm");
//       $SeoAppointments = "notice9skl";
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
             
        }
//     $this->view->notice9skl=$this->model->FindBySeo('news',  $SeoAppointments,  $this->siteLang, $mainPageCount['notice9skl']);
     $this->view->adv_main_committee=$this->model->FindBySeo('documents', 'adv_main_committee',  $this->siteLang, $mainPageCount['notice9skl']);
     $this->view->info_startnews=$this->model->FindBySeo('news', 'info_startnews',  $this->siteLang, $mainPageCount['notice9skl']);
     $this->view->info_appnt_other=$this->model->FindBySeo('documents', 'info_appnt_other',  $this->siteLang, $mainPageCount['notice9skl']);
 
 return true;
 }
 public function arhive_appntm(){
       $this->view("appointments_subsite/arhive_appntm");
       $SeoAppointments = "archiv_apnt";
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
        }
     $this->view->archiv_apnt=$this->model->FindBySeo('documents',  $SeoAppointments,  $this->siteLang, $mainPageCount['tsk_topnews']);
 
 return true;
 }

    
}
