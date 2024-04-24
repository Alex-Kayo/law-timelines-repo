<?php

class Plenar_week_Model extends Model {

    protected $db;

    public function __construct() {
        parent::__construct();
        $this->db = Database::instance('default');
    }

    public function get_week_date($topicId,$date, $langNick) {
        
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
   and t.i_date_create between trunc({$date}, 'D') and {$date}+1
 order by t.i_date_create asc";
       // var_dump($sqlstr);
        $pweek = $this->db->query($sqlstr);

        $plen_week = array();
       // $plen_days = array();
        foreach ($pweek as $key => $value) {
           // $plen_days  = array($value->weekday);
            $count_golos = $value->g_pos + $value->g_neg + $value->refrain + $value->not_voting;
            $g_pos_persent = ($value->g_pos/$count_golos)*100;
            $g_neg_persent = ($value->g_neg/$count_golos)*100;
            $refrain_persent = ($value->refrain/$count_golos)*100;
            $not_voting_persent = ($value->not_voting/$count_golos)*100;
            $plen_week[$value->weekday][] = array(
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
                'g_pos_persent' => (int)round($g_pos_persent, 0),
                'g_neg_persent' => (int)round($g_neg_persent, 0),
                'refrain_persent' => (int)round($refrain_persent, 0),
                'not_voting_persent' => (int)round($not_voting_persent, 0),
                'i_link' => $value->i_link
                    
               );
        }
            
        return $plen_week;
    }

}
