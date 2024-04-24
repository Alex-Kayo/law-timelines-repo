<?php

defined('SYSPATH') OR die('No direct access allowed.');

class Test_Controller extends Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {

        //unlink(APPPATH . 'views/default/hash.txt');
        //die('sasa-4');

        $db = Database::instance();

        $db->query("update templates set tpl_nickname = REPLACE(tpl_nickname, '''', '')");
        $db->query("update templates set tpl_name = REPLACE(tpl_name, '''', '')");
        $db->query("update templates set tpl_description = REPLACE(tpl_description, '''', '')");
        $db->query("update templates set tpl_path = REPLACE(tpl_path, '''', '')");
        die('sasa-5');


        $id = $db->from('modules')->select('max(m_id) as id')->get()->current()->id;

        $db->select('tpl_id')->from('templates')->where("tpl_path like 'page_hf%'");

        foreach ($db->get()->result() as $row) {
            $db->insert('modules_templates', array('m_id' => $id, 'tpl_id' => $row->tpl_id));
        }
        die('sasa-3');


        //$sql = 'ALTER TABLE MODULES MODIFY(M_TYPE VARCHAR2(100))';
        //$sql="insert into modules (m_nickname,m_name,m_status,m_type) (select 'page_hf',m_name,m_status,m_type from modules where m_nickname = 'subscribe')";
        //$db->query($sql);    	

        /*
          $db->query("update templates set tpl_nickname = REPLACE(tpl_nickname, '''', '')");
          $db->query("update templates set tpl_name = REPLACE(tpl_name, '''', '')");
          $db->query("update templates set tpl_description = REPLACE(tpl_description, '''', '')");
          $db->query("update templates set tpl_path = REPLACE(tpl_path, '''', '')");



          die;
         */

        $res = $db->from('themes')->where('th_name', "'default'")->get()->current();
        if (!is_object($res)) {
            echo '-1-BAD-1';
            return;
        }
        $th_id = $res->th_id;



        $id = $db->from('modules')->select('max(m_id) as id')->get()->current()->id;

        $db->update('modules', array('m_name' => 'Відгрузка хідера і футера'), array('m_id' => $id));
        die;





        $db->from('templates')->where('tpl_hash is null');
        foreach ($db->get()->result() as $row) {
            $db->insert('modules_templates', array('m_id' => $id, 'tpl_id' => $row->tpl_id));
        }


        //die;
        //$db->update('modules', array('m_name' => 'Відгрузка хідера && футера'), array('m_id' => $id));
        //die;

        /*


          $saveData = array(
          'm_nickname' => "'page_hf'",
          'm_name'	=> "'Відгрузка хідера && футера'",
          'm_status'	=> 1,
          'm_type'=> "'front'"

          );

          $id = $db->insert('modules', $saveData)->insert_id();
         */


        $arrTemplates = array();

        $arr1 = array('footer.tpl', 'header.tpl');

        foreach ($arr1 as $item) {
            $saveData = array(
                'tpl_nickname' => "$item",
                'tpl_name' => "$item",
                'tpl_description' => "$item",
                'tpl_path' => "page_hf/'$item'",
                'th_id' => $th_id,
                'tpl_data' => '111'
            );

            $arrTemplates[] = $db->insert('templates', $saveData)->insert_id();
        }
    }

}
