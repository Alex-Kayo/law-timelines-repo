<?php


class Manage_Property_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();

       // $this->view->front = false;
        $this->model = new Main_mod_Model();
        $this->view("manage_property_subsite/main_property");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }
    public function __call($method, $arguments)
    {   
        self::index();
        if(in_array($this->current_node->t_seo_name, Kohana::config('nato_site_seos.seos_list'))) 
                $this->view->is_nato_subsite = TRUE;
        
    }    

// public function appointments(){ 
 public function index(){ 
     $SeoManage_Property = "property_parlam";
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
       //    $this->count_NatoFixNews = $mainPageCount['nato_fix_news'];
       //      $this->count_NatoSesionNews = $mainPageCount['nato_sesion_news'];
             
             
        }
     $this->view->property_parlam=$this->model->FindBySeo('documents',  $SeoManage_Property,  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->unused_property=$this->model->FindBySeo('documents',  'unused_property',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->use_property =$this->model->FindBySeo('documents',  'use_property',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->other_pr =$this->model->FindBySeo('documents',  'other_pr' ,  $this->siteLang, $mainPageCount['tsk_topnews']);
//     $this->view->notice9skl=$this->model->FindBySeo('news',   $this->siteLang, 18);
     
     return true;
 }
   
// public function actual_appntm (){
//       $this->view("appointments_subsite/actual_appntm");
//        $SeoAppointments = "notice9skl";
//     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
//        if ($mainPageCount) {
//          
//             
//        }
//     $this->view->notice9skl=$this->model->FindBySeo('news',  $SeoAppointments,  $this->siteLang, $mainPageCount['tsk_topnews']);
// 
// return true;
// }
  
     
}