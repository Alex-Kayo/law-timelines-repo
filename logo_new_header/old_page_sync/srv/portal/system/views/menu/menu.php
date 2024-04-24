<?php defined('SYSPATH') OR die('No direct access allowed.');
		/*
      $menu = $this->db->query("SELECT daddy.*,
                (SELECT COUNT(*)
                    FROM menu
                    WHERE m_parent_id = daddy.m_id
                ) AS m_childs

            FROM menu daddy
            WHERE m_status=1 AND l_langnick = 'ua'
            ORDER BY m_left_key");		
		*/
		$cats = array();
        foreach ($menu->result(false) as $t) {
            $cats[$t['m_parent_id']][] =  $t;
            
        }

        echo build_tree($lang_prefix, $cats, $cats[0][0]['m_id']);
        return;

        
        
        
        function  build_tree($lang_prefix, $cats,$parent_id){
        
          if (is_array($cats) and isset($cats[$parent_id])){
            $tree = '';
            foreach($cats[$parent_id] as $cat){
                
               $name = ($cat['m_level']>2 ? wordwrap($cat['m_name'], Kohana::config('menu.wrap_width_count'), '<br>') : $cat['m_name']);
                
               switch (intval($cat['m_type'])){
                    case 0: //внутр
                    
                        $url = $lang_prefix . $cat['m_url'];
                        break;
                    
                    case 1: //зовн
                    
                        $url = $cat['m_url'];
                        break;
               }
               
               
               if($cat['m_level'] == 2){
                    $tree .= '<li><a class="main" href="' . $url .  '">'. $name . '</a>';
                   
               }else{
                    $tree .= '<li><a href="' . $url .  '">'. $name . '</a>';
                   
               }
               
               $popup = build_tree($lang_prefix, $cats,$cat['m_id']);
               if(strlen($popup) > 0){
                   $tree .= '<ul>' . $popup . '</ul>';
                   
               }
               
               $tree .= '</li>';         
        
            }
          }
          
          if(isset($tree)){
               return  $tree; 
              
          }
        }        
?>

