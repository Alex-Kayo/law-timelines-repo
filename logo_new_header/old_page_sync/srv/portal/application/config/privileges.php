<?php defined('SYSPATH') OR die('No direct access allowed.');

								 
$config['method_denied'] = 'accessDenied'; 

$config['cache_id_users'] = 'users'; 

$config['cache_id_allpriv'] = 'all_priv'; 


$config['cache_id_bad_auth'] = 'bad_auth'; 


$config['block_bad_auth'] = array('send_mail' => FALSE,
								  'count_bad_login'=>3, 
								  'time_block' => 3);



?>