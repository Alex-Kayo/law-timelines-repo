<?php

defined('SYSPATH') OR die('No direct access allowed.');

class Gallery_Controller extends Front_Controller {
    /**
     * Кількість інших галерей при перегл
     *
     */

    const count_other_gallery = 3;

    public function __construct() {
        parent::__construct();

        $this->view->front = false;
    }

    public function index() {
        $galleryID = $this->input->post('gallery_id', null, true);
        $this->view->categories = $this->getCategories($this->class);
//        $this->view->categories = $this->getCategories('gallery');
        if (empty($galleryID)) {
            $this->view("gallery/list");
            $this->listGallery();
        } else {

            $this->view("gallery/other_gallery");
            $this->use_main = FALSE;
            $this->listGallery($galleryID);
        }
    }

    /**
     * Вивід конкретної фотогалереї
     */
    public function show() {
        $ids = $this->item_id;
        $i_id = (int) $ids[0];
        $first_image = (int) $this->input->post('first_image', null, true);
        $last_image = (int) $this->input->post('last_image', null, true);


        $this->view('gallery/show');
        $this->view->header_gallery = $this->getItem($i_id);

        if (!$this->view->header_gallery) {
            Kohana::show_404();
        }



        if (count($ids) == 2 && ((int) $ids[1]) > 0) { //вибір фото	
            $this->view('gallery/sel_foto');
            $this->use_main = FALSE;
            $this->selFoto((int) $ids[1]);
            return;
        }



        $this->db->select("CASE WHEN ia.ia_id IS NOT NULL THEN to_char(ia.ia_id)||'.'||ia.ia_type else '' END AS fileName, to_char(ia.i_id)||'_'||to_char(ia.ia_id) as foto_id, ia.ia_description, ia_author")
                ->from('items_attachments ia')
                ->where('ia.i_id', $i_id)
                ->orderby(array('ia_date_create' => 'desc', 'ia_id' => 'desc')); //mirs ! to do

        if ($this->search_params['search_month'] > 0) {
            $this->db->where("to_char(ia_date_create,'mm') = '" . str_pad($this->search_params['search_month'], 2, '0', STR_PAD_LEFT) . "'");
        }
        if ($this->search_params['search_year'] > 0) {
            $this->db->where("to_char(ia_date_create,'yyyy') = '" . str_pad($this->search_params['search_year'], 4, '0', STR_PAD_LEFT) . "'");
        }
        if (strlen($this->search_params['search_substr']) > 0) {
            $this->db->where(" (CONTAINS(ia_name,'" . $this->search_params['search_substr'] . "',1)>0 or CONTAINS(IA_DESCRIPTION,'" . $this->search_params['search_substr'] . "',2)>0) ");
        }
        if ($first_image > 0 && $last_image > 0) { //формування списску малюнків для перегляду через jcarousel
            $this->db->limit($last_image - $first_image + 1, $first_image - 1);
        }


        $arrResult = array();
        foreach ($this->db->get()->result() as $row) {
            $arrResult['items'][] = array('filename' => $row->filename, 'foto_id' => $row->foto_id, 'ia_description' => $row->ia_description, 'ia_author' => $row->ia_author);
        }
        $arrResult['total'] = $this->db->count_last_query();
        if ($first_image > 0 && $last_image > 0) { //формування списску малюнків для перегляду через jcarousel
            $this->auto_render = false;
            echo json_encode($arrResult);
            return;
        }

        $this->view->images = array_reverse($arrResult); //!mirs



        if ($this->search_params['search_month'] > 0) {
            $this->db->where("to_char(ia_date_create,'mm') = '" . str_pad($this->search_params['search_month'], 2, '0', STR_PAD_LEFT) . "'");
        }
        if ($this->search_params['search_year'] > 0) {
            $this->db->where("to_char(ia_date_create,'yyyy') = '" . str_pad($this->search_params['search_year'], 4, '0', STR_PAD_LEFT) . "'");
        }
        if (strlen($this->search_params['search_substr']) > 0) {
            $this->db->where(" (CONTAINS(ia_name,'" . $this->search_params['search_substr'] . "',1)>0 or CONTAINS(IA_DESCRIPTION,'" . $this->search_params['search_substr'] . "',2)>0) ");
        }
        $ia_id = (int) $this->db->select('ia_id')->from('items_attachments')->where('i_id', $i_id)->orderby(array('ia_date_create' => 'desc'))->get()->current()->ia_id;
        if ($ia_id > 0) {
            $this->selFoto($ia_id);
        }
        $this->listGallery($i_id);
    }

