<?php

class PreviewSelect_Controller extends Preview_Controller {
    
    private $cache_anons_life = 1800;

    public function ItemList() {

        $this->use_main = FALSE;
        $this->view('preview/list');
        $this->view->date_period = $this->input->post('reque', '0', true);
        $this->view->anonsperiod = $this->SelPeriod($this->view->date_period);
    }

    private function SelPeriod($period) {

        if ($period == 7) {
            $FromDate = 1;
        } elseif ($period == 30) {
            $FromDate = 8;
        } else {
            $FromDate = 0;
        }
        $cacheID = 'anons_block' . $this->siteLang . md5($period);
    // print_r($cacheID); die();
        if (!$block_anons = $this->cache->get($cacheID)) {
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
                               AND t.t_left_key >= 505
                               and t.t_right_key <= 508) t
                    ON i.t_id = t.t_id
                 WHERE i.i_type = 'preview'
                   AND l_langnick = 'ua'
                   AND i.i_status = 1
                   AND (i.i_ip IS NULL OR NOT EXISTS
                        (SELECT i_id
                           FROM items_ips ip
                          WHERE ip.i_id = i.i_id
                            AND '192.168.122.6' LIKE
                                replace(ip.ii_ip, '*', '%')))
                   AND trunc(i_date_create)  between trunc(sysdate+" . $FromDate . ") and trunc(sysdate + " . $period . ")) i_all
         INNER JOIN months m
            ON to_number(to_char(i_all.i_date_create, 'mm')) = m.m_number
           AND l_langnick = 'ua'
           AND i_all.i_date_create >= sysdate-2/24
         ORDER BY i_date_create ASC)");
            //WHERE rownum <= 15 //mirs
            
        $this->cache->set($cacheID, $block_anons, array('main_page'), $this->cache_anons_life);
            
        }
        return $block_anons;
    }

}
