<?php

class RSS_Controller extends Template_Controller {

    /**
     * Вивід RSS
     */
    public function index() {
        
        
//   $ool = $this->db->query( "select plenw.*, cursor(select '1' from dual ) cur from 
//(select i_date_create,
//       TO_NUMBER(to_char(i_date_create, 'd')) wdn,
//       i_name,
//       i_anons,
//       i_status,
//       i_description,
//       i_link
//  from ITEMS 
// where t_id = 1134
//   and i_date_create between trunc(sysdate, 'D') and sysdate) plenw
// order by plenw.i_date_create desc");
        
 //  var_dump($ool[0]->cur); die();

        $type = security::xss_clean($this->uri->segment(2));
        if (!$type)
            $type = 'news';

        $this->use_main = FALSE;

        $this->view('rss/index');

        $posts = $this->db->query("
                    SELECT p1.*, CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = p1.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories 
    
                    FROM ( 
                        SELECT * FROM (SELECT rownum as linenum, p_query.* FROM (
                            SELECT i_id, i_author, i_name, REPLACE(i_anons, '&nbsp;', ' ') AS i_anons, i_link, i_logoname, t_id, CASE WHEN i_logoname IS NULL THEN 1 ELSE 0 END AS logo_null,



                            TO_CHAR(i_date_create, 'dd Month yyyy, Day hh24:mi') AS i_date
                            FROM items i
                            WHERE
                            i_status = 1
                            AND i_link IS NULL
                            AND i_type = '$type'
                            AND l_langnick = '" . $this->siteLang . "' 
                            AND t_id <> (SELECT t_id FROM topics WHERE t_seo_name = 'recycler')
                            AND i.i_date_create " . ($type === 'preview' ? '<= 40 +' : '<=') . "sysdate
			    AND (
                                i.i_ip IS NULL OR
                                NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%'))
                                )
                            ORDER BY i_date_create DESC
                        ) p_query WHERE rownum <= " . 20 . ") WHERE linenum > " . 0 . "
                    ) p1");



        //echo $this->db->last_query();die();
        $this->view->url = substr(url::site(), 0, strlen(url::site()) - 1);
        $this->view->posts = $posts;

        //print_r($posts);die();
    }

    /**
     * Редірект на index
     */
    public function __call($method, $arguments) {
        self::index();
    }

}
