<?php

define('SC_GET', 1);
define('SC_POST', 2);
define('SC_REQUEST', SC_GET | SC_POST);
define('SC_COOKIE', 4);
define('SC_SERVER', 8);
define('SC_PATH', 16);

class Request_Core {

    /**
    * Единственый объект класса, реализация шаблона Singleton
    */
    private static $instance;
        
    function __construct() {
    }

    /**
    * Отключение возможности клонирования объекта.
    * Реализация шаблона Singleton
    */
    private function __clone() {}
        
    /**
    * Обращение к объекту класса.
    * Реализация шаблона Singleton
    */
    public static function getInstance() {
        if (!self::$instance) self::$instance = new Request;
            
        return self::$instance;
    }
        
    /**
     * Метод получения переменной из суперглобального массива
     *
     * @param string  $name  имя переменной
     * @param string  $type  тип, в который будет преобразовано значение
     * @param integer $scope бинарное число, определяющее в каких массивах искать переменную
     * @return string|null
     */
    public function get($name, $type = 'mixed', $scope = SC_REQUEST) {
        
        /*
        $result = null;
        $originalName = false;
        if ($bracket = strpos($name, '[')) {
            $originalName = $name;
            $name = substr($name, 0, $bracket);
        }
        $done = false;

        if (!$done && $scope & SC_REQUEST && @!is_null($result = $_REQUEST[$name])) {
            $done = true;
        }

        if (!$done && $scope & SC_SERVER && @!is_null($result = $_SERVER[$name])) {
            $done = true;
        }

        if (!$done && $scope & SC_COOKIE && @!is_null($result = $_COOKIE[$name])) {
            $done = true;
        }

        if (!$done && $scope & SC_POST && @!is_null($result = $_POST[$name])) {
            $done = true;
        }

        if (!$done && $scope & SC_GET && @!is_null($result = $_GET[$name])) {
            $done = true;
        }

        if ($originalName) {
            $name = $originalName;
            $name = str_replace('[]', '[0]', $name);
            preg_match_all('/\[["\']?(.*?)["\']?\]/', $name, $indexes);
            // or str_replace(array('[]', '][', '[', ']'), array('', '[', '[', ''), substr($name, strpos($name, '[') + 1));
            $indexes = $indexes[1];

            foreach($indexes as $index) {
                if (!isset($result[$index])) {
                    $result = null;
                    break;
                }
                $result = $result[$index];
            }
        }

        if (empty($type) || $type == 'mixed') {
            return $result;
        } else {
            return $this->convertToType($result, $type);
        }
        */
        return $this->convertToType(Input::instance()->post($name), $type);
    }

    /**
     * Преобразователь значения переменной $result к типу $type
     * Если $result массив, то из него извлекается первый элемент и
     * дальнейшие преобразования происходят только с этим элементом
     *
     * @param mixed $result значение полученное из URI
     * @param string $type тип, в который будет преобразовано значение
     * @return mixed
     */
    public function convertToType($result, $type) {
        if ($type == 'mixed') $type = 'string';
        $validTypes = array('array' => 1, 'integer' => 1, 'boolean' => 1, 'string' => 1);
        if (gettype($result) == 'string') {
            $result = stripcslashes($result);
        }
        if (gettype($result) == 'array' && $type != 'array') {
            $result = array_shift($result);
            if (!is_scalar($result)) {
                $result = null;
            }
        }

        if (gettype($result) != $type) {
            settype($result, $type);
        }
        return $result;
    }

    
    public function jsonResponse($success, $message='ok') {
        if ($success) $success = 'true';else $success = 'false';
        return '{"success": '.$success.', "msg": "'.$message.'"}';
    }

    public function php2js($a=false) {
        return json_encode($a);
        /*
        if (is_null($a)) return 'null';
        if ($a === false) return 'false';
        if ($a === true) return 'true';
        if (is_scalar($a)){
            if (is_float($a)){            	
            	$a = str_replace(",", ".", strval($a));                
            	return $a;
            	
            }
            
            static $jsonReplaces = array(array("\\", "/", "\n", "\t", "\r", "\b", "\f", '"'),
            array('\\\\', '\\/', '\\n', '\\t', '\\r', '\\b', '\\f', '\"'));
            
            if((is_int($a)) or (is_float($a))){
            	return str_replace($jsonReplaces[0], $jsonReplaces[1], $a);
            		
            }	else{
            	return '"' . str_replace($jsonReplaces[0], $jsonReplaces[1], $a) . '"';
            
            }
            		
        }
        
        $isList = true;
        for ($i = 0, reset($a); $i < count($a); $i++, next($a)) {
            if (key($a) !== $i) {
                $isList = false;
                break;
            }
        }
        $result = array();
        if ($isList){
            foreach ($a as $v) $result[] = $this->php2js($v);
            return '[ ' . join(', ', $result) . ' ]';
        } else {
            foreach ($a as $k => $v) $result[] = $this->php2js($k).': '.$this->php2js($v);
            return '{ ' . join(', ', $result) . ' }';
        }
        */
    }
    

}

?>