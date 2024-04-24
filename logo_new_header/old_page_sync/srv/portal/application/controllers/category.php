<?php
class Category_Controller extends Template_Controller {

    function index()
    {

        $pagination = new Pagination(array(
            'uri_segment'    => 'page',
            'items_per_page' => 5,
            'style'          => 'digg',
            'auto_hide'      => TRUE,
        ));

        if ($this->navigation->current_node->id) {
            $type = $this->navigation->current_node->type;
            $posts = ORM::factory($type)->where('category_id', $this->navigation->current_node->id);
        } else {
            $type = 'news';
            $posts = ORM::factory('news');
        }
        $this->view->posts = $posts->find_all($pagination->items_per_page, $pagination->sql_offset);

        $pagination->set_total_items($posts->count_last_query());
        $this->view->pagination = $pagination;

        $this->view($type.'/index');

    }

//    public function test_1233(){
//        
//      echo $this->input->ip_address();
//
//        
//        
//        
//    }
}
    

