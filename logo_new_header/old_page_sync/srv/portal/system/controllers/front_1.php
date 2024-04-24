<?php

class Front_Controller extends Template_Controller {

    /**
     * Кількість топ новин 
     *
     * @var number
     */
    private $top_news = 3;

    /**
     * Кількість новин з логотипом
     *
     * @var number
     */
    private $logo_news = 8;

    /**
     * Кількість  новин з без логотипу
     *
     * @var number
     */
    private $nologo_news = 3;

    /**
     * Кількість медіа-галереї
     *
     * @var number
     */
    private $gallery = 2;

    /**
     * Кількість публікацій у вікні відсутніх депутатів
     *
     * @var number
     */
    private $abs_nd = 5;
    /*
     * Мітка пленарного тижня
     */
        protected $is_plenar = NULL;
        
        /*
         * мітка сабсайту новин
         */
        protected $is_news_subsite = FALSE;

    /**
     * Список модулів, які мають свій шаблон для списку
     *
     * @var array
     */
    private $otherList = array('video',
        'news',
        'audio',
        'fsview',
        'preview'
    );

    /**
     * Умова для перегляду публікацій за діапазон часу
     *
     * @var string
     */
    private $betweenDateConditions = '';

    /**
     * Час життя кешу блоків головної сторінки
     *
     * @var integer
     */
    private $cache_main_page_life = 3600;

    /**
     * Контструктор
     */
    public function __construct() {
        parent::__construct();

        if(in_array($this->current_node->t_seo_name, Kohana::config('news_site_seos.seos_list'))) 
                $this->is_news_subsite = TRUE;
        
//   var_dump($this->is_news_subsite);    die();
//    var_dump(Kohana::config('news_site_seos'));    die();
//    var_dump($this->current_node->t_seo_name);    die();
    
        $mainPageCount = Kohana::config("main_page_count." . trim($this->lang_data['th_folder']));
        if ($mainPageCount) {
            $this->top_news = $mainPageCount['top_news'];
            $this->logo_news = $mainPageCount['logo_news'];
            $this->nologo_news = $mainPageCount['nologo_news'];
            $this->gallery = $mainPageCount['gallery'];
        }


        $this->view->front = TRUE;
        if (isset($this->item_id[1]) and ( $this->item_id[1] == 'print')) {
            $this->use_main = FALSE;
        }

        //mirs Блокування деяких пунктів меню для зовнішніх користувачів          
        // перенесено до templete.php 20121121
        ////////////////////////////////////////////////////////////////
        //Визначення діапазону дат виборки
        $dateBetween = $this->getDateBetween();
        if ($dateBetween) {
            $this->betweenDateConditions = " AND i.i_date_create BETWEEN  to_date('" . $dateBetween['date_start'] . " 00:00', 'dd.mm.yyyy hh24:mi') AND  to_date('" . $dateBetween['date_end'] . " 23:59', 'dd.mm.yyyy hh24:mi') ";
        }


        //Топ новини
        $this->view->top_news = $this->getTopNewsData();


        //Новини з логотипом
        $this->view->logo_news = $this->getLogoNewsData();


        //Новини без логотипа	
        $this->view->nologo_news = $this->getWithoutLogoNewsData();

        //Вс новини
        $this->view->all_news = $this->getAllNewsData();

        //Медіа-галерея
        $this->view->gallery = $this->getGallery();
        
        //Відео-галерея
        $this->view->video = $this->getMediaData('video');


// mirs перевірка чи є в це день пленарка
// поветртає тип пленарного дня
// 1	Пленарні засідання
// 4	Пленарне засідання + робота у комітетах
// 5	Година запитань до Уряду
// 6	Погоджувальна рада
// 7	Погоджувальна рада + пленарне засідання

//        
//                        
//var_dump(Kohana::config('tv_filter.day_id')); die('');
        
        $ipl = $this->db->query(
                  "select mdt.md_type as is_plenar from MEETING_DAY_TYPE mdt
                  inner join MEETING_DAY md on mdt.md_type = md.md_type
                    where  to_char(md.md_date) = to_char(sysdate)
                    and mdt.md_type in (".Kohana::config('plenar_day_type.plenday_id').")"
                )->current(); 
        if (isset($ipl)) {
            
            $this->is_plenar = $ipl->is_plenar;
        }
                             
        $this->view->is_plenar = $this->is_plenar;
 //       die(var_dump($ipl));
 // показувати завжди       
//        $this->view->is_plenar = 1;
                
                
    }

