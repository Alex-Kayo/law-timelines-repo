<?php

defined('SYSPATH') OR die('No direct access allowed.');

class Preview_Controller extends Front_Controller {


    public function __construct() {
        parent::__construct();

        $this->view->front = false;



    }

    public function index() {

        //      var_dump($this->search_params);        die();
        //   var_dump($this->view);    die();

        $this->view->site_title = strip_tags($this->current_node->t_name).' - '.$this->site_title; //mirs Вивід категорії у заголовок сайту
//        $galleryID = $this->input->post('gallery_id', null, true);
        $this->view->categories = $this->getCategories($this->class);
        //       var_dump($this->view->categories); die();
//        $this->view->categories = $this->getCategories('gallery');

        $this->view("preview/list");
        $this->listPreview();


        //mirs Вивід мітки новинного сабсійту у шаблон
        //    $this->view->is_news_subsite = $this->is_news_subsite;
    }


    private function listPreview($idPreview = null) {


        $attachmentsConditions = array();

//var_dump($this->search_params);die(Kohana::lang('search.date.months.'.$this->search_params['search_month']));


        /*if ($this->search_params['search_day'] > 0) {
            $attachmentsConditions[] = "to_char(i_date_create,'dd') = '" . str_pad($this->search_params['search_day'], 2, '0', STR_PAD_LEFT) . "'";
        }*/
        if ($this->search_params['search_month'] > 0) {
            $attachmentsConditions[] = "to_char(i_date_create,'mm') = '" . str_pad($this->search_params['search_month'], 2, '0', STR_PAD_LEFT) . "'";
            //назва місяця
           $this->view->months_s = Kohana::lang('search.date.months.'.$this->search_params['search_month']);
        }
        if ($this->search_params['search_year'] > 0) {
            $attachmentsConditions[] = "to_char(i_date_create,'yyyy') = '" . str_pad($this->search_params['search_year'], 4, '0', STR_PAD_LEFT) . "'";
            //назва року
            $this->view->year_s = $this->search_params['search_year']." року";
        }
        if (strlen($this->search_params['search_substr']) > 0) {

            $attachmentsConditions[] = " CONTAINS(i_name,'" . $this->search_params['search_substr']. "%')>0
             OR CONTAINS(i_anons,'" . $this->search_params['search_substr']. "%')>0";
            // маркування знайденого тексту у заголовку
            $iname = "mark_find_text(i_id, '".$this->search_params['search_substr']."%', 'items_fulltext_1') as i_name";
            // маркування знайденого тексту у анонсі
            $ianons = "mark_find_text(i_id, '".$this->search_params['search_substr']."%', 'items_fulltext_2') as i_anons";
        }
        else {
            $iname = "i_name";
            $ianons = "i_anons";
        }


      //  var_dump($iname); die();


        // сортуваня в залежності чи був пошук у списту анонсів

        $sortCondition ="ORDER BY i_date_create DESC";
/*        if (!$this->search_params['search_substr']) {
            $sortCondition = $attachmentsConditions ? "ORDER BY i_date_create DESC" : "ORDER BY i_date_create DESC";
        }*/

      //   var_dump($sortCondition); die();
     //    var_dump($attachmentsConditions); die();


        $selTopic = 0;
        if ($this->search_params['search_topic_id'] > 0) {
            $selTopic = intval($this->search_params['search_topic_id']);
        } elseif ($this->current_node->t_id && $this->current_node->t_seo_name != 'preview') {
            $selTopic = $this->current_node->t_id;
        }

        $baseCondition = "FROM items i
		    INNER JOIN topics ts ON i.t_id=ts.t_id AND ts.t_status=1
			WHERE i.i_status = 1
			AND i.t_id <> (SELECT t_id FROM topics WHERE t_seo_name = 'recycler')
			" . ($selTopic > 0 ? " AND i.t_id=" . $selTopic : '') . "            
			AND i.i_id IN (select distinct i_id from items " . (count($attachmentsConditions) > 0 ? ' WHERE ' . implode(' AND ', $attachmentsConditions) : '') . ")            
			
	        AND i.i_type = 'preview'        
	        AND i.l_langnick = '" . $this->siteLang . "'	        
	        AND (
	        	i.i_ip IS NULL OR
	            NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%'))
	        )";

    //    var_dump($baseCondition); die();

        $pagination = new Pagination(array(
            'base_url' => $this->view->base_url,
            'lang_prefix' => $this->view->lang_prefix,
            'uri_segment' => 'page',
            'items_per_page' => ( Kohana::config('posts.count_preview')),
            'style' => 'digg',
            'auto_hide' => TRUE,
        ));

    //    var_dump($pagination); die();



        $result = $this->db->query("
            SELECT p1.*, 
            	m.m_name as month, to_char(i_date_create,'dd') as day,  to_char(i_date_create,'yyyy')	as year, 
				
				case when floor(sysdate-p1.i_date_create)<=" . Kohana::config('posts.count_day_new') . " then 1 else null end as flag_new,					
				p1.i_anons AS ia_previw_description,
            	CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = p1.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories 
            FROM ( 
                SELECT * FROM (SELECT rownum as linenum, p_query.* FROM (
                    SELECT i_id,". $iname.", i_link,".$ianons.", i.t_id, i_date_create, i_logoname 
                    " . $baseCondition . "
                    " . (!is_null($idPreview) ? " AND i_id <> " . $idPreview : "") . " ORDER BY i_date_create DESC
                   
                ) p_query WHERE rownum <= " . ($pagination->sql_limit + $pagination->sql_offset) . ") WHERE linenum > " . $pagination->sql_offset . "
            $sortCondition ) p1 
            	INNER JOIN months m ON to_number(to_char(p1.i_date_create,'mm'))=m.m_number AND l_langnick = '$this->siteLang'
            	 
")->as_array();
//var_dump($this->db->last_query()); die("application/controllers/preview.php:141");
        //      var_dump($this->db->last_query()); die();
        //       var_dump($result); die(1);

        $list_preview = array();
        $item_ids = array();
        foreach ($result as $row) {
            $list_preview[$row->i_id] = $row;
            $item_ids[] = $row->i_id;
        }
        unset($result);

        $count_items = $this->db->query("select count(*) as cnt ".$baseCondition)->current()->cnt;
  //      var_dump($this->db->last_query()); die();

     //   $list_preview['total_count'] = intval($count_items);

//var_dump($list_preview); die();

        $pagination->set_total_items($count_items);

        $this->view->posts = $list_preview;

        unset($list_preview);


        /*   $media_count = $this->db->query("
              select sum(cnt_all) as cnt_all, sum(cnt_new) as cnt_new from (
              select 1 as cnt_all, case when floor(sysdate-i_date_create)<=" . Kohana::config('posts.count_day_new') . " then 1 else 0 end as cnt_new
              " . $baseCondon . ")")->current();

         /* $this->view->all_count_posts = $media_count->cnt_all;
          $this->view->new_count_posts = $media_count->cnt_new;

          if (!is_null($idPreview)) {
              $other_count = $this->db->query("
                  select sum(cnt_all) as cnt_all, sum(cnt_new) as cnt_new from (
                  select 1 as cnt_all, case when floor(sysdate-i_date_create)<=" . Kohana::config('posts.count_day_new') . " then 1 else 0 end as cnt_new
                  " . $baseCondition . " AND i_id <> " . $idPreview . ")")->current();

              $pagination->set_total_items($other_count->cnt_all);
              $this->view->other_all_count_posts = $other_count->cnt_all;
              $this->view->other_new_count_posts = $other_count->cnt_new;
          } else {
              $pagination->set_total_items($media_count->cnt_all);
          }*/


        $this->view->pagination = $pagination;

     //   var_dump($this->view->pagination); die();
    }

    protected function getCategories($docType) {

        $rootNode = $this->db->select('*')
            ->from("topics")
            ->where("t_seo_name", "'$docType'")
            ->where("t_status", 1)
            ->where("l_langnick = ", "'$this->siteLang'")
            ->get()->current();

        $result = array();
        if (is_object($rootNode)) {
            $res = $this->db->select('*')
                ->from("topics")
                ->where("t_id <> " . $rootNode->t_id)
                ->where("t_left_key >= " . $rootNode->t_left_key)
                ->where("t_right_key <= " . $rootNode->t_right_key)
                ->where("t_status", 1)
               // ->where("t_basic", 1)
                ->where("l_langnick = ", "'$this->siteLang'")
                ->orderby("t_left_key");
            foreach ($this->db->get()->result(false) as $row) {
                $result[] = $row;
            }
        }

        return $result;
    }




    public function __call($method, $arguments) {
        self::index();
    }

}

