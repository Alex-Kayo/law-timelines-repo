<?php defined('SYSPATH') OR die('куда лезешь сцуко?!');

class Pages_Controller extends Template_Controller {

	function index(){
        $uri = Router::$rsegments;

		$page = ORM::factory('page')->where('uri',security::xss_clean($uri[0]))->find();
        $this->view->page = $page;
        $this->view->current_node->title = $this->view->page->title;
        $this->view('page/page');
    }

}