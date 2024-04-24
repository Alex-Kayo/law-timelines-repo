<?php defined('SYSPATH') OR die('No direct access allowed.');

class Infocenter_Controller extends Template_Controller {

	/**
	 * імя таблиці
	 *
	 * @var string
	 */
	protected $table_name	= "infocenter";
	
	/**
	 * перегляд запитання і відповідей
	 *
	 * @param int $id	- id запитання
	 */
	public function show($id){
		
		$this->view('infocenter/view');
		
		if(!empty($id)){
	
			$question = $this->db->select('*')
				->from($this->table_name)
				->where(array('i_public'=>1,'i_id'=>intval($id)))
            	->get()
            	->current();
			
           	$answers = $this->db->select('*')
           		->from($this->table_name."_answer")
           		->where(array('i_id'=>intval($id)))
           		->get();
         	  		
           	if(count($question)){
           		$this->view->question = $question;
           	} else {
           		$this->view->error = Kohana::lang('infocenter_custom_errors.item_not_found');
           	}
           	
           	if(count($answers)){
           		$this->view->answers  = $answers;
           	} else {
           		$this->view->answ_error = Kohana::lang('infocenter_custom_errors.no_answers_found');
           	}
           	
		} else {
			$this->view->error = Kohana::lang('infocenter_custom_errors.item_not_found');
		}
	}
	
	/**
	 * перегляд опублікованих запитань
	 *
	 */
	public function index(){
				
		$pagination_config = array(
            'base_url'       => 'infocenter',
            'lang_prefix'    => $this->view->lang_prefix,
			'uri_segment'    => 'page',
			'items_per_page' => Kohana::config('posts.count_infocenter'),
            'style'          => 'digg',
            'auto_hide'      => TRUE,
		);
		
		$pagination = new Pagination($pagination_config);
		
		$this->view->questions = $this->db->select('*')
			->from($this->table_name)
			->where('i_public',1)
			->where('l_langnick', "'$this->siteLang'")
            ->limit($pagination->items_per_page, $pagination->sql_offset)
            ->get();

		$pagination->set_total_items($this->db->count_last_query());
		$this->view->offset = $pagination->sql_offset;
        $this->view->pagination = $pagination;
		
		$this->view('infocenter/index');
	}
	
	/**
	 * додавання нового запитання
	 *
	 */
	public function add(){
		
		$this->view('infocenter/add');
        
        $add = $this->input->post("add",null,true);
		
		if(!empty($add)){
			
			$cookie = array(
				'name'	=> 'infocenter_expire',
				'value' => mktime(),
				'expire' => '86500'
			);
			
			$cookie_value = cookie::get('infocenter_expire',null,true);
			
			
			if(!empty($cookie_value)){
				if($cookie_value < (mktime()-30)){
					$access = true;
				} else {
					$access = false;
				}
			} else {
				$access = true;
			}
			
			$post = Validation::factory($_POST)
				->pre_filter('trim', TRUE)
				->add_rules('name','required','length[5,255]',array('Infocenter_Model', 'checkBadWords'))
				->add_rules('email', 'required', 'valid::email')
				->add_rules('username', 'required','length[2,255]',array('Infocenter_Model', 'checkBadWords'))
				->add_rules('question', 'required',array('Infocenter_Model', 'checkBadWords'))
				->add_rules('captcha', 'required', 'Captcha::valid','length[6]');
			
			if($access === true){
			
				if(!$post->validate()){
					
					// Repopulate the form
					$form = $post->as_array();
				
					// And use your custom errors messages file
					$errors = $post->errors('infocenter_custom_errors');
					
					foreach ($post as $k=>$v){
						$data[$k] = $v;
					}
				
					$this->view->value = $data;
								
					$this->view->errors = $errors;
				} else {
					// Do your stuff here. Send your mail.
				
					$db_data = array(
						"i_question_name"		=> $post["name"],
						"i_question"			=> $post["question"],
						"i_question_username"	=> $post["username"],
						"i_question_useremail"	=> $post["email"],
						"i_question_date"		=> "sysdate",
						"i_public"				=> "0",
						"l_langnick"			=> $this->siteLang						
					);
					
					$insert = $this->db->insert($this->table_name,$db_data);
					
					
					
					//setcookie($cookie['name'],$cookie['value'],$cookie['expire'],$cookie['path']);	
					
					header('Set-Cookie: '.rawurlencode($cookie['name']).'='.rawurlencode($cookie['value']), false); 

					//$this->view->id = $insert->insert_id();
					$this->view('infocenter/added');

					$this->auto_render = FALSE;
					$this->view->render(TRUE);
					exit;
				}
			} else {

				foreach ($post as $k=>$v){
					$data[$k] = $v;
				}
				if(!$post->validate()){
					$this->view->errors = $errors;
				}
				$this->view->fields = $data;
				$this->view->error = Kohana::lang('infocenter_custom_errors.cookie');
				
			}
			
		}
		
		
		$this->view->captcha = Captcha::factory('vr')->render(true);
		
	}
	
	
	

}