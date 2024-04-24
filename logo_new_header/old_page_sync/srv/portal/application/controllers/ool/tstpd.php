<?php

class TstPd_Controller extends Controller {
      
    /**
     * Об"єкт  класу Database
     *
     * @var object
     */
    private $db;

    
    
    public function __construct(){


        parent::__construct();


        if  (in_array($this->input->ip_address(), Kohana::config('filter_ip.rss_deni' )))

            Kohana::show_404();
        
        $this->db =  Database::instance('rss');
        
    }
    

    /**
     * Спсисок RSS для обробки
     *
     */
    public function index(){


        $ipl = $this->db->query(
            "select mdt.md_type as is_plenar from MEETING_DAY_TYPE mdt
                  inner join MEETING_DAY md on mdt.md_type = md.md_type
                    where  to_char(md.md_date) = to_char(sysdate-1)
                    and mdt.md_type in (".Kohana::config('plenar_day_type.plenday_id').")"
        )->current();

        $sd = $this->db->query(
            "select to_char(sysdate) from dual"
//            "select to_char(sysdate, 'dd.mm.yyyy') from dual"
        )->current();

        var_dump($sd); die();
//        var_dump($this->db->last_query()); die();

    }

}
