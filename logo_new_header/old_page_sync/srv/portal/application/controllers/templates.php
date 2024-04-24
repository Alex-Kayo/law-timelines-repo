<?php

class Templates_Controller extends Controller {

    public $m_id = 1;
    public $tpl_id = 100;
    public $mtpl_id = 100;
    public $cur_mod;

    public function tree($folder) {

        $temp = opendir($folder);
        while (false !== ($file = readdir($temp))) {
            if (!in_array($file, array(".", "..", "/", ".svn", "main.tpl"))) {
                if (is_dir($folder . '/' . $file)) {

                    //$name = mb_substr($file, 0, mb_strrpos($file, '.'));
                    $this->cur_mod = $file;

                    $data = array(
                        'm_id' => $this->m_id,
                        'm_nickname' => $file,
                        'm_name' => $file,
                        'm_status' => 1,
                        'm_type' => 'front'
                    );

                    $this->m_id = $this->db->insert('modules', $data)->insert_id();

                    $this->tree($folder . '/' . $file);
                } else {
                    $name = mb_substr($file, 0, mb_strrpos($file, '.'));

                    $data = array(
                        'tpl_id' => $this->tpl_id,
                        'tpl_nickname' => $file,
                        'tpl_name' => $file,
                        'tpl_description' => $file,
                        'tpl_data' => file_get_contents($folder . '/' . $file),
                        'tpl_path' => $this->cur_mod . "/" . $file,
                        'th_id' => 2
                    );

                    $this->tpl_id = $this->db->insert('templates', $data)->insert_id();

                    $data = array(
                        //'mtpl_id' => $this->mtpl_id,
                        'm_id' => $this->m_id,
                        'tpl_id' => $this->tpl_id
                    );

                    $this->mtpl_id = $this->db->insert('modules_templates', $data)->insert_id();

                    echo $this->cur_mod . "/" . $file . "<br />";
                }
            }
        }
        closedir($temp);
    }

    public function index() {
        $this->tree(APPPATH . 'views/default');
    }

}