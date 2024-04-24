<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of cc_all
 *
 * @author mirs
 */

class Ccall_Controller extends Controller{
    
    private $IPs;
    
    public function __construct() {
        
         parent::__construct();
         
         $this->IPs = $this->input->ip_address();
         
         
         if  (in_array($this->IPs, Kohana::config('filter_ip.ccall_deni' )))
    
            Kohana::show_404();
        
        $this->cache = new Cache;
    }
    public function index() {
        
        
//        if (in_array($this->input->ip_address(), Kohana::config('filter_ip.ccall_deni')))
//            Kohana::show_404();
        $this->cache->delete_all();
//        echo 'Ok '.explode('.', $this->input->ip_address());
        echo substr($this->IPs, 8).'->Ok!  ';
    }
}
