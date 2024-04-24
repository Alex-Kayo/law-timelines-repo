<?php defined('SYSPATH') OR die('No direct access allowed.');

        $old_level = 0;
        $path_stack = array();

        foreach ($menu as $t) {
            
            $level = $t->t_level - 1;

            for ($j = $old_level; $j > $level; $j--) {
                for ($i = 1; $i < $j; $i++) echo "\t";
                echo "</ul></li>\n";
                array_pop($path_stack);
            }

            for ($i = 1; $i <= $level; $i++) echo "\t";
            $path = implode('/', $path_stack);
            if ($path) $path .= '/';
            
            $active_style = ($this->current_node->t_seo_name == $t->t_seo_name) ? ' class="on"' : '';
            
            echo '<li'.$active_style.'><a href="' . $this->view->lang_prefix . '/'.$path.$t->t_seo_name.'/">'.$t->t_name.'</a>';
            echo ($t->t_childs) ? "<ul>\n" : "</li>\n";
            
            if ($t->t_childs)
            {
                array_push($path_stack, $t->t_seo_name);
            }
            
            $old_level = $level;
        }
        
        for ($j = $old_level; $j > 0; $j--) {
            echo "</ul></li>\n";
        }

?>