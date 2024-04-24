<?php

class Meeting_Model extends Model {

    protected $db;

    public function __construct() {
        parent::__construct();
        $this->db = Database::instance('default');
    }

    public function get_day_types($lang) {
        $this->db
                        ->select("md_type, md_type_name_$lang as name, front_style")
                        ->from('meeting_day_type')
                        ->where('status', 1);
                       
        $result = array();
        foreach ($this->db->get()->result() as $row) {
            $result[$row->md_type] = $row->name;
        }
       // var_dump($result);  die();
        return $result;
    }

    public function get_day_types_style() {
        $this->db
                ->select("md_type,front_style")
                ->from('meeting_day_type')
                ->where('status', 1);

        $result = array();
        foreach ($this->db->get()->result() as $row) {
            $result[$row->md_type] = $row->front_style;
        }
    //    var_dump($result); die();
        return $result;
    }

    /**
     * ерегляд документу
     * @param ыекштп $lang
     * @param type $id 
     */
    public function show($lang, $id) {

        $result = $this->db
                        ->select('mi_id', "mi_name_$lang as mi_name", "mi_number", "mi_type", "mi_text_$lang as mi_text", "to_char(meeting_day.md_date, 'dd') as day", "to_char(meeting_day.md_date, 'mm') as month", "to_char(meeting_day.md_date, 'yyyy') as year", "meeting_session.ms_name_$lang as ms_name", "meeting_convocation.mc_name_$lang as mc_name")
                        ->from('meeting_items')
                        ->join('meeting_day', 'meeting_items.md_id', 'meeting_day.md_id', 'INNER')
                        ->join('meeting_session', "to_number(to_char(meeting_day.md_date, 'yyyymm')) between meeting_session.ms_month_start and meeting_session.ms_month_end AND 1=1", "", 'INNER')
                        ->join('meeting_convocation', "meeting_convocation.mc_id=meeting_session.mc_id", '', 'INNER')
                        ->where('meeting_items.mi_status', 1)
                        ->where('meeting_items.mi_id', $id)->get()->current();

        if (!is_object($result)) {
            return false;
        }
     //   var_dump($this->db->last_query());        die();
        
        return $result;
    }

    /**
     * Пошук
     * 
     * @param integer $type
     * @param string $lang
     * @param integer  $convocation_id
     * @param integer $session_id
     * @param string $substr 
     */
    public function search($type, $lang, $convocation_id, $session_id, $substr, $limit, $offset) {

        $this->db
                ->select("meeting_items.mi_name_$lang as mi_name", "meeting_items.mi_id", "to_char(meeting_day.md_date, 'dd.mm.yyyy') as md_date", "meeting_items.mi_type", "meeting_session.ms_name_$lang as ms_name", "meeting_convocation.mc_name_$lang as mc_name")
                ->from('meeting_items')
                ->where('meeting_items.mi_status', 1)
                ->where('meeting_items.mi_type', $type)
                ->join('meeting_day', 'meeting_items.md_id', 'meeting_day.md_id', 'INNER')
                ->join('meeting_session', "to_number(to_char(meeting_day.md_date, 'yyyymm')) between meeting_session.ms_month_start and meeting_session.ms_month_end " . (intval($session_id) > 0 ? " AND meeting_session.ms_id = " . intval($session_id) : '') . ' AND 1=1', "", 'INNER')
                ->join('meeting_convocation', "meeting_convocation.mc_id=meeting_session.mc_id " . (intval($convocation_id) > 0 ? " AND meeting_convocation.mc_id = " . intval($convocation_id) : ''), '', 'INNER')
                ->orderby(array('meeting_day.md_date' => 'DESC'))
                ->limit($limit, $offset);

        if (strlen($substr) > 0) {
            $this->db->where("(CONTAINS(mi_name_$lang, '" . $substr . "',1)>0 OR CONTAINS(mi_text_$lang, '" . $substr . "',2)>0)");
        }


        $result = array();
        $result['items'] = $this->db->get();
        $result['total_count'] = $this->db->count_last_query();

        return $result;
    }

    /**
     * Список скликань з сесіями
     * @param type $lang - мова
     * @return array 
     */
    public function getArcConvocations($lang) {

        $this->db
                ->select("meeting_convocation.mc_id", "meeting_convocation.mc_name_$lang as mc_name", "meeting_session.ms_id", "meeting_session.ms_short_name_$lang as ms_name")
                ->from('meeting_convocation')
                ->join('meeting_session', 'meeting_convocation.mc_id', 'meeting_session.mc_id', 'LEFT')
                ->orderby(array('meeting_convocation.mc_index' => 'desc', 'meeting_session.ms_month_start' => 'asc'));

        $result = array();
        foreach ($this->db->get()->result(false) as $row) {
            $result[$row['mc_id']]['mc_name'] = $row['mc_name'];
            if (intval($row['ms_id']) > 0) {
                $result[$row['mc_id']]['sessions'][] = array('ms_id' => $row['ms_id'], 'ms_name' => $row['ms_name']);
            }
        }
        return $result;
    }

