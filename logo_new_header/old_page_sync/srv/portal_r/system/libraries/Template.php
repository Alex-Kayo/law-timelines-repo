<?php

include Kohana::find_file('vendor', 'smarty/Smarty.class');

class Template_Core extends Smarty {

    function __construct()
    {
        parent::__construct();

        $this->cache_dir      = Kohana::config('smarty.cache_dir');
        $this->compile_dir    = Kohana::config('smarty.compile_dir');
        $this->config_dir     = Kohana::config('smarty.configs_path');
        $this->plugins_dir[]  = Kohana::config('smarty.plugins_path');
        $this->debug_tpl      = Kohana::config('smarty.debug_tpl');
        $this->debugging_ctrl = Kohana::config('smarty.debugging_ctrl');
        $this->debugging      = Kohana::config('smarty.debugging');
        $this->caching        = FALSE;
        $this->force_compile  = Kohana::config('smarty.force_compile');
        $this->security       = Kohana::config('smarty.security');
        
    }

}