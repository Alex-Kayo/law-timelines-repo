<?php


class Structure_parlam_Controller extends Front_Controller {
    
     public function __construct() {

        parent::__construct();
      //  Kohana::show_404();
       // $this->view->front = false;
         $items_hide = (in_array($this->input->ip_address(), Kohana::config('filter_ip.item_hide')));

 //        var_dump($items_hide);die();
         if (!$items_hide) {$this->view("structure_parlam_subsite/main_structure_parlam");}
         else $this->view("structure_parlam_subsite/main_structure_parlam4inet");

        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
        
    }

 public function index(){ 
     return true;
 }

    public function arhive_skl(){
        $this->view("structure_parlam_subsite/arhive_skl");

        return true;
    }

    
}
