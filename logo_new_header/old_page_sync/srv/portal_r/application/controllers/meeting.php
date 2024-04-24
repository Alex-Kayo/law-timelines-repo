<?php

defined('SYSPATH') OR die('No direct access allowed.');

class Meeting_Controller extends Template_Controller {

    private $model;

    public function __construct() {
        parent::__construct();
       // var_dump($this->current_node->t_seo_name);        die();
        $this->model = new Meeting_Model();
    }

    /*
     * Календар засідань (Перегляд вибранної сесії)
     * 
     * Стенограми пленарних засідань (mi_type = 1)
     * Порядки денні пленарних засідань (mi_type = 2)
     * Оперативна інформація про результати розгляду питань порядку денного на пленарних засіданнях (mi_type = 3)
     */

    public function callendar($type, $session_id = 0) {

        $this->view('meeting/index');
        $this->view->type_callendar = $type;
        $this->view->common_lang = Kohana::lang('common');
        $this->view->main_title = Kohana::lang("meeting.types.$type");
        $this->view->day_types = $this->model->get_day_types($this->siteLang);
        $this->view->day_types_style = $this->model->get_day_types_style();

//mirs Вивід у футер автора інформаційної підтримки
        $this->view->footer_info_support = Kohana::lang("meeting.infosuport.$type");


        $this->view->session = $this->model->getSession($this->siteLang, intval($session_id));
        if (!$this->view->session) {
            Kohana::show_404();
        }

        $this->view->months_data = $this->model->getMonths($type, $this->siteLang, $this->view->session->ms_month_start, $this->view->session->ms_month_end);
        $this->view->convocations_data = $this->model->getArcConvocations($this->siteLang);


        $convocations_json = array();
        foreach ($this->view->convocations_data as $key => $val) {
            $convocations_json[$key] = (isset($val['sessions']) ? $val['sessions'] : array());
        }
        $this->view->convocations_json = json_encode($convocations_json);
    //    var_dump($convocations_json);        die();
        //breadcrump
        $this->view->current_node = (object) array('t_name' => $this->view->main_title);
    }

    /**
     * Пошук 
     */
    public function search() {


        if (intval($this->input->get('search_type', 0, true)) == 0) {
            Kohana::show_404();
        }

        $this->view('meeting/search');
        $this->view->type_callendar = intval($this->input->get('search_type', 0, true));

        $pagination = new Pagination(array(
            'base_url' => $this->view->lang_prefix . '/meeting/search',
            'lang_prefix' => $this->view->lang_prefix,
            'uri_segment' => 'page',
            'items_per_page' => 30,
            'style' => 'digg',
            'auto_hide' => TRUE,
        ));


        $result = $this->model->search(
                intval($this->input->get('search_type', 0, true)), $this->siteLang, intval($this->input->get('search_convocation', 0, true)), intval($this->input->get('search_session', 0, true)), search::strip($this->input->get('search_string', '', true)), $pagination->sql_limit, $pagination->sql_offset
        );

        $this->view->search_result = $result;

        $pagination->set_total_items($result['total_count']);
        $this->view->pagination = $pagination;


        //breadcrump
        $this->view->current_node = (object) array('t_name' => Kohana::lang('meeting.search'));

        $parent = '/';
        if ($this->view->type_callendar == 1) {
            $parent .= 'stenogr';
        } elseif ($this->view->type_callendar == 2) {
            $parent .= 'awt';
        } elseif ($this->view->type_callendar == 3) {
            $parent .= 'faxiv';
        } elseif ($this->view->type_callendar == 4) { //mirs
            $parent .= 'stenpog';
        }

        $this->view->path_way = array((object) array('t_parents' => 'meeting' . $parent, 't_name' => Kohana::lang("meeting.types." . intval($this->input->get('search_type', 0, true)))));
    }

    /**
     * Перегляд документу
     * @param integer $id 
     */
    public function show($type, $id) {

        
    
    $item_base_url = '';
    
    for ($i=1; $this->uri->segment($i); $i++)
    {
        
        $item_base_url .= "/". $this->uri->segment($i);
                
    }

// -------  тип 5 для прінт сторінки
    if ($type==5){
        $this->view('meeting/print');
        $item_base_url = str_replace('print', 'show', $item_base_url);
    }
    else {
        $this->view('meeting/show');
        $item_base_url = str_replace('show', 'print', $item_base_url);
    }

        $this->view->item_url = url::base().ltrim($item_base_url, "/");
   // $site_domein = url::base();
   // var_dump($site_domein.$this->view->item_url);        die();
        $this->view->main_title = Kohana::lang("meeting.type.$type");
        $this->view->item = $this->model->show($this->siteLang, intval($id));
//        var_dump($this->view->item); die();
//mirs Вивід у футер автора інформаційної підтримки
        $this->view->footer_info_support = Kohana::lang("meeting.infosuport.$type");

        if (!$this->view->item) {
            Kohana::show_404();
        }

        $lang = Kohana::lang('common');
        $this->view->item->month_name = $lang['months'][$this->view->item->month];

        //breadcrump
        $this->view->current_node = (object) array('t_name' => $this->view->main_title);
        //$this->view->current_node = (object)array('t_name' => Kohana::lang('meeting.doc'));        
        //$this->view->path_way = array( (object)array('t_parents' => 'meeting', 't_name' => $this->view->main_title));        
    }

}

