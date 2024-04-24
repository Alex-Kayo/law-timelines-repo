<?php defined('SYSPATH') OR die('No direct access allowed.');

define("CLOSE_ACRED",    2/24); //mirs 2 години

class Feedbackakred_Controller extends Front_Controller
{


    private $ad;
    // private $rootNode;
    private $lkey_anons;
    private $rkey_anons;
    public $recaptcha;
    public $imail_from = 'iportal@rada.gov.ua';
    public $imail_subject = 'Заявка на разову акредитацію ';
    public $templite_sendOk;


    public function __construct()
    {
        parent::__construct();
        //Kohana::show_404();
        $this->recaptcha = ReCaptcha::factory('vr');

        $Topic_ID = $this->getTopicID('anons_acred'); //UA list acred
        //    $Topic_ID = $this->getTopicID('anons_acred'); //EN list acred
        //            print_r($Topic_ID);                die();
        $rootNode = $this->getTopic($Topic_ID);
        $this->lkey_anons = $rootNode->t_left_key;
        $this->rkey_anons = $rootNode->t_right_key;
        $model = new Anons_calendar_Model();
        $this->ad = $model->get_anons_dates($this->lkey_anons, $this->rkey_anons, CLOSE_ACRED);


    }

    public function index()
    {

        //Kohana::show_404();  //mirs feedback disable 20130130
        $this->view('feedbackakred/index');
        $arrLang = Language::getLangData();
        $this->view->anons_dates = $this->ad;
        $this->view->sitekey = $this->recaptcha->key;

        //   print_r($this->view->anons_dates[0]['fulldate']);
        $thFolder = substr($arrLang[$this->siteLang]['th_folder'], 0, 1) == '/' ? substr($arrLang[$this->siteLang]['th_folder'], 1) : trim($arrLang[$this->siteLang]['th_folder']);
        //               var_dump($thFolder); die();
        if ($thFolder[0] != '/') $thFolder = '/' . $thFolder;


        //   print_r($this->lkey_anons);          die('1233');


        //	$this->view->addressee = $this->getAddressees();
        $this->view->th_folder = $thFolder;
        //     var_dump($thFolder);                die();
//		$this->view->captcha = "<div class='g-recaptcha' data-sitekey='6LeR7jkUAAAAAGS9mKZGDGjsnEgUgcOC9PCCVxRT'></div>
//            </div>";
        //	$this->view->captcha = Captcha::factory('vr')->render(true);

    }

