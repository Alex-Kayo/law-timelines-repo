<?php defined('SYSPATH') OR die('No direct access allowed.');

$config = array
(
	'integration'           => TRUE,        // Enable/Disable Smarty integration
	'templates_ext'         => 'tpl',
	'template_dir'          => APPPATH.'views',
	'cache_dir'             => APPPATH.'cache/smarty_cache',
	'compile_dir'           => APPPATH.'cache/smarty_compile',
	'configs_dir'           => APPPATH.'views/smarty_configs',
	'plugins_dir'           => SYSPATH.'vendor/smarty/plugins',
	'debug_tpl'             => APPPATH.'views/debug.tpl',
	'debugging_ctrl'        => FALSE,
	'debugging'             => FALSE,
	'caching'               => FALSE,
	'force_compile'         => FALSE,
    'security'              => FALSE,
);
