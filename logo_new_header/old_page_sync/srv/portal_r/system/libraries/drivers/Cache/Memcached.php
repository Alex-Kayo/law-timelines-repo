<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Memcached-based Cache driver.
 *
 * @package    Cache
 * @author     Oleh Zamkovyi <oleh.zam@gmail.com>
 */
class Cache_Memcached_Driver implements Cache_Driver {

	const TAGS_KEY = 'memcached_tags_array';

	// Cache backend object and flags
	protected $backend;

	// Tags array
	protected static $tags;

	// Have the tags been changed?
	protected static $tags_changed = FALSE;

	public function __construct()
	{
		if ( ! extension_loaded('memcached'))
			throw new Kohana_Exception('cache.extension_not_loaded', 'memcached');

		$this->backend = new Memcached;
        $this->backend->setOption(Memcached::OPT_PREFIX_KEY, Kohana::config('cache_memcache.prefix'));
        
		$servers = Kohana::config('cache_memcached.servers');
/*
        $this->backend->addServers($servers)
            or Kohana::log('error', 'Cache: Connection failed');
*/
        foreach ($servers as $server)
        {
            // Make sure all required keys are set
            $server += array('host' => '127.0.0.1', 'port' => 11211, 'weight' => 100);

            // Add the server to the pool
            $this->backend->addServer($server['host'], $server['port'], $server['weight'])
                or Kohana::log('error', 'Cache: Connection failed: '.$server['host']);
        }
        
		// Load tags
		self::$tags = $this->backend->get(self::TAGS_KEY);

		if ( ! is_array(self::$tags))
		{
			// Create a new tags array
			self::$tags = array();

			// Tags have been created
			self::$tags_changed = TRUE;
		}
	}

	public function __destruct()
	{
		if (self::$tags_changed === TRUE)
		{
			// Save the tags
			$this->backend->set(self::TAGS_KEY, self::$tags, 0);
			// Tags are now unchanged
			self::$tags_changed = FALSE;
		}
	}

	public function find($tag)
	{
		if (isset(self::$tags[$tag]) AND $results = $this->backend->get(self::$tags[$tag]))
		{
				// Return all the found caches
				return $results;
		}
		else
		{
			// No matching tags
			return array();
		}
	}

	public function get($id)
	{
		return (($return = $this->backend->get($id)) === FALSE) ? NULL : $return;
	}

	public function set($id, $data, array $tags = NULL, $lifetime)
	{
		if ( ! empty($tags))
		{
			// Tags will be changed
			self::$tags_changed = TRUE;

			foreach ($tags as $tag)
			{
				// Add the id to each tag
				self::$tags[$tag][$id] = $id;
			}
		}

		if ($lifetime !== 0)
		{
			// Memcached driver expects unix timestamp
			$lifetime += time();
		}

		// Set a new value
		return $this->backend->set($id, $data, $lifetime);
	}

	public function delete($id, $tag = FALSE)
	{
		// Tags will be changed
		self::$tags_changed = TRUE;

		if ($id === TRUE)
		{
			if ($status = $this->backend->flush())
			{
				// Remove all tags, all items have been deleted
				self::$tags = array();

				// We must sleep after flushing, or overwriting will not work!
				// @see http://php.net/manual/en/function.memcached-flush.php#81420
				sleep(1);
			}

			return $status;
		}
		elseif ($tag === TRUE)
		{
			if (isset(self::$tags[$id]))
			{
				foreach (self::$tags[$id] as $_id)
				{
					// Delete each id in the tag
					$this->backend->delete($_id);
				}

				// Delete the tag
				unset(self::$tags[$id]);
			}

			return TRUE;
		}
		else
		{       
                    //tag delete
                    if(isset(self::$tags[$tag])){
                        foreach (self::$tags[$tag] as $item){
                            $this->backend->delete($item);
                            
                        }
                        unset(self::$tags[$tag]);                        
                    }
                    return true;

		}
	}

	public function delete_expired()
	{
		// Tags will be changed
		self::$tags_changed = TRUE;

		foreach (self::$tags as $tag => $_ids)
		{
			foreach ($_ids as $id)
			{
				if ( ! $this->backend->get($id))
				{
					// This id has disappeared, delete it from the tags
					unset(self::$tags[$tag][$id]);
				}
			}

			if (empty(self::$tags[$tag]))
			{
				// The tag no longer has any valid ids
				unset(self::$tags[$tag]);
			}
		}

		// Memcached handles garbage collection internally
		return TRUE;
	}

} // End Cache Memcached Driver
