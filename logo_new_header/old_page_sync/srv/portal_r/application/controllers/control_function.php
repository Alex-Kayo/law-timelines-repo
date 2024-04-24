<?php


class Control_function_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();

       // $this->view->front = false;
        $this->model = new Main_mod_Model();
        $this->view("control_function_subsite/main_control_function");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

// public function appointments(){ 
 public function index(){ 
     $Control_function = "control_func_kmu";
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
       //    $this->count_NatoFixNews = $mainPageCount['nato_fix_news'];
       //      $this->count_NatoSesionNews = $mainPageCount['nato_sesion_news'];
             
             
        }
     $this->view->control_func_kmu=$this->model->FindBySeo('documents',  $Control_function,  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->program_dij_kmu=$this->model->FindBySeo('documents',  'program_dij_kmu',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->reports_kmu=$this->model->FindBySeo('documents',  'reports_kmu',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->request_kmu=$this->model->FindBySeo('news',  'request_kmu',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->other_reports=$this->model->FindBySeo('documents', 'other_reports', $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->other_inf=$this->model->FindBySeo('documents',  'other_inf',  $this->siteLang, $mainPageCount['tsk_topnews']);
//     $this->view->consid_appeals=$this->model->FindBySeo('news',  'consid_appeals',  $this->siteLang, $mainPageCount['tsk_topnews']);
//     $this->view->notice9skl=$this->model->FindBySeo('news',   $this->siteLang, 18);
     
     return true;
 }
 
  
  
 
// public function arhive_appntm(){
//       $this->view("appointments_subsite/arhive_appntm");
//       $SeoAppointments = "archiv_apnt";
//     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
//        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
       //    $this->count_NatoFixNews = $mainPageCount['nato_fix_news'];
       //      $this->count_NatoSesionNews = $mainPageCount['nato_sesion_news'];
             
             
// 
// public function zvernenv2(){
//       $this->view("zvernen_gromad_subsite/main_zvernenv2");
       
 
// return true;
// }

    
}
