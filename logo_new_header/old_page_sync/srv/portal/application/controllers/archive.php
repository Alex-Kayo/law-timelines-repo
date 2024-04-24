<?php

class Archive_Controller extends Front_Controller {

    /**
     * Профіль NLS_LANG выдносно мов сайту
     *
     * @var array
     */
    private $ORA_NLS_LANG = array('ua' => 'UKRAINIAN',
        'ru' => 'RUSSIAN',
        'en' => 'AMERICAN');

    /**
     * Вивід конкретної текстової публікації
     */
    
    public function __construct() {
        parent::__construct();

         Kohana::show_404();
    }
    
    public function show() {
        $this->view('news/show');

        $ids = $this->item_id;
        $i_id = (int) $ids[0];

        $this->view->item = $this->db->query("
            SELECT i.i_id,
                   i.i_name,
                   i.i_anons,
                   i.i_author,
                   i.i_link,                                        
                   TO_CHAR(i.i_date_create, 'DD.MM.YYYY') AS i_date,                                       
                   i.i_logoname,
                   if.i_full        
            FROM items i
            INNER JOIN items_full if ON i.i_id = if.i_id
            WHERE i.i_id = $i_id
            AND i.i_status = 1
            AND (
    			i.i_ip IS NULL OR
    			NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%')) 
    			)
			AND i_date_create <= sysdate")->current();
    }

    /**
     * Голвна сторінка архіву
     *
     */
    public function index() {

 //       Kohana::show_404();
        
        $ajax_processing = $this->input->post('ajax_processing', null, true);

        $class = 'news';
        $baseURL = $this->view->lang_prefix . "/" . $this->class;
        $strURI = $this->uri->string();
        $strURI = security::xss_clean($this->uri->string());



        $type_sort = $this->input->post('type_sort', 'DESC', true);
        //!mirs XSS clear for page count
        $page_count = security::xss_clean($this->input->post('page_count', Kohana::config('posts.count_' . $class), true));
        $page_count = ($page_count > 200 ? 200 : $page_count);



        //формування дати виборки	
        $callendarMonth = '';

        if (preg_match('/^archive\/([0-9]{4})\/([0-9]{2})\/([0-9]{2})/', $strURI, $matches)) {
            
          //  print_r($matches); die();
            
            $baseURL .= '/' . $matches[1] . "/" . $matches[2] . "/" . $matches[3];
            $callendarMonth = $matches[1] . $matches[2];

            //  "РРРР/ММ/ДД"
            $dateStart = $matches[3] . "." . $matches[2] . "." . $matches[1];
            
           // print_r($dateStart); die();
            
            $dateEnd = $dateStart;

            $this->view->sel_day = intval($matches[3]);
            $this->view->sel_month = intval($matches[2]);
            $this->view->sel_year = $matches[1];
        } elseif (preg_match('/^archive\/([0-9]{4})\/([0-9]{2})/', $strURI, $matches)) {
            $baseURL .= '/' . $matches[1] . "/" . $matches[2];
            $callendarMonth = $matches[1] . $matches[2];

            //  "РРРР/ММ"
            $dateStart = "01." . $matches[2] . "." . $matches[1];
            $dateEnd = date::getLastMonthDay($matches[1], $matches[2]) . "." . $matches[2] . "." . $matches[1];

            $this->view->sel_year = $matches[1];
            $this->view->sel_month = intval($matches[2]);
        } elseif (preg_match('/^archive\/([0-9]{4})/', $strURI, $matches)) {
            $baseURL .= '/' . $matches[1];
            $callendarMonth = $matches[1] . '01';

            //  "РРРР"
            $dateStart = "01.01." . $matches[1];
            $dateEnd = "31.12." . $matches[1];

            $this->view->sel_year = $matches[1];
        } elseif (preg_match('/^archive\/(.*?)/', $strURI, $matches)) {
            Kohana::show_404();
        } else {
           // $baseURL .= '/' . date('Y') . '/' . date('m') . '/' . date('d');
            $baseURL .= date('/Y/m/d');
           // print_r($baseURL); die();
            $dateStart = date('d.m.Y'); //mirs публікації поточної дати, якщо не вказана інша
            $dateEnd = $dateStart;;
            
              //      print_r($dateStart); die();
        }




        if (empty($ajax_processing)) {
            $this->view("archive/index");

            $this->callendarBld($callendarMonth);

            $this->view->year_posts = $this->db->query("
				SELECT distinct to_char(i.i_date_create,'yyyy') as year
			    FROM items i
			    WHERE i_status = 1
			    AND i_type = '$class'
			    AND l_langnick = '" . $this->siteLang . "'
			    AND (
			    	i.i_ip IS NULL OR
			        NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%'))
			        )
			    ORDER BY to_number(to_char(i.i_date_create,'yyyy')) desc");
        } else { //ajax запит
            $this->view("archive/list");
            $this->use_main = FALSE;
        }

      //  print_r($baseURL); die();
        
        //Формування списку архіву    	
        $pagination = new Pagination(array(
            'base_url' => $baseURL,
            'lang_prefix' => $this->view->lang_prefix,
            'uri_segment' => 'page',
            'items_per_page' => $page_count,
            'style' => 'digg',
            'auto_hide' => TRUE,
        ));

        //mirs додано фільтрацію по даті яка більше поточної       
        $baseQuery = "
		    FROM items i
		    WHERE i_status = 1
            AND i.i_date_create <= sysdate
		    AND i_type = '$class'
		    AND l_langnick = '" . $this->siteLang . "'
		    " . (isset($dateStart) && isset($dateEnd) ?
                        " AND i.i_date_create BETWEEN  to_date('" . $dateStart . " 00:00', 'dd.mm.yyyy hh24:mi') AND  to_date('" . $dateEnd . " 23:59', 'dd.mm.yyyy hh24:mi') " : "") . " 
		    AND (
		    	i.i_ip IS NULL OR
		        NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%'))
		        )";



        $posts = $this->db->query("
            SELECT p1.*, 
            m.m_name as month, to_char(p1.i_date_create,'dd') as day,  to_char(p1.i_date_create,'yyyy') as year,   to_char(p1.i_date_create,'hh24') as hour,   to_char(p1.i_date_create,'mi') as minute,
            
            CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = p1.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories 

            FROM ( 
                SELECT * FROM (SELECT rownum as linenum, p_query.* FROM (
                    SELECT i_id, i_name, i_anons, i_link, i_logoname, t_id, CASE WHEN i_logoname IS NULL THEN 1 ELSE 0 END AS logo_null, i_date_create
                    " . $baseQuery . "                        
                    ORDER BY i_date_create " . $type_sort . "
                ) p_query WHERE rownum <= " . ($pagination->sql_limit + $pagination->sql_offset) . ") WHERE linenum > " . $pagination->sql_offset . "
            ) p1
            INNER JOIN months m ON to_number(to_char(p1.i_date_create,'mm')) = m.m_number AND m.l_langnick = '$this->siteLang'");


        $pagination->set_total_items($this->db->select("COUNT(*) AS total " . $baseQuery)
                        ->get()
                        ->current()
                ->total);
        //print_r($posts);die;

        $this->view->posts = $posts;
        $this->view->pagination = $pagination;
        $this->view->baseURL = $baseURL;
        $this->view->type_sort = $type_sort;
        $this->view->page_count = $page_count;

        $this->view->month_list = $this->db->query("
			select lpad(m_number,2,'0') as month_number, to_char(to_date(lpad(m_number,2,'0'), 'mm'),'Month', 'NLS_DATE_LANGUAGE=" . $this->ORA_NLS_LANG[$this->siteLang] . "') as month_name 
			from months
			where l_langnick='$this->siteLang'
    	")->as_array();

        $this->view->get_param = '?sort=' . $type_sort . '&page_count=' . $page_count;
    }

    /**
     * Формування календаря головної сторінки (ajax)
     *
     * @param number $setMonth - місяць формування (РРРРММ)
     */
    public function callendar_main_page($setMonth = '') {
        $this->view('main_page/callendar');
        $this->use_main = FALSE;

        $this->callendarBld($setMonth);
    }

    /**
     * Формування календаря архіву (ajax)
     *
     * @param number $setMonth - місяць формування (РРРРММ)
     */
    public function callendar_archive($setMonth = '') {
        $this->view('archive/callendar');
        $this->use_main = FALSE;

        $this->callendarBld($setMonth);
    }

    /**
     * Редірект на посторінковий вивід
     */
    public function __call($method, $arguments) {
        self::index();
    }

    /**
     * Формування календаря
     *
     * @param number $setMonth - місяць формування (РРРРММ)
     */
    private function callendarBld($setMonth = '') {

        $class = 'news';

        if (empty($setMonth) || strlen($setMonth) != 6 || !is_numeric($setMonth) ||
                (int) substr($setMonth, 0, 4) < 1900 || (int) substr($setMonth, 0, 4) > 2099 ||
                (int) substr($setMonth, 4, 2) < 1 || (int) substr($setMonth, 4, 2) > 12) {

            $year = (int) date('Y');
            $month = (int) date('m');
        } else {
            $year = (int) substr($setMonth, 0, 4);
            $month = (int) substr($setMonth, 4, 2);
        }
        $ymStr = str_pad($year, 4, "0", STR_PAD_LEFT) . str_pad($month, 2, "0", STR_PAD_LEFT);
//mirs додано фільтрацію по даті яка більше поточної  i.i_date_create <= sysdate 
        $dayList = $this->db->query("
			SELECT 
			    MAX(DECODE (p_add_day.week_day, 1, p_add_day.nday, NULL)) wkday_1_num,
			    MAX(DECODE (p_add_day.week_day, 1, p_day_data.cnt, NULL)) wkday_1_cnt,
			        
			    MAX(DECODE (p_add_day.week_day, 2, p_add_day.nday, NULL)) wkday_2_num,
			    MAX(DECODE (p_add_day.week_day, 2, p_day_data.cnt, NULL)) wkday_2_cnt,
			    
			    MAX(DECODE (p_add_day.week_day, 3, p_add_day.nday, NULL)) wkday_3_num,
			    MAX(DECODE (p_add_day.week_day, 3, p_day_data.cnt, NULL)) wkday_3_cnt,
			    
			    MAX(DECODE (p_add_day.week_day, 4, p_add_day.nday, NULL)) wkday_4_num,
			    MAX(DECODE (p_add_day.week_day, 4, p_day_data.cnt, NULL)) wkday_4_cnt,
			    
			    MAX(DECODE (p_add_day.week_day, 5, p_add_day.nday, NULL)) wkday_5_num,
			    MAX(DECODE (p_add_day.week_day, 5, p_day_data.cnt, NULL)) wkday_5_cnt,
			    
			    MAX(DECODE (p_add_day.week_day, 6, p_add_day.nday, NULL)) wkday_6_num,
			    MAX(DECODE (p_add_day.week_day, 6, p_day_data.cnt, NULL)) wkday_6_cnt,
			    
			    MAX(DECODE (p_add_day.week_day, 7, p_add_day.nday, NULL)) wkday_7_num,
			    MAX(DECODE (p_add_day.week_day, 7, p_day_data.cnt, NULL)) wkday_7_cnt				
			FROM				
			(SELECT tab.*
			FROM (SELECT ROWNUM nday,  WEEK_NUMBER(TRUNC(to_date('$ymStr','yyyymm'),'MM')+ROWNUM-1) as week_num, 
			    to_char(to_date('$ymStr'||lpad(ROWNUM,2,'0'),'yyyymmdd'),'D', 'NLS_DATE_LANGUAGE=" . $this->ORA_NLS_LANG[$this->siteLang] . "') as week_day
			      FROM DUAL
			      CONNECT BY LEVEL <= to_number(to_char(last_day(to_date('$ymStr','yyyymm')),'dd'))) tab
			CONNECT BY TAB.nday = PRIOR TAB.nday + 1
			START WITH TAB.nday = 1) p_add_day
			    LEFT JOIN 				    
			    (SELECT to_number(TO_CHAR(i_date_create, 'dd')) AS nday, count(1) as cnt 
			    FROM items i 
			    WHERE i_status = 1
                AND i.i_date_create <= sysdate 
			    AND i_type = '$class' AND l_langnick = '" . $this->siteLang . "' 
                AND i.i_date_create BETWEEN to_date('" . $ymStr . "010000', 'yyyymmddhh24mi') 
                					AND  to_date('" . $ymStr . date::getLastMonthDay($year, $month) . " 2359', 'yyyymmddhh24mi') 
                
                AND (
                	i.i_ip IS NULL OR
                    NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%'))
                    )
			    GROUP BY to_number(TO_CHAR(i_date_create, 'dd'))) p_day_data  on p_add_day.nday=p_day_data.nday
			GROUP BY p_add_day.week_num
			ORDER BY p_add_day.week_num
         ");

        $arrMonth = array();
        foreach ($dayList->result(false) as $row) {
            $arrDay = array();
            for ($lp1 = 0; $lp1 < 7; $lp1++) {
                $arrDay[] = array('num' => $row['wkday_' . ($lp1 + 1) . '_num'],
                    'cnt' => $row['wkday_' . ($lp1 + 1) . '_cnt']);
            }
            $arrMonth[] = $arrDay;
        }
        $this->view->days_list = $arrMonth;

        $addParam = $this->db->query("        	
			select 	to_char(to_date('$ymStr','yyyymm'),'Month', 'NLS_DATE_LANGUAGE=" . $this->ORA_NLS_LANG[$this->siteLang] . "') as cur_month_name,
					to_char(add_months(to_date('$ymStr','yyyymm'),-1),'Month', 'NLS_DATE_LANGUAGE=" . $this->ORA_NLS_LANG[$this->siteLang] . "') as prev_month_name,
					to_char(add_months(to_date('$ymStr','yyyymm'),-1),'yyyymm') as prev_month,										
					to_char(add_months(to_date('$ymStr','yyyymm'),-1),'yyyy/mm') as prev_month_url,
					to_char(add_months(to_date('$ymStr','yyyymm'),1),'Month', 'NLS_DATE_LANGUAGE=" . $this->ORA_NLS_LANG[$this->siteLang] . "') as next_month_name,
					to_char(add_months(to_date('$ymStr','yyyymm'),1),'yyyymm') as next_month,			
					to_char(add_months(to_date('$ymStr','yyyymm'),1),'yyyy/mm') as next_month_url,	
					to_char(LAST_DAY(to_date('$ymStr','yyyymm')),'dd') as last_day,							
					CONCAT_CRS (CURSOR(					
						SELECT name_day FROM (
						SELECT distinct replace(day_of_week_name,'.','') as name_day , day_of_week 
						FROM (SELECT ROWNUM nday,
						    TO_CHAR (TRUNC(SYSDATE,'MM') + ROWNUM - 1, 'Dy', 'NLS_DATE_LANGUAGE=" . $this->ORA_NLS_LANG[$this->siteLang] . "') AS day_of_week_name,
						    TO_CHAR (TRUNC(SYSDATE,'MM') + ROWNUM - 1, 'D') AS day_of_week
						      FROM DUAL
						      CONNECT BY LEVEL <= to_number(to_char(last_day(to_date('$ymStr','yyyymm')),'dd'))) TAB
						CONNECT BY TAB.nday = PRIOR TAB.nday + 1
						START WITH TAB.nday = 1
						order by TAB.day_of_week)											
					 ), '|') name_week_days			
					
			
			FROM DUAL			
        ")->current();


        $arrRedDay = array();
        $allRedDay = Kohana::config('callendar.red_day');
        for ($lp1 = 0; $lp1 <= $addParam->last_day; $lp1++) {
            $arrRedDay[] = in_array(substr($ymStr, 4, 2) . str_pad($lp1, 2, "0", STR_PAD_LEFT), $allRedDay);
        }

        $this->view->red_day = $arrRedDay;


        $this->view->current_year = substr($ymStr, 0, 4);
        $this->view->current_month = substr($ymStr, 4, 2);
        $this->view->prev_year = (substr($ymStr, 0, 4) - 1) . substr($ymStr, 4, 2);
        $this->view->next_year = (substr($ymStr, 0, 4) + 1) . substr($ymStr, 4, 2);


        $this->view->name_week_days = explode('|', $addParam->name_week_days);
        $this->view->callendar_header = $addParam;

        $this->view->current_day = date('Ymd');
        $this->view->selected_month = $ymStr;
        $this->view->month_uri = substr($ymStr, 0, 4) . '/' . substr($ymStr, 4, 2);

        $this->view->is_current_month = ($ymStr === date('Ym'));
        $this->view->is_current_year = (substr($ymStr, 0, 4) === date('Y'));

        $first_month = $this->db->select("to_char(min(i_date_create),'yyyymm') as first_month")
                        ->from('items')
                        ->where('i_status', 1)
                        ->where('l_langnick', "'" . $this->siteLang . "'")->get()->current()->first_month;

        $this->view->is_firts_month = ($ymStr === $first_month);
        $this->view->is_firts_year = (substr($ymStr, 0, 4) === substr($first_month, 0, 4));
    }

}