    /**
     * Головний блок / список сторінок
     */
    public function index() {
         
    //    var_dump($this->current_node->t_seo_name);        die();
        
        if ($this->class == 'main_page') {

            //Формування інформаційного блоку головної сторінки
            $this->view("main_page/main_content");
            $this->mainPageBlockBuilder();

            $this->view->video = $this->getMediaData('video');
            $this->view->audio = $this->getMediaData('audio');
        } else {


            if (intval($this->current_node->t_status) == 0) {
                Kohana::show_404();
            }



            if (in_array($this->class, $this->otherList)) {
                $this->view($this->class . "/list");
            } else {
                $this->view("main_page/list");
            }

            $this->view->categories = $this->getCategories($this->class);
            $this->view->site_title = strip_tags($this->current_node->t_name) . ' - ' . $this->site_title; //mirs Вивід категорії у заголовок сайту
            $this->view->is_news_subsite = $this->is_news_subsite; //mirs Вивід мітки новинного сабсійту у шаблон


            $pagination = new Pagination(array(
                'base_url' => $this->view->base_url,
                'lang_prefix' => $this->view->lang_prefix,
                'uri_segment' => 'page',
                'items_per_page' => Kohana::config('posts.count_' . $this->class),
                'style' => 'digg',
                'auto_hide' => TRUE,
            ));
                
           
            
            if ($this->current_node->t_id and $this->current_node->t_seo_name != $this->class) {
                $post_result = $this->getItemsSelTopics($this->class, intval($this->current_node->t_id), intval($pagination->sql_limit), intval($pagination->sql_offset));
            } else {
                $post_result = $this->getItemsSelClass($this->class, intval($pagination->sql_limit), intval($pagination->sql_offset));
                //print_r($post_result);die;
            }

            $pagination->set_total_items($post_result['total_count']);
            $this->view->posts = $post_result['items'];
            $this->view->pagination = $pagination;
        }
    }

    /**
     * Відображення публікації
     */
    public function show() {
        
        $arrPostVars = $this->input->post();
        //mirs перевіряє чи ппергляд публікації є результатом пошуку
        isset($arrPostVars['search'])? $this->str_search = $this->ukrSearchQuery($arrPostVars['search']): $this->str_search = '';
        
        $this->view->i_id = intval($this->item_id[0]);
        $this->view->item = $this->getItem($this->view->i_id);
        $this->view->site_title = strip_tags($this->current_node->t_name . ' - ' . $this->view->item->i_name) . ' - ' . $this->site_title; //mirs Вивід інфо у заголовок сайту
        //   $this->view->site_title =  $this->site_title;

        if (!$this->view->item) {
            Kohana::show_404();
        }


        //mirs для повносторінкового виводу                  
        if ($this->view->item->i_type == $this->class) {
            $this->view($this->view->item->i_type . '/show');
        } else {
            $this->view($this->class . '/show');
        }
        //////////////////////////////////////////////////////       



        $attachments = $this->getItemAttachments($this->view->i_id);
        if (isset($this->item_id[1])) {
            $ia_id = (int) $this->item_id[1];
        } elseif (count($attachments) > 0) {
            reset($attachments);
            $val = array_shift(array_values($attachments));
            $ia_id = $val[0]->ia_id;
        } else {
            $ia_id = 0;
        }
        $this->view->ia_id = $ia_id;
        $this->view->attachments = $attachments;
        $this->view->attachments_json = json_encode($attachments);
    }

