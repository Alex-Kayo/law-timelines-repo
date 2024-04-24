<?php

class Rss_Controller extends Controller {
      
    /**
     * Об"єкт  класу Database
     *
     * @var object
     */
    private $db;
    private $descriptor_limit = 495; //mirs довжина текстового рядка 
    
    
    public function __construct(){

//!mirs  ini_set('user_agent', 'RadaPortal');  
        
        parent::__construct();

  //      var_dump($this->input->ip_address()); die();

        if  (in_array($this->input->ip_address(), Kohana::config('filter_ip.rss_deni' )))

            Kohana::show_404();
        
        $this->db =  Database::instance('rss');
        
    }
    

    /**
     * Спсисок RSS для обробки
     *
     */
    public function index(){       
        $rss = $this->db->select('t_id', 't_rsslist', 't_seo_name')
                    ->from('topics')
                    ->where('t_rsslist IS NOT NULL')
                    ->where('t_status = 1')
                    ->get();

        foreach ($rss as $r) {
            
            $canals = explode(';', $r->t_rsslist);
            foreach ($canals as $feed) {
                $this->parseRSS($feed, $r->t_id);
                

            }
        }
        $this->cache = Cache::instance();
//        $this->cache->delete_tag('main_page');   //yuraim 20120608
        $this->cache->delete_all();
        
    }

    public function listrss(){
        $rss = $this->db->select('t_name', 't_rsslist', 't_seo_name')
            ->from('topics')
            ->where('t_rsslist IS NOT NULL')
            ->where('t_status = 1')
            ->get();

        foreach ($rss as $r) {

                echo $r->t_name.'=>'.$r->t_rsslist.'<br>';

            }
        }


    /**
     * Парсинг РСС + додавання в БД
     *
     * @param string $rss - URL RSS 
     * @param number $topicID - ID розділу
     */
    private function parseRSS($rss, $topicID){
        $reader = new XMLReader();
        //echo $rss;die();
        $reader->open($rss);
    
        while($reader->read()){
            if($reader->name == 'item' and $reader->nodeType == XMLReader::ELEMENT){
                $result = array();
                $itemFields = array();
                $text = $reader->readInnerXml();
    
                if($text === false){
                    continue;
    
                }
    
                preg_match_all("/<([a-z]+)[^>]*>(.*)<\/\\1>/is", $text, $result);
                $nicks = $result[1];
                $data = $result[2];
    
                if(!empty($nicks)){
                    $itemFields = array();
    
                    for($i = 0; $i < count($nicks); $i ++){
                        $pos = strpos($data[$i], '<![CDATA[');
    
                        if($pos !== false){
                            $text = strtr($data[$i], array('<![CDATA['=>'', ']]>'=>''));
                            $text = trim(strip_tags($text));

    
                        }    else{
                            $text = trim(strip_tags($data[$i]));

    
                        }
                        $text = html_entity_decode($text);
                        $text = trim(strip_tags($text));    
                        
                        
                        $itemFields[$nicks[$i]] = $text;
    
    
                    }
                    
// mirs
// якщо у  в RSS відсутне поле <description>                   
                    isset($itemFields['description']) ? $itemFields['description'] : $itemFields['description']='';
//////////////////////////////////////////////////////////////////////  
// mirs  у  в RSS текст <<description> первищує допустимий розмір поля в БД 500

                if (strlen($itemFields['description'])>$this->descriptor_limit){
                 $strcut = substr($itemFields['description'], 0, $this->descriptor_limit);  
                   $itemFields['description'] = substr($strcut, 0, strrpos($strcut,' ')).'...';
              }
///////////////////////////////////////////////////////////////////////////////////

                    $data = array(
                        'i_type' => 'news',
                        'i_link' => $itemFields['link'],
                        'i_name' => $itemFields['title'],

                        'i_anons' => $itemFields['description'],
                        'i_description' => $itemFields['description'],

                        'i_date_create' => "TO_DATE('" . date('Y-m-d H:i', (isset($itemFields['pubDate'])) ? strtotime($itemFields['pubDate']) : time()) . "', 'YYYY-MM-DD HH24:MI')",

                        'i_status' => 1,
                        'u_id' => 1,
                        't_id' => $topicID,
                        'l_langnick' => 'ua'
                    );
//mirs заміна старих лінків в oracle proc на нові                   
 //                   $data['i_link'] = preg_replace('/(^.*)\/radac_gs09\/(.*)$/','$1/radan_gs09/$2',$data['i_link']);
 //                   $data['i_link'] = preg_replace('/(^.*)\/zweb_n\/(.*)$/','$1/zweb2/$2',$data['i_link']);
//                  http://w1.c1.rada.gov.ua/pls/zweb_n/webproc4_1?pf3511=41071            
/////////////////////////////////////////////////////////                   
//!mirs                    
//echo $data['i_name']."-------".$data['i_date_create']."<br>"; 
//!
                     $cnt = $this->db->query("SELECT count(1) as cnt FROM items WHERE i_link = '".$data['i_link']."' AND t_id = " . $topicID . " AND rownum = 1")->current()->cnt;                     
                    if ($cnt != 1){
                          $this->db->insert('items', $data);
                    }
    
                }
    
            }    else{
                continue;
    
            }
   
        }
     echo 'OK ';
    
    }    
    
    
       
    

    
    
    
}
