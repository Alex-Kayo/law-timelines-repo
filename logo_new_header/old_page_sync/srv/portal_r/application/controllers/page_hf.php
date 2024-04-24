<?php defined('SYSPATH') OR die('No direct access allowed.');

/**
 * Выгрузка хидера && футера
 *
 */
class Page_hf_Controller extends Front_Controller {

    /**
     * Формування хидера
     * 
     * $_GET
     * 	title - Заголовок сервісу
     *
     */
     public function __construct(){

        parent::__construct();

//mirs
   if  (in_array($this->input->ip_address(), Kohana::config('filter_ip.page_hf_deni' )))
    
            Kohana::show_404();
    
    }
    public function header_zp(){


        $this->view('page_hf/header_zp');
        $this->view->RequestorIp = $this->input->ip_address();
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->service_title = $this->input->get('title', '', true);
        $this->view->service_subtitle = $this->input->get('subtitle', 'Законопроект', true);
        $this->use_main = FALSE;
        $this->view->menu_active = $this->input->get('ma', '', true);
	
		
    }

    public function header_zp_f(){


        $this->view('page_hf/header_zp_f');
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->service_title = $this->input->get('title', '', true);
        $this->view->service_subtitle = $this->input->get('subtitle', 'Законопроект', true);
        $this->view->frame_title = $this->input->get('ftitle', $this->view->service_title, true);
        $this->view->frame_subtitle = $this->input->get('fsubtitle', '', true);
        $this->use_main = FALSE;
        $this->view->menu_active = $this->input->get('ma', '', true);
    
        
    }

    public function header_zp_f_ssi(){


        $this->view('page_hf/header_zp_f_ssi');
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->service_title = $this->input->get('title', '', true);
        $this->view->service_subtitle = $this->input->get('subtitle', '', true);
        $this->view->frame_title = $this->input->get('ftitle', $this->view->service_title, true);
        $this->view->frame_subtitle = $this->input->get('fsubtitle', '', true);
        $this->use_main = FALSE;
        $this->view->menu_active = $this->input->get('ma', '', true);
    
        
    }



       
       
        public function header_rada(){
        
        
        $this->view('page_hf/header_rada');
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->service_title = $this->input->get('title', '', true);
        $this->view->service_subtitle = $this->input->get('subtitle', 'Законотворчість', true);
        $this->use_main = FALSE;
        $this->view->menu_active = $this->input->get('ma', '', true);
    
        
    }

    public function header_rada_f(){


        $this->view('page_hf/header_rada_f');
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->service_title = $this->input->get('title', 'Хід пленарних засідань', true);
        $this->view->service_subtitle = $this->input->get('subtitle', 'Законотворчість', true);
        $this->view->frame_title = $this->input->get('ftitle', $this->view->service_title, true);
        $this->view->frame_subtitle = $this->input->get('fsubtitle', '', true);
        $this->use_main = FALSE;
        $this->view->menu_active = $this->input->get('ma', '', true);
    
    }


    public function header_zak(){

        
        $this->view('page_hf/header_zak');
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->service_title = $this->input->get('title', '', true);
        $this->view->service_subtitle = $this->input->get('subtitle', 'Законодавство', true);
        $this->use_main = FALSE;
        $this->view->menu_active = $this->input->get('intranet', FALSE, true);
    
        
    }

    public function header_zak_f(){


        $this->view('page_hf/header_zak_f');
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->service_title = $this->input->get('title', 'Законодавство України', true);
        $this->view->service_subtitle = $this->input->get('subtitle', 'Законодавство', true);
        $this->view->frame_title = $this->input->get('ftitle', $this->view->service_title, true);
        $this->view->frame_subtitle = $this->input->get('fsubtitle', '', true);
        $this->use_main = FALSE;
        $this->view->menu_active = $this->input->get('ma', '', true);
    
        
    }

    /**
     * Формування футера
     * 
     * $_GET
     * 	sitemap - URL "Карта сайту" (необов"язковий)
     * 	contact - URL "Контакти" (необов"язковий)	
     *  adress  - URL "Адреса" (необов"язковий)
     *
     */
    public function footer(){

        $this->view('page_hf/footer');
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->sitemap = $this->input->get('sitemap', false, true);
        $this->view->contact = $this->input->get('contact', false, true);
        $this->view->adress = $this->input->get('adress', false, true);
        $this->view->teams = $this->input->get('team', 'Інформаційне управління,<br>
                     Прес-служба Апарату Верховної Ради України', true);
        $this->use_main = FALSE;
    }

    public function footer_zak(){

        $this->view('page_hf/footer_zak');
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->sitemap = $this->input->get('sitemap', false, true);
        $this->view->contact = $this->input->get('contact', false, true);
        $this->view->adress = $this->input->get('adress', false, true);
        $this->view->teams = $this->input->get('team', 'Інформаційне управління,<br>
                     Прес-служба Апарату Верховної Ради України', true);
        $this->use_main = FALSE;
    }

    public function footer_zp_f(){

        $this->view('page_hf/footer_zp_f');
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->sitemap = $this->input->get('sitemap', false, true);
        $this->view->contact = $this->input->get('contact', false, true);
        $this->view->adress = $this->input->get('adress', false, true);
        $this->use_main = FALSE;
        
        
    }

    public function footer_rada_f(){

        $this->view('page_hf/footer_rada_f');
        $this->view->site_domain = url::base(Kohana::config('config.site_domain'));
        $this->view->sitemap = $this->input->get('sitemap', false, true);
        $this->view->contact = $this->input->get('contact', false, true);
        $this->view->adress = $this->input->get('adress', false, true);
        $this->use_main = FALSE;
        
        
    }

	
	
}
