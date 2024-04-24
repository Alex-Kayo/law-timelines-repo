<?php

defined('SYSPATH') OR die('No direct access allowed.');

abstract class Template_Controller extends Controller {
    
    
    
    private $date_pieces = array(0,0,0); // mirs новий сайт 19.09.2019

    /**
     * Заголовок сторінки
     *
     * @var unknown_type
     */
    public $site_title;

    /**
     * Метатегі
     *
     * @var array
     */
    public $meta = array();

    // Do not allow to run in production

    const ALLOW_PRODUCTION = FALSE;
    const LOGI_AND_UKR = 'ТА';
    const LOGI_OR_UKR = 'АБО';

    // Назва шаблону
    public $view;
    // Database
    public $db;

    /**
     * Головне меню
     *
     * @var array
     */
    public $menu = array();
    // Default to do auto-rendering
    public $auto_render = TRUE;
    public $use_main = TRUE;

    /**
     * Файл поточного шаблону
     *
     * @var object
     */
    public $template = 'index';

    /**
     * Об"єкт класу шаблонізатора
     *
     * @var object
     */
    public $smarty;

    /**
     * Об"єкт класу Cache
     *
     * @var object
     */
    public $cache;

    /**
     * Поточний вузол дерева
     *
     * @var object
     */
    public $current_node;

    /**
     * Поточний шлях в дереві категорій
     *
     * @var object
     */
    public $path_way;

    /**
     * Дерево категорій
     *
     * @var object
     */
    private $tree;

    /**
     * Базовий URL
     *
     * @var object
     */
    public $base_url;

    /**
     * ID поточноъ публікації
     *
     * @var object
     */
    public $item_id;

    /**
     * Мова сайту
     *
     * @var string
     */
    public $siteLang;

    public $str_search;
    

    /**
     *  Інф по поточній мові
     * @var array
     */
    protected $lang_data;

    /**
     * Поточний дочірній клас
     *
     * @var string
     */
    protected $class;

    /**
     * Спеціальні модулі
     *
     * @var string
     */
    private $modules = array(
        'news',
        'gallery',
        'documents',
        'audio',
        'video',
        'recycler',
      //  'rss',
      //  'fsview',
        'preview',
        'print',
        'memory'
    );
    protected $search_params = array();