    private function listGallery($idGallery = null) {


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

        $selTopic = 0;
        if ($this->search_params['search_topic_id'] > 0) {
            $selTopic = intval($this->search_params['search_topic_id']);
        } elseif ($this->current_node->t_id && $this->current_node->t_seo_name != 'gallery') {
            $selTopic = $this->current_node->t_id;
        }


        $baseCondition = "FROM items i
		    INNER JOIN topics ts ON i.t_id=ts.t_id AND ts.t_status=1
			WHERE i.i_status = 1
			AND i.t_id <> (SELECT t_id FROM topics WHERE t_seo_name = 'recycler')
			" . ($selTopic > 0 ? " AND i.t_id=" . $selTopic : '') . "            
			AND i.i_id IN (select distinct i_id from items_attachments " . (count($attachmentsConditions) > 0 ? ' WHERE ' . implode(' AND ', $attachmentsConditions) : '') . ")
	        AND i.i_type = 'gallery'        
	        AND i.l_langnick = '" . $this->siteLang . "'	        
	        AND (
	        	i.i_ip IS NULL OR
	            NOT EXISTS (SELECT i_id FROM items_ips ip WHERE ip.i_id = i.i_id AND '" . $this->input->ip_address() . "' LIKE replace(ip.ii_ip, '*', '%'))
	        )
	        AND i.i_date_create <= sysdate";


        $pagination = new Pagination(array(
            'base_url' => $this->view->base_url,
            'lang_prefix' => $this->view->lang_prefix,
            'uri_segment' => 'page',
            'items_per_page' => (!is_null($idGallery) ? self::count_other_gallery : Kohana::config('posts.count_gallery')),
            'style' => 'digg',
            'auto_hide' => TRUE,
        ));


        $result = $this->db->query("
            SELECT p1.*, 
            	m.m_name as month, to_char(i_date_create,'dd') as day,  to_char(i_date_create,'yyyy')	as year, 
				(select count(1) from items_attachments WHERE i_id = p1.i_id " . (count($attachmentsConditions) > 0 ? ' AND ' . implode(' AND ', $attachmentsConditions) : '') . ") as foto_cnt,
				case when floor(sysdate-p1.i_date_create)<=" . Kohana::config('posts.count_day_new') . " then 1 else null end as flag_new,					
				p1.i_anons AS ia_foto_description,
            	CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = p1.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') i_categories 
            FROM ( 
                SELECT * FROM (SELECT rownum as linenum, p_query.* FROM (
                    SELECT i_id, i_name, i_link, i_anons, i.t_id, i_date_create
                    " . $baseCondition . "
                    " . (!is_null($idGallery) ? " AND i_id <> " . $idGallery : "") . "
                    ORDER BY i_date_create DESC
                ) p_query WHERE rownum <= " . ($pagination->sql_limit + $pagination->sql_offset) . ") WHERE linenum > " . $pagination->sql_offset . "
            ) p1 
            	INNER JOIN months m ON to_number(to_char(p1.i_date_create,'mm'))=m.m_number AND l_langnick = '$this->siteLang'            	
            	")->as_array();

        //       print_r($result); die(); 

        $list_gallery = array();
        $item_ids = array();
        foreach ($result as $row) {
            $list_gallery[$row->i_id] = $row;
            $item_ids[] = $row->i_id;
        }
        unset($result);


        if (count($item_ids) > 0) {
            $list_logo = $this->db->query(
                            "select ia.i_id, ia.ia_id, CASE WHEN ia.ia_id IS NOT NULL THEN to_char(ia.ia_id)||'.'||ia.ia_type else '' END AS fileName,
            ia.ia_title as ia_foto_description, ia_author
            from (select i_id, max(ia_id) ia_id " .
                            //mirs (b4) from (select i_id, min(ia_id) ia_id
                            "from items_attachments
            where i_id in (" . implode(',', $item_ids) . ")
            " . (count($attachmentsConditions) > 0 ? ' AND ' . implode(' AND ', $attachmentsConditions) : '') . "
            group by i_id) p inner join items_attachments ia on p.ia_id=ia.ia_id")->as_array();

            foreach ($list_logo as $logo) {
                $list_gallery[$logo->i_id]->filename = $logo->filename;
                $list_gallery[$logo->i_id]->ia_author = $logo->ia_author;
                if (strlen($logo->ia_foto_description) > 0) {
                    $list_gallery[$logo->i_id]->ia_foto_description = $logo->ia_foto_description;
                }
            }
        }
        $this->view->list_gallery = $list_gallery;
        unset($list_gallery);


        $media_count = $this->db->query("
			select sum(cnt_all) as cnt_all, sum(cnt_new) as cnt_new from (
			select 1 as cnt_all, case when floor(sysdate-i_date_create)<=" . Kohana::config('posts.count_day_new') . " then 1 else 0 end as cnt_new
			" . $baseCondition . ")")->current();

        $this->view->all_count_posts = $media_count->cnt_all;
        $this->view->new_count_posts = $media_count->cnt_new;

        if (!is_null($idGallery)) {
            $other_count = $this->db->query("
				select sum(cnt_all) as cnt_all, sum(cnt_new) as cnt_new from (
				select 1 as cnt_all, case when floor(sysdate-i_date_create)<=" . Kohana::config('posts.count_day_new') . " then 1 else 0 end as cnt_new
				" . $baseCondition . " AND i_id <> " . $idGallery . ")")->current();

            $pagination->set_total_items($other_count->cnt_all);
            $this->view->other_all_count_posts = $other_count->cnt_all;
            $this->view->other_new_count_posts = $other_count->cnt_new;
        } else {
            $pagination->set_total_items($media_count->cnt_all);
        }


        $this->view->pagination = $pagination;
    }

    private function selFoto($selIDFoto) {

        $this->view->sel_foto = $this->db->query("SELECT
    		CASE WHEN ia.ia_id IS NOT NULL THEN to_char(ia.ia_id)||'.'||ia.ia_type else '' END AS fileName,
                ia.ia_id,
                ia.ia_description,
    		i.i_anons AS i_anons, ia.ia_author, ia_name,
    		m.m_name as month, to_char(ia_date_create,'dd') as day,  to_char(ia_date_create,'yyyy')	as year,
        	case when floor(sysdate-ia_date_create)<=" . Kohana::config('posts.count_day_new') . " then 1 else null end as flag_new
    		FROM items_attachments ia    		
    			INNER JOIN items i ON ia.i_id=i.i_id
				INNER JOIN months m ON to_number(to_char(ia.ia_date_create,'mm'))=m.m_number AND m.l_langnick = '$this->siteLang'    			
    		WHERE ia.ia_id=$selIDFoto")->current();

        $this->db
                ->select('ia_id', 'i_id')
                ->from('items_attachments')
                ->where("i_id in (select i_id from items_attachments where ia_id=$selIDFoto)")
//			->orderby(array('ia_date_create' => 'desc', 'ia_id' => 'desc'));
                ->orderby(array('ia_date_create' => 'desc'));

        if ($this->search_params['search_month'] > 0) {
            $this->db->where("to_char(ia_date_create,'mm') = '" . str_pad($this->search_params['search_month'], 2, '0', STR_PAD_LEFT) . "'");
        }
        if ($this->search_params['search_year'] > 0) {
            $this->db->where("to_char(ia_date_create,'yyyy') = '" . str_pad($this->search_params['search_year'], 4, '0', STR_PAD_LEFT) . "'");
        }
        if (strlen($this->search_params['search_substr']) > 0) {
            $this->db->where(" (CONTAINS(ia_name,'" . $this->search_params['search_substr'] . "',1)>0 or CONTAINS(IA_DESCRIPTION,'" . $this->search_params['search_substr'] . "',2)>0) ");
        }

        $arrResult = array();
        $this->view->move_id = new stdClass;
        $this->view->move_id->i_id = 0;
        foreach ($this->db->get()->result() as $row) {
            if ($this->view->move_id->i_id == 0) {
                $this->view->move_id->i_id = $row->i_id;
            }
            $arrResult[] = $row->ia_id;
        }


        $searchIndex = array_search($selIDFoto, $arrResult);

        if ($searchIndex !== false) {
            $this->view->move_id->prev_id = (isset($arrResult[$searchIndex - 1]) ? $arrResult[$searchIndex - 1] : null);
            $this->view->move_id->next_id = (isset($arrResult[$searchIndex + 1]) ? $arrResult[$searchIndex + 1] : null);
        }
    }

    public function __call($method, $arguments) {
        self::index();
    }

}

