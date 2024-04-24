<?php defined('SYSPATH') OR die('No direct access allowed.');

class Fsview_Controller extends Front_Controller {   

    public function __construct(){
        parent::__construct();    
        
        $this->view->front = false;
        $this->view->print_style = false;
        
    }
    
    
    /**
    * Редірект на  вивід
    */
    public function __call($method, $arguments)
    {              
        $this->view('fsview/show');
        $this->view->i_id = intval($this->item_id[0]);
        $this->view->item = $this->getItem($this->view->i_id);            
        if(!$this->view->item){
            Kohana::show_404();
        }
    }
    
    
}
