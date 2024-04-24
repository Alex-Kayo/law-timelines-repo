<?php defined('SYSPATH') OR die('No direct access allowed.');
        
        $old_level = 0;
        $path_stack = array();
        $last = count($tree);
        $key = 1;
        foreach ($tree as $t) {
            
            $level = $t->t_level - 1;

            for ($j = $old_level; $j > $level; $j--) {
                for ($i = 1; $i < $j; $i++) echo "\t";
                echo "</ul></li>\n";
                array_pop($path_stack);
            }

            for ($i = 1; $i <= $level; $i++) echo "\t";
            $path = implode('/', $path_stack);
            if ($path) $path .= '/';
            
            $last_style = ($key == $last) ? ' class="last"' : '';
            echo '<li' . $last_style . '><a href="' . $this->view->lang_prefix . '/'.str_replace('"', '', $path.$t->t_seo_name).'/"><span>'.$t->t_name.'</span></a>';
            echo (!$t->t_childs) ? "</li>\n" : "<ul class=\"clr2\">\n";

            if ($t->t_childs)
            {
                array_push($path_stack, $t->t_seo_name);
            }
            
            $old_level = $level;
            $key++;
        }
        
        for ($j = $old_level; $j > 0; $j--) {
            echo "</ul></li>\n";
        }

?>