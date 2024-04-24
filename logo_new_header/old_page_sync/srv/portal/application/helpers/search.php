<?php defined('SYSPATH') OR die('No direct access allowed.');

class search_Core {

   
    public static function strip($data){        
        if(is_array($data)){
            $result = array();            
            foreach ($data as $key => $item){
                $result[$key] = self::strip($item);                        

            } 
            return $result;
        }else{
            $data = preg_replace("/[^a-zA-ZА-Яа-я0-9\sёЁїЇєіІЄ\'\-\;\,.@?!*:\/_ ]/u","", $data);
            $data = str_replace("'", "''", $data);
            return $data;                            
        }        
        
    }


}

