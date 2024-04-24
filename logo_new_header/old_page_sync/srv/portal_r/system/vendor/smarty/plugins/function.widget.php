<?php

/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */
 
function smarty_function_widget($params, &$smarty) {
	
    
	if (!isset($params['name'])) {
        $smarty->trigger_error("widget: missing 'name' parameter");
        return;
    }
    
	if (!isset($params['action'])) {
        $smarty->trigger_error("widget: missing 'action' parameter");
        return;
    }
    
    
    $sendParams = $params;
    unset($sendParams['name']);
    unset($sendParams['action']);
        
    return widget::get(ucfirst($params['name']),$params['action'],$sendParams);
    
}
 