<?php

class Infocenter_Model extends Model {
	
	
	/**
	 * імя таблиці
	 *
	 * @var string
	 */
	protected $table_name = "infocenter";
	
	/**
	 * поле і напрямок сортування
	 *
	 * @var array
	 */
	protected $sorting = array();
	
	protected $join_data = array();

	/**
	 * Отримання всі записів по where параметру
	 *
	 * @param array $exp	- where parameters
	 * @return mixed
	 */
	public function getAll($exp = array(),$select = false){
		$db = Database::instance();
		
		if(!empty($select) && is_array($select))
			$db->select($select);
		
		$result = $db->from($this->table_name);
		
		if(!empty($this->join_data) && is_array($this->join_data)){
			foreach ($this->join_data as $join){
				$db->join($join['table'],$join['relation']);
			}
		}
			
		
		if(!empty($this->sorting) && is_array($this->sorting)){
			$result->orderby($this->sorting);
		}
		
		if(!empty($exp) && is_array($exp)){
			$result->where($exp);
		}
		
		return $result->get();
	}
	
	/**
	 * Отримання одного запису з бд по where параметру
	 *
	 * @param array $exp
	 * @return object
	 */
	public function getOne($exp = array()){
		
		$db = Database::instance();
		$result = $db->from($this->table_name);
		
		if(!empty($exp) && is_array($exp)){
			$result->where($exp);
		}
		
		return $result->get()->current();
	}
	
	/**
	 * патерн factory
	 *
	 * @param string $table_name	- table name
	 * @return object
	 */
	public static function factory($table_name = false){
		return new self($table_name);
	}
	
	/**
	 * конструктор
	 *
	 * @param string $table_name	- table name
	 */
	public function __construct($table_name = false){
		if(!empty($table_name))
			$this->table_name = $table_name;
	}
	
	
	/**
	 * сортування
	 *
	 * @param array $exp	- sortby parameters
	 * @return object
	 */
	public function sortby($exp = array()){
		if(!empty($exp) && is_array($exp))
			$this->sorting = $exp;
		return $this;
	}
	
	public function join($table, $relation){
		if(!empty($table) && !empty($relation))
			$this->join_data[] = array(
				"table"		=> $table,
				"relation"	=> $relation
			);
			
		return $this;
		
	}
	
	/**
	 * оновлення
	 *
	 * @param array $data	- данні для оновлення
	 * @param array $where	- where параметр
	 * @return object
	 */
	public function update($data = array(),$where = array()){
		$db = Database::instance();
		$result = $db->from($this->table_name);
		
		$result->set($data);
		
		if(!empty($where) && is_array($where))
			$result->where($where);
		
		return $result->update();
	}
	
	/**
	 * додавання запису до бд
	 *
	 * @param array $data
	 * @return object
	 */
	public function insert($data = array()){
		$db = Database::instance();
		$status = $db->insert($this->table_name, $data);
		return $status;
	}
	
	/**
	 * отримання списку запитань
	 *
	 * @param int $limit	- ліміт отримання рядків
	 * @param int $start	- зміщення
	 * @param array $where	- where параметр
	 * @return mixed
	 */
	public function list_questions($limit = false, $start = false, $where = false){
		$db = Database::instance();
		$questions = $db->select(
        						'i_id',
        						'i_question_name',
        						'i_question_username',
        						"to_char(i_question_date,'Month dd, YYYY. HH:mm ') as i_question_date, i_public",
        						"(select u_surname||' '||u_name from users where u_id = infocenter.u_id) as answer_user")
                         ->from($this->table_name)
                         ->limit(intval($limit), intval($start));
                         
        if ($where) {
            $questions = $questions->where($where);
        }
        
        return $questions;
	}
	
	/**
	 * матотест
	 *
	 * @param string $text	- рядок для перевірки
	 * @return boolean
	 */
	public static function checkBadWords($text){
		$db = Database::instance();
		$query = $db->select('bw_base, bw_completion')
		->from('badwords')
		->get();

		$badwords = array();

		foreach ($query->result(false) as $row){
			$badwords[] = $row;

		}

		if(empty($badwords)) return true;

		$pattern = '/((\s|\.|,|!|\?)(';
		$split = '';

		foreach($badwords as $word){
			if($word['bw_completion'] != ''){
				$word['bw_completion'] = str_replace(',', '|', $word['bw_completion']);
				$completion = '(|' . $word['bw_completion'] .')';

			}	else{
				$completion = '';

			}

			$pattern .= $split . $word['bw_base'] . $completion;

			$split = '|';

		}

		$pattern .= ')(\s|\.|,|!|\?))/isU';

		if(preg_match($pattern, ' ' . $text . ' '))	return false;

		return true;

	}
	
	/**
	 * Відправка відповіді на запитання електропоштою
	 *
	 * @param int	$i_id	- id запитання
	 */
	public static function send_email($i_id = false){
		if(!empty($i_id)){
			
			$db = Database::instance();
			
			$res = $db->select("*")
					  ->from("infocenter")
					  ->join("infocenter_answer", 'infocenter.i_id = infocenter_answer.i_id',false,'left')
					  ->join("users", 'users.u_id = infocenter_answer.u_id',false,'left')
					  ->where(array('infocenter.i_id'=>$i_id))
					  ->get()
					  ->current();
					  
					  
			$to      = $res->i_question_username." <".$res->i_question_useremail.">";  
			$from    = Kohana::config('infocenter.email_from');
			$subject = Kohana::lang('infocenter_custom_errors.email_subject');
			$message = Kohana::lang('infocenter_custom_errors.email_question').
					   "\r\n".
					   $res->i_question_name.
					   "\r\n\r\n".
					   $res->i_question.
					   "\r\n\r\n\r\n".
					   Kohana::lang('infocenter_custom_errors.answer').
					   "\r\n".
					   Kohana::lang('infocenter_custom_errors.answer_username')." ".
					   $res->u_name." ".$res->u_surname.
					   "\r\n".
					   $res->ia_answer;
 
			$headers  = "MIME-Version: 1.0\r\n";
			$headers .= "Content-type: text; charset=utf-8\r\n";
			$headers .= "From: {$from}\r\n"; 
			
			mail($to, $subject, $message, $headers);
		}
	}

}