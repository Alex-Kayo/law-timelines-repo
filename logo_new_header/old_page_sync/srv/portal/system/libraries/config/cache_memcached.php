<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * @package  Cache:Memcached
 *
 * memcache server configuration.
 */
$config['servers'] = array
(
    array
    (
        'host' => '127.0.0.1',
        'port' => 11211,
        'weight' => 77
    )
    /*,
    array
    (
        'host' => '192.168.0.28',
        'port' => 11211,
        'weight' => 33
    )
    */    
);

/**
 * Domen prefix
 */
$config['prefix'] = 'domen2';