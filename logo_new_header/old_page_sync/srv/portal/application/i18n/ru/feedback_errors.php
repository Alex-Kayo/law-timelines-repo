<?php

$lang = array
(
	'theme' => Array
	(
		'required' => 'Пожалуйста введите тему сообщения',
		'default' => 'Пожалуйста введите тему сообщения',
		'length'	=> 'Тема сообщения должна быть больше 10 символов'
	),
	'name' => Array
	(
		'required' => 'Пожалуйста введите ваше Ф.И.О',
		'default' => 'Неправильное имя',
		'length'	=> 'Имя должно быть больше 3 символов'
	),
	'text' => Array
	(
		'required' => 'Пожалуйста введите текст сообщения',
		'default' => 'Пожалуйста введите текст сообщения',
		'length'	=> 'Текст сообщения должен содержать больше 25 символов'
	),
	'email' => Array
	(
		'required' => 'Пожалуйста укажите свой адрес электронной почты',
		'email' => 'Формат адреса электронной почты не верный',
		'default' => 'Формат адреса электронной почты не верный'
	),	
	'captcha' => Array
	(
		'required' => 'Введите код проверки',
		'default' => 'Не верный код проверки',
		'length'	=> 'Код проверки должен состоять из 6 символов'
	),
	
	'cookie' => 'Антифлуд 30 сек',
	
	'badWords' => 'В тексте замеченные запрещены слова',
	
	'sendOk'	=> 'Ваше сообщение успешно отослано',
	
	'sendProblems' => 'При отправлении сообщения возникли проблемы'
	
);