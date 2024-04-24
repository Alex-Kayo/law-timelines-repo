<?php


class Gospfin_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();
        $this->model = new Main_mod_Model();
       // $this->view->front = false;
        $this->view("gospfin_subsite/main_gospfin");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

 public function index(){ 
     $this->view("gospfin_subsite/main_gospfin");
               $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
         $SeoGospfin = "project_kosht";
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
       //    $this->count_NatoFixNews = $mainPageCount['nato_fix_news'];
       //      $this->count_NatoSesionNews = $mainPageCount['nato_sesion_news'];
             
             
        }
     $this->view->project_kosht=$this->model->FindBySeo('documents',  $SeoGospfin,  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->kosht_rozporjad=$this->model->FindBySeo('documents',  'kosht_rozporjad',  $this->siteLang, $mainPageCount['tsk_topnews']);
     return true;
 }
public function  koshtorys(){
       $this->view("gospfin_subsite/koshtorys");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        // $SeoGospfin = "bd_zap";
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
       //    $this->count_NatoFixNews = $mainPageCount['nato_fix_news'];
       //      $this->count_NatoSesionNews = $mainPageCount['nato_sesion_news'];


        }
   //  $this->view->effectiv_bdProg=$this->model->FindBySeo('documents',  'effectiv_bdProg',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->ocin_efect_prog=$this->model->FindBySeo('documents',  'ocin_efect_prog',  $this->siteLang, $mainPageCount['tsk_topnews']);
  //   $this->view->publ_policyGoals=$this->model->FindBySeo('documents',  'publ_policyGoals',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->inf_pro_dersh_pol=$this->model->FindBySeo('documents',  'inf_pro_dersh_pol',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->zvity_fin_year=$this->model->FindBySeo('documents',  'zvity_fin_year',  $this->siteLang, $mainPageCount['top_news']);
     $this->view->komnsecii_nd=$this->model->FindBySeo('documents',  'komnsecii_nd',  $this->siteLang, $mainPageCount['top_news']);
     return true;
 }
    
public function  publ_zakupivli(){
       $this->view("gospfin_subsite/publ_zakupivli");
       $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        // $SeoGospfin = "bd_zap";
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];
       //    $this->count_NatoFixNews = $mainPageCount['nato_fix_news'];
       //      $this->count_NatoSesionNews = $mainPageCount['nato_sesion_news'];
             
             
}
     $this->view->justification_pr=$this->model->FindBySeo('documents',  'justification_pr',  $this->siteLang, $mainPageCount['tsk_topnews']);
     $this->view->procurement_archive=$this->model->FindBySeo('documents',  'procurement_archive',  $this->siteLang, $mainPageCount['tsk_topnews']);
       $this->view->der_zak=$this->model->FindBySeo('documents',  'der_zak',  $this->siteLang, $mainPageCount['top_news']);
       $this->view->arh_derzhzak=$this->model->FindBySeo('documents',  'arh_derzhzak',  $this->siteLang, $mainPageCount['top_news']);
 
             return true;
   }
   
public function  gospfin_abaza(){
       $this->view("gospfin_subsite/gospfin_abaza");
       
//       $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
//        if ($mainPageCount) {
//            $this->count_NatoSpeaker = $mainPageCount['nato_speakers'];
//            $this->count_NatoSesionNews = $mainPageCount['nato_sesion_news'];
//        }
//            $this->view->nato_speaker=$this->model->FindBySeo('news', $this->NatoSpeakersSeo, $this->siteLang, $this->count_NatoSpeaker);
//            $this->view->nato_sesion_news=$this->model->FindBySeo('news', $this->NatoSesionNewsSeo, $this->siteLang, $this->count_NatoSesionNews);
//       
//       die('11111111');
             return true;
   }

    
}
