<?php defined('SYSPATH') OR die('No direct access allowed.');

class Comments_Controller extends Template_Controller {

	/**
	 * Кількість коментарів на сторінку
	 *
	 */
	const page_count_comments = 10;
	
	
	
	/**
	 * Список коментарів
	 *
	 * @param string $method
	 * @param array $arguments
	 */
	public function __call($method, $arguments){		
		$itemID = (int)$this->input->post('item_id', null, true);
		$this->view("news/list_comments");		
		if($itemID  > 0){					
			$this->use_main = FALSE;
			$this->list_comments($itemID);
			
		}		
		
		
	}
	
    
	
    /**
     * Формування списку коментарів
     *
     * @param integer $items_id - ID публікації
     */
    public function list_comments($items_id){
            
        $pagination = new Pagination(array(
            'base_url'       => '/comments/',
            'lang_prefix'    => $this->view->lang_prefix,
            'uri_segment'    => 'comments',
            'items_per_page' => self::page_count_comments,
            'style'          => 'digg',
            'auto_hide'      => TRUE,
        ));		        
        
         //echo $pagination->sql_offset;
        
        $this->view->item_commets = $this->db
        		->select("comments.*, m.m_name as month, to_char(comments.c_date,'dd') as day,  to_char(comments.c_date,'yyyy') as year,   to_char(comments.c_date,'hh24') as hour,   to_char(comments.c_date,'mm') as minute" )
        		->from('comments')
        		->join('months m', "to_number(to_char(comments.c_date,'mm')) = m.m_number AND m.l_langnick = '" . $this->siteLang . "'", '', 'LEFT')
        		->where('comments.i_id', $items_id)
        		->where('comments.c_status > 0')
        		->orderby(array('c_date' => 'desc', 'c_id' => 'desc'))
        		->limit($pagination->sql_limit, $pagination->sql_offset)->get();
        
       	$pagination->set_total_items($this->db->count_last_query());
                
        $this->view->pagination = $pagination;		
        
    }	

	
	
	
	
	/**
	 * Додавання коментаря
	 *
	 */
	public function add(){
		$this->view('news/add_comments');
		$this->use_main = FALSE;
	
		$add = $this->input->post('add_comment', null, true);
		$item_id = (int)$this->input->post('item_id', 0, true);
		                
                if(!is_object($this->db->from('items')->where('i_id', $item_id)->where('comment_type > 1')->get()->current())){                    
                   die('No direct access allowed.');
                    
                }
                
		if(!empty($add) && $item_id > 0){	
			$post = Validation::factory($_POST)
				->pre_filter('trim', TRUE)
				->add_rules('name','required','length[3,255]')
				->add_rules('text','required','length[25,4000]')
				->add_rules('captcha', 'required', 'Captcha::valid');;				
				
			$post->add_callbacks('name', array($this, '_check_badwords'));	
			$post->add_callbacks('text', array($this, '_check_badwords'));	
			$post->add_callbacks('other', array($this, '_check_flood'));	
				
			if(!$post->validate()){ //Обробка з помилками
				
				$form = $post->as_array();
				$errors = $post->errors('comments_errors');
				
				$this->view->fields = $form;
				foreach ($errors as $k=>$v){
					$var_name = "error_{$k}";
					$this->view->$var_name = $v;
					
				}				
				
			}	else {

				$strip = search::strip(strip_tags($this->input->post('text', null, true)));
				$strip = wordwrap($strip, 75, "</br>", true);	       
				
				$arrSave = array('c_name' 	=> $this->input->post('name', null, true),
								 'c_comment'	=> $strip,
								 'i_id'		=> $item_id);
				
				$this->db->insert('comments', $arrSave);
								 
				$cookie = array(
				'name'	=> 'comments_expire',
				'value' => mktime(),
				'expire' => '86500',
				'domain' => 'vr',
				'path'   => '/'
				);
					
				header('Set-Cookie: '. rawurlencode($cookie['name']).'='.rawurlencode($cookie['value']), false);	
			
				
				$this->view->added_msg = Kohana::lang('news.comments_add');
			
				$this->view->errors = false;
				$this->view->fields = false;				
				
			}
			
			$this->view->captcha = Captcha::factory('vr')->render(true);





		}
		
		
	}
	
	
	/**
	 * Проверка на заборонені слова
	 *
	 * @param Validation $array		обьект класса Validation
	 * @param string $field			поле
	 */
	public function _check_badwords(Validation $array, $field){
		if(!Feedback_Controller::checkBadWords($array[$field])){
			$array->add_error($field, 'badword');
		}

	}	
	
	
	/**
	 * Проверка на флуд
	 *
	 * @param Validation $array		обьект класса Validation
	 * @param string $field			поле
	 */
	public function _check_flood(Validation $array, $field){
		$cookie_value = cookie::get('comments_expire',null,true);

		if(!empty($cookie_value)){
			if($cookie_value < (mktime()-30)){
				$access = true;

			} else {
				$access = false;

			}

		} else {
			$access = true;

		}
		
		if(!$access){
			$array->add_error('other', 'flood');
			
		}
		
		
		

	}	

	
	
}
