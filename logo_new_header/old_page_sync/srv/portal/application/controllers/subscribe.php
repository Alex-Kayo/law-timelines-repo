<?php

defined('SYSPATH') OR die('No direct access allowed.');

class Subscribe_Controller extends Template_Controller {

    /**
     * Формування сторінки підписки
     *
     */
    public function index() {

     //   Kohana::show_404();

        $this->view('subscribe/index');

        $this->view->topics_sel = $this->getTopics();
       // var_dump($this->view->topics_sel); die();
        $this->view->captcha = Captcha::factory('vr')->render(true);
    }

    /**
     * Підписатися на розсилку анонсів новин
     *
     */
    public function add() {


        $subscribe = $this->input->post("subscribe", null, true);

        if (!empty($subscribe)) {
            $cookie = array(
                'name' => 'subscribe_expire',
                'value' => mktime(),
                'expire' => '86500'
            );

            $cookie_value = cookie::get('subscribe_expire', null, true);


            if (!empty($cookie_value)) {
                if ($cookie_value < (mktime() - 30)) {
                    $access = true;
                } else {
                    $access = false;
                }
            } else {
                $access = true;
            }


            $post = Validation::factory($_POST)
                    ->pre_filter('trim', TRUE)
                    ->add_rules('email', 'required', 'valid::email')
                    ->add_callbacks('email', array($this, 'emailCheck'))
                    ->add_callbacks('topics_sel', array($this, 'topicCheck'))
                    ->add_rules('captcha', 'required', 'Captcha::valid', 'length[6]');


            if ($access === true) {

                if (!$post->validate()) {
                    $this->view->email = $post->email;
                    $this->view->topics_sel = $post->topics_sel;
                    $this->view->errors = $post->errors('subscribe_errors');
                } else {

                    $errors = '';
                    $uniqID = uniqid('', true);

                    $db_data = array(
                        "sb_email" => $post["email"],
                        "l_langnick" => $this->siteLang,
                        "sb_confirm_id" => $uniqID
                    );

                    $insert_id = $this->db->insert('subscribe', $db_data)->insert_id();


                    //задати підписку на розділи
                    $arrIDs = array_keys($post->topics_sel);
                    foreach ($arrIDs as $id) {
                        $this->db->insert('subscribe_topics', array('sb_id' => $insert_id, 't_id' => $id));
                    }

                    //Формування листа і відправка на e-mail для підтвердження підписки
                    $this->view('subscribe/send_confirm');
                    $this->view->confirm_link = url::site((strlen($this->view->lang_prefix) > 0 ? substr($this->view->lang_prefix, 1) . '/' : '') . 'subscribe/confirm/' . $uniqID);
                    $this->auto_render = FALSE;
                    $this->use_main = FALSE;
                    $strMail = $this->view->render(FALSE);
                    $this->use_main = TRUE;

                    email::send($post["email"], Kohana::config('subscribe.from_mail'), Kohana::lang('subscribe.confirm_message.subject'), $strMail, TRUE);

                    $this->view('subscribe/added');

                    cookie::set('subscribe_expire', mktime());

                    $this->auto_render = FALSE;
                    $this->view->render(TRUE);
                    exit;
                }
            } else {
                foreach ($post as $k => $v) {
                    $data[$k] = $v;
                }
                if (!$post->validate()) {
                    $this->view->errors = $post->errors('subscribe_errors');
                }
                $this->view->data = $data;
                $this->view->error = Kohana::lang('subscribe_errors.cookie');
            }
        }

        $this->view->topics_sel = $this->getTopics();
        $this->view->captcha = Captcha::factory('vr')->render(true);

        $this->view('subscribe/index');
    }

    /**
     * Підтвердження підписки
     *
     */
    public function confirm($confirmID = '') {
        $this->view('subscribe/apply_confirm');
        $this->view->subscribe = TRUE;

        if (strlen($confirmID) != 0) {
            $query = $this->db->select('*')->from('subscribe')->where("sb_confirm_id", "'" . $confirmID . "'")->get()->current();
            if (is_object($query)) {
                $this->view->email = $query->sb_email;

                if (strlen($query->sb_confirm_date) == 0) {
                    $this->db->update('subscribe', array('sb_confirm_date' => 'sysdate'), array('sb_id' => $query->sb_id));
                }
            }
        }
    }

    /**
     * Видалення підписки
     *
     */
    public function delete($confirmID = '') {
        $this->view('subscribe/apply_confirm');
        $this->view->unsubscribe = TRUE;

        if (strlen($confirmID) != 0) {
            $query = $this->db->select('*')->from('subscribe')->where("sb_confirm_id", "'" . $confirmID . "'")->get()->current();
            if (is_object($query)) {
                $this->view->email = $query->sb_email;

                $this->db->delete('subscribe', array('sb_id' => $query->sb_id));
            }
        }
    }

    /**
     * Перевірка унікальності e-mail
     *
     * @param Validation $post
     */
    public function emailCheck(Validation $post) {
        $query = $this->db->select('*')->from('subscribe')->where('sb_email', "'" . $post->email . "'")->where('l_langnick', "'" . $this->siteLang . "'")->get()->current();

        if (is_object($query)) {
            $post->add_error('email', 'uniq');
        }
    }

    /**
     * Перевірка наявності заданих розділів підписки
     *
     * @param Validation $post
     */
    public function topicCheck(Validation $post) {
        if (
                !is_array($post->topics_sel) ||
                        $this->db->select('count(1) as cnt')
                        ->from('topics')
                        ->where('l_langnick', "'" . $this->siteLang . "'")
                        //->where("t_status", 1)
                        ->where("t_subscribe", 1)
                        ->in("t_id", array_keys($post->topics_sel))->get()->current()->cnt == 0
        ) {
            $post->add_error('topics_sel', 'required');
        }
    }

    /**
     * Формування списку доступних розділів для підписки
     *
     * @return - array - масив категорій підписки
     */
    private function getTopics() {
        $subscribe = $this->input->post("subscribe", null, true);
        $topicsSet = $this->input->post('topics_sel', array(), true);

        $result = $this->db->select("t_id, t_name")
                        ->from('topics')
                        ->where('l_langnick', "'" . $this->siteLang . "'")
                        //->where("t_status", 1)
                        ->where("t_subscribe", 1)
                        ->orderby(array('t_left_key' => 'asc'))->get()->result_array(false);

        foreach ($result as $key => $item) {
            $result[$key]['checked'] = (isset($topicsSet[$item['t_id']]) || empty($subscribe));
        }
        return $result;
    }

}

?>