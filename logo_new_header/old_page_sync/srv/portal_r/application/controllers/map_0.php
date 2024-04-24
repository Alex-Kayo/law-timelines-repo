<?php
class Map_Controller extends Template_Controller {

    function index()  {   
        $this->view('map/index');
        $this->view->current_node->t_name = Kohana::lang('map.title');

        /*
          $arrLang = Language::getLangData();
          $thFolder = substr($arrLang[$this->siteLang]['th_folder'],0,1) == '/' ? substr($arrLang[$this->siteLang]['th_folder'],1) : trim($arrLang[$this->siteLang]['th_folder']);

          if($thFolder[0] != '/') $thFolder = '/' . $thFolder;

          $this->view->map = $this->_render_sitemap();
          $this->view->th_folder = $thFolder;
         */

        /*
          $this->tree = $this->db->query("SELECT daddy.*,
          (SELECT COUNT(*)
          FROM topics
          WHERE t_parent_id = daddy.t_id
          AND l_langnick = '$this->siteLang'
          AND t_status = 1) AS t_childs
          FROM topics daddy
          WHERE t_status = 1
          AND t_seo_name <> 'recycler'
          AND l_langnick = '$this->siteLang'
          ORDER BY t_left_key");

          $this->view->map = View::factory('menu/sitemap', array('menu' => $this->tree))->render();
         */
        $this->view('map/index');

        //$this->db->query("DELETE FROM topics WHERE t_id IN (813, 815, 821)");

        $this->tree = $this->db->query("
            SELECT daddy.*,
                (SELECT COUNT(*)
                    FROM topics
                    WHERE t_parent_id = daddy.t_id
                    AND l_langnick = '$this->siteLang'
		    AND m_status = 0
		     AND t_status = 1 
                ) AS t_childs
            FROM topics daddy
            WHERE l_langnick = '$this->siteLang'
            AND t_seo_name <> 'recycler'
            AND t_status = 1    
            AND (SELECT SUM(m_status) FROM topics START WITH t_id = daddy.t_id CONNECT BY PRIOR t_parent_id=t_id) = 0
            ORDER BY t_left_key

        ");
        //mirs AND t_status = 1 

       
        //$this->view->map = View::factory('menu/sitemap', array('tree' => $this->tree))->render(TRUE);die();
        $this->view->map = View::factory('menu/sitemap', array('tree' => $this->tree))->render();
        
        
    }

    
}