    /**
     * Формування виборки
     *
     * @param  string $itemsType - тип публыкації
     * @param  string $arrKeys - left, right keys
     * @param  string $langNick - нік мови
     * @param  integer $countRows - кількість рядків виборки
     * @param  mixed $where - додаткова умова виборки
     * @param  mixed $addFunction - додатокові функуції обробки виборки
     * @return Database
     */
    private function makeMainFind($itemsType, $arrKeys, $langNick, $countRows, $where = NULL, $addFunction = null) {
        $itemsType = strtolower($itemsType);

        $addWhere = '';
        if (!is_null($where)) {

            if (is_array($where)) {
                $addWhere = implode(' AND ', $where);
            } else {
                $addWhere = $where;
            }
        }

        $addFunctionStr = '';
        if (!is_null($addFunction)) {

            if (is_array($addFunction)) {
                $addFunctionStr = implode(', ', $addFunction);
            } else {
                $addFunctionStr = $addFunction;
            }
        }


        $sqlStr = "
    		SELECT * FROM (SELECT i_all.*,
    			m.m_name as month, to_char(i_date_create,'dd') as day,  to_char(i_date_create,'yyyy') as year,
                to_char(i_date_create,'hh24:mi') as hour,    		
    			CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = i_all.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories  
    			" . (strlen($addFunctionStr) > 0 ? ', ' . $addFunctionStr : '') . "    		
    		FROM
    		(SELECT i.t_id, i_id, i_date_create, i_name, i_anons, i_logoname, i_link, i_author 
    		FROM items i
    		INNER JOIN (select distinct t.t_id
    					from topics t
			        	where t.t_status = 1 AND t.t_left_key >= " . $arrKeys[0] . " and t.t_right_key <= " . $arrKeys[1] . ") t ON i.t_id = t.t_id
    		WHERE i.i_type='$itemsType'
    		AND l_langnick = '$langNick'
    		AND i.i_status = 1
    		" . (strlen($addWhere) > 0 && $itemsType !== 'preview' ? ' AND ' . $addWhere : '') . "
    		AND (
    			i.i_ip IS NULL OR
    			NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%')) 
    			)
                        " . //mirs додавання часу для пергляду анонсів 1ця-день
                "AND i_date_create " . ($itemsType === 'preview' ? '> (-0.042) +' : '<=') . " sysdate				
    		) i_all
    			INNER JOIN months m ON to_number(to_char(i_all.i_date_create,'mm'))=m.m_number AND l_langnick = '$langNick'
    		ORDER BY i_date_create " . ($itemsType === 'preview' ? 'ASC' : 'DESC') . ")

        WHERE rownum<=$countRows";

//if ($itemsType === 'preview'){print_r($sqlStr);die();}

        return $this->db->query($sqlStr);
    }

    /**
     * Визначення діапазону дат виборки
     *
     * return mixed array('date_start' => 'dd.mm.yyyy', 'date_end' => 'dd.mm.yyyy') || false
     */
    private function getDateBetween() {
        $baseURL = $this->view->lang_prefix . "/" . $this->class;
        $strURI = $this->uri->string();

        $dateStart = $dateEnd = '';
        if (preg_match('/^main_page\/([0-9]{4})\/([0-9]{2})\/([0-9]{2})/', $strURI, $matches)) {
            $baseURL .= '/' . $matches[1] . "/" . $matches[2] . "/" . $matches[3];

            //  "РРРР/ММ/ДД"
            $dateStart = $matches[3] . "." . $matches[2] . "." . $matches[1];
            $dateEnd = $dateStart;
        } elseif (preg_match('/^main_page\/([0-9]{4})\/([0-9]{2})/', $strURI, $matches)) {
            $baseURL .= '/' . $matches[1] . "/" . $matches[2];

            //  "РРРР/ММ"
            $dateStart = "01." . $matches[2] . "." . $matches[1];
            $dateEnd = date::getLastMonthDay($matches[1], $matches[2]) . "." . $matches[2] . "." . $matches[1];
        } elseif (preg_match('/^main_page\/([0-9]{4})/', $strURI, $matches)) {
            $baseURL .= '/' . $matches[1];

            //  "РРРР"
            $dateStart = "01.01." . $matches[1];
            $dateEnd = "31.12." . $matches[1];
        }

        if (strlen($dateStart) > 0 && strlen($dateEnd) > 0) {
            return array('date_start' => $dateStart, 'date_end' => $dateEnd);
        } else {
            return false;
        }
    }

    /**
     * Настройки сайту відносно мови
     *
     */
    protected function getLangConfig() {
        $result = $this->db->from('lang')
                        ->where('l_langnick', "'" . $this->siteLang . "'")->get()->current();
        if (is_object($result)) {
            return $result;
        } else {
            return false;
        }
    }

