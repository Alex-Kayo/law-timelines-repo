<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * ReCaptcha library.
 *
 * mirs
 */
class ReCaptcha_Core
{

    // Captcha singleton
    protected static $instance;

    // Config values

    public $field_name;
    private $url;
    public  $key;
    private $skey;
    public  $response = false;
    private $ip;
    private $google_validate_url;
    private $proxy;


    private $is_valid = false;



    /**
     * Singleton instance of ReCaptcha.
     *
     * @return  object
     */
    public static function instance()
    {
        // Create the instance if it does not exist
        empty(self::$instance) and new ReCaptcha;

        return self::$instance;
    }

    /**
     * Constructs and returns a new Captcha object.
     *
     * @param string  config group name
     * @return  object
     */
    public static function factory($group = NULL)
    {

        return new ReCaptcha($group);
    }

    /**
     * Constructs a new Captcha object.
     *
     * @param string  config group name
     * @return  void
     * @throws  Kohana_Exception
     */
    public function __construct($group = NULL)
    {
        // Create a singleton instance once

        empty(self::$instance) and self::$instance = $this;

        // Load and validate config group
        if (!is_array($config = Kohana::config('recaptcha.' . $group)))
            throw new Kohana_Exception('recaptcha.undefined_group', $group);
        $this->field_name = $config['field_name'];
        $this->key = $config['sitekey'];
        $this->skey = $config['gsecretkey'];
        $this->url= $config['url'];
        $this->ip = $_SERVER['REMOTE_ADDR'];
        $this->proxy = $config['proxy_server'];


//var_dump($this->field_name); die();



    }
    public  function validate(){

        if (isset($_POST["{$this->field_name}"])){
            $this->response = $_POST["{$this->field_name}"];
            $this->google_validate_url = "{$this->url}?secret={$this->skey}&response={$this->response}&remoteip={$this->ip}";
       // var_dump($this->google_validate_url); die();
        }
        else {return false;}
//var_dump($this->response); die();
//        $context = stream_context_create([
//            'http' => [
//                'proxy' => $this->proxy,
//                'request_fulluri' => true
//            ]
//        ]);
//
//var_dump($this->proxy);
//        $curlData = file_get_contents($this->google_validate_url, false, $context );
//        var_dump($curlData); die();



        //------------reCAPHA------------

        // set post fields
        $post = array(
            'secret' => $this->skey,
            'response' => $this->response,
            'remoteip' => $this->ip,
        );

var_dump($post); die();


        $curl  = curl_init();
        curl_setopt($curl, CURLOPT_URL, $this->url);
        curl_setopt($curl, CURLOPT_PROXY, $this->proxy);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $post);
   //     curl_setopt($curl, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16");
       $curlData = curl_exec($curl);
        curl_close($curl);
        $res = json_decode($curlData, true);
        //------------!reCAPHA------------
    //    var_dump($res); die();

        if (isset($res["success"])) {$this->is_valid = $res["success"];};

        return $this->is_valid;


    }
}// End Captcha Class