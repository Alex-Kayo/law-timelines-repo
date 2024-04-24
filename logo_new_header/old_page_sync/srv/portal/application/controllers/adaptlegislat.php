 <?php


class Adaptlegislat_Controller extends Front_Controller {
    
     public function __construct() {
        parent::__construct();
        $this->model = new Main_mod_Model();
       // $this->view->front = false;
        $this->view("adaptlegislat_subsite/main_adaptlegislat");
        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

 public function index(){ 
     $this->view("adaptlegislat_subsite/main_adaptlegislat");
               $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
       //  $SeoGospfin = "project_kosht";
     $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
       //     $this->view->count_TskTopNews = $mainPageCount['tsk_topnews'];               
           
        }
        
   //  $this->view->project_kosht=$this->model->FindBySeo('documents',  $SeoGospfin,  $this->siteLang, $mainPageCount['tsk_topnews']);
   //  $this->view->kosht_rozporjad=$this->model->FindBySeo('documents',  'kosht_rozporjad',  $this->siteLang, $mainPageCount['tsk_topnews']);
     return true;
 }
       
}
