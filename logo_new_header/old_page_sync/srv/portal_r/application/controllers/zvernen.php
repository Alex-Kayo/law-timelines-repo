<?php


class Zvernen_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();

       // $this->view->front = false;
        $this->model = new Main_mod_Model();
        $this->view("zvernen_gromad_subsite/main_zvernen");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

// public function appointments(){ 
 public function index(){ 
     $SeoAppointments = "inf_petition";
//     $SeoAppointments = "notice9skl";
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
       //    $this->count_NatoFixNews = $mainPageCount['nato_fix_news'];
       //      $this->count_NatoSesionNews = $mainPageCount['nato_sesion_news'];
             
             
        }
     $this->view->inf_petition=$this->model->FindBySeo('news',  $SeoAppointments,  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->ezvernen=$this->model->FindBySeo('news',  'ezvernen',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->pers_reception=$this->model->FindBySeo('news',  'pers_reception',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->consid_appeals=$this->model->FindBySeo('news',  'consid_appeals',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->appeal=$this->model->FindBySeo('news',  'appeal',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->zvernenGrm=$this->model->FindBySeo('documents',  'zvernenGrm',  $this->siteLang, $mainPageCount['tsk_topnews']);
//     $this->view->notice9skl=$this->model->FindBySeo('news',   $this->siteLang, 18);
     
     return true;
 }
   
 // public function arhive_appntm(){
 //      $this->view("appointments_subsite/arhive_appntm");
 //     $SeoAppointments = "archiv_apnt";
 //     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
  //       if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
       //    $this->count_NatoFixNews = $mainPageCount['nato_fix_news'];
       //      $this->count_NatoSesionNews = $mainPageCount['nato_sesion_news'];
             
             
//         }
 //     $this->view->archiv_apnt=$this->model->FindBySeo('documents',  $SeoAppointments,  $this->siteLang, $mainPageCount['tsk_topnews']);
 
//  return true;
//  }
 public function zvernenv2(){
       $this->view("zvernen_gromad_subsite/main_zvernenv2");
       
 
 return true;
 }

    
}
