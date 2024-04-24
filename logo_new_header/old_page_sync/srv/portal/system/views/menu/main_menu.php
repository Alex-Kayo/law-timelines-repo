<?php defined('SYSPATH') OR die('No direct access allowed.');?>




<?php /* MAX 4 level */?>
<!--TOP MENU cut -->
<ul id="topnav" class="lbut">
    <?php foreach ($menu_tree as $menu):?>
        <li>
            <a <?php if(isset($menu['is_root'])):?>class="root"<?php endif;?> href="<?php echo $menu['url']; ?>"><?php echo $menu['name']; ?></a>
            
            <div class="sub">
            
                <?php if(isset($menu['children'])):?>
                    
                
                    <?php 
                        $cnt_sub_childs = 0; 
                        foreach ($menu['children'] as $sub_menu1):
                            $cnt_sub_childs += (isset($sub_menu1['children']) ? count($sub_menu1['children']) : 0);
                        endforeach;
                    ?>
                    
                    <?php if($cnt_sub_childs == 0):?>
                    
                        <ul>
                            <?php foreach ($menu['children'] as $sub_menu1):?>
                                <li><a href="<?php echo $sub_menu1['url']; ?>"><?php echo $sub_menu1['name']; ?></a></li>
                            <?php endforeach;?>
                        </ul>       
                                                                                                 
                    <?php else:?>
                    

                        <?php foreach ($menu['children'] as $sub_menu1):?>                        
                            <ul>
                                <?php if(isset($sub_menu1['children'])):?>
                                    <li><h3><?php if($sub_menu1['url']!='#'):?><a href="#"><?php endif;?><?php echo $sub_menu1['name']; ?><?php if($sub_menu1['url']!='#'):?></a><?php endif;?></h3></li>
                                    
                                <?php endif;?>
                                
                                <?php if(isset($sub_menu1['children'])):?>
                                    <?php foreach ($sub_menu1['children'] as $sub_menu2):?> 
                                         
                                        <?php if(isset($sub_menu2['children'])):?>
                                            <li><span><?php if($sub_menu2['url']!='#'):?><a href="#"><?php endif;?><?php echo $sub_menu2['name']; ?><?php if($sub_menu2['url']!='#'):?></a><?php endif;?></span></li>                                            
                                            <?php foreach ($sub_menu2['children'] as $sub_menu3):?> 
                                                <li><a href="<?php echo $sub_menu3['url']; ?>"><?php echo $sub_menu3['name']; ?></a></li>
                                            <?php endforeach;?>

                                        <?php else:?>    
                                            <li><a href="<?php echo $sub_menu2['url']; ?>"><?php echo $sub_menu2['name']; ?></a></li>
                                        <?php endif;?>
                                        
                                    <?php endforeach;?>
                                <?php endif;?>

                            </ul>
                        <?php endforeach;?>                       
                    
                    
                    
                    
                    <?php endif;?>

                    
                <?php endif;?>
                
             </div>   
                
        </li>
    <?php endforeach;?>
</ul>
<!-- cut TOP MENU-->