    /**
     * Повертає данні категорії по ідентифікатору або СЕО
     *
     * @param mixed $uniqParam (string | integer)
     */
    public function getTopic($uniqParam) {
//    protected function getTopic($uniqParam){
        $this->db->select("topics.*, CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics p START WITH p.t_id = topics.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories")
                ->from('topics');

        if (is_numeric($uniqParam)) {
            $this->db->where('t_id', intval($uniqParam));
        } else {
            $this->db->where('t_seo_name', "'$uniqParam'")
                    ->where('t_level', 1)
                    ->where('l_langnick', "'" . $this->siteLang . "'");
        }
        $res = $this->db->get()->current();
        if (is_object($res)) {
            //  print_r($this->db); die();
            return $res;
        } else {
            return false;
        }
    }
    public function getTopicLRKey($seo_name) {
     
     $res =  $this->db->query("select t_left_key, t_right_key, SYS_CONNECT_BY_PATH(t.t_seo_name, '/') LINK  from topics t
         WHERE t.t_status = 1
         --and t.t_level = 1
         START WITH t.t_seo_name = '{$seo_name}'
            AND t.l_langnick = '{$this->siteLang}'
        CONNECT BY PRIOR t_id = t_parent_id
        ORDER BY t.t_left_key"
             );
     
        if (is_object($res)) {
           // var_dump($res); die();
            return $res->current();
//            return $res[0];
            }
      }

    public function getTopicID($TSeoName) {
//    protected function getTopic($uniqParam){
        $this->db->select('t_id')
                ->from('topics');
        $this->db->where('t_seo_name', "'$TSeoName'");
        $res = $this->db->get()->current();
        if ($res) {
            // print_r($res->t_id); die();
            return $res->t_id;
        } else {
            //    print_r($res); die();
            return false;
        }
    }

    /**
     * Повертає данні для формування топ-новин
     *
     */
    private function getTopNewsData() {
        $result = false;
        $cacheID = "main_page_top_news" . $this->siteLang . md5($this->betweenDateConditions);
        if (!$result = $this->cache->get($cacheID)) {
            if ($langConfig = $this->getLangConfig()) {
                if ($rootNode = $this->getTopic(intval($langConfig->l_top_news_topic))) {
                    $result = $this->makeMainFind('news', array($rootNode->t_left_key, $rootNode->t_right_key), $this->siteLang, $this->top_news, 'i.t_id IN (select t_id from topics WHERE T_RSSLIST IS NULL)' . $this->betweenDateConditions);

                    if (empty($this->betweenDateConditions)) { //некешуємо архівні данні
                        $this->cache->set($cacheID, $result, array('main_page'), $this->cache_main_page_life);
                    }
                }
            }
        }
        return $result;
    }

    /**
     * Повертає данні для формування новин з логотипом
     *
     */
    private function getMediaData($type) {
        $result = false;
        $cacheID = "main_page_media{$type}_" . $this->siteLang . md5($this->betweenDateConditions);
        if (!$result = $this->cache->get($cacheID)) {
            if ($langConfig = $this->getLangConfig()) {
                if ($rootNode = $this->getTopic($type)) {
                    $result = $this->makeMainFind($type, array($rootNode->t_left_key, $rootNode->t_right_key), $this->siteLang, $this->gallery, $this->betweenDateConditions);

                    if (empty($this->betweenDateConditions)) { //некешуємо архівні данні
                        $this->cache->set($cacheID, $result, array('main_page'), $this->cache_main_page_life);
                    }
                }
            }
        }
        return $result;
    }

    /**
     * Повертає данні для формування новин з (логотипом + без логотипу)
     *
     */
    private function getAllNewsData() {
        $result = false;
        $cacheID = "main_page_all_news" . $this->siteLang . md5($this->betweenDateConditions);
        if (!$result = $this->cache->get($cacheID)) {
            if ($langConfig = $this->getLangConfig()) {
                if ($rootNode = $this->getTopic('news')) {
                    $result = $this->makeMainFind('news', array($rootNode->t_left_key, $rootNode->t_right_key), $this->siteLang, $this->logo_news, 'i.t_id IN (select t_id from topics WHERE T_RSSLIST IS NULL) AND i.t_id !=' . $langConfig->l_top_news_topic . ' ' . $this->betweenDateConditions);

                    if (empty($this->betweenDateConditions)) { //некешуємо архівні данні
                        $this->cache->set($cacheID, $result, array('main_page'), $this->cache_main_page_life);
                    }
                }
            }
        }
        return $result;
    }

