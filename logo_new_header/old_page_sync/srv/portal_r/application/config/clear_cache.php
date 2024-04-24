<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
Видалення кешу

description - назва кешу
action - опис дій
type - тип дії (function - функція, dir - директорія)
param - назва функції / директорії
 */
$config['clear_cfg'] = array
(

	array('description' => 'Системний кеш (Cache)',
		  'action'	=> array( 		  
		  					array('type' => 'function', 'param'	=> array(new Cache, 'delete_all'))
		  				)
	
	)
	
	,array('description' => 'Відкомпільовані шаблони',
		  'action'	=> array( 		  
		  					array('type' => 'dir', 'param'	=> APPPATH.'cache/smarty_cache'),
		  					array('type' => 'dir', 'param'	=> APPPATH.'cache/smarty_compile')
		  				)
	
	)	
	
	,array('description' => 'Ресурси: Новини',
		  'action'	=> array( 		  
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/news'),
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/news_prev')
		  				)
	
	)		
	
	,array('description' => 'Ресурси: Логотипи публікацій',
		  'action'	=> array( 		  
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/logos'),
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/logos_middle'),
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/logos_small')
		  				)
	
	)				
	
	
	,array('description' => 'Ресурси: Медіа-галерея',
		  'action'	=> array( 		  
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/gallery'),
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/gallery_prev')
		  				)
	
	)			
	
	,array('description' => 'Ресурси: Аудіо',
		  'action'	=> array( 		  
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/audio')
		  				)
	
	)	
	
	,array('description' => 'Ресурси: Відео',
		  'action'	=> array( 		  
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/video'),
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/video_prev')
		  				)
	
	)			
	
	,array('description' => 'Ресурси: Документи',
		  'action'	=> array( 		  
		  					array('type' => 'dir', 'param'	=> DOCROOT . 'uploads/documents')
		  				)
	
	)		
	

);
