<?php
class Search_Controller extends Front_Controller {

    private $date_pieces = array(0,0,0); // mirs новий сайт 19.09.2019
    /**
	 * Форма вводу параметрів пошуку
	 *
	 */
    private $topics;
    
    public function __construct() {
        parent::__construct();
		Kohana::show_404();
		
$search_seos = Kohana::config('topics_search_seos.seos_list'); // mirs формує перелік сео (рядок з комами) для пошуку
  //  var_dump($search_seos);        die();
        $this->topics = $this->db->select("t_id, t_name")
			->from('topics')
			->where("t_seo_name  in (".$search_seos.")")
//			->where("t_seo_name  in ('news', 'documents', 'preview', 'Top-novyna')")
			->where('t_status', 1)
                        ->where('l_langnick', "'" . $this->siteLang . "'")
                        ->orderby(array('t_left_key' => 'ASC'))->get();
    }
//        $this->topics = $this->db->select("t_id, lpad('.',(t_level-1)*5,'.')||substr(t_name,1,50) as t_name")
//			->from('topics')
//			->where('t_status', 1)
//                        ->where('l_langnick', "'" . $this->siteLang . "'")
//			->where("t_seo_name <> 'recycler'")
//                        ->orderby(array('t_left_key' => 'ASC'))->get();
//    }
    
    public function index() {
	    
        $this->view('search/index');
        $this->view->front = false;

		
		
        $this->view->current_node->t_name = Kohana::lang('search.title');
        
        
        if (isset($_GET['submit']) || isset($_GET['submit_form'])) {

            if ($this->input->get('date_point')) {
                $this->date_pieces = explode(".", $this->input->get('date_point')); // mirs новий сайт 19.09.2019
            }
        //     var_dump($this->input->get('date_point'));        die();
	    
            $params = array(
                                'date_point' => $this->input->get('date_point'),
                                'field' => intval($this->input->get('field')),
                                'field_check' => 'fcheck'.intval($this->input->get('field')),// mirs для повернення checked
                                'search' => search::strip($this->input->get('search')),
                                'date_type' => intval($this->input->get('date_type')),
                                'date_type_check' => 'dtcheck'.intval($this->input->get('date_type')),
                                'day' => intval($this->date_pieces[0]),
                                'month' => intval($this->date_pieces[1]),
                                'year' => intval($this->date_pieces[2]),
                                'topics' => intval($this->input->get('topics')),
                                'sort' => intval($this->input->get('sort')),
                                'sort_check' => 'scheck'.intval($this->input->get('sort')),
                                'from_page_form' => intval($this->input->get('from_page_form')),
                
                
                        );
            
			$params['search'] = $this->dublicate_space_remove($params['search']);
			
			
        // Перетворюем пошуковий рядок 
         if ($this->siteLang == 'ua'){
			$params['search'] = str_ireplace(array('AND', 'OR'), '', $params['search']);
                //        $params['search']= $this->ukrSearchQuery($params['search']);
         }
            $this->view->search_str = $params['search']; //mirs формує пошуковий рядок для відображення у шапці форми 
                        $params['search']= $this->ukrSearchQuery($params['search']); //для англ версії заміна * на %, - на //- 
            
			$get = Validation::factory($params)
				->pre_filter('trim', TRUE)
				->add_rules('search', 'required', 'length[3,100]')
				->add_callbacks('year', array($this, 'yearCheck'))        
				->add_callbacks('month', array($this, 'monthCheck'));        
				

            if (!$get->validate()) {
                                if($params['from_page_form']){$this->view('search/page');}
                                else {$this->view('search/index');}		
				$this->view->front = false;
				$this->view->var_data = $params;        	
				$this->view->errors = $get->errors('search_errors');
			} else { 
				$this->view('search/page');	
				$this->view->front = false;
                                $this->view->var_data = $params;
                                $this->view->topics = $this->topics;
                                
				$this->procSearch($get);
				return;
			}        	
                }	
        
		$arrYear = array();
        for ($lp1 = 0; $lp1 <= 20; $lp1++) {
            $arrYear[] = ((int) date('Y')) - $lp1;
		}
		$this->view->year = $arrYear;
		
		
		$arrDay = array();
        for ($lp1 = 1; $lp1 <= 31; $lp1++) {
			$arrDay[] = $lp1;
		}
		$this->view->day = $arrDay;		
		
		
		$this->view->topics = $this->topics;
	}
	
