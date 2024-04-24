<?php

class Anons_calendar_Model extends Model {

    protected $db;
    
    public function __construct(){
        parent::__construct();
        $this->db = Database::instance('default');
        
    }


    public function get_anons_dates($lkey, $rkey, $time_ofset){
       
        
        
        $selAnons = $this->db->query("SELECT  to_char(i_date_create, 'dd') as day, to_char(i_date_create, 'mm')   as month, to_char(i_date_create, 'D') as weekday, to_char(i_date_create, 'yyyymmdd') as fdate, count(to_char(i_date_create, 'dd')) as count
  FROM items i
 INNER JOIN (select distinct t.t_id
               from topics t
              where t.t_status = 1
                AND t.t_left_key >= ".$lkey."
                and t.t_right_key <= ".$rkey.") t
    ON i.t_id = t.t_id
 WHERE i.i_type = 'preview'
   AND l_langnick = 'ua'
   AND i.i_status = 1
   AND i_date_create > sysdate + {$time_ofset}
   group by (to_char(i_date_create, 'dd'), to_char(i_date_create, 'mm'), to_char(i_date_create, 'D'), to_char(i_date_create, 'yyyymmdd'))
   ORDER BY to_char(i_date_create, 'mm') asc, to_char(i_date_create, 'dd') asc");
    	

  //     print_r($selAnons); die();

//$arrAnonsDays = array();
        $lang = Kohana::lang('common');
        foreach ($selAnons as $row){
                $AnonsDays[] = array(
                    
                    'year'         => substr($row->fdate, 0, 4 ),
                    'day'          => $row->day,
                    'month_name'   => $lang['months'][$row->month],
                   // 'weekday_name'  => $lang['week_day_long'][$row->weekday-1],
                    'fulldate'     => $row->fdate,
                    'count'        => $row->count
                );
                
            }
           
            if (!isset($AnonsDays))  return NULL;
                
             return $AnonsDays;
           
            
        
    }

 
    /**
     * Формування даних по місяцям
     * 
     * @param integer $type - тип документа
     * @param string $lang - поточна мова
     * @param string $monthStart - початковий місяць (yyyymm)
     * @param string $monthEnd  - кінцевий місяць (yyyymm)
     */
    public function getMonths($type, $lang, $monthStart, $monthEnd){
  
        $arrMonths = array();        
        $currentMonth = mktime(0,0,0, intval(substr($monthStart, 4)),1, intval(substr($monthStart, 0, 4)));             
        while(date('Ym', $currentMonth) <= $monthEnd){
            $arrMonths[] = $currentMonth;
            $currentMonth = strtotime("+1 month", $currentMonth);
        }
        $arrDays = array();	    
	$this->db
	       ->select("to_char(md_date, 'yyyymmdd') as md_date, md_type, meeting_day.md_id, meeting_items.mi_name_$lang as mi_name, meeting_items.mi_id")
	       ->from('meeting_day')
               ->join('meeting_items', 'meeting_day.md_id = meeting_items.md_id and meeting_items.mi_status=1 and meeting_items.mi_type='.$type, '', 'LEFT')
	       ->where("md_date between  to_date('" . date('Ym', $arrMonths[0]) ."', 'yyyymm') and last_day(to_date('" . date('Ym', $arrMonths[count($arrMonths)-1]) ."', 'yyyymm') )")
               ->orderby(array('meeting_items.mi_id' => 'asc'));
	    foreach ($this->db->get()->result(false) as $row){
	        $arrDays[$row['md_date']]['type']   = $row['md_type'];
                $arrDays[$row['md_date']]['id']     = $row['md_id'];                
                if(intval($row['mi_id']) > 0){
                    $arrDays[$row['md_date']]['items'][$row['mi_id']] = $row['mi_name'];
                }
                
	    }              
        
            $lang = Kohana::lang('common');
            $result = array();
            
            foreach ($arrMonths as $month){
                $result[] = array(
                    'month_name'    => $lang['months_first'][date('m', $month)],
                    'data'          => $this->getMonthData($month, $arrDays)                    
                );
                
            }
            
            return $result;
        
    }

    
    
    
    
    

    private function getMonthData($monthTimestamp, $arr_days){        
	    
        $dayofmonth = date('t', $monthTimestamp);
        $day_count = 1;
        $num = 0;
        $week = array();
        for($i = 0; $i < 7; $i++){
            $dayofweek = date('w', mktime(0, 0, 0, date('m', $monthTimestamp), $day_count, date('Y', $monthTimestamp)));
            $dayofweek = $dayofweek - 1;
            if($dayofweek == -1) $dayofweek = 6;
        
            if($dayofweek == $i)
            {
              $week[$num][$i] = $day_count;
              $day_count++;
            }
            else
            {
              $week[$num][$i] = "";
            }
        }

        while(true){
            $num++;
            for($i = 0; $i < 7; $i++)
            {
              $week[$num][$i] = $day_count;
              $day_count++;
              if($day_count > $dayofmonth) break;
            }
            if($day_count > $dayofmonth) break;
          }
          
          $result = array();
          for($i = 0; $i < count($week); $i++)
          {
            for($j = 0; $j < 7; $j++)
            {
              if(!empty($week[$i][$j]))
              {
                 $full_day = date('Ym', $monthTimestamp) . str_pad($week[$i][$j], 2, "0", STR_PAD_LEFT);                  
                 $result[$i]['days'][] = array(
                            'day'           => $week[$i][$j], 
                            'type'          => (isset($arr_days[$full_day]) ? intval($arr_days[$full_day]['type']) : 0), 
                            'id'            => (isset($arr_days[$full_day]) ? intval($arr_days[$full_day]['id']) : 0), 
                            'items'         => (isset($arr_days[$full_day]['items']) ? $arr_days[$full_day]['items'] : false), 
                            'full_day'      => $full_day
                            
                 ); 
                  
              }else{
                  $result[$i]['days'][] = array('day' => '');                    
              }

            }
          } 

          return $result;  
  
    }
    
    

}