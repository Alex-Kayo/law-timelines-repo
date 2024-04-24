<?php defined('SYSPATH') OR die('No direct access allowed.');

class Print_Controller extends Front_Controller {   

    public function __construct(){
        parent::__construct();    
        
        $this->view->front = false;
        $this->view->print_style = true;
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        
    }
    
    
    /**
    * Редірект на  вивід
    */
    public function __call($method, $arguments)
    {              
        $this->view('print/show');
        $this->view->i_id = intval($this->item_id[0]);
        $this->view->item = $this->getItem($this->view->i_id);            
        if(!$this->view->item){
            Kohana::show_404();
        }
    }
    
    
}
