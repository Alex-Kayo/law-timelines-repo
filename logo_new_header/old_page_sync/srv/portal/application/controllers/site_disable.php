<?php
/**
 * 
 */
class Site_disable_Controller extends Controller {

	public function index()
	{
        Kohana::auto_load('Language');        
        $siteLang = Kohana::config('locale.language.0');		
		
		
		$resData = Database::instance()
			->select('l_site_disabled')
			->from('lang')
			->where('l_langnick', "'$siteLang'")->get()->current();
		

		if(!is_object($resData)){
			Kohana::show_404();
			
		}else {
			echo $resData->l_site_disabled;
			
		}
			
	}

}  

