<?php

/**
 * Контролер головної сторінки
 *
 */
class Main_Page_Controller extends Front_Controller {

    public $model;
    public $pwDate;
    public $astartDate;
  //  public $AnonsLK;
  //  public $AnonsRK;
    
     public function __construct() {
        parent::__construct();
        //$rootNode = $this->getTopic('preview');
        $this->model = new Main_mod_Model();
        
        // Емуляція пленарного тижня
        // фориат командного рядка: <url>?pd=DD.MM.YYYY
       if (isset($_POST['pd'])) {
          $this->pwDate = "TO_DATE('" . date('Y.m.d', strtotime($_POST['pd'])) . "', 'YYYY.MM.DD')";

       $this->is_plenar = 1;
       $this->view->is_plenar = $this->is_plenar;
       }
        // END Емуляція пленарного тижня
        // 
        //var_dump($this->siteLang); die();
        //$this->view->planar_week_info = $this->model->get_golos_info( 1134, $this->pwDate, $this->siteLang );
        $this->view->planar_week_dates = $this->model->get_plenweek_dates($this->pwDate, $this->siteLang );
        $this->view->next_planar_week_dates = $this->model->get_next_plenweek_dates($this->pwDate, $this->siteLang );
//        !ЕМУЛ пленар
     if ($this->is_plenar){
        $this->view->planar_week_byday = $this->model->get_plenweek_dates_by_day($this->pwDate, $this->siteLang );
        $this->view->planar_registratios = $this->model->dep_registration();
     }
    //    $LRKey = $this->getTopicLRKey('preview');
        $this->view->anons_info = $this->model->get_anons_info($this->getTopicLRKey('preview'));
        
 //       var_dump($this->current_node->t_seo_name);        die();
      //  var_dump($LRKey->t_right_key); die();
        //var_dump($this->view->next_planar_week_dates);        die();
 
            $this->view->fixednews = $this->model->FindBySeo('news', 'fixed_news', $this->siteLang, 100);
            
       //     var_dump( $this->view->fixednews);            die();
    }
    
    /**
    * Редірект на посторінковий вивід
    */
    public function __call($method, $arguments)
    {             	
        self::index();
    }
    	
    
	
}