	/**
	 * Перевірка року
	 *
	 * @param Validation $get
	 */
	public function yearCheck(Validation $get){
		
		if(isset($get->year) && $get->year == 0){					
			if( (isset($get->day) && $get->day > 0) || (isset($get->month) && $get->month > 0)){	
				$get->add_error('year', 'required');
			}
		}
	}	
	
	/**
	 * Перевірка місяця
	 *
	 * @param Validation $get
	 */
	public function monthCheck(Validation $get){
		
		if(isset($get->month) && $get->month == 0){					
			if(isset($get->day) && $get->day > 0){	
				$get->add_error('month', 'required');
				
			}
		}
		
	}		
	
	
	/**
	 * Обробка запиту пошуку
	 *
	 * @param object $objGet - об"єкт GET змінних запиту
	 */
    private function procSearch($objGet) {

			
        $pagination = new Pagination(array(
            'base_url'       => $this->view->lang_prefix.'/search/',
            'lang_prefix'    => $this->view->lang_prefix,
            'uri_segment'    => 'page',
            'items_per_page' => Kohana::config('posts.count_search'),
            'style'          => 'digg',
            'auto_hide'      => TRUE,
        ));        
        
        
        //пошук по назві або анонсам
        if((isset($objGet->field) && ($objGet->field==0 || $objGet->field==1 || $objGet->field==2)) || !isset($objGet->field)){ 
        	$sql = "insert into search (id, score_1, score_2)
				(SELECT i.i_id , SCORE(1),SCORE(2) 
				FROM items i  WHERE  (CONTAINS(i.i_name,'" . $objGet->search . "',1)>0 or  CONTAINS(i.i_anons,'" . $objGet->search . "',2)>0)
				)";
        
        	$this->db->stmt_prepare($sql)->noCommit()->execute();
        }
        
        //пошук по тексту документа
        if ((isset($objGet->field) && ($objGet->field==0 || $objGet->field==3)) || !isset($objGet->field)) {
        	$sql = "insert into search (id, score_3)
				(select i_id, SCORE(3) from items_full f 
				where CONTAINS(f.i_full,'" . $objGet->search . "',3)>0)";
        	        	
       		$this->db->stmt_prepare($sql)->noCommit()->execute();   
        	
        }
                
        
        //Базова умова виборки
        //mirs додано фільтр дати рядок 
        $strBase = "from items i
			    inner join (
			            select id, sum(score_1) as score_1 , sum(score_2) as score_2, sum(score_3) as score_3  
			            from search
			            group by id        
			    ) s on i.i_id=s.id 
			    " .         
        		(isset($objGet->topics) && $objGet->topics > 0?
        		"
		    		INNER JOIN (select distinct t.t_id
					        	from topics t, (select t_left_key, t_right_key from topics where t_id='" . $objGet->topics . "') t_root   
					        	where t.t_left_key >= t_root.t_left_key  and t.t_right_key <= t_root.t_right_key AND t_status=1 AND t_seo_name <> 'recycler') t ON i.t_id = t.t_id
        		"
        		:        		
        			" 
        				inner join topics t on i.t_id=t.t_id and  t.l_langnick='" . $this->siteLang . "' and  t.t_status=1 AND t_seo_name <> 'recycler'
        			"
        		). "
			WHERE i.i_status=1 and i.l_langnick='" . $this->siteLang . "'
			AND (
			    i.i_ip IS NULL OR
			    NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '".$this->input->ip_address()."' LIKE replace(ip.ii_ip, '*', '%'))
			) AND i_date_create <= sysdate ";
        //дата виборки
        if(isset($objGet->year) && isset($objGet->month) && isset($objGet->day) 
        	&& strlen($objGet->year)==4 
        	&& $objGet->month>=1 && $objGet->month<=12 
        	&& $objGet->day>=1 && $objGet->day<=31){
        	
        		$dateStart = str_pad($objGet->day, 2, "0", STR_PAD_LEFT) . "." . str_pad($objGet->month, 2, "0", STR_PAD_LEFT) . "." . $objGet->year;
        		$dateEnd = $dateStart;
        		
        }	elseif (isset($objGet->year) && isset($objGet->month) 
        	&& strlen($objGet->year)==4
        	&& $objGet->month>=1 && $objGet->month<=12){
        		
        		$dateStart =  "01." .str_pad($objGet->month, 2, "0", STR_PAD_LEFT) . "." . $objGet->year;
        		$dateEnd = date::getLastMonthDay($objGet->year, $objGet->month) . "." . str_pad($objGet->month, 2, "0", STR_PAD_LEFT) . "." . $objGet->year;        		
        		
        }	elseif (isset($objGet->year) && strlen($objGet->year)==4){
        	
        		$dateStart =  "01.01." . $objGet->year;
        		$dateEnd = "31.12." . $objGet->year;        		        	
        	
        }
        if(isset($dateStart) && isset($dateEnd)){
        	
        	$dateStart = "to_date('" . $dateStart . " 00:00', 'dd.mm.yyyy hh24:mi')";
        	$dateEnd = "to_date('" . $dateEnd . " 23:59', 'dd.mm.yyyy hh24:mi')";
        	
        	if(isset($objGet->date_type) && $objGet->date_type == 2){ // "<"
        		$strBase .= " AND i.i_date_create < " . $dateStart;
        		
        		
        	}	elseif (isset($objGet->date_type) && $objGet->date_type == 3) { // ">"
        		$strBase .= " AND i.i_date_create > " . $dateEnd;
        		
        	}	else {  // "between"      		
        		$strBase .= " AND i.i_date_create BETWEEN  " . $dateStart . " AND " . $dateEnd;
        		
        	}
        }        		
        
// для підсвітки результату пошуку
// mark_find_text(  i.i_id, '{$objGet->search}', 'items_fulltext_1') as i_name
// mark_find_text(  i.i_id, '{$objGet->search}', 'items_fulltext_2') as i_anons        
        