    /**
     * Повертає данні для формування новин з логотипом
     *
     */
    private function getLogoNewsData() {
        $result = false;
        $cacheID = "main_page_logo_news" . $this->siteLang . md5($this->betweenDateConditions);
        if (!$result = $this->cache->get($cacheID)) {
            if ($langConfig = $this->getLangConfig()) {
                if ($rootNode = $this->getTopic('news')) {
                    $result = $this->makeMainFind('news', array($rootNode->t_left_key, $rootNode->t_right_key), $this->siteLang, $this->logo_news, 'i.i_logoname IS NOT NULL AND i.t_id IN (select t_id from topics WHERE T_RSSLIST IS NULL)' . $this->betweenDateConditions); //mirs
//                    $result = $this->makeMainFind('news',array($rootNode->t_left_key, $rootNode->t_right_key), $this->siteLang, $this->logo_news, 'i.i_logoname IS NOT NULL AND i.t_id IN (select t_id from topics WHERE T_RSSLIST IS NULL) AND i.t_id !=' .$langConfig->l_top_news_topic . ' '.$this->betweenDateConditions);

                    if (empty($this->betweenDateConditions)) { //некешуємо архівні данні
                        $this->cache->set($cacheID, $result, array('main_page'), $this->cache_main_page_life);
                    }
                }
            }
        }
        return $result;
    }

    /**
     * Повертає данні для формування новин з без логотипу
     *
     */
    private function getWithoutLogoNewsData() {
        $result = false;
        $cacheID = "main_page_withoutlogo_news" . $this->siteLang . md5($this->betweenDateConditions);
        if (!$result = $this->cache->get($cacheID)) {
            if ($langConfig = $this->getLangConfig()) {
                if ($rootNode = $this->getTopic('news')) {
                    $result = $this->makeMainFind('news', array($rootNode->t_left_key, $rootNode->t_right_key), $this->siteLang, $this->nologo_news, 'i.i_logoname IS NULL AND i.t_id IN (select t_id from topics WHERE T_RSSLIST IS NULL) AND i.t_id !=' . $langConfig->l_top_news_topic . ' ' . $this->betweenDateConditions);

                    if (empty($this->betweenDateConditions)) { //некешуємо архівні данні
                        $this->cache->set($cacheID, $result, array('main_page'), $this->cache_main_page_life);
                    }
                }
            }
        }
        return $result;
    }

    private function getGallery() {
        $result = false;
        $cacheID = "gallery" . $this->siteLang . md5($this->betweenDateConditions);
        if (!$result = $this->cache->get($cacheID)) {
            if ($rootNode = $this->getTopic('gallery')) {
                $result = $this->makeMainFind('gallery', array($rootNode->t_left_key, $rootNode->t_right_key), $this->siteLang, $this->gallery, 'i.t_id IN (select t_id from topics WHERE T_RSSLIST IS NULL) AND i_id IN (select distinct i_id from items_attachments)', array('MAIN_PAGE.GET_RANDOM_ATTACH(i_all.i_id) as file_name', 'MAIN_PAGE.GET_COUNT_ATTACH(i_all.i_id) as count_attach'));

                if (empty($this->betweenDateConditions)) { //некешуємо архівні данні
                    $this->cache->set($cacheID, $result, array('main_page'), $this->cache_main_page_life);
                }
            }
        }
        
   //     var_dump($result); die();
        return $result;
    }

