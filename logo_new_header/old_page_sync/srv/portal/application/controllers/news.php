<?php


class News_Controller extends Front_Controller {
    
    
     public function __construct() {
        parent::__construct();

        $this->view->show_block_news = true;
        self::mainPageBlockBuilder();
    }



    /**
     * Вивід конкретної текстової публікації
     */
    public function show() {

        $this->view('news/show');
     //   if(in_array($this->current_node->t_seo_name, Kohana::config('nato_site_seos.seos_list'))) 
     //           $this->view->is_nato_subsite = TRUE;
     //       var_dump($this->is_nato_subsite);            die();
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));


        $arrPostVars = $this->input->post();
        if(isset($arrPostVars['admin_view'])){        	

            $this->view->item = new stdClass();
            $this->view->item->i_id = $arrPostVars['id'];
            $this->view->item->i_name = $arrPostVars['title'];
            $this->view->item->i_full = $arrPostVars['full_story'];
            $this->view->item->i_anons = $arrPostVars['short_story'];

        	
        } else{
            
            $arrPostVars = $this->input->post();
        //mirs перевіряє чи ппергляд публікації є результатом пошуку
        isset($arrPostVars['search'])? $this->str_search = $this->ukrSearchQuery($arrPostVars['search']): $this->str_search = '';
            
            
            $this->view->i_id = intval($this->item_id[0]);
            $this->view->item = $this->getItem($this->view->i_id);
            
/*            $this->view->img_link = preg_match("/(src[ ]{0,}=[ ]{0,}('\/images.*?').*?>)/", $this->view->item->i_full);
            var_dump($this->view->item->i_full);            die();
           var_dump($this->view->img_link);            die();
*/ 
           
           
            $this->view->class_name = $this->class;
	        if(!$this->view->item){
                Kohana::show_404();
            }
            //mirs Вивід мітки новинного сабсійту у шаблон
            $this->view->is_news_subsite = $this->is_news_subsite; 
            /////
            $this->view->site_title =  strip_tags($this->current_node->t_name.' - '.$this->view->item->i_name).' - '.$this->site_title; //mirs Вивід інфо у заголовок сайту
            
            ///////------------------------отримати список категорії - mirs
            $post_result = $this->getItemsSelTopics('news',$this->current_node->t_id, 10, 0);
            $this->view->other_items = $post_result['items'];
            
         //  $this->view->other_items =$this->getItem($this->current_node->t_id['items']);
           
 //       var_dump($this->current_node); die();
            

//	        if(!$this->view->item){
//                Kohana::show_404();
//            }


            //Коментарі
	        if($this->view->item->comment_type > 0){
	            if($this->view->item->comment_type > 1){
                    $this->view->captcha = Captcha::factory('vr')->render(true);
                }
                Comments_Controller::list_comments($this->view->item->i_id);
	        	
            }
        }
    }
    
    
    /**
     * Редірект на посторінковий вивід
     */
    public function __call($method, $arguments)
    {         
        self::index();
        
      //  if(in_array($this->current_node->t_seo_name, Kohana::config('nato_site_seos.seos_list'))) 
      //          $this->view->is_nato_subsite = TRUE;
       //     var_dump($this->view);            die();
      //  print_r($this->input->get('title', '', true));        die();
        
        
    }

    
}