        $str = "SELECT p1.*
			, CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = p1.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories,
			m_name as month , to_char(i_date_create,'dd') as day,  to_char(i_date_create,'yyyy')	as year, to_char(i_date_create,'hh24:mi') as hour    					
			
			                    FROM ( 
			SELECT * FROM (SELECT rownum as linenum, p_query.*, m.m_name 
                        FROM (
			select i.i_id, i.t_id,  mark_find_text(  i.i_id, '{$objGet->search}', 'items_fulltext_1') as i_name,                    
                        mark_find_text(  i.i_id, '{$objGet->search}', 'items_fulltext_2') as i_anons, i.i_link, i.i_date_create, i.is_video
			" . $strBase . " " . (isset($objGet->sort) && $objGet->sort == 2 ? 'ORDER BY i.i_date_create desc' : 'ORDER BY s.score_1 DESC, s.score_2 DESC, s.score_3 DESC') . "			
			) p_query 
				INNER JOIN months m ON to_number(to_char(p_query.i_date_create,'mm'))=m.m_number AND l_langnick = '" . $this->siteLang . "'			
			WHERE rownum <= " . ($pagination->sql_limit + $pagination->sql_offset) . ") WHERE linenum > " . $pagination->sql_offset . ") p1";        
        
    //    die($str);
        
        
         $this->view->posts = $this->db->query($str);
//         var_dump($this->db->last_query());         die();


		$total_items = $this->db->query('SELECT count(1) AS cnt ' . $strBase)->current()->cnt;
		$this->view->total_items = $total_items;
		$pagination->set_total_items($total_items);
		
		
		
        
        $this->view->pagination = $pagination;        
	}
		

	private function dublicate_space_remove($str){
	    while(strpos($str, '  ') !== false){
		$str = str_replace('  ', ' ', $str);		
	    }
	    return trim($str);
	    
	}

}
