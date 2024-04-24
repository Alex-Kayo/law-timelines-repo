<?php

class VotinList_Controller extends Front_Controller {

  private $seo_name;

    public function __construct() {


        parent::__construct();

      $this->seo_name = $this->uri->segment($this->uri->segment(1));

    }

    // Для того щоб у url (наприслад:http://mirs.rada.gov.ua/VotinList/123/),
    // 123 не сприймався як метод сласу, треба використовувати магічну ф-цію
    // __call($method, $arguments)

    public function index(){
     //   var_dump(); die();

        //$categ_id  id категорії
        $categ = $this->db->query("select t_id, t_name  from TOPICS 
where t_seo_name = '{$this->seo_name}'")->current();

       //var_dump(intval($pagination->sql_limit)); die();

        if (!$categ) Kohana::show_404();

        $this->view('main_page/votinlist');
   //     var_dump($this->view); die();
        $this->view->votin_name = $categ->t_name;

        $pagination = new Pagination(array(
            'base_url'       => $this->view->lang_prefix."/votinlist/{$this->seo_name}",
            'lang_prefix'    => $this->view->lang_prefix,
            'uri_segment'    => 'page',
            'items_per_page' => 10,
//            'items_per_page' => Kohana::config('posts.count_votinlist'),
            'style'          => 'digg',
            'auto_hide'      => TRUE,
        ));

        $pagination->set_total_items($this->db->query('select count(1) as cnt from ITEMS 
where t_id ='.$categ->t_id)->current()->cnt );
        $this->view->pagination = $pagination;


        $this->getList($categ->t_id, $pagination->sql_limit,$pagination->sql_offset);
//var_dump($pagination); die();


    }

    public function getList($topic_id, $limit, $offset){
//var_dump($topic_id); die();
        $this->view->posts = $this->db->query("select TO_CHAR(i_date_create, 'DD.MM.YYYY') as dat, TO_CHAR(i_date_create, 'HH24:MI') as time,
       i_name,
       i_anons,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 1, 'm')) as g_pos,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 2, 'm')) as g_neg,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 3, 'm')) as refrain,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 4, 'm')) as not_voting,
       REGEXP_SUBSTR(i_anons, '[^-]+$', 1, 1, 'm') as rishen,
       i_link
  from ITEMS t
   where t.t_id = {$topic_id}          
 order by t.i_date_create desc, t.i_id desc
 OFFSET {$offset} ROWS FETCH NEXT {$limit} ROWS ONLY
 
 ");

    }

    public function __call($method, $arguments)
    {
        self::index();
    }

}
