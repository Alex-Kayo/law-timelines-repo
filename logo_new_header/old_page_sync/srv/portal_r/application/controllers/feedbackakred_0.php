<?php defined('SYSPATH') OR die('No direct access allowed.');

define("CLOSE_ACRED",    2/24); //mirs 2 години

class Feedbackakred_Controller extends Template_Controller{
   
    
 //   const CLOSE_ACRED = 2/24;
    
    private $ad;
   // private $rootNode;
    private $lkey_anons;
    private $rkey_anons;
    
    public function __construct() {
        parent::__construct();
       
                $Topic_ID = Front_Controller::getTopicID('anons_acred');
    //            print_r($Topic_ID);                die();
                $rootNode = Front_Controller::getTopic($Topic_ID);
        $this->lkey_anons = $rootNode->t_left_key;
        $this->rkey_anons = $rootNode->t_right_key;
                $model = new Anons_calendar_Model();
                $this->ad = $model->get_anons_dates($this->lkey_anons, $this->rkey_anons, CLOSE_ACRED);
        
    
    }
    
   public function index(){
	
	//Kohana::show_404();  //mirs feedback disable 20130130
             $this->view('feedbackakred/index');
             $arrLang = Language::getLangData();
             $this->view->anons_dates = $this->ad;
		
             //   print_r($this->view->anons_dates[0]['fulldate']);
		$thFolder = substr($arrLang[$this->siteLang]['th_folder'],0,1) == '/' ? substr($arrLang[$this->siteLang]['th_folder'],1) : trim($arrLang[$this->siteLang]['th_folder']);

		if($thFolder[0] != '/') $thFolder = '/' . $thFolder;
		
      
             //   print_r($this->lkey_anons);          die('1233');
        

	//	$this->view->addressee = $this->getAddressees();
		$this->view->th_folder = $thFolder;

		$this->view->captcha = Captcha::factory('vr')->render(true);

	}
    
