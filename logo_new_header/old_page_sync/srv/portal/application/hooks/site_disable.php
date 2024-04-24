<?php

Event::add('system.post_routing', 'siteDisable'); 


/**
 * Відключення сайту
 *
 */
function siteDisable(){
	
   	Kohana::auto_load('Configsaver');
   	
   	$saver = new Configsaver;
   	$saver->recreateFrontend();	
	
	if(Kohana::config('other.site_disabled')){
		Router::$controller = 'site_disable';  
		Router::$method = 'index';        
        
		
	}
	
}
?>