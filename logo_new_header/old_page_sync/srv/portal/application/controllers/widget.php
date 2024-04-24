<?php defined('SYSPATH') OR die('No direct access allowed.');

class Widget_Controller extends Template_Controller {

    
    
	/**
	 * Віджет формування головного меню
	 *
	 * @param array $params array('root_id' => 'ідентифікатор кореневого вузла', 'lang_prefix' => 'мовний префікс', 'menu_view' => 'Представлення меню')
	 * @return string
	 */
	public function menu_builder($params){
	    $rootNode = $this->db->from('menu')
	       ->where('m_id', $params['root_id'])
	       ->get()->current();
	       
        if(!$rootNode) {
           return '';
        }
	       
    	$this->db->from('menu')
    		->where('m_status', 1)
    		->where('m_left_key > ', $rootNode->m_left_key)
    		->where('m_right_key < ', $rootNode->m_right_key)
			->orderby('m_left_key');    	
			
			
		$res = array();
		foreach ($this->db->get()->result() as $row){
		  
		   $url = '#';  
           switch (intval($cat['m_type'])){
                case 0: //внутр
                
                     $url = $params['lang_prefix'] . $row->m_url;
                    break;
                
                case 1: //зовн
                
                    $url = $row->m_url;
                    break;
                    
                default:
                    $url = '#';
            }	
		    
			$res[$row->m_id] = array(
			     'id'          => intval($row->m_id),
			     'parent_id'   => intval($row->m_parent_id),
			     'name'        => $row->m_name,
			     'url'         => $url,
			     'is_root'     => true
			
			);			
						
		  	if(isset($res[$row->m_parent_id]) && intval($row->m_parent_id) > 0){
		  		$res[$row->m_parent_id]['children'][] = &$res[$row->m_id];
				unset($res[$row->m_id]['is_root']);		  		
		  		
		  	}		
		}
		
		$resultArray = array();
		reset($res);
		foreach ($res as $key => $value) {		
		  if (isset($value['is_root'])) {
		    $resultArray[] = $value;
		  }

		}			
		 
                $params['menu_view'] = (!isset($params['menu_view']) ? 'main_menu' : $params['menu_view']);
		return View::factory('menu/' . $params['menu_view'], array('menu_tree' => $resultArray))->render();
	}
  
    
}


