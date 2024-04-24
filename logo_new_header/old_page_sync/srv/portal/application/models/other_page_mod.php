<?php

class Other_page_mod_Model extends Model {

    protected $db;
    
    private $infoblock = array(
        '1',
        '2',
        '3'
    );
    

    public function __construct() {
        parent::__construct();
        $this->db = Database::instance('default');
    }
    
    
    
}