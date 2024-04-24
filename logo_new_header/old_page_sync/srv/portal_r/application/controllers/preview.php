<?php


class Preview_Controller extends Front_Controller {
    
    private $lkey_anons;
    
    private $rkey_anons;
    
    
    
    private $cache_anons_life = 1800;
    
    public function __construct() {
        
        parent::__construct();
       
        $rootNode = $this->getTopic('preview');
    //    print_r($rootNode);        die();
        $this->lkey_anons = $rootNode->t_left_key;
        $this->rkey_anons = $rootNode->t_right_key;
        
        $this->view("preview/list");
        $this->view->categories = $this->getCategories($this->class);
        
        
        !$this->search_params['search_topic_id'] ? $t_name = "Анонси" : $t_name = $this->getTopic($this->search_params['search_topic_id'])->t_name;
        $this->view->t_name = $t_name;
//        var_dump($this->current_node->t_seo_name);        die();
    }
    
public function index() {
          
    //   $className = $this->class;
      
     //  $offset = '';
     //  $limit = '';
        $result = array();
	    // Не виводити пагінатор якщо показ усіх анонсів

            if ($this->current_node->t_seo_name === "preview") {
            $limit = 100;
            $offset = 0;
            $this->view->anons_searh_fild = true;
        } else {
            parent::index();
            return;
                   
        }
        !$this->search_params['search_day'] ? $SearchDate = "" : $SearchDate = $this->search_params["search_day"].".".$this->search_params["search_month"].".".$this->search_params["search_year"];    
        
            
            $this->view->date_search = $this->input->get('date_point');
//            $this->view->date_search = $SearchDate;
//            die(var_dump($this->view->date_search));
            $SearchS = $this->search_params['search_substr'];
            
 //       die(var_dump($SearchS));
           $baseCondition = "
           FROM items i
           WHERE i_status = 1
           AND i_type = '$this->class'
           AND l_langnick = '{$this->siteLang}'
           ". ($this->search_params['search_topic_id'] > 0 ? " AND i.t_id=" 
            . $this->search_params['search_topic_id'] : '')
            .($SearchS ? " AND CONTAINS(i_name,". "'{$SearchS}%', 1) > 0" : '')
            .($this->search_params['search_day'] > 0 ?   " AND trunc(i.i_date_create, 'dd') = "."'{$SearchDate}'" : " AND i.i_date_create".($SearchS ? "<=" : ">=")."sysdate-0.5");
          
     
           
//                die(var_dump($baseCondition));
           
           
           
           // . ' '. ($this->search_params['search_day'] > 0 ? "AND trunc(i.i_date_create, 'dd') = '{$SearchDate}' : 'AND i.i_date_create > sysdate ')
//mirs 2020.06.10 доано у $result['items'] (SELECT t_seo_name FROM topics  where t_id = p1.t_id ) i_seo_name
// для передачі у списки публікацій seo_name конкретної публікації для спец. дій  
        
      //  var_dump($baseCondition);die();
        