    /**
     * Конструктор
     */
    public function __construct() {

////////// ЗАГЛУШКА НА ПОРТАЛ /////////
        //mirs розремити Kohana::show_404() для встановлення заглушки на портал
        // файл system/views/kohana_error_disabled.php замінити на system/views/kohana_error_disabled_rw.php
        // відповідно переіменувавши

      //  Kohana::show_404();

////////// !ЗАГЛУШКА НА ПОРТАЛ /////////
///
        parent::__construct();


        $this->class = get_class($this);
        $this->class = strtolower(substr($this->class, 0, strrpos($this->class, '_')));

        if (!is_object($this->db)) {
            // Load the default database
            if (isset($_GET["name"])){
            $user=htmlspecialchars($_GET["name"]);
//            var_dump($user); die();
            $this->db = Database::instance($user);
            }
            else $this->db = Database::instance('default');
        }

        if (!is_object($this->cache)) {
            $this->cache = Cache::instance();
        }

        // Load the template
        $this->view = new View;
        $this->smarty = new Template;

//!mirs  ---------Завантаження шаблонів з бази---------------------------          
        /*if (!Kohana::config('config.debug')) {

            Kohana::auto_load('Configsaver');
            $saver = new Configsaver;

            $saver->recreateFrontend();
        }*/
//----------------------------------------------
        // ініціалізація шаблонізатора
        foreach (Kohana::config('smarty') as $key => $option) {
            $this->smarty->{$key} = $option;
        }

        Kohana::auto_load('Language');
        $this->siteLang = Kohana::config('locale.language.0');
        $arrLang = Language::getLangData();
        $this->view->site_lang = $this->siteLang;
        $this->view->lang_selector = Language::getLangSelector();
        $this->lang_data = $arrLang[$this->siteLang];


        /*  Робота з шаблонами  * */
        if (!Kohana::config('config.debug')) {
            view_hash::check($this->siteLang);
        }


        $this->view->lang_prefix = Language::getPrefix();
        $this->smarty->template_dir = Kohana::config('smarty.template_dir') . trim($arrLang[$this->siteLang]['th_folder']);
        $this->view->template_dir = $this->smarty->template_dir;


        $this->site_title = $arrLang[$this->siteLang]['l_title'];
        $this->view->site_title = $this->site_title;
//        $this->view->site_title = $arrLang[$this->siteLang]['l_title'];
//        print_r($this->site_title.'ooo');
        $this->view->meta = array('description' => $arrLang[$this->siteLang]['l_description'],
            'keywords' => $arrLang[$this->siteLang]['l_keywords']);
        // mirs now date
        $lang = Kohana::lang('common');
        $this->view->nowday = date("d");
        $this->view->nowmonth = $lang['months'][date("m")];


        //mirs Блокування деяких пунктів меню/мапи сайта інше для зовнішніх користувачів           

        $this->view->items_hide = (in_array($this->input->ip_address(), Kohana::config('filter_ip.item_hide')));

        ////////////////////////////////////////////////////////////////

        $this->view->class = $this->class;


        // Пошук в модулях
        
        if ($this->input->get('date_point')) {
                $this->date_pieces = explode(".", $this->input->get('date_point')); // mirs новий сайт 19.09.2019
            }
//             var_dump($this->input->get('date_point'));        die();
//             var_dump($this->date_pieces);        die();
        
        $this->search_params = array(
            'search_topic_id' => intval($this->input->get('search_topic_id', 0, true)),
            'search_day' => intval($this->date_pieces[0]),
            'search_month' => intval($this->date_pieces[1]),
//            'search_month' => intval($this->input->get('search_month', 0, true)),
//            'search_year' => intval($this->input->get('search_year', 0, true)),
            'search_year' => intval($this->date_pieces[2]),
            'search_substr' => search::strip($this->input->get('search_substr', '', true)),
            'submit' => (boolean) $this->input->get('submit', false, true)
        );
        $show_request = array();
        if ($this->search_params['submit']) {
            foreach ($this->search_params as $key => $item) {
                $show_request[] = $key . '=' . urlencode($item);
            }
        }
        $this->view->show_request = implode('&', $show_request);
        $this->view->search_params = $this->search_params;


        // BLOCK_NAME
        $this->db
                ->select('distinct bi_nick')
                ->from('block_ips')
                ->where("'" . $this->input->ip_address() . "' LIKE replace(bi_ip, '*', '%')");

        foreach ($this->db->get()->result() as $item) {
            $this->smarty->assign($item->bi_nick, true);
        }

  //      var_dump($this->uri->segment(1));        die();
            
        if (in_array($this->uri->segment(1), $this->modules)) {
            // Якщо останній сегмент містить у собі .html
            if (strpos($this->uri->last_segment(), '.html')) {
                if (intval($this->input->post('admin_view', 0, true)) == 1) { //Перегляд публікації з адмінки
                    Event::add('system.post_controller', array($this, '_render'));
                    return;
                }

                $this->item_id = explode("_", str_replace('.html', '', $this->uri->last_segment()));
                $cache_id = 'item_' . $this->siteLang . '_' . ((int) $this->item_id[0]);
                $this->current_node = $this->cache->get($cache_id);


                if (!$this->current_node) {
                    $this->current_node = $this->db->select('*')
                                    ->from('topics')
                                    ->where("l_langnick", "'$this->siteLang'")
                                    ->where("t_id = (SELECT t_id FROM items WHERE i_id = " . (int) $this->item_id[0] . ")")
                                    ->where("t_status", 1)
                                    ->get()->current();

                    $this->cache->set($cache_id, $this->current_node, array('topics_tree', 'main_page'), 0);
                }
            } else {

                $seo_name = router::$current_uri;
                if ($this->uri->segment($this->uri->total_segments() - 1) == 'page') {

                    $seo_name = $this->uri->segment($this->uri->total_segments() - 2);
                    $path = $this->uri->segment_array();
                    array_pop($path);
                    array_pop($path);
                    $seo_name = implode($path, '/');
                }
                if ($this->uri->segment(1) == 'rss') {
                    $seo_name = $this->uri->segment(2);
                }

                $tree_paths = $this->cache->get('tree_paths_' . $this->siteLang);
                if (!$tree_paths) {
                    $query = $this->db->query("
                        select t_id, CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = p1.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories FROM topics p1
                        WHERE L_LANGNICK='$this->siteLang' and t_status=1
                        ");

                    foreach ($query as $t) {
                        $tree_paths[$t->t_id] = $t->i_categories;
                    }

                    $this->cache->set('tree_paths_' . $this->siteLang, $tree_paths, array('topics_tree', 'main_page'), 0);
                }

                $key = array_search($seo_name, $tree_paths);
                $key = $key ? $key : 0;


                // Поточний вузол дерева
                $cache_id = 'root_' . $key;
                $this->current_node = $this->cache->get($cache_id);
                if (!$this->current_node) {
                    $this->current_node = $this->db->select('*')
                                    ->from('topics')
                                    ->where("t_id = $key")
                                    ->get()->current();



                    $this->cache->set($cache_id, $this->current_node, array('topics_tree', 'main_page'), 0);
                }
            }

            if (!$this->current_node)
                kohana::show_404();


            // Шлях до вузла з корня
            $cache_id = 'root_path_' . $this->current_node->t_id;
            $this->path_way = $this->cache->get($cache_id);
            if (!is_array($this->path_way)) {
                $this->path_way = $this->db->select('*')
                                ->from("topics")
                                ->where("t_id <> " . $this->current_node->t_id)
                                ->where("t_left_key <= " . $this->current_node->t_left_key)
                                ->where("t_right_key >= " . $this->current_node->t_right_key)
                                ->where("t_status", 1)
                                ->where("l_langnick = ", "'$this->siteLang'")
                                ->orderby("t_left_key")
                                ->get()->as_array();

                $this->cache->set($cache_id, $this->path_way, array('topics_tree', 'main_page'), 0);
            }

            $path = array();
            $this->view->base_url = $this->view->lang_prefix . "/";

            foreach ($this->path_way as $key => $node) {
                $path[] = $node->t_seo_name;
                $this->path_way[$key]->t_parents = implode('/', $path);
                $this->view->base_url .= $node->t_seo_name . "/";
            }

            $this->view->path_way = $this->path_way;

            $this->view->base_url .= $this->current_node->t_seo_name . "/";
        } else {
            $seo_name = $this->uri->segment(1);
            $this->current_node = (object) array(
                        't_id' => 0,
                        't_seo_name' => ''
            );
        }

        $this->view->current_node = $this->current_node;

        // Усе дерево       
        $this->tree = $this->cache->get('tree_' . $this->siteLang);
        if (!$this->tree) {

            $this->tree = $this->db->query("SELECT daddy.*,
                            (SELECT COUNT(*)
                                FROM topics
                                WHERE t_parent_id = daddy.t_id
                                AND l_langnick = '$this->siteLang'
                                ) AS t_childs
                        FROM topics daddy
                        WHERE t_seo_name <> 'recycler'
                        AND l_langnick = '$this->siteLang'
                        and t_status=1
                        ORDER BY t_left_key");

            $this->cache->set('tree_' . $this->siteLang, $this->tree, array('topics_tree', 'main_page'), 0);
        }


        if ($this->auto_render == TRUE) {
            // Render the template immediately after the controller method
            Event::add('system.post_controller', array($this, '_render'));
        }
    }

    /**
     * Завантаження шаблону, який буде використовуватись
     * 
     * @param string $name - назва шаблону
     * 
     */
    public function view($name) {
        $this->template = $name;
        $this->view->set_filename($name, Kohana::config('smarty.templates_ext'));
    }

    /**
     * Выдображення завантаженого шаблону
     */
    public function _render() {
        if ($this->auto_render == TRUE) {
            // Render the template when the class is destroyed
            $this->view->render(TRUE);
        }
    }

    /**
     * Відображення мапи сайту
     */
    public function _render_sitemap() {
        return View::factory('menu/sitemap', array('menu' => $this->menu))->render();
    }

    /**
     * Виклик неіснуючого методу
     * 
     * @param string $method - метод
     * @param array $arguments - аргументи методу
     */
    public function __call($method, $arguments) {
        // Disable auto-rendering
        $this->auto_render = FALSE;

        // By defining a __call method, all pages routed to this controller
        // that result in 404 errors will be handled by this method, instead of
        // being displayed as "Page Not Found" errors.
        kohana::show_404();
    }

    /**
     * Завантаження змінних у шаблон
     * 
     * @param string $template - шаблон
     * @param array $vars - змінні
     */
    public function _kohana_load_view($template, $vars) {
        if ($template == '')
            return;

        if (substr(strrchr($template, '.'), 1) === Kohana::config('smarty.templates_ext')) {
            // Assign variables to the template
            if (is_array($vars) AND count($vars) > 0) {
                foreach ($vars AS $key => $val) {
                    $this->smarty->assign_by_ref($key, $vars[$key]);
                }
            }

            $template_path = explode('/', $this->template);

            $this->smarty->assign('i18n', Kohana::lang($template_path[0]));
            $this->smarty->assign('template', $this->template . ".tpl");

            $arrLang = Language::getLangData();
            $thFolder = substr($arrLang[$this->siteLang]['th_folder'], 0, 1) == '/' ? substr($arrLang[$this->siteLang]['th_folder'], 1) : trim($arrLang[$this->siteLang]['th_folder']);
            if ($thFolder[0] != '/')
                $thFolder = '/' . $thFolder;

            $this->smarty->assign('th_folder', $thFolder);
            if ($this->use_main) {
                $output = $this->smarty->fetch('main_page/main.tpl');
            } else {
                $output = $this->smarty->fetch($this->template . ".tpl");
            }
        } else {
            $output = parent::_kohana_load_view($template, $vars);
        }

        return $output;
    }

    /**
     * Повертає дерево категорій вибранного типу
     * 
     * @param - string $docType - тип документу (news, gallery, ...)
     */
    protected function getCategories($docType) {

        $rootNode = $this->db->select('*')
                        ->from("topics")
                        ->where("t_seo_name", "'$docType'")
                        ->where("t_status", 1)
                        ->where("l_langnick = ", "'$this->siteLang'")
                        ->get()->current();

        $result = array();
        if (is_object($rootNode)) {
            $res = $this->db->select('*')
                    ->from("topics")
                    ->where("t_id <> " . $rootNode->t_id)
                    ->where("t_left_key >= " . $rootNode->t_left_key)
                    ->where("t_right_key <= " . $rootNode->t_right_key)
                    ->where("t_status", 1)
                    ->where("l_langnick = ", "'$this->siteLang'")
                    ->orderby("t_left_key");
            foreach ($this->db->get()->result(false) as $row) {
                $result[] = $row;
            }
        }

        return $result;
    }

    /**
     * Інформація по вибранній публікації
     *
     * @param integer - Ідентифікатор публікації
     * @param bool - $flagPreview - признак анонсу
     * @return Object
     */
    protected function getItem($item_id) {

        // mirs Перевірка на наявність пошукового запиту для підсвітки результату пошуку
        // 
        $this->str_search ? $ifull = "mark_find_text( if.if_id, '{$this->str_search}', 'items_fulltext_3')": $ifull = 'if.i_full';
//        $this->str_search ? $ifull = 'mark_find_text( if.if_id, ''&search'', ''items_fulltext_3'') as i_full' : $ifull = 'if.i_full';
            
        $result = $this->db->query("
            SELECT i.i_id,
                   i.i_name,
                   i.i_type,
                   i.i_anons,
                   i.i_author,
                   i.i_link,
                   i.i_logoname,
                   i.comment_type,
				   TO_CHAR(i.i_date_create, 'DD.MM.YYYY') AS i_date,                                       
                   CASE WHEN i.i_logoname IS NULL THEN 1 ELSE 0 END AS logo_null,
                   m.m_name as month, m.m_number as mon, to_char(i_date_create,'dd') as day,  to_char(i_date_create,'yyyy') as year,   to_char(i_date_create,'hh24') as hour,   to_char(i_date_create,'mi') as minute,
                   CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics p START WITH i.t_id = p.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories,
                   Image_Enlarge({$ifull}) as i_full,
                   TO_CHAR(i.i_date_create, 'YYYY-MM-DD HH24:MI:SS') AS full_datetime,
                   TO_CHAR(i.i_date_create, 'YYYY-MM-DD') AS full_date,
                  (SELECT count(1) FROM items_attachments ia WHERE ia.i_id=i.i_id) as cnt_foto
                  
            FROM items i
            INNER JOIN months m ON to_number(to_char(i.i_date_create,'mm')) = m.m_number AND m.l_langnick = '$this->siteLang'
            INNER JOIN topics t on i.t_id=t.t_id and t.t_seo_name!='recycler'
            LEFT JOIN items_full if ON i.i_id = if.i_id            
            WHERE i.i_id = $item_id
            AND i.i_status = 1
            AND (
    			i.i_ip IS NULL OR
    			NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%')) 
    			)
    	   ")->current();

        if (is_object($result)) {

            $seo_name = explode('/', strtolower($result->i_categories));


            // if( ($seo_name[0] === 'preview' && strtotime($result->full_datetime) < time()) ||
            //     ($seo_name[0] !== 'preview' && strtotime($result->full_datetime) > time())	        
            // ){
            //mirs показувати зміст анонсів
            if (($seo_name[0] !== 'preview' && strtotime($result->full_datetime) > time())
            ) {
                return false;
            }

            return $result;
        } else {
            return false;
        }
    }

    /**
     * Інформація по вибранній публікації
     *
     * @param integer - Ідентифікатор публікації
     * @return Array
     */
    protected function getItemAttachments($item_id) {
        $this->db->select('ia_id', 'ia_name', 'ia_type', 'ia_description', 'ia_size')
                ->from('items_attachments')
                ->where('i_id', $item_id)
                ->orderby(array('ia_date_create' => 'desc', 'ia_id' => 'desc')); //mirs для виводу атачментів сотованих по часу завантаження на сервер          	    

        if ($this->search_params['search_month'] > 0) {
            $this->db->where("to_char(ia_date_create,'mm') = '" . str_pad($this->search_params['search_month'], 2, '0', STR_PAD_LEFT) . "'");
        }
        if ($this->search_params['search_year'] > 0) {
            $this->db->where("to_char(ia_date_create,'yyyy') = '" . str_pad($this->search_params['search_year'], 4, '0', STR_PAD_LEFT) . "'");
        }
        if (strlen($this->search_params['search_substr']) > 0) {
            $this->db->where(" (CONTAINS(ia_name,'" . $this->search_params['search_substr'] . "',1)>0 or CONTAINS(IA_DESCRIPTION,'" . $this->search_params['search_substr'] . "',2)>0) ");
        }

        $result = array();
        foreach ($this->db->get()->result(false) as $row) {
            $result[md5($row['ia_name'])][] = (object) $row;
        }
        return $result;
    }

    protected   function ukrSearchQuery($sq){

                $sq = str_replace(array('*','ТА','АБО','-'), array('%',' AND ',' OR ','\\-'), $sq); 
//                $sq = str_replace(array(), array(), $sq); // AND
//                $sq = str_replace(array(), array(), $sq); //mirs OR
//                $sq = str_replace(array(), array(), $sq); //mirs OR
                
                return $sq;
}

}
