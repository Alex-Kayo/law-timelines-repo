<?php defined('SYSPATH') OR die('No direct access allowed.');

$config = array
(
	'integration'           => TRUE,        // Enable/Disable Smarty integration
	'templates_ext'         => 'tpl',
	'global_templates_path' => APPPATH.'views/',
	'cache_path'            => APPPATH.'cache/smarty_cache/',
	'compile_path'          => APPPATH.'cache/smarty_compile/',
	'configs_path'          => APPPATH.'views/smarty_configs/',
	'plugins_path'          => APPPATH.'views/smarty_plugins/',
	'debug_tpl'             => APPPATH.'views/debug.tpl',
	'plugins_dir'			=> SYSPATH.'vendor/smarty/plugins',
	'debugging_ctrl'        => FALSE,
	'debugging'             => FALSE,
	'caching'               => FALSE,
	'force_compile'         => TRUE,
	'security'              => FALSE
);