    public function ItemList($data_sel = '')
    {

        if (!$data_sel) {
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

    public function EventList($data_sel = '')
    {
        $arrLang = Language::getLangData();
        //  var_dump($arrLang); die();
        if (!$data_sel) {
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

    private function SelAnons($date_anons, $date_offset)
    {
        //      var_dump($this->siteLang);       die();
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
                               AND t.t_left_key >=" . $this->lkey_anons . "
                               and t.t_right_key <=" . $this->rkey_anons . ") t
                    ON i.t_id = t.t_id
                 WHERE i.i_type = 'preview'
                  -- AND l_langnick = '{$this->siteLang}'
                   AND i.i_status = 1
                   AND (i.i_ip IS NULL OR NOT EXISTS
                        (SELECT i_id
                           FROM items_ips ip
                          WHERE ip.i_id = i.i_id
                            AND '" . $this->input->ip_address() . "' LIKE
                                replace(ip.ii_ip, '*', '%')))
                   AND trunc(i_date_create) = trunc(to_date('" . $date_anons . "','yyyymmdd'))) i_all
         INNER JOIN months m
            ON to_number(to_char(i_all.i_date_create, 'mm')) = m.m_number
           AND l_langnick = '{$this->siteLang}'
           AND i_all.i_date_create >= sysdate + " . $date_offset . "
         ORDER BY i_date_create ASC)");
        //WHERE rownum <= 15 //mirs

        //     $this->cache->set($cacheID, $block_anons, array('main_page'), $this->cache_anons_life);

        //      }
        //       print_r($block_anons);
        return $block_anons;
    }

    public function sendMsg()
    {
        $this->use_main = FALSE;
        $this->imail_subject.='"'.$_POST['zminame'].'"';
        $this->view('feedbackakred/index');
        $this->view->sitekey = $this->recaptcha->key;
        $this->view->anons_dates = $this->ad;


//		$add = $this->input->post('addressee', null, true);
//        $add = '';


            // Перевірка на стоп-слова
//            if (!($this->checkBadWords($_POST['text']))
//                or !($this->checkBadWords($_POST['name']))
//                or !($this->checkBadWords($_POST['lname']))
//                //or !($this->checkBadWords($_POST['pname']))
//                or !($this->checkBadWords($_POST['zminame']))
//                or !($this->checkBadWords($_POST['eventdate']))
//                or !($this->checkBadWords($_POST['eventname']))
//                or !($this->checkBadWords($_POST['phone']))) {
//
//                print Kohana::lang('feedback_errors.badWords');
//                exit();
//
//            }

            $cookie = array(
                'name' => 'feedbackakred_expire',
                'value' => time(),
                'expire' => '86500',
                'domain' => 'vr',
                'path' => '/'
            );

            $cookie_value = cookie::get('feedbackakred_expire', null, true);

            if (!empty($cookie_value)) {
                if ($cookie_value < (time() - 30)) {
                    $access = true;

                } else {
                    $access = false;

                }

            } else {
                $access = true;

            }


            $post = Validation::factory($_POST)
                ->pre_filter('trim', TRUE)
                ->add_rules('name', 'required', 'length[3,255]')
                ->add_rules('lname', 'required', 'length[3,255]')
                ->add_rules('phone', 'required', 'chars[-," ",0,1,2,3,4,5,6,7,8,9]')
                ->add_rules('phone', 'required', 'length[7,16]')
                ->add_rules('zminame', 'required', 'length[8,255]')
                ->add_rules('zmiposada', 'required', 'length[3,255]')
                ->add_rules('eventname', 'required', 'length[15,512]')
                ->add_rules('email', 'required', 'email')
                ->add_rules('recaptcha', 'required');

            if ($access === true) if ((!$post->validate())) {
                $errors = $post->errors('feedbackakred_errors');

                foreach ($post as $key => $value) {
                    $data[$key] = strip_tags(trim($value));

                }
                $this->view->value = $data;
                $this->view->errors = $errors;
                $this->view->timeoutError = '';

            } else {

                $email = Kohana::config('emails.acred_recip');

                if ($email == '') {
                    print Kohana::lang('feedback_errors.sendProblems');

                } else {

                    // Формування лінків з полі додаткова інформація

                    !$post['text'] ? $post['text'] = 'відсутня' : $post['text'] = preg_replace("/(https?:\/\/.[^\s]*)/", "<a href=\"$1\">$1</a>", $post['text']);


                    $message = "
    <style> 
th {
vertical-align: top;
    text-align: right;
    color: #770000;
} 
</style>

<table width='650' border='0' cellpadding='2'>
<tbody>
<tr>
  <th width='180' scope='row'>Назва ЗМІ:</th>
  <td width='456'><b>&laquo;{$post['zminame']}&raquo;</b></td>
</tr>
<tr>
  <th width='180' scope='row'>Посада:</th>
  <td width='456'><b>&laquo;{$post['zmiposada']}&raquo;</b></td>
</tr>
<tr>
  <th scope='row'>Відправник: </th>
  <td><b>{$post['name']} {$post['lname']} </b></td>
</tr>
<tr>
  <th scope='row'>Е-mail відправника: </th>
  <td><a href=\"mailto:{$post['email']}\">{$post['email']}</a></td>
</tr>
<tr>
  <th scope='row'>Телефон відправника:</th>
  <td>{$post['phone']}</td>
</tr>
<tr>
  <th scope='row'>Дата події:</th>
  <td>{$post['eventdate']}</td>
</tr>
<tr>
  <th scope='row'>Назва події:</th>
  <td>{$post['eventname']}</td>
</tr>
<tr>
  <th scope='row'>Додаткова інформація:</th>
  <td>{$post['text']}</td>
</tr>
</tbody>
</table>
       ";


                    foreach ($email as $em) {
                        email::send($em, $this->imail_from, $this->imail_subject, $message, \TRUE);
                    }

                    header('Set-Cookie: ' . rawurlencode($cookie['name']) . '=' . rawurlencode($cookie['value']), false);

//                        $_ok = "
//
//<div style='font-weight: bold; font-size: 18pt; padding: 1em; background-color: #D4D1D1FF; margin-top: 1em'>
//
//  <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='currentColor' class='bi bi-send' viewBox='0 0 16 16'>
//    <path d='M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576zm6.787-8.201L1.591 6.602l4.339 2.76z'/>
//  </svg>
//   ".Kohana::lang('feedbackakred_errors.sendOk')."
// <br><a href='/'>Перейти на головну сторінку</a>
// <br><a href='/fba'>Перейти на форму акредитації</a>
//</div>
//";
//
//                        $output = $this->smarty->fetch('index.tpl');
//var_dump($output); die("application/controllers/feedbackakred.php:320");

        $this->sendOk();

                    return;

                }

                exit();

            } else {
                foreach ($post as $key => $value) {
                    $data[$key] = $value;

                }

                if (!$post->validate()) {
                    $errors = $post->errors('feedback_errors');
                    $this->template->assign('errors', $errors);

                }

                $this->view->addressee = $this->getAddressees();
                $this->view->value = $data;
                $this->view->timeoutError = Kohana::lang('feedback_errors.cookie');

            }

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

    private function sendOk()
    {
        $this->view('feedbackakred/modal_ok');

    }


}
