<?php defined('SYSPATH') OR die('No direct access allowed.');

/**
 * Робота з ресурсами
 *
 */
class Resource_Controller extends Main_Controller {

    /**
     * Екзкмпляр класу Resource
     *
     * @var object
     */
    private $resource;

		
	
	public function __construct(){
        parent::__construct();

        $this->resource = new Resource;
		
    }

    public function __call($method, $arguments) {

        Kohana::auto_load('Resource');

    	if(count($arguments)<2){
            Event::run('system.404');
        }

    	$dirRes= '/'.$method.'/'.implode('/', (array_slice($arguments, 0, count($arguments)-2)));    	
    	$resID = $arguments[count($arguments)-2];

        $this->resource->base_cached($method, $dirRes, $resID);
    }

    
    

    public function im_cached(){  
        $arrArgument = $this->uri->argument_array();
		$path = Kohana::config('resource.im_root_dir') . '/' . implode('/', array_slice($arrArgument,0, -2));
		$path = (substr($path,-1) == '/' ? substr($path,0,-1) : $path);

    	$filename = implode('.', array_slice($arrArgument,-2));
        $this->resource->im_cached($path, $filename);
    	
    }


    public function all_unlock(){
    	
        $dir = APPPATH . 'cache/lock_file';
        echo '-START-';
        $listFiles = scandir($dir);
		print_r($listFiles);
		foreach ($listFiles as $file){
			if(is_file($dir . '/' . $file) && $file !== '..' && $file !== '.svn' && $file !=='.'){
				echo $dir . '/' . $file.'<br>';
                unlink($dir . '/' . $file);
				
            }
			
        }
        echo '-END-';

    	
    }

    
}

?>