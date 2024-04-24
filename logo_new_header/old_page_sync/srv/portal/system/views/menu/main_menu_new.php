<?php defined('SYSPATH') OR die('No direct access allowed.');?>




<?php /* MAX 4 level */?>
<!--TOP MENU cut -->
<ul>
    
    <?php 
    
    $count_root = 0;
    foreach ($menu_tree as $menu):
        if(isset($menu['is_root'])):
            $count_root++;            
        endif;
    endforeach;?>
    
    <?php $root_index = 0;?>
    <?php foreach ($menu_tree as $menu):?>
        
        <?php $liclass = "";?>
        <?php if($root_index == 0):
            $liclass .= "first";            
          elseif ($root_index+1 == $count_root):  
            $liclass .= "last";            
          endif; ?>
        
        <li <?php if(strlen($liclass) > 0):?> class="<?php echo $liclass?>"<?php endif;?>>

        
            <a href="<?php echo $menu['url']; ?>" <?php if(isset($menu['is_root'])):?> class="root"<?php endif;?>><?php echo $menu['name']; ?></a>            

            
                  <?php if(isset($menu['children'])):?>
                    <div class="submenu">

                        <?php 
                            $cnt_sub_childs = 0; 
                            foreach ($menu['children'] as $sub_menu1):
                                $cnt_sub_childs += (isset($sub_menu1['children']) ? count($sub_menu1['children']) : 0);
                            endforeach;
                        ?>

                        <?php if($cnt_sub_childs == 0):?>
                            <div class="submenu_col">
                                <ul>
                                    <?php foreach ($menu['children'] as $sub_menu1):?>
                                        <li><a href="<?php echo $sub_menu1['url']; ?>"><?php echo $sub_menu1['name']; ?></a></li>
                                    <?php endforeach;?>
                                </ul>       
                            </div>
                        <?php else:?>


                            <?php foreach ($menu['children'] as $sub_menu1):?>    
                                <div class="submenu_col">
                                    
                                        <?php if(isset($sub_menu1['children'])):?>
                                            <h3><?php if($sub_menu1['url']!='#'):?><a href="#"><?php endif;?><?php echo $sub_menu1['name']; ?><?php if($sub_menu1['url']!='#'):?></a><?php endif;?></h3>
                                        <?php endif;?>

                                        <?php if(isset($sub_menu1['children'])):?>
                                            
                                            <?php 
                                                $cnt_sub_childs = 0; 
                                                foreach ($sub_menu1['children'] as $sub_menu2):
                                                    $cnt_sub_childs += (isset($sub_menu2['children']) ? count($sub_menu2['children']) : 0);
                                                endforeach;
                                            ?>                                            

                                            <?php if($cnt_sub_childs == 0):?>
                                                <ul>
                                                    <?php foreach ($sub_menu1['children'] as $sub_menu2):?> 
                                                        <li><a href="<?php echo $sub_menu2['url']; ?>"><?php echo $sub_menu2['name']; ?></a></li>
                                                    <?php endforeach;?>
                                                </ul>

                                            <?php else:?>   


                                                <?php foreach ($sub_menu1['children'] as $sub_menu2):?> 

                                                    <?php if(isset($sub_menu2['children'])):?>
                                                        <p><?php if($sub_menu2['url']!='#'):?><a href="#"><?php endif;?><?php echo $sub_menu2['name']; ?><?php if($sub_menu2['url']!='#'):?></a><?php endif;?></p>                                            
                                                        <ul>
                                                        <?php foreach ($sub_menu2['children'] as $sub_menu3):?> 
                                                            <li><a href="<?php echo $sub_menu3['url']; ?>"><?php echo $sub_menu3['name']; ?></a></li>
                                                        <?php endforeach;?>
                                                        </ul>
                                                    <?php endif;?>

                                                <?php endforeach;?>
                                                    
                                            <?php endif;?>                                                    
                                                    
                                        <?php endif;?>
                                
                                    
                                </div>
                            <?php endforeach;?>                          




                        <?php endif;?>

                    </div>
                <?php endif;?>           
            
            
                
        </li>
        <?php if(isset($menu['is_root'])):
            $root_index++;
        endif;?>
    <?php endforeach;?>
</ul>
<!-- cut TOP MENU-->