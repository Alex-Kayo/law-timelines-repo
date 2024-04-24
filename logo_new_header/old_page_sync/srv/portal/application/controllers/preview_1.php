<?php


class Preview_Controller extends Front_Controller {
    
    private $lkey_anons;
    
    private $rkey_anons;
    
    private $cache_anons_life = 1800;
    
    public function __construct() {
        
        parent::__construct();
       
        $rootNode = $this->getTopic('preview');
        //print_r($rootNode);        die();
        $this->lkey_anons = $rootNode->t_left_key;
        $this->rkey_anons = $rootNode->t_right_key;
        
    }
    
    public function ItemList($data_sel='') {
            if(!$data_sel){
                die("Наразі нічого не заплановано"); 
            }
        $this->use_main = FALSE;
        $this->view('preview/list');
//        $date_anons = $this->input->post('reque', '0', true);
//        $date_anons = "20160321";
        $this->view->anonses = $this->SelAnons($data_sel);
        
        
//        echo '<pre>';
//      print_r($this->class); 
////        print_r($this->view->anonsperiod['i_categories']); 
//        echo '/<pre>';
//       die();
    }
    public function EventList($data_sel='') {
            if(!$data_sel){
                die("Наразі нічого не заплановано"); 
            }
        $this->use_main = FALSE;
        $this->view('feedbackakred/list');
//        $date_anons = $this->input->post('reque', '0', true);
//        $date_anons = "20160321";
        $this->view->events = $this->SelAnons($data_sel);
        
        
//        echo '<pre>';
//      print_r($this->class); 
////        print_r($this->view->anonsperiod['i_categories']); 
//        echo '/<pre>';
//       die();
    }
   private function SelAnons($date_anons) {

              
        
        $cacheID = 'anons_block' . $this->siteLang . md5($date_anons);
//     print_r($cacheID); die();
        if (!$block_anons = $this->cache->get($cacheID)) {
            $block_anons = $this->db->query("SELECT *
  FROM (SELECT i_all.*,
               m.m_name as month,
               to_char(i_date_create, 'dd') as day,
               to_char(i_date_create, 'yyyy') as year,
               to_char(i_date_create, 'hh24:mi') as hour,
               CONCAT_CRS(CURSOR (SELECT t_seo_name
                             FROM topics
                            START WITH t_id = i_all.t_id
                           CONNECT BY PRIOR t_parent_id = t_id
                            ORDER BY t_left_key ASC),
                          '/') i_categories
          FROM (SELECT i.t_id,
                       i_id,
                       i_date_create,
                       i_name,
                       i_anons,
                       i_logoname,
                       i_link,
                       i_author
                  FROM items i
                 INNER JOIN (select distinct t.t_id
                              from topics t
                             where t.t_status = 1
                               AND t.t_left_key >=".$this->lkey_anons."
                               and t.t_right_key <=".$this->rkey_anons.") t
                    ON i.t_id = t.t_id
                 WHERE i.i_type = 'preview'
                   AND l_langnick = 'ua'
                   AND i.i_status = 1
                   AND (i.i_ip IS NULL OR NOT EXISTS
                        (SELECT i_id
                           FROM items_ips ip
                          WHERE ip.i_id = i.i_id
                            AND '".$this->input->ip_address()."' LIKE
                                replace(ip.ii_ip, '*', '%')))
                   AND trunc(i_date_create) = trunc(to_date('".$date_anons."','yyyymmdd'))) i_all
         INNER JOIN months m
            ON to_number(to_char(i_all.i_date_create, 'mm')) = m.m_number
           AND l_langnick = 'ua'
           AND i_all.i_date_create >= sysdate-2/24
         ORDER BY i_date_create ASC)");
            //WHERE rownum <= 15 //mirs
            
        $this->cache->set($cacheID, $block_anons, array('main_page'), $this->cache_anons_life);
            
        }
//        print_r($block_anons);
        return $block_anons;
    }
    
    public function show(){
        
        $this->view('news/show');
        $this->view->i_id = intval($this->item_id[0]);
        $this->view->item = $this->getItem($this->view->i_id);	        
        if(!$this->view->item){
            Kohana::show_404();
        }
	        
        
    }
    
    
    /**
    * Редірект на посторінковий вивід
    */
    public function __call($method, $arguments)
    {         
            self::index();
    }
    
    
}
