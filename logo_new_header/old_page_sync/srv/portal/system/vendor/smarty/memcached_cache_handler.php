<?php

function memcache_cache_handler($action, &$smarty_obj, &$cache_content, $tpl_file=null, $cache_id=null, $compile_id=null, $exp_time=null) {
	// set $GLOBALS['memcached_red'] to be a instance of a memcache object
	$m = $GLOBALS['memcached_res'];
	
	// unique cache id
	if ($tpl_file != null && $cache_id != null && $compile_id != null) {
		$cache_id = md5($tpl_file.$cache_id.$compile_id);
	}
	
	switch ($action) {
	case 'read':
		// grab the key from memcached
		$cache_content = $m->get($cache_id);
		$return = true;
		break;
	
	case 'write':
		if(!$m->set($cache_id, $cache_contents, 0, (int)$exp_time)) {
			$smarty_obj->trigger_error("cache_handler: set failed.");
		}
		
		$return = true;
		break;
	
	case 'clear':
		if($cache_id == null) {
			$m->flush();
		} else {
			$result = $m->delete($cache_id);
		}
		if(!$result) {
			$smarty_obj->trigger_error("cache_handler: query failed.");
		}
		$return = true;
		break;
		
	default:
		$smarty_obj->trigger_error("cache_handler: unknown action \"$action\"");
		$return = false;
		break;
	}
	
	return $return;
}
?>
