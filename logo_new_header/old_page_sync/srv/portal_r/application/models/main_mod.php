<?php

class Main_mod_Model extends Model {
///////////////////// змінити для нового скликання
    protected $seo_hpz = 'hpz9'; // seo категорії хід пленарних засідань поточного скликання
    protected $seo_regnd = 'regnd9'; // seo категорії електронної реєстрації НД поточного скликання
//////////////////////    
    protected $db;
    protected $id_hpz; // ID категорії хід пленарних засідань поточного скликання
    protected $id_regnd; // ID категорії електронної реєстрації НД поточного скликання
    public function __construct() {
        parent::__construct();
        $this->db = Database::instance('default');
        $this->id_hpz = $this->db->query("select t_id from TOPICS  where t_seo_name = '{$this->seo_hpz}'")->current();
        $this->id_regnd = $this->db->query("select t_id from TOPICS  where t_seo_name = '{$this->seo_regnd}'")->current();
    //    var_dump($this->id_regnd);        die();
        
    }

    public function get_golos_info($topicId, $date, $langNick) {
        
        
        isset($date)? $date : $date = 'sysdate';
        

        $sqlstr = "select TO_CHAR(i_date_create, 'DD') as day,
       mon.m_name as name_monts, 
       TO_CHAR(i_date_create, 'YYYY') as year,
       wd.wd_name as weekday,
       TO_CHAR(i_date_create, 'HH24:MI') as time,
       i_name,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 1, 'm')) as g_pos,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 2, 'm')) as g_neg,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 3, 'm')) as refrain,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 4, 'm')) as not_voting,
       REGEXP_SUBSTR(i_anons, '[^-]+$', 1, 1, 'm') as rishen,
       i_link,
       i_anons
  from ITEMS t
  inner join WEEKDAY wd on TO_NUMBER(to_char(t.i_date_create, 'D'))= wd.wd_number and wd.l_langnick = '{$langNick}'
  inner join MONTHS mon  on to_number(to_char(t.i_date_create, 'MM')) = mon.m_number and mon.l_langnick = '{$langNick}'
   where t.t_id = {$topicId}
   and t.i_date_create between trunc({$date}, 'D') and trunc({$date}, 'D')+4
 order by t.i_date_create asc";
       // var_dump($sqlstr);
        $pweek = $this->db->query($sqlstr);

        $golos_info = array();
       // $plen_days = array();
        foreach ($pweek as $key => $value) {
           // $plen_days  = array($value->weekday);
            $count_golos = $value->g_pos + $value->g_neg + $value->refrain + $value->not_voting;
            $g_pos_persent = ($value->g_pos/$count_golos)*100;
            $g_neg_persent = ($value->g_neg/$count_golos)*100;
            $refrain_persent = ($value->refrain/$count_golos)*100;
            $not_voting_persent = ($value->not_voting/$count_golos)*100;
            $golos_info[$value->weekday][] = array(
                'day' => $value->day,
                'name_monts' => $value->name_monts,
                'year' => $value->year,
                'weekday' => $value->weekday,
                'time' => $value->time,
                'i_name' => $value->i_name,
                'g_pos' => $value->g_pos,
                'g_neg' => $value->g_neg,
                'refrain' => $value->refrain,
                'not_voting' => $value->not_voting,
                'rishen' => $value->rishen,
                'count_golos' => $count_golos,
                'g_pos_persent' => round($g_pos_persent, 3),
                'g_neg_persent' => round($g_neg_persent, 3),
                'refrain_persent' => round($refrain_persent, 3),
                'not_voting_persent' => round($not_voting_persent, 3),
                'i_link' => $value->i_link
                    
               );
             
        }
