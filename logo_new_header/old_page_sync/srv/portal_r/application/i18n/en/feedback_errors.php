<?php

$lang = array
(
	'theme' => Array
	(
		'required' => 'Please enter the subject',
		'default' => 'Please enter the subject',
		'length'	=> 'Subject should be more than 10 characters'
	),
	'name' => Array
	(
		'required' => 'Please enter your name',
		'default' => 'Invalid name',
		'length'	=> 'Name should be more than 3 characters'
	),
	'text' => Array
	(
		'required' => 'Please enter your message',
		'default' => 'Please enter your message',
		'length'	=> 'Message must be at least 25 but not more than 1000 characters'
	),
	'email' => Array
	(
		'required' => 'Please enter your email',
		'email' => 'Your e-mail address is not correct',
		'default' => 'Your e-mail address is not correct'
	),	
	'captcha' => Array
	(
		'required' => 'Enter verification code',
		'default' => 'Wrong verification code',
		'length'	=> 'Validation code should contain 6 characters'
	),
	
	'cookie' => 'Антифлуд 30сек',
	
	'badWords' => 'In the text were seen vulgar words',
	
	'sendOk'	=> 'Message sent successfully',
	
	'sendProblems' => 'Toruble sending messages'
	
);
