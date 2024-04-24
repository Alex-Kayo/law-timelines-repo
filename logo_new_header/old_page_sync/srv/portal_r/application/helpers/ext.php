<?php defined('SYSPATH') OR die('No direct access allowed.');
/**
 * Ext helper class.
 *
 * @package    Core
 * @author     Oleh Zamkovyi <oleh.zam@gmail.com>
 */
class ext_Core {

   
    /**
     * Формирует JSON ответ для отправки статуса выполнения в формате
     * необходимом для понимания в Ext.js
     * 
     * @param $success bool статус выполнения true/false
     * @param $message sring информация об ошибке
     * @return JSON
     */
    public static function json_response($success, $message = 'ok') {
        if ($success) $success = 'true';else $success = 'false';
        return '{"success": '.$success.', "msg": "'.$message.'"}';
    }
    
    /**
     * JSON data to Grid
     * @return JSON
     */
    public static function grid($order = FALSE)
    {
        $start = (int)Input::instance()->post('start');
        $limit = (int)Input::instance()->post('limit');

        if ($limit) {
            $nodes['items'] = Database::instance()
                            ->limit($limit, $start)
                            ->get()
                            ->as_array(FALSE);
        } else {
            $nodes['items'] = Database::instance()
                            ->get()
                            ->as_array(FALSE);
        }

        $nodes['total'] = Database::instance()->count_last_query();
        
        if ($order) {
            for($key = 0; $key < $nodes['total']; $key++)
            {
                $nodes['items'][$key]->order = $key + 1;
            }
        }

        return json_encode($nodes);
    }    

} // End ext