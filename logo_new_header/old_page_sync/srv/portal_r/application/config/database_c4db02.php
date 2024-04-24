<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * @package  Database
 *
 * Database connection settings, defined as arrays, or "groups". If no group
 * name is used when loading the database library, the group named "default"
 * will be used.
 *
 * Each group can be connected to independently, and multiple groups can be
 * connected at once.
 *
 * Group Options:
 *  benchmark     - Enable or disable database benchmarking
 *  persistent    - Enable or disable a persistent connection
 *  connection    - Array of connection specific parameters; alternatively,
 *                  you can use a DSN though it is not as fast and certain
 *                  characters could create problems (like an '@' character
 *                  in a password):
 *                  'connection'    => 'mysql://dbuser:secret@localhost/kohana'
 *  character_set - Database character set
 *  table_prefix  - Database table prefix
 *  object        - Enable or disable object results
 *  cache         - Enable or disable query caching
 *	escape        - Enable automatic query builder escaping
 */


$config['default'] = array
(
    'benchmark'     => TRUE,
    'persistent'    => FALSE,
    'connection'    => array
    (
        'type'     => 'oracle',
        'user'     => 'radanp806',
        'pass'     => 'radanp806',
        'host'     => 'localhost',
        'port'     => FALSE,
        'socket'   => FALSE,
        /*'database' => '(DESCRIPTION =
                                (ADDRESS = (PROTOCOL = TCP)(HOST = n2-vip.c2.rada.gov.ua)(PORT = 1521))
                                (ADDRESS = (PROTOCOL = TCP)(HOST = n3-vip.c2.rada.gov.ua)(PORT = 1521))
                                    (LOAD_BALANCE = yes)
                                (CONNECT_DATA =
                                    (SERVER = DEDICATED)
                                    (SERVICE_NAME = webdb)
                                )
                          )'				
				'database' => '(DESCRIPTION =
								(ADDRESS = (PROTOCOL = TCP)(HOST = n1-vip.c1.rada.gov.ua)(PORT = 1521))
								(ADDRESS = (PROTOCOL = TCP)(HOST = n2-vip.c1.rada.gov.ua)(PORT = 1521))
								(ADDRESS = (PROTOCOL = TCP)(HOST = n4-vip.c1.rada.gov.ua)(PORT = 1521))
									(LOAD_BALANCE = yes)
								(CONNECT_DATA =
									(SERVER = DEDICATED)
									(SERVICE_NAME = gs04)
								)
						)'*/

				'database' => '(DESCRIPTION =
								(ADDRESS = (PROTOCOL = TCP)(HOST = scan.c4.rada.gov.ua)(PORT = 1521))
								(CONNECT_DATA =
									(SERVER = DEDICATED)
									(SERVICE_NAME = c4db02)
								)

						)'

    ),
    'character_set' => 'utf8',
    'table_prefix'  => '',
    'object'        => TRUE,
    'cache'         => FALSE,
    'escape'        => TRUE
);