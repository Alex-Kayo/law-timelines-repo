<?php defined('SYSPATH') OR die('No direct access allowed.');

// Valid drivers are: native, sendmail, smtp
$config['driver'] = 'smtp';


// Standard smtp connection
$config['options'] = array('hostname'=>'cas01.rada.gov.ua', 'port'=>'25', 'username'=>'iportal', 'password'=>'');


?>