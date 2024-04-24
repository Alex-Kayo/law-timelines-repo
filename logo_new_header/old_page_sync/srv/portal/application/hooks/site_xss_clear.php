<?php

Event::add('system.ready', 'xss_clear'); 

function xss_clear(){
    
    $_GET = search::strip(Input::instance()->get());
    $_POST = search::strip(Input::instance()->post());
    
    $result = array();
    foreach (explode('&', $_SERVER['QUERY_STRING']) as $item){
        $tmp = explode('=',$item);
        if(count($tmp) == 2){
            $result[] = $tmp[0] . '=' . urlencode(search::strip(urldecode($tmp[1])));                        
        }else{
            $result[] = $item;            
        }
    }
    $_SERVER['QUERY_STRING'] = implode('&', $result);
    
}

?>