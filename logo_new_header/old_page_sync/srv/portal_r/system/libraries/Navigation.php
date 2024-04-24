<?php defined('SYSPATH') OR die('No direct access allowed.');

class Navigation_Core {

    public $path_way;
    public $current_node;
    
    protected $tree;
    protected $menu = array();

    private static $instance;

    public static function instance()
    {
        if (self::$instance == NULL)
        {
            // Create a new instance
            self::$instance = new Navigation;
        }

        return self::$instance;
    }
        
	public function __construct()
	{
        if (self::$instance === NULL)
        {
            $this->db = new Database;

            // Поточний вузол дерева
            $this->current_node = $this->db->select('*')
                                       ->from('topics')
                                       ->where('t_id', 14)
                                       ->get()
                                       ->current();
            
            // Шлях до вузла з корня
            $node = $this->current_node;
            $this->path_way = $this->db->select('*')
                                       ->from('topics')
                                       ->where("t_id <> $node->t_id")
                                       ->where("t_left_key <= $node->t_left_key")
                                       ->where("t_right_key >= $node->t_right_key")
                                       ->get(); 
            
            // Усе дерево
            $this->tree = $this->db->select('*')
                                   ->from('topics')
                                   ->get();
            
/*
            $this->tree = $this->db->query("SELECT daddy.*, (SELECT COUNT(*) FROM topics WHERE parent_id = daddy.id AND public = 1) AS childs
                                    FROM categories daddy
                                    ORDER BY left_key");
*/
                                    
        }
	}

    public function filter()
    {
        $key=0;
        foreach ($this->tree as $m) {
    
            $add = false;

            if (($m->t_level == 1) || ($this->current_node->t_id == $m->t_parent_id)) {
                $add = true;
            } elseif ($this->path_way) foreach ($this->path_way as $p) {
                    if ($p->id == $m->t_parent_id) {
                        $add = true;
                        break;
                    }
            }

            if ($add) {
                $this->menu[] = $m;
            }

            $key++;
        }
        
        $key = 0;
        foreach ($this->menu as $m) {
            if ((!isset($this->menu[$key + 1]))||($this->menu[$key + 1]->t_parent_id != $m->id)) {
                $this->menu[$key]->childs = 0;
            }
            $key++;    
        }
        
    }

    public function render_menu()
    {
        // Фільтрація дерева відносно поточного вузла
        $this->filter();
        return View::factory('menu/menu', array('menu' => $this->menu))->render();
    }

    public function render_tree()
    {       
        return View::factory('menu/tree', get_object_vars($this))->render();
    }

}