    /**
     * Формування блоків(права панель) для головної сторінки
     *
     */
    public function mainPageBlockBuilder() {
        if ($this->view->panel_config = $this->getLangConfig()) {
            //print_r($this->view->panel_config);die;

            $cacheID = 'main_page_block' . $this->siteLang . md5($this->betweenDateConditions);
            if (!$block_data = $this->cache->get($cacheID)) {
                $block_data = array();
                for ($block_index = 1; $block_index <= 18; $block_index++) {
                    $fieldStatus = "l_block{$block_index}_status";
                    $fieldTopicID = "l_block{$block_index}_topic";
                    $fieldCount = "l_block{$block_index}_count";
                    if (intval($this->view->panel_config->$fieldStatus) == 1) {
                        if ($block_data[(string) $block_index]['topic'] = $this->getTopic($this->view->panel_config->$fieldTopicID)) {
                            $items_seo = explode("/", $block_data[(string) $block_index]['topic']->i_categories);
                            $block_data[(string) $block_index]['items'] = $this->makeMainFind($items_seo[0], array($block_data[(string) $block_index]['topic']->t_left_key, $block_data[(string) $block_index]['topic']->t_right_key), $this->siteLang, intval($this->view->panel_config->$fieldCount), $this->betweenDateConditions);
                        }
                    }
                }
                // mirs --- Формування Оголошень
                $notice_id = 1101;
                if ($block_data['notice']['topic'] = $this->getTopic($notice_id)) {

                    $items_seo = explode("/", $block_data['notice']['topic']->i_categories);
                    $block_data['notice']['items'] = $this->makeMainFind($items_seo[0], array($block_data['notice']['topic']->t_left_key, $block_data['notice']['topic']->t_right_key), $this->siteLang, 4, $this->betweenDateConditions);
                }
                //--------------------------------------    
                // mirs --- Формування списку відсутніх НД
                $absnd_id = 1148;
                if ($block_data['absnd']['topic'] = $this->getTopic($absnd_id)) {

                    $items_seo = explode("/", $block_data['absnd']['topic']->i_categories);
                    $block_data['absnd']['items'] = $this->makeMainFind($items_seo[0], array($block_data['absnd']['topic']->t_left_key, $block_data['absnd']['topic']->t_right_key), $this->siteLang, $this->abs_nd, $this->betweenDateConditions);
                }
                //--------------------------------------    

                $this->cache->set($cacheID, $block_data, array('main_page'), $this->cache_main_page_life);
            }
        }

        //print_r($block_data);die;

        $this->view->block_data = $block_data;
    }

