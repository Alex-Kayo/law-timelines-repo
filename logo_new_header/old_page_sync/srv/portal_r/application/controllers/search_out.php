<?php
class Search_out_Controller extends Front_Controller {
        
    private $max_request_items = 4;
	
    
	public function index(){
	    
	    
            if(isset($_GET['submit']) || isset($_GET['submit_form'])){		
		$this->page(1);
		
            }else{
                Kohana::show_404();

            }	
		
	}
	
	
	public function page($index){
	    
	    
	    $page_result = $this->getRequestData($index*$this->max_request_items-$this->max_request_items, $this->input->get('submit'));
	    
	    
	    $this->view('search/page_out');	
	    $this->view->front = false;	    
	    
	    $this->view->page_result = $page_result;
	    
	    
	    
	    $pagination = new Pagination(array(
		'base_url'       => $this->view->lang_prefix.'/search_out/',
		'lang_prefix'    => $this->view->lang_prefix,
		'uri_segment'    => 'page',
		'items_per_page' => $this->max_request_items,
		'style'          => 'digg',
		'auto_hide'      => TRUE,
	    ));        


	    $pagination->set_total_items(count($page_result['pages']) * $this->max_request_items);

	    $this->view->pagination = $pagination;  	    
	    
	}
	

	/*
	 * return array('items' => array(), 'pages' => array(), 'total_count' => 0);
	 */
	private function getRequestData($start, $query){
	    
	    $result = array('items' => array(), 'pages' => array(), 'total_count' => 0);
	    
	    $url = str_replace(array('%%query%%', '%%start%%', '%%key%%'), array(urlencode(" ".$query), $start, Kohana::config('search.key')), Kohana::config('search.request_url'));
	    	
	    
	    $ch = curl_init();
	    curl_setopt($ch, CURLOPT_URL, $url);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	    curl_setopt($ch, CURLOPT_REFERER, Kohana::config('search.url_referer'));
	    
	    if($body = curl_exec($ch)){
				
		$body = json_decode($body);
		
		if(isset($body->responseData) && isset($body->responseData->results) && count($body->responseData->results) > 0){
		    foreach($body->responseData->results as $item){
			$image = null;
			$result['items'][] = array(
			    'url'   => $item->url,
			    'title' => $item->title,
			    'content'   => $item->content,
			    'image' => (isset($item->richSnippet) && isset($item->richSnippet->cseImage) && isset($item->richSnippet->cseImage->src) ? $item->richSnippet->cseImage->src : null)
			);
			
		    }	

		    if(isset($body->responseData->cursor)){
			$result['total_count'] = $body->responseData->cursor->resultCount;
			foreach($body->responseData->cursor->pages as $item){
			    $result['pages'][] = intval($item->start);
			}

		    }		    
		    
		}

	    }
	    
	    curl_close($ch);
	    return $result;
	    
	}
	
	

}
