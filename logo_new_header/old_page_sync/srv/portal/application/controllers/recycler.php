<?php

class Recycler_Controller extends Front_Controller {   

    public function show()
    {
        $this->use_main = FALSE;
        parent::show();
    }    
    
    public function __call($method, $arguments)
    {              
            self::index();
    }
    
    
}
