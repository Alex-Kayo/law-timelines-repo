<?php
 
class Sources_Controller extends Template_Controller{
	public function __construct(){
		parent::__construct();

	}


	public function js(){
		header('Content-type: text/javascript');

		$arrLang = Language::getLangData();
		$path = Kohana::config('template.template_dir') . (substr($arrLang[$this->siteLang]['th_folder'],0,1) == '/' ? substr($arrLang[$this->siteLang]['th_folder'],1) : trim($arrLang[$this->siteLang]['th_folder']));
		$params = func_get_args();

		if(empty($params)){
			$file_content = '';

		}	else{
			$str = str_replace(' ', '' , implode('/', $params));
			$path .= 'scripts/' . $str;

			if(file_exists($path)){
				$file_content = file_get_contents($path);

			}	else{
				$file_content = '';

			}

			print $file_content;

		}

		die;

	}
	
	
	
	public function css(){
		header('Content-type: text/javascript');

		$arrLang = Language::getLangData();
		$path = Kohana::config('template.template_dir') . (substr($arrLang[$this->siteLang]['th_folder'],0,1) == '/' ? substr($arrLang[$this->siteLang]['th_folder'],1) : trim($arrLang[$this->siteLang]['th_folder']));
		$params = func_get_args();

		if(empty($params)){
			$file_content = '';

		}	else{
			$str = str_replace(' ', '' , implode('/', $params));
			$path .= 'scripts/' . $str;

			if(file_exists($path)){
				$file_content = file_get_contents($path);

			}	else{
				$file_content = '';

			}

			print $file_content;

		}

		die;

	}

}


?>