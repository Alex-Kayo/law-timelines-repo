<?php
	
$config['vr'] = array
(
    'field_name' => 'recaptcha', //ім'я поля у формі
    'url'      => 'https://www.google.com/recaptcha/api/siteverify', //google recaptcha url
    'sitekey'      => '6LeR7jkUAAAAAGS9mKZGDGjsnEgUgcOC9PCCVxRT', // реєстраційний ключ
    'gsecretkey'     => '6LeR7jkUAAAAAN2R3I2MTa-fS3_vq87CCgQ05aNj', //secret key
    //'proxy_server'  => 'tcp://mcproxy.rada.gov.ua:9090', // важливо ! протокол tcp для stream_context_create()
    'proxy_server'  => 'mcproxy.rada.gov.ua:9090', // для curl_setopt($curl, CURLOPT_PROXY, proxy)
);