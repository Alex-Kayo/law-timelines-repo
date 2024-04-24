<?php defined('SYSPATH') OR die('No direct access allowed.');

class resize_Core {

   
	public static function resize($src, $dst, $width, $height)
	{
        $thumb = new Image($src);
           
        if (($thumb->__get('height')/$thumb->__get('width')) < ($height/$width)) {
                $thumb->resize($width, $height, Image::HEIGHT);
            } else {
                $thumb->resize($width, $height, Image::WIDTH);
            }
            
            $thumb->crop($width, $height)
                  ->sharpen(15)
                  ->quality(85)
                  ->save($dst);
	}

    public static function resize_logo_small($src){
        self::resize($src, $src, Kohana::config('image.size_logo_small.width'), Kohana::config('image.size_logo_small.height'));
        
    }

    public static function resize_logo_middle($src){
        self::resize($src, $src, Kohana::config('image.size_logo_middle.width'), Kohana::config('image.size_logo_middle.height'));
        
    }
        
    public static function resize_logo_big($src){
        self::resize($src, $src, Kohana::config('image.size_logo_big.width'), Kohana::config('image.size_logo_big.height'));
        
    }    
}