    /**
     * Повертає публікації вибранної категорії
     *
     * @param string $className - Тип публікації
     * @param integer $topic_id - Ідентифікатор категорії
     * @param integer $limit - Макимальна кількість вибранных публікацій
     * @param integer $offset - Індекс публікації, з якої виводити
     * @return array('items' => array(), 'total_count' => integer)
     */
    protected function getItemsSelTopics($className, $topic_id, $limit, $offset) {
        $className = strtolower($className);
        $result = array();

        $this->db->select("i_id,
                    i_name,
                    i_anons,
                    i_author,
                    REGEXP_REPLACE(i_link, 'ns_golos', 'ns_golos_23') as i_link,
                    i_logoname,
                    TO_CHAR(i_date_create, 'DD.MM.YYYY') AS i_date,
                    m.m_name as month, to_char(i_date_create,'dd') as day,  to_char(i_date_create,'yyyy') as year, to_char(i_date_create,'hh24') as hour, to_char(i_date_create,'mi') as minute,
					case when floor(sysdate-i.i_date_create)<=" . Kohana::config('posts.count_day_new') . " then 1 else null end as flag_new,
                    CASE WHEN i_logoname IS NULL THEN 1 ELSE 0 END AS logo_null,
                    '" . substr($this->view->base_url, 1, strlen($this->view->base_url) - 2) . "' AS i_categories")
                ->from("items i")
                ->join('topics ts', 'i.t_id = ts.t_id AND ts.t_status=1', '', 'INNER')
                ->join('months m', "to_number(to_char(i.i_date_create,'mm'))", "m.m_number AND m.l_langnick = '$this->siteLang'", 'INNER')
                ->where("i_status", 1)
                ->where("i.i_date_create " . ($className === "preview" ? '<= 40 +' : '<=') . " sysdate")//mirs відсікає майбутні дати для новин
                ->where("i.t_id = " . ($topic_id == 895 ? $topic_id . " OR i.t_id = 909" : $topic_id)) //mirs 909 - ID ТОП НОВИНИ
                ->where("(i.i_ip IS NULL OR NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%')))")
                //mirs додавання часу для пергляду анонсів 1ця-день
                ->where("i.i_date_create " . ($className === "preview" ? '<= 40 +' : '<=') . " sysdate") //mirs дублювати зверху
                ->orderby('i_date_create', ($className === "preview" ? 'DESC' : 'DESC'))
                ->orderby('i_id', ($className === "preview" ? 'ASC' : 'DESC'))
                ->limit($limit, $offset);

        $result['items'] = $this->db->get();
        $result['total_count'] = $this->db->count_last_query();

        //  print_r($result); die();
        return $result;
    }

    /**
     * Повертає публікації вибранного классу(типу)
     *
     * @param string $className - Тип публікації
     * @param integer $limit - Макимальна кількість вибранных публікацій
     * @param integer $offset - Індекс публікації, з якої виводити
     * @return array('items' => array(), 'total_count' => integer)
     */
    protected function getItemsSelClass($className, $limit, $offset) {
        //die('stop');
        $className = strtolower($className);
        $result = array();

        $attachmentsConditions = array();
        if ($this->search_params['search_month'] > 0) {
            $attachmentsConditions[] = "to_char(ia_date_create,'mm') = '" . str_pad($this->search_params['search_month'], 2, '0', STR_PAD_LEFT) . "'";
        }
        if ($this->search_params['search_year'] > 0) {
            $attachmentsConditions[] = "to_char(ia_date_create,'yyyy') = '" . str_pad($this->search_params['search_year'], 4, '0', STR_PAD_LEFT) . "'";
        }
        if (strlen($this->search_params['search_substr']) > 0) {
            $attachmentsConditions[] = " (CONTAINS(ia_name,'" . $this->search_params['search_substr'] . "',1)>0 or CONTAINS(IA_DESCRIPTION,'" . $this->search_params['search_substr'] . "',2)>0) ";
        }


        $baseCondition = "
           FROM items i
           WHERE i_status = 1
           AND t_id <> (SELECT t_id FROM topics WHERE t_seo_name = 'recycler')
           AND t_id IN (SELECT t_id FROM topics WHERE t_rsslist IS NULL AND t_status=1)
           " . (in_array($className, array('gallery', 'audio')) ? " AND i.i_id IN (select distinct i_id from items_attachments " . (count($attachmentsConditions) > 0 ? ' WHERE ' . implode(' AND ', $attachmentsConditions) : '') . ")" : '') . "           
           AND i_type = '$className'
           AND l_langnick = '" . $this->siteLang . "'
           " . ($this->search_params['search_topic_id'] > 0 ? " AND i.t_id=" . $this->search_params['search_topic_id'] : '') . "
           AND (
           	i.i_ip IS NULL OR
               NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%'))
               )
           AND i.i_date_create " . ($className === "preview" ? '>' : '<=') . " sysdate        
        ";

        $result['items'] = $this->db->query("
            SELECT p1.*, CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = p1.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories,
            m.m_name as month, to_char(i_date_create,'dd') as day,  to_char(i_date_create,'yyyy') as year,   to_char(i_date_create,'hh24') as hour, to_char(i_date_create,'mi') as minute, 
			case when floor(sysdate-p1.i_date_create)<=" . Kohana::config('posts.count_day_new') . " then 1 else null end as flag_new					
            FROM ( 
                SELECT * FROM (SELECT rownum as linenum, p_query.* FROM (
                    SELECT i_id, i_name, i_anons, i_link, i_logoname, i_author, t_id, CASE WHEN i_logoname IS NULL THEN 1 ELSE 0 END AS logo_null,". 
                /*Кількість атачментів*/
                    "CASE 
                     WHEN i.i_type = 'documents' then
                     (select count(1) from items_attachments ia where  ia.i_id = i.i_id)
                      ELSE
                      0
                      END AS cntat,
                    TO_CHAR(i_date_create, 'DD.MM.YYYY') AS i_date, i_date_create
    				" . $baseCondition . "
                    ORDER BY i_date_create " . ($className === "preview" ? 'ASC' : 'DESC') . "
                ) p_query WHERE rownum <= " . ($limit + $offset) . ") WHERE linenum > " . $offset . "
            ) p1
            	INNER JOIN months m ON to_number(to_char(p1.i_date_create,'mm'))=m.m_number AND l_langnick = '$this->siteLang'");
        
       foreach ($result['items'] as $key=>$value){
//            
           $id =((int)$value->i_id);
            $result['atcount'] = $this->db->query("select count(1) atcnt from items_attachments t"
                    . " where t.i_id = {$id}")->current()->atcnt;
  //  var_dump($result['atcount']);         
        }

    //    var_dump($this->db->last_query());        die();
        //  die($baseCondition);
        $result['total_count'] = $this->db->query("SELECT count(1) cnt " . $baseCondition)->current()->cnt;
 //      var_dump($result['items']);  die();      
        return $result;
    }

}
