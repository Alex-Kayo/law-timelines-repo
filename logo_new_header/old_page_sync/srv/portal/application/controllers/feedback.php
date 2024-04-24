<?php defined('SYSPATH') OR die('No direct access allowed.');

class Feedback_Controller extends Template_Controller{

    public  $recaptcha;

    public function __construct() {
        parent::__construct();
        $this->recaptcha = ReCaptcha::factory('vr');

        $this->view->addressee = $this->getAddressees();

    }


    public function index(){
	
	//Kohana::show_404();

        $this->view('feedback/index');
        $this->view->sitekey = $this->recaptcha->key;

		$arrLang = Language::getLangData();
		$thFolder = substr($arrLang[$this->siteLang]['th_folder'],0,1) == '/' ? substr($arrLang[$this->siteLang]['th_folder'],1) : trim($arrLang[$this->siteLang]['th_folder']);
        $this->view->th_folder = $thFolder;
		if($thFolder[0] != '/') $thFolder = '/' . $thFolder;

	}

	public function sendMsg(){

		$this->use_main = FALSE;
		$this->view('feedback/index');
        $this->view->sitekey = $this->recaptcha->key;
        $add = $this->input->post('addressee', null, true);
		if(!empty($add)){
			// Перевірка на стоп-слова
			if(!($this->checkBadWords($_POST['text']))
			or !($this->checkBadWords($_POST['name']))
			or !($this->checkBadWords($_POST['theme']))
			//or !($this->checkBadWords($_POST['post']))
			//or !($this->checkBadWords($_POST['phone']))
                                ){

				print Kohana::lang('feedback_errors.badWords');
				exit();

			}

			$cookie = array(
			'name'	=> 'feedback_expire',
			'value' => time(),
			'expire' => '86500',
			'domain' => 'vr',
			'path'   => '/'
			);

			$cookie_value = cookie::get('feedback_expire',null,true);

			if(!empty($cookie_value)){
				if($cookie_value < (time()-30)){
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
			->add_rules('text','required','length[25,1024]') //mirs було 25, 255
			->add_rules('theme','required','length[8,255]')
			->add_rules('email', 'required', 'email');

                $RecaptureValidate = $this->recaptcha->validate();

			if($access === true){
				if((!$post->validate()) or !$RecaptureValidate){
					$errors = $post->errors('feedback_errors');

					if(!$RecaptureValidate){
						$errors['recaptcha'] = Kohana::lang('feedback_errors.recaptcha.default');

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
					$this->view->recipient = '- "'.$_POST['recipient'].'"';
                    $this->view->value = $data;
					$this->view->errors = $errors;
					$this->view->timeoutError = '';


				}	else{
					$email = $this->getAddresseeById($post['addressee']);

					if($email == ''){
						print Kohana::lang('feedback_errors.sendProblems');

					}	else{
						$message = "

                            <style> 
th {
                            vertical-align: top;
    text-align: right;
    color: #770000;
    width: 30%;
} 
</style>

<table width='680' border='0' cellpadding='2'>
<tbody>
   <th scope='row'>І'мя відправника: </th>
  <td><b>{$post['name']}</b></td>
</tr>
<tr>
  <th scope='row'>Е-mail відправника: </th>
  <td><a href=\"mailto:{$post['email']}\">{$post['email']}</a></td>
</tr>
</tr>
<tr>
  <th scope='row'>Текст повідомлення:</th>
  <td>{$post['text']}</td>
</tr>
</tbody>
</table>
       ";



						email::send($email, 'iportal@rada.gov.ua', $post['theme'], $message, TRUE);

						header('Set-Cookie: '. rawurlencode($cookie['name']).'='.rawurlencode($cookie['value']), false);
			
						print Kohana::lang('feedback_errors.sendOk');
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


		}

	}


	private function getAddressees(){
		$query = $this->db->select('fba_id, fba_nickname')
		->from('feedback_addressee')
		->where('l_langnick', "'$this->siteLang'")
		->where('fba_public', 1)
        ->orderby('fba_id', 'desc')->get();
		$addressee = array();

		foreach ($query->result(false) as $row){
			$addressee[] = $row;

		}
//var_dump($addressee); die("application/controllers/feedback.php:191");
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