    /**
     * Поветрає данні по вибранній сесії
     * 
     * @param string $lang - поточна мова
     * @param integer $session_id  - ідентифікатор сесії (null - поточна сесія)
     * @return Object
     */
    public function getSession($lang, $session_id = null) {

        $lang = strtolower($lang);
        $this->db
                ->select("ms_id", "ms_name_$lang as ms_name", "ms_month_start", "ms_month_end", "meeting_session.mc_id", "meeting_convocation.mc_name_$lang as mc_name", "ms_description_$lang as ms_description")
                ->from('meeting_session')
                ->join('meeting_convocation', 'meeting_session.mc_id', 'meeting_convocation.mc_id', 'INNER')
                ->orderby(array('ms_month_end' => 'desc'))
                ->limit(1);

        if (intval($session_id) > 0) {
            $this->db->where('ms_id', intval($session_id));
        }

        $result = $this->db->get()->current();
        if (!is_object($result)) {
            return false;
        }

        $lang = Kohana::lang('common');
        $result->ms_month_start_month = $lang['months_first'][substr($result->ms_month_start, 4)];
        $result->ms_month_end_month = $lang['months_first'][substr($result->ms_month_end, 4)];
        $result->ms_month_start_year = substr($result->ms_month_start, 0, 4);
        $result->ms_month_end_year = substr($result->ms_month_end, 0, 4);

        return $result;
    }

    /**
     * Формування даних по місяцям
     * 
     * @param integer $type - тип документа
     * @param string $lang - поточна мова
     * @param string $monthStart - початковий місяць (yyyymm)
     * @param string $monthEnd  - кінцевий місяць (yyyymm)
     */
    public function getMonths($type, $lang, $monthStart, $monthEnd) {

        $arrMonths = array();
        $currentMonth = mktime(0, 0, 0, intval(substr($monthStart, 4)), 1, intval(substr($monthStart, 0, 4)));
        while (date('Ym', $currentMonth) <= $monthEnd) {
            $arrMonths[] = $currentMonth;
            $currentMonth = strtotime("+1 month", $currentMonth);
        }
        $arrDays = array();
        $this->db
                ->select("to_char(md_date, 'yyyymmdd') as md_date, md_type, meeting_day.md_id, meeting_items.mi_name_$lang as mi_name, meeting_items.mi_id")
                ->from('meeting_day')
                ->join('meeting_items', 'meeting_day.md_id = meeting_items.md_id and meeting_items.mi_status=1 and meeting_items.mi_type=' . $type, '', 'LEFT')
                ->where("md_date between  to_date('" . date('Ym', $arrMonths[0]) . "', 'yyyymm') and last_day(to_date('" . date('Ym', $arrMonths[count($arrMonths) - 1]) . "', 'yyyymm') )")
                ->orderby(array('meeting_items.mi_id' => 'asc'));
        foreach ($this->db->get()->result(false) as $row) {
            $arrDays[$row['md_date']]['type'] = $row['md_type'];
            $arrDays[$row['md_date']]['id'] = $row['md_id'];
            if (intval($row['mi_id']) > 0) {
                $arrDays[$row['md_date']]['items'][$row['mi_id']] = $row['mi_name'];
            }
        }

        $lang = Kohana::lang('common');
        $result = array();

        foreach ($arrMonths as $month) {
            $result[] = array(
                'month_name' => $lang['months_first'][date('m', $month)],
                'data' => $this->getMonthData($month, $arrDays)
            );
        }
        //         var_dump($result); die();
        return $result;
    }

    private function getMonthData($monthTimestamp, $arr_days) {

        $dayofmonth = date('t', $monthTimestamp);
        $day_count = 1;
        $num = 0;
        $week = array();
        for ($i = 0; $i < 7; $i++) {
            $dayofweek = date('w', mktime(0, 0, 0, date('m', $monthTimestamp), $day_count, date('Y', $monthTimestamp)));
            $dayofweek = $dayofweek - 1;
            if ($dayofweek == -1)
                $dayofweek = 6;

            if ($dayofweek == $i) {
                $week[$num][$i] = $day_count;
                $day_count++;
            } else {
                $week[$num][$i] = "";
            }
        }

        while (true) {
            $num++;
            for ($i = 0; $i < 7; $i++) {
                $week[$num][$i] = $day_count;
                $day_count++;
                if ($day_count > $dayofmonth)
                    break;
            }
            if ($day_count > $dayofmonth)
                break;
        }

        $result = array();
        for ($i = 0; $i < count($week); $i++) {
            for ($j = 0; $j < 7; $j++) {
                if (!empty($week[$i][$j])) {
                    $full_day = date('Ym', $monthTimestamp) . str_pad($week[$i][$j], 2, "0", STR_PAD_LEFT);
                    $result[$i]['days'][] = array(
                        'day' => $week[$i][$j],
                        'type' => (isset($arr_days[$full_day]) ? intval($arr_days[$full_day]['type']) : 0),
                        'id' => (isset($arr_days[$full_day]) ? intval($arr_days[$full_day]['id']) : 0),
                        'items' => (isset($arr_days[$full_day]['items']) ? $arr_days[$full_day]['items'] : false),
                        'full_day' => $full_day
                    );
                } else {
                    $result[$i]['days'][] = array('day' => '');
                }
            }
        }

        return $result;
    }

}
