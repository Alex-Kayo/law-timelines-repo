<?php

class widget {
	
	public static function get($className,$functionName,$parameters = array()){
				
		$controllerName = $className.'_Controller';
		$controller = new $controllerName;
		$result = $controller->$functionName($parameters);
		
		return $result;
		
	}
	 
}