        $result['items'] = $this->db->query("
            SELECT p1.*,
            CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = p1.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories,
            (SELECT t_seo_name FROM topics  where t_id = p1.t_id ) i_seo_name, 
            m.m_name as month,
            to_char(i_date_create,'dd') as day,
            to_char(i_date_create,'yyyy') as year,
            to_char(i_date_create,'hh24') as hour,
            to_char(i_date_create,'mi') as minute 
            FROM ( SELECT * FROM (SELECT rownum as linenum, p_query.* FROM (
                    SELECT i_id, i_name, i_anons, i_link, i_logoname, i_author, t_id,  
                    TO_CHAR(i_date_create, 'DD.MM.YYYY') AS i_date, i_date_create
    				" . $baseCondition . "
                    ORDER BY i_date_create ASC ) p_query WHERE rownum <= " . ($limit + $offset) . ") WHERE linenum > " . $offset . " ) p1
            	INNER JOIN months m ON to_number(to_char(p1.i_date_create,'mm'))=m.m_number AND l_langnick = '$this->siteLang' ORDER BY i_date_create ASC ");
         
      //  die(var_dump($this->db->last_query()));
        
        $this->view->posts = $result['items'] ;
        $this->view->count_items  = $this->db->query("SELECT count(1) cnt {$baseCondition}")->current()->cnt;
        $this->view->is_search = $this->search_params['submit'];
        
 //           var_dump($pagination); die();
      //  die(var_dump($this->view->count_items));
    //    die(var_dump($this->view->is_search));
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
    public function SearchAnonsList() {
        
        $rootNode = $this->getTopic('preview');
        //print_r($rootNode);        die();
        $this->lkey_anons = $rootNode->t_left_key;
        $this->rkey_anons = $rootNode->t_right_key;
        
     //   var_dump($rootNode);        die();
        url::redirect('preview');
     //   self::index();
            
        
        
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
        
        $this->view('preview/show');
        
        $arrPostVars = $this->input->post();
        //mirs перевіряє чи ппергляд публікації є результатом пошуку
        isset($arrPostVars['search'])? $this->str_search = $this->ukrSearchQuery($arrPostVars['search']): $this->str_search = '';
        
        $this->view->i_id = intval($this->item_id[0]);
        $this->view->item = $this->getItem($this->view->i_id);
        $this->view->class_name = $this->class;
        if(!$this->view->item){
            Kohana::show_404();
        }
	$this->view->site_title =  strip_tags($this->current_node->t_name.' - '.$this->view->item->i_name).' - '.$this->site_title; //mirs Вивід інфо у заголовок сайту
        
        ///////------------------------отримати список категорії - mirs
            $post_result = $this->other_list_anons($this->current_node->t_id, 5); ///mirs цифра - кількість у списку
//            $post_result = $this->getItemsSelTopics('preview',$this->current_node->t_id, 5, 0);
            $this->view->other_items = $post_result;
         //   var_dump($post_result['i_name']);            die();
//            var_dump($this->view->other_items);            die();
    }
//    {
//        $this->view->i_id = intval($this->item_id[0]);
//            $this->view->item = $this->getItem($this->view->i_id);
//            $this->view->class_name = $this->class;
//	        if(!$this->view->item){
//                Kohana::show_404();
//    }
    
    
    
    private function other_list_anons($topic_id, $limit){
      $result = $this->db->query("SELECT *
  FROM (SELECT rownum as linenum, p_query.*
          FROM (SELECT i_id,
                       i_name,
                       i_anons,
                       i_author,
                       i_link,
                       i_logoname,
                       TO_CHAR(i_date_create, 'DD.MM.YYYY') AS i_date,
                       m.m_name AS month,
                       to_char(i_date_create, 'dd') AS day,
                       to_char(i_date_create, 'yyyy') AS year,
                       to_char(i_date_create, 'hh24') AS hour,
                       to_char(i_date_create, 'mi') AS minute,
                       case
                         when floor(sysdate - i.i_date_create) <= 10 then
                          1
                         else
                          null
                       end as flag_new,
                       CASE
                         WHEN i_logoname IS NULL THEN
                          1
                         ELSE
                          0
                       END AS logo_null,
                       '" . substr($this->view->base_url, 1, strlen($this->view->base_url) - 2) . "' AS i_categories
                  FROM items i
                 INNER JOIN topics ts
                    ON (i.t_id = ts.t_id AND ts.t_status = 1)
                 INNER JOIN months m
                    ON (to_number(to_char(i.i_date_create, 'mm')) =
                       m.m_number AND m.l_langnick = 'ua')
                 WHERE i_status = 1
                   AND i.t_id = ".$topic_id."
                   AND i.i_date_create >= sysdate 
                 ORDER BY i_date_create asc, i_id ASC) p_query
         WHERE rownum <= ".$limit.")
 WHERE linenum > 0");
//   var_dump($this->db->last_query());
      
   return $result;
    }
    
    
    //AND i.i_date_create <= 40 + sysdate -> line 183
    
    /**
    * Редірект на посторінковий вивід
    */
    public function __call($method, $arguments)
    {         
            self::index();
    }
    
    
}


