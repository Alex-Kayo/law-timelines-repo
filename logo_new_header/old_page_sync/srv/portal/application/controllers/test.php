<?php

defined('SYSPATH') OR die('No direct access allowed.');

class Test_Controller extends Controller {

    public function index() {
        Session::instance()->set('session_test', 'SESSION SUCCESS');
        if ($session_data = Session::instance()->get('session_test')) {
            echo 'Події за тиждень1';
//            echo $session_data;
        } else {
            echo 'SESSION ERROR';
        }
    }
    public function AnonsReque() {
    
    echo $this->input->post('reque', 'no_reque', true);
    }

}

