<?php
/**
 * Розсилка анонсів
 *
 */
class Anons_Controller extends Template_Controller {
	
	
	public function index(){
		
//		new Profiler;
		
		$this->auto_render = FALSE;
		$this->use_main = FALSE;						
		
		if(!Kohana::config('subscribe.enabled')){ //Розсилка новин заборонена
			echo 'Розсилка новин заборонена';
			return;
			
		}
		
		$countSendMsg = 0; //кількість відправлених повідомлкень
		
		Kohana::auto_load('Language');
		
		$swift = email::connect();
		
		$langQuery = $this->db->select('l_langnick')->from('lang')->where('l_status',1)->orderby(array('l_index'=>'asc'))->get();
              //  var_dump($this->db->last_query());  die();
		foreach ($langQuery as $rowLang){
			
			Language::setLocale($rowLang->l_langnick);
			
			$queryPost = $this->db->select("items.t_id, topics.t_name, items.i_id, items.l_langnick, to_char(items.i_date_create,'dd.mm.yyyy') as i_date_create, items.i_name, items.i_anons, CONCAT_CRS (CURSOR( SELECT t_seo_name FROM topics START WITH t_id = items.t_id CONNECT BY PRIOR t_parent_id=t_id ORDER BY t_left_key ASC ), '/') as i_categories")
	 		      ->from('items')
	 		      //->join('topics', 'items.t_id', 'topics.t_id and t_status=1 AND t_subscribe=1', 'INNER')
                  ->join('topics', 'items.t_id', 'topics.t_id AND t_subscribe=1', 'INNER')
	 			  ->in('items.i_type', array('news', 'preview'))
	 			  ->where('items.i_status', 1)
	 			  ->where('items.l_langnick', "'" . $rowLang->l_langnick . "'")
	 			  ->where('items.i_date_modify >= (select nvl(max(sl_date_send),sysdate-2) from subscribe_send_log)')
	 			  ->orderby(array('items.i_date_create'=>'desc'))->get();				
             //      var_dump($this->db->last_query());                   die();	  
			$nCountPosts = $this->db->count_last_query();
                 //  var_dump($nCountPosts);                  die();	  
			echo '</br></br>Розсилка для ' . $rowLang->l_langnick . ' - Count=' . $nCountPosts . '</br>';
			
			if($nCountPosts > 0){
				
				//Формування масиву доступних топіків для розсилки
				$arrTopics = array();
				$this->view('subscribe/anons_list');
				$this->view->site_name = substr(url::base(),0,-1);						 			  					
				foreach ($queryPost->result() as $rowPost){
					$this->view->anons_data = $rowPost;
					$arrTopics[$rowPost->t_id] = (isset($arrTopics[$rowPost->t_id]) ? $rowPost->t_name : '') . $this->view->render(FALSE);
				//	var_dump($this->view->anons_data);
				}
                              //  die();
				//var_dump($arrTopics);  die();
                                
				$strSelTopics = implode(',',array_keys($arrTopics));
				
				echo 'Список розділів розсилки - ' . $strSelTopics .'<br>';                                //die();

				//Визначення списку адресів для розсилки без distinct може бути багаторазова розсилка
				$strSQL = "SELECT  distinct s.sb_id, s.sb_email, s.sb_confirm_id, 
					concat_crs (CURSOR (select t_id from subscribe_topics st_list where st_list.sb_id=s.sb_id  and st_list.t_id in (" . $strSelTopics . ")					
					), ',') AS list_t_id					
					FROM subscribe s
					INNER JOIN subscribe_topics st ON s.sb_id=st.sb_id and st.t_id in (" . $strSelTopics . ") 
					WHERE s.sb_confirm_date is not null";
				//var_dump($strSQL);  die();
				$emailQuery = $this->db->query($strSQL);
				//var_dump($emailQuery); die();
				$this->view('subscribe/anons_msg');
				foreach ($emailQuery->result() as $rowEmail){
					
					$postData = '';
					$arrSendTopics = explode(',', $rowEmail->list_t_id);
					foreach ($arrSendTopics as $element){
						$postData .= $arrTopics[$element];
						 
					}
                                        
					$this->view->posts_data = $postData;
					$this->view->confirm_link =  url::site((strlen($this->view->lang_prefix) > 0 ? substr($this->view->lang_prefix, 1) . '/' : '') . 'subscribe/delete/' . $rowEmail->sb_confirm_id);
					$message = new Swift_Message(Kohana::lang('subscribe.send_anons.subject'), $this->view->render(FALSE), "text/html");				
                                     //   var_dump($message); die();
                                        
                                        $swift->send($message, $rowEmail->sb_email, Kohana::config('subscribe.from_mail'));					
					$countSendMsg++;

					
				}
			}	 			  

		}
		
		$swift->disconnect();
		$this->db->insert('subscribe_send_log', array('sl_count_send'	=> $countSendMsg));
		
		
		
	}
	
	
}
?>