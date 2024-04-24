<?php /* Smarty version 2.6.22, created on 2024-01-31 13:07:03
         compiled from gallery/list.tpl */ ?>
<?php if ($this->_tpl_vars['is_news_subsite']): ?>
   <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'news_subsite/newcenter_menu.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/">Головна</a></li> 
                    <?php $_from = $this->_tpl_vars['path_way']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                    <li class="breadcrumb-item"><a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->t_parents; ?>
/"><?php echo $this->_tpl_vars['data']->t_name; ?>
</a></li>  
                    <?php endforeach; endif; unset($_from); ?>                    
                    <li class="breadcrumb-item"><?php echo $this->_tpl_vars['current_node']->t_name; ?>
</li>
                </ol>
<h3 class="page-heading with-search">
    <span>Фотогалерея</span>
    
    <a class="search-by-link" data-toggle="collapse" href="#collapseSearch" role="button" aria-expanded="false" aria-controls="collapseSearch">
        <i class="ico-search"></i>
        Пошук <span class="mob-hide">у фотоальбомах</span>
    </a>
</h3>  
<div class="gallery_content">

    <div class="collapse" id="collapseSearch">
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "gallery/module_filter.tpl", 'smarty_include_vars' => array('url' => 'gallery')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    </div>

    <hr />
    
    <div class="mediagallery-list">
        <div class="grid has-cols-4 has-grid-gap-2 is-dense sub-example">

                   
            <?php $_from = $this->_tpl_vars['list_gallery']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['media_data']):
        $this->_foreach['i']['iteration']++;
?>
                
             <?php if (($this->_foreach['i']['iteration']-1) == 0): ?>  
                        <div class="has-row-md-3 has-col-md-3">
                    <div class="gallery_item example--item">
                                               <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['media_data']->i_categories; ?>
/<?php echo $this->_tpl_vars['media_data']->i_id; ?>
.html?<?php echo $this->_tpl_vars['show_request']; ?>
">
                        <img alt="<?php echo $this->_tpl_vars['media_data']->i_name; ?>
" src="/uploads/gallery_prev/<?php echo $this->_tpl_vars['media_data']->filename; ?>
" />
                    </a>
                        <a class="item-caption" href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['media_data']->i_categories; ?>
/<?php echo $this->_tpl_vars['media_data']->i_id; ?>
.html?<?php echo $this->_tpl_vars['show_request']; ?>
">
                        <h3>
                       
                        <?php echo $this->_tpl_vars['media_data']->i_name; ?>

                        
                        <?php if ($this->_tpl_vars['media_data']->flag_new): ?>
                                <span class="warn">(оновлено)</span>											
                        <?php endif; ?>

                        </h3>
                        <div class="foto_num">
                            <i class="camera-icn"></i>
                            <?php echo $this->_tpl_vars['media_data']->foto_cnt; ?>
 фото
                        </div>
                    </a>
                    </div>
            </div>
                        <?php elseif (($this->_foreach['i']['iteration']-1) == 1): ?>
                        <div class="has-row-md-2 has-col-md-2">
                    <div class="gallery_item example--item">
                                               <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['media_data']->i_categories; ?>
/<?php echo $this->_tpl_vars['media_data']->i_id; ?>
.html?<?php echo $this->_tpl_vars['show_request']; ?>
">
                        <img alt="<?php echo $this->_tpl_vars['media_data']->i_name; ?>
" src="/uploads/gallery_prev/<?php echo $this->_tpl_vars['media_data']->filename; ?>
" />
                    </a>
                        <a class="item-caption" href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['media_data']->i_categories; ?>
/<?php echo $this->_tpl_vars['media_data']->i_id; ?>
.html?<?php echo $this->_tpl_vars['show_request']; ?>
">
                        <h3>
                       
                        <?php echo $this->_tpl_vars['media_data']->i_name; ?>

                        
                        <?php if ($this->_tpl_vars['media_data']->flag_new): ?>
                                <span class="warn">(оновлено)</span>											
                        <?php endif; ?>

                        </h3>
                        <div class="foto_num">
                            <i class="camera-icn"></i>
                            <?php echo $this->_tpl_vars['media_data']->foto_cnt; ?>
 фото
                        </div>
                    </a>
                    </div>
            </div>
                        <?php else: ?>
                   
                        <div class="has-row-md-1 has-col-md-1">
                <div class="gallery_item example--item">

                    <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['media_data']->i_categories; ?>
/<?php echo $this->_tpl_vars['media_data']->i_id; ?>
.html?<?php echo $this->_tpl_vars['show_request']; ?>
">
                        <img alt="<?php echo $this->_tpl_vars['media_data']->i_name; ?>
" src="/uploads/gallery_prev/<?php echo $this->_tpl_vars['media_data']->filename; ?>
" />
                    </a>

                                        <a class="item-caption" href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['media_data']->i_categories; ?>
/<?php echo $this->_tpl_vars['media_data']->i_id; ?>
.html?<?php echo $this->_tpl_vars['show_request']; ?>
">
                        <h3>
                       
                        <?php echo $this->_tpl_vars['media_data']->i_name; ?>

                        
                        <?php if ($this->_tpl_vars['media_data']->flag_new): ?>
                                <span class="warn">(оновлено)</span>											
                        <?php endif; ?>

                        </h3>
                        <div class="foto_num">
                            <i class="camera-icn"></i>
                            <?php echo $this->_tpl_vars['media_data']->foto_cnt; ?>
 фото
                        </div>
                    </a>
           
                </div>                    
            </div><!--/has-row-md-1 has-col-md-1-->
            
                         
                    
<?php endif; ?>
      <?php endforeach; endif; unset($_from); ?>
                  
            
            
          
    </div>
      
    <?php echo $this->_tpl_vars['pagination']; ?>

</div>  
      
</div>