//            var_dump($golos_info);               die();
        
        return $golos_info;
    }
    public function get_plday_info($topicId, $date) {
        
        
        isset($date)? $date : $date = 'sysdate';
        //mirs підміна лінку в рядку 88 REGEXP_REPLACE(i_link, 'ns_golos', 'ns_golos_23') as i_link
       
        $sqlstr = "select TO_CHAR(i_date_create, 'HH24:MI') as time,
       i_name,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 1, 'm')) as g_pos,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 2, 'm')) as g_neg,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 3, 'm')) as refrain,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 4, 'm')) as not_voting,
       REGEXP_SUBSTR(i_anons, '[^-]+$', 1, 1, 'm') as rishen,
       i_link
  from ITEMS t
   where t.t_id = {$topicId}
   and trunc(t.i_date_create, 'DD') = trunc(to_date('{$date}'), 'DD')
   and t.i_status = 1    
 order by t.i_date_create asc, t.i_id desc";
 //       var_dump($sqlstr); die();
        $pweek = $this->db->query($sqlstr);
 //       var_dump($pweek); die();

        $golos_info = array();
       // $plen_days = array();
        foreach ($pweek as $key => $value) {
           // $plen_days  = array($value->weekday);
            $count_golos = $value->g_pos + $value->g_neg + $value->refrain + $value->not_voting;
            $g_pos_persent = ($value->g_pos/$count_golos)*100;
            $g_neg_persent = ($value->g_neg/$count_golos)*100;
            $refrain_persent = ($value->refrain/$count_golos)*100;
            $not_voting_persent = ($value->not_voting/$count_golos)*100;
            $golos_info[] = array(
                'time' => $value->time,
                'i_name' => $value->i_name,
                'g_pos' => $value->g_pos,
                'g_neg' => $value->g_neg,
                'refrain' => $value->refrain,
                'not_voting' => $value->not_voting,
                'rishen' => $value->rishen,
                'count_golos' => $count_golos,
                'g_pos_persent' => round($g_pos_persent, 3),
                'g_neg_persent' => round($g_neg_persent, 3),
                'refrain_persent' => round($refrain_persent, 3),
                'not_voting_persent' => round($not_voting_persent, 3),
                'i_link' => $value->i_link
                    
               );
            
        }

        return $golos_info;
    }
    public function get_reg_info($topicId, $date) {
        
        
        isset($date)? $date : $date = 'sysdate';
        

        $sqlstr = "select TO_CHAR(i_date_create, 'HH24:MI') as time,
       i_name,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 1, 'm')) as g_pos,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 2, 'm')) as g_neg,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 3, 'm')) as refrain,
       to_number(REGEXP_SUBSTR(i_anons, '(\d{1,})', 1, 4, 'm')) as not_voting,
       REGEXP_SUBSTR(i_anons, '[^-]+$', 1, 1, 'm') as rishen,
       i_link
  from ITEMS t
   where t.t_id = {$topicId}
   and trunc(t.i_date_create, 'DD') = trunc(to_date('{$date}'), 'DD')
 order by t.i_date_create asc";
 //       var_dump($sqlstr); die();
        $pweek = $this->db->query($sqlstr);
 //       var_dump($pweek); die();

        $reg_info = array();
       // $plen_days = array();
        foreach ($pweek as $key => $value) {
           // $plen_days  = array($value->weekday);
            $count_golos = $value->g_pos + $value->g_neg + $value->refrain + $value->not_voting;
            $g_pos_persent = ($value->g_pos/$count_golos)*100;
            $g_neg_persent = ($value->g_neg/$count_golos)*100;
            $refrain_persent = ($value->refrain/$count_golos)*100;
            $not_voting_persent = ($value->not_voting/$count_golos)*100;
            $golos_info[] = array(
                'time' => $value->time,
                'i_name' => $value->i_name,
                'g_pos' => $value->g_pos,
                'g_neg' => $value->g_neg,
                'refrain' => $value->refrain,
                'not_voting' => $value->not_voting,
                'rishen' => $value->rishen,
                'count_golos' => $count_golos,
                'g_pos_persent' => round($g_pos_persent, 3),
                'g_neg_persent' => round($g_neg_persent, 3),
                'refrain_persent' => round($refrain_persent, 3),
                'not_voting_persent' => round($not_voting_persent, 3),
                'i_link' => $value->i_link
                    
               );
            
        }

        return $reg_info;
    }
    
    
    
    
    public function get_plenweek_dates($date, $langNick) {

                isset($date) ? $date : $date = 'sysdate';
                
                $sqlstr = "select to_char(wds, 'DD') as day_s,
       m.m_name as mon_s,
       m.m_number as m_s,
       to_char(wds, 'YYYY') as year_s,
       to_char(wde, 'DD') as day_e,
       m1.m_name as mon_e,
       m1.m_number as m_e,
       to_char(wde, 'YYYY') as year_e

  from (select t.md_date as wds, trunc(t.md_date, 'D') + 4 as wde
          from meeting_day t
         where t.md_type in (".Kohana::config('plenar_day_type.plenday_id').")
           and t.md_date >= trunc(to_date(($date)), 'D')
         order by t.md_date asc
         FETCH FIRST 1 ROWS ONLY)
 inner join months m
    on to_number(to_char(wds, 'MM')) = m.m_number
   and m.l_langnick = '{$langNick}'
 inner join months m1
    on to_number(to_char(wde, 'MM')) = m1.m_number
   and m1.l_langnick = '{$langNick}'
";
          
          $week_dates = $this->db->query($sqlstr);
  //        var_dump($sqlstr);          die();
           return $week_dates->current();
            }
            
    
            
    public function get_plenweek_dates_by_day($date, $langNick) {

                isset($date) ? $date : $date = 'sysdate';
                
                $sqlstr = "select 
                       wdate as full_date,
                       md_type,
                       wd.wd_name as wday,
                       to_char(wdate, 'DD') as day,
                       m.m_name as mon,
                       to_char(wdate, 'YYYY') as year,
                       CASE  
                         when trunc(wdate,'dd')= trunc(sysdate, 'dd') then 'active'
                         when trunc(wdate,'dd')> trunc(sysdate, 'dd') then 'disable'
                         else ''
                       END as status
                  from (select t.md_date as wdate,
                         t.md_type as md_type 
                         from meeting_day t
                         where t.md_type  in (".Kohana::config('plenar_day_type.plenday_id').") and t.md_type is not null
                         and t.md_date between trunc(to_date({$date}), 'D') and trunc(to_date({$date}), 'D')+5
                         order by t.md_date asc
                         FETCH FIRST 6 ROWS ONLY)
                 inner join WEEKDAY wd
                    on TO_NUMBER(to_char(wdate, 'D')) = wd.wd_number
                   and wd.l_langnick = 'ua'
                 inner join months m
                    on to_number(to_char(wdate, 'MM')) = m.m_number
                   and m.l_langnick = '{$langNick}'";
          
    //            var_dump($sqlstr);                die();
                   $week_dates_byday = $this->db->query($sqlstr);
          
//          var_export($week_dates_byday[0]->full_date); die();
          
          foreach ($week_dates_byday as $key => $value) {
              
              
              //1134 ------ id hpz8
              //1230 ------ id hpz9
              
              $item = $this->get_plday_info(1230,$value->full_date);
//              $item = $this->get_plday_info(1134,$value->full_date);
              
    //          var_dump($key, $item );              
             
              
              $pd_info[] = array(
                  
                  'wday' => $value->wday,
                  'day' => $value->day,
                  'mon' => $value->mon,
                  'year' => $value->year,
                  'md_type' => $value->md_type,
                  'status' => $value->status,
                  'item' => $item,
              ); 
        //     var_dump($item); die();      
          }
          
         
          
    //   var_dump($pd_info); die();
    //      var_dump($week_dates_byday); die();
    //        print_r($week_dates_byday);            die();
//            var_export($week_dates_byday); 
//                       die();
          
          
           return $pd_info;
          // return $week_dates_byday;
            }
           
        public function dep_registration(){
            
            //1147------ Rstr_nd
            //1231------ Rstr_nd_9
          
          if($rnd =  $this->get_plday_info(1231, date("d.m.y"))){
          $reg_nd = new stdClass();
          $reg_nd->time = $rnd[0]['time'];
          $reg_nd->present = (int)$rnd[0]['g_pos'];
          $reg_nd->ebsent = (int)$rnd[0]['g_neg'];
          $reg_nd->persent = round($reg_nd->present/($reg_nd->present + $reg_nd->ebsent)*100, 0);//*;
          $reg_nd->link = $rnd[0]['i_link'];
          return $reg_nd;
        }
          return NULL;
        }       
            public function get_next_plenweek_dates($date, $langNick) {

                isset($date) ? $date : $date = 'sysdate';
                
  //======================== Пошук наступного пленарного тижня ================== 
                
                $sqlstr_f = "select to_char(wds, 'DD') as day_s,
       m.m_name as mon_s,
       m.m_number as m_s,
       to_char(wds, 'YYYY') as year_s,
       to_char(wde, 'DD') as day_e,
       m1.m_name as mon_e,
       m1.m_number as m_e,
       to_char(wde, 'YYYY') as year_e,
       CONCAT_CRS(cursor(select t.md_type_descript_{$langNick} from MEETING_DAY_TYPE t, meeting_day md  
where t.md_type = md.md_type and md.md_date = trunc(sysdate, 'dd'))) as current_day_descriptor

  from (select t.md_date as wds, trunc(t.md_date, 'D') + 4 as wde
          from meeting_day t
         where t.md_type in (1, 7, 6)"
           ."and t.md_date >= to_date({$date})" //mirs спроба вирішити варіант скороченого плен. тижня
          // ."and t.md_date >= trunc(to_date({$date}), 'D')"
         ."order by t.md_date asc
         FETCH FIRST 1 ROWS ONLY)
 inner join months m
    on to_number(to_char(wds, 'MM')) = m.m_number
   and m.l_langnick = '{$langNick}'
 inner join months m1
    on to_number(to_char(wde, 'MM')) = m1.m_number
   and m1.l_langnick = '{$langNick}'";
// var_dump($sqlstr_f); die();
  //======================== Пошук попереднього пленарного тижня ================== 
   $sqlstr_b = "select to_char(wds, 'DD') as day_s,
       m.m_name as mon_s,
       m.m_number as m_s,
       to_char(wds, 'YYYY') as year_s,
       to_char(wde, 'DD') as day_e,
       m1.m_name as mon_e,
       m1.m_number as m_e,
       to_char(wde, 'YYYY') as year_e,
       wds,
       wde
       
  from (select t.md_date as wde, trunc(t.md_date, 'D') as wds
          from meeting_day t
         where t.md_type in (1, 4, 7, 5, 6)"
          ." and t.md_date < trunc(to_date({$date}), 'D')".
         // ." and t.md_date < to_date({$date})
         "order by t.md_date desc
         FETCH FIRST 1 ROWS ONLY)
 inner join months m
    on to_number(to_char(wds, 'MM')) = m.m_number
   and m.l_langnick = '{$langNick}'
 inner join months m1
    on to_number(to_char(wde, 'MM')) = m1.m_number
   and m1.l_langnick = '{$langNick}'";
          
          $week_dates['forward'] = $this->db->query($sqlstr_f)->current();
          $week_dates['backward'] = $this->db->query($sqlstr_b)->current();
        //  $week_dates['backward']->day_s = $week_dates['backward']->day_e;
          
 //         var_dump($week_dates['backward']); die();
           
          return $week_dates;
            }
            
            /**
	 * Отримання всіх анонсованих подій від $date ло $date+60 днів 
	 *
	 * @param $LRKey	- LeftKey - RightKey parameters
	 * @param $date	- start дата з якої показувати аноноси по замовчанню sysdate
	 * @return array
	 */
            public function get_anons_info( $LRKey, $date='sysdate') {

             //   isset($date) ? $date : $date = 'sysdate';
                
                $sqlstr = "select 
                    
                   to_char(trunc(t.i_date_create,'dd'),'yyyymmdd') as full_date,
                   TO_CHAR(i_date_create, 'DD') as day,
                    
                   mon.m_name as name_monts, 
                   TO_CHAR(i_date_create, 'YYYY') as year,
                   wd.wd_name as weekday,
                   TO_CHAR(i_date_create, 'HH24:MI') as time,
                   i_name,
                   i_link,
                   i_anons,
                   '/preview/'||top.t_seo_name||'/'||t.i_id||'.html' a_link,
                   case 
                   when trunc(i_date_create, 'dd') = trunc(sysdate, 'dd')
                   then 1 
                   else 0 
                   end as a_current
              from ITEMS t
              inner join WEEKDAY wd on TO_NUMBER(to_char(t.i_date_create, 'D'))= wd.wd_number and wd.l_langnick = 'ua'
              inner join MONTHS mon  on to_number(to_char(t.i_date_create, 'MM')) = mon.m_number and mon.l_langnick = 'ua'
              inner join topics top  on t.t_id = top.t_id
               where t.t_id  in (select distinct t.t_id
                                          from topics t
                                         where t.t_status = 1
                                           AND t.t_left_key >={$LRKey->t_left_key}
                                           and t.t_right_key <={$LRKey->t_right_key}
                                           )
               and t.i_date_create between TO_DATE({$date}) and TO_DATE({$date}+60)
               and t.i_status = 1   
             order by t.i_date_create asc";
          ///
          $AnonsPD = $this->db->query($sqlstr);
          
 //         var_dump($this->db->last_query());          die();
 //        var_dump($AnonsPD); die();
          foreach ($AnonsPD as $key => $value) {
              $anons_info['an_date_inf'][$value->full_date][] = array(
                'day' => $value->day,
                'name_monts' => $value->name_monts,
                'year' => $value->year,
                'weekday' => !$value->a_current ? $value->weekday : 'Сьогодні',
                'time' => $value->time,
                'i_name' => $value->i_name,
                'i_anons' => $value->i_anons,
                'i_link' => $value->i_link,
                'a_link' => $value->a_link,
                'a_day_css_class' => !$value->a_current ? 'mob-hide' : 'white-bg' //css classes
                    
               );
              
          }
          
          $anons_info['total_rows'] = $AnonsPD->count();

  //        var_dump($anons_info['an_date_inf']); die(); //Mirs

           return $anons_info;
            }
            
            private function getTopicLRKey($seo_name, $siteLang) {
     
     $res =  $this->db->query("select t_left_key, t_right_key, SYS_CONNECT_BY_PATH(t.t_seo_name, '/') LINK  from topics t
         WHERE t.t_status = 1
         --and t.t_level = 1
         START WITH t.t_seo_name = '{$seo_name}'
            AND t.l_langnick = '{$siteLang}'
        CONNECT BY PRIOR t_id = t_parent_id
        ORDER BY t.t_left_key"
             );
     
        if (is_object($res)) {
           // var_dump($res); die();
            return $res->current();
//            return $res[0];
            }
      }
            
            /**
     * Формування виборки
     *
     * @param  string $itemsType - тип публыкації
     * @param  string $arrKeys - left, right keys
     * @param  string $langNick - нік мови
     * @param  integer $countRows - кількість рядків виборки
     * @param  mixed $where - додаткова умова виборки
     * @param  mixed $addFunction - додатокові функуції обробки виборки
     * @return Database
     */
            
          public function FindBySeo($itemsType, $SeoName, $langNick, $countRows, $where = NULL, $addFunction = null) {
        
           //   var_dump($countRows);
              
              $LRKey = $this->getTopicLRKey($SeoName, $langNick);
              
            //  var_dump($LRKey);              die();
              if (!$LRKey) return NULL; //mirs якщо нема такого SeoName
              
              $itemsType = strtolower($itemsType);

        $addWhere = '';
        if (!is_null($where)) {

            if (is_array($where)) {
                $addWhere = implode(' AND ', $where);
            } else {
                $addWhere = $where;
            }
        }

        $addFunctionStr = '';
        if (!is_null($addFunction)) {

            if (is_array($addFunction)) {
                $addFunctionStr = implode(', ', $addFunction);
            } else {
                $addFunctionStr = $addFunction;
            }
        }

// mirs внесено зміни у $sqlStr рядок --AND l_langnick = '$langNick' для не укр версій
        $sqlStr = "
    		SELECT * FROM (SELECT i_all.*,
    			m.m_name as month, to_char(i_date_create,'dd') as day,  to_char(i_date_create,'yyyy') as year,
                to_char(i_date_create,'hh24:mi') as hour,    		
    			CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = i_all.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories  
    			" . (strlen($addFunctionStr) > 0 ? ', ' . $addFunctionStr : '') . "    		
    		FROM
    		(SELECT i.t_id, i_id, i_date_create, i_name, i_anons, i_logoname, i_link, i_author, is_video 
    		FROM items i
    		INNER JOIN (select distinct t.t_id
    					from topics t
			        	where t.t_status = 1 AND t.t_left_key >= " . $LRKey->t_left_key . " and t.t_right_key <= " . $LRKey->t_right_key . ") t ON i.t_id = t.t_id
    		WHERE i.i_type='$itemsType'
    		--AND l_langnick = '$langNick'
    		AND i.i_status = 1
    		" . (strlen($addWhere) > 0 && $itemsType !== 'preview' ? ' AND ' . $addWhere : '') . "
    		
                        " . //mirs додавання часу для пергляду анонсів 1ця-день
                "AND i_date_create " . ($itemsType === 'preview' ? '> (-0.042) +' : '<=') . " sysdate				
    		) i_all
    			INNER JOIN months m ON to_number(to_char(i_all.i_date_create,'mm'))=m.m_number AND l_langnick = '$langNick'
    		ORDER BY i_date_create " . ($itemsType === 'preview' ? 'ASC' : 'DESC') . ")

        WHERE rownum<=$countRows";

//if ($itemsType === 'preview'){print_r($sqlStr);die();}

        return $this->db->query($sqlStr);
    }

          public function FindBySeoFullText($itemsType, $SeoName, $langNick, $countRows, $where = NULL, $addFunction = null) {

        //   var_dump($countRows);

        $LRKey = $this->getTopicLRKey($SeoName, $langNick);

        //  var_dump($LRKey);              die();
        if (!$LRKey) return NULL; //mirs якщо нема такого SeoName

        $itemsType = strtolower($itemsType);

        $addWhere = '';
        if (!is_null($where)) {

            if (is_array($where)) {
                $addWhere = implode(' AND ', $where);
            } else {
                $addWhere = $where;
            }
        }

        $addFunctionStr = '';
        if (!is_null($addFunction)) {

            if (is_array($addFunction)) {
                $addFunctionStr = implode(', ', $addFunction);
            } else {
                $addFunctionStr = $addFunction;
            }
        }

// mirs внесено зміни у $sqlStr рядок --AND l_langnick = '$langNick' для не укр версій
        $sqlStr = "
    		SELECT ool.i_name, f.i_full FROM (SELECT i_all.*,
    			m.m_name as month, to_char(i_date_create,'dd') as day,  to_char(i_date_create,'yyyy') as year,
                to_char(i_date_create,'hh24:mi') as hour,    		
    			CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = i_all.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories  
    			" . (strlen($addFunctionStr) > 0 ? ', ' . $addFunctionStr : '') . "    		
    		FROM
    		(SELECT i.t_id, i_id, i_date_create, i_name, i_anons, i_logoname, i_link, i_author, is_video 
    		FROM items i
    		INNER JOIN (select distinct t.t_id
    					from topics t
			        	where t.t_status = 1 AND t.t_left_key >= " . $LRKey->t_left_key . " and t.t_right_key <= " . $LRKey->t_right_key . ") t ON i.t_id = t.t_id
    		WHERE i.i_type='$itemsType'
    		--AND l_langnick = '$langNick'
    		AND i.i_status = 1
    		" . (strlen($addWhere) > 0 && $itemsType !== 'preview' ? ' AND ' . $addWhere : '') . "
    		
                        " . //mirs додавання часу для пергляду анонсів 1ця-день
            "AND i_date_create " . ($itemsType === 'preview' ? '> (-0.042) +' : '<=') . " sysdate				
    		) i_all
    			INNER JOIN months m ON to_number(to_char(i_all.i_date_create,'mm'))=m.m_number AND l_langnick = '$langNick'
    		ORDER BY i_date_create " . ($itemsType === 'preview' ? 'ASC' : 'DESC') . ") ool
            inner join items_full f
            on ool.i_id = f.i_id
        WHERE rownum<=$countRows";

//print_r($sqlStr);die();

        return $this->db->query($sqlStr);
    }

}