    public function ItemList($data_sel='') {
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
    public function EventList($data_sel='') {
            if(!$data_sel){
                die("Наразі нічого не заплановано"); 
            }
        $this->use_main = FALSE;
        $this->view('feedbackakred/list');
//        $date_anons = $this->input->post('reque', '0', true);
//        $date_anons = "20160321";
        $this->view->events = $this->SelAnons($data_sel, CLOSE_ACRED);
        
        
//        echo '<pre>';
//      print_r($this->class); 
////        print_r($this->view->anonsperiod['i_categories']); 
//        echo '/<pre>';
//       die();
    }
   private function SelAnons($date_anons, $date_offset) {

//        if (!$block_anons = $this->cache->get($cacheID)) {
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
           AND i_all.i_date_create >= sysdate+".$date_offset."
         ORDER BY i_date_create ASC)");
            //WHERE rownum <= 15 //mirs
            
   //     $this->cache->set($cacheID, $block_anons, array('main_page'), $this->cache_anons_life);
            
 //      }
 //       print_r($block_anons);
        return $block_anons;
    }
	public function sendMsg(){
		$this->use_main = FALSE;
		$this->view('feedbackakred/form');
                $this->view->anons_dates = $this->ad;
    
//		$add = $this->input->post('addressee', null, true);
		$add = 'ooo';
        
		if(!empty($add)){
			// Перевірка на стоп-слова
			if(!($this->checkBadWords($_POST['text']))
			or !($this->checkBadWords($_POST['name']))
			or !($this->checkBadWords($_POST['lname']))
//			or !($this->checkBadWords($_POST['zminame']))
			or !($this->checkBadWords($_POST['eventdate']))
			or !($this->checkBadWords($_POST['eventname']))
			or !($this->checkBadWords($_POST['phone']))){

				print Kohana::lang('feedback_errors.badWords');
				exit();

        }
	        
			$cookie = array(
			'name'	=> 'feedbackakred_expire',
			'value' => mktime(),
			'expire' => '86500',
			'domain' => 'vr',
			'path'   => '/'
			);
        
			$cookie_value = cookie::get('feedbackakred_expire',null,true);

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
			->add_rules('name','required','length[3,255]')
			->add_rules('lname','required','length[3,255]')
			->add_rules('phone','required','length[10,20]')
			->add_rules('zminame','required','length[8,255]')
			//->add_rules('eventdate','required','length[6,15]')
			->add_rules('eventname','required','length[15,512]')
			->add_rules('email', 'required', 'email');

			if($access === true){
				if((!$post->validate()) or (!Captcha::valid($_POST['captcha']))){
					$errors = $post->errors('feedbackakred_errors');

					if(!Captcha::valid($_POST['captcha'])){
						$errors['captcha'] = Kohana::lang('feedback_errors.captcha.default');

					}

					foreach ($post as $key=>$value){
						$data[$key] = strip_tags(trim($value));

					}
                                        
					$addressee = $this->getAddressees();

					for($j = 0; $j < count($addressee); $j++){
						if($addressee[$j]['fba_id'] == $post['addressee']){
							$addressee[$j]['selected'] = ' selected ';

						}	else{
							$addressee[$j]['selected'] = '';

						}

					}



					$this->view->addressee = $addressee;

					$this->view->value = $data;
					$this->view->errors = $errors;
					$this->view->timeoutError = '';


				}	else{
//					$email = $this->getAddresseeById($post['addressee']);
					
                                    $email = Kohana::config('emails.acred_recip');
                                 //   print_r($email);                                    die();
//                                    $email[0] = 'advise@v.rada.gov.ua';
                                    //$email[0] = 'mirs@rada.gov.ua';
                                    
				
					if($email == ''){
						print Kohana::lang('feedback_errors.sendProblems');

					}	else{
                                            
                                            // Формування лінків з полі додаткова інформація
                                        
                                    //    <a>https://mail.google.com/mail/ca/u/0/#inbox/158f7b95302bca77</a> dsfsdf sdfsdfsd <a>http://opendata.rada.gov.ua/</a>
                                        
                                    $post['text'] = preg_replace("/(https?:\/\/.[^\s]*)/", "<a href=\"$1\">$1</a>", $post['text']);
                                    
						
$message = "
            Назва ЗМІ:  <b> &laquo;{$post['zminame']}</b>&raquo; <br>  <br> 
            Відправник: <b>{$post['name']} {$post['lname']} </b><br><br>
            Е-mail відправника: <a href=\"mailto:{$post['email']}\">{$post['email']}</a><br>
            Телефон відправника: {$post['phone']}<br>
            Дата події: {$post['eventdate']}<br>
            Назва події: {$post['eventname']}<br>
            Додаткова інформація: {$post['text']}<br>";

						// print $message;
						/*
						$headers  = "MIME-Version: 1.0\r\n";
						$headers .= "Content-type: text; charset=utf-8\r\n";
						$headers .= "From: feedback.vr@gov.ua\r\n";
						mail($email, 'Сайт Верховної ради України', $message, $headers);
    */
//						email::send($email, 'iportal@rada.gov.ua', $post['zminame'], $message, TRUE);

                            foreach ($email as $em) {
                        email::send($em, 'iportal@rada.gov.ua', 'Заявка на акредитацію «'.$post['zminame'].'»', $message, \TRUE);
    }
    
						header('Set-Cookie: '. rawurlencode($cookie['name']).'='.rawurlencode($cookie['value']), false);
    
						
						print Kohana::lang('feedbackakred_errors.sendOk');
                                               // print " ".$post['text'];
                        exit();
						return;

}

					exit();

				}

			}	else{
				foreach ($post as $key => $value){
					$data[$key] = $value;

				}

				if(!$post->validate()){
					$errors = $post->errors('feedback_errors');
					$this->template->assign('errors', $errors);

				}

				$this->view->addressee = $this->getAddressees();
				$this->view->value = $data;
				$this->view->timeoutError = Kohana::lang('feedback_errors.cookie');

			}

			$this->view->captcha = Captcha::factory('vr')->render(true);

		}
 else {
//    print_r($add.'oooo');
}
	}


	private function getAddressees(){
		$query = $this->db->select('fba_id, fba_nickname')
		->from('feedback_addressee')
		->where('l_langnick', "'$this->siteLang'")
		->where('fba_public', 1)->get();

		$addressee = array();

		foreach ($query->result(false) as $row){
			$addressee[] = $row;

		}

		return $addressee;

	}


	public function checkBadWords($text){
		$query = $this->db->select('bw_base, bw_completion')
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


	protected function getAddresseeById($id = ''){
		if($id == '') return false;

		$query = $this->db->select('fba_email')
		->from('feedback_addressee')
		->where('fba_id', $id)->get()->current();

		$email = $query->fba_email;

		if(isset($email) and ($email != '')){
			return $email;

		}	else{
			return false;

		}

	}


}
