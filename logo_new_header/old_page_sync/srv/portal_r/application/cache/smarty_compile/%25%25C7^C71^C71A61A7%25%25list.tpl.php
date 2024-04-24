<?php /* Smarty version 2.6.22, created on 2024-01-29 09:45:59
         compiled from main_page/list.tpl */ ?>
<?php if ($this->_tpl_vars['is_news_subsite']): ?>
   <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'news_subsite/newcenter_menu.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['is_gospfin_subsite']): ?>
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'gospfin_subsite/gospfin_menu.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['current_node']->t_name): ?>

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

        <?php endif; ?>  


<div class="right_col">
    <!-- information_block -->
<div class="page-heading">

    <h3>
        <?php if ($this->_tpl_vars['current_node']->t_name != "Текстові публікації (UA)"): ?>
        <?php echo $this->_tpl_vars['current_node']->t_name; ?>

        <?php else: ?> 
        Усі текстові публікації
        <?php endif; ?>    
    
    </h3>
</div>    

 <!-- form -->
 
 
 <hr>

<div class="row">
    <!-- col-md-9 -->
    <div class="col-md-9">
                
        <div id="list_archive">
       
    <div class="information_block archieve_block">        
        
        
        
            <?php $_from = $this->_tpl_vars['posts']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?> 
                <!-- timeline-block -->
                <div class="timeline-block">
                <?php if ($this->_tpl_vars['data']->hour != '00'): ?>    
                <div class="timeline-block__date">
                        <?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>

                </div>
               <?php endif; ?>     
                
                <div class="timeline-block__day">
                </div>
                    
                <div class="timeline__conteiner">
                    <?php if ($this->_tpl_vars['data']->hour != '00'): ?>
                    <span class="time"><?php echo $this->_tpl_vars['data']->hour; ?>
:<?php echo $this->_tpl_vars['data']->minute; ?>
</span>
                    <?php endif; ?>
                    
                    <?php if ($this->_tpl_vars['data']->i_link): ?>
                    <div class="news_item">
	
                        <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) > 0): ?>
            
                        <div class="timeline-block_img">
                            <img alt="" src="/uploads/logos_small/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg"/>
                        </div>
            
                        <?php endif; ?>
                        <div class="timeline-block_text">
                            <div class="timeline-block__heading f-bold">
                                <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
">
                                    <?php echo $this->_tpl_vars['data']->i_name; ?>

                                </a>
                            </div>
	
                            <?php if ($this->_tpl_vars['data']->i_anons): ?>
                                <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                            <?php endif; ?>

                            <!--<span class="details"><a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
">посилання</a></span>-->
                                                    </div>
                        
                    </div>      

                    <?php else: ?>
      
                    <div class="news_item">
                        <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) > 0): ?>
                            <div class="timeline-block_img">
                                <img align="left" alt="" src="/uploads/logos_small/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg" />
                            </div>
                        <?php endif; ?>
                        <div class="timeline-block_text">
                                                        <div class="timeline-block__heading f-bold">
                                <?php if ($this->_tpl_vars['data']->is_video): ?>
                                      <span class="btn-video">Відео</span>
                                <?php endif; ?>
                                <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                    <?php echo $this->_tpl_vars['data']->i_name; ?>

                                </a>
                                
                            </div>
                            <?php if ($this->_tpl_vars['data']->i_anons): ?>
                                <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                            <?php endif; ?>
                            <?php if ($this->_tpl_vars['data']->cntat): ?>
                                <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html" class="paperclip-link">
                                    <i class="fas fa-paperclip"></i>
                                    вкладених файлів <?php echo $this->_tpl_vars['data']->cntat; ?>
 
                                </a>
                            <?php endif; ?>    
                            <!--<span class="details">
                                <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">докладніше</a>
                            </span>-->
                                                        <span class="details">
                                                        </span>
                    
                        </div>
     
                    </div>      
      

                    <?php endif; ?> 
                </div>
                
                </div>
            <!-- /timeline-block -->
            <?php endforeach; endif; unset($_from); ?>
        
  
        

  <?php echo $this->_tpl_vars['pagination']; ?>
        
        
    </div>
        <!-- end information_block -->
        </div>
    
    
    </div>
    <!-- /col-md-9 -->
    
    <!-- col-md-3 -->
                          
                
               <div class="col-md-3 right-column-content">
                   <div class="section-heading">Важлива тема</div>
<?php $_from = $this->_tpl_vars['top_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?> 
                    <div class="sub-news main-theme with-data">
                    
                        <div class="sub-news_img">
                            
                        <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) > 0): ?>
                        <img src="/uploads/logos_middle/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg">
                        <?php endif; ?> 
                        </div>
                    <div class="sub-news_heading">
                        <b>
                    <?php if (! $this->_tpl_vars['data']->i_link): ?>
                           <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a>  
                    <?php else: ?> 
                            <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
"><?php echo $this->_tpl_vars['data']->i_name; ?>
 </a>    
                    <?php endif; ?>
                    </b>
                    </div>
                    <span class="sub-news_date"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
 <?php echo $this->_tpl_vars['data']->hour; ?>
</span>  
                                
                    
                    </div>
               <?php endforeach; endif; unset($_from); ?> 
<?php $_from = $this->_tpl_vars['block_data']['5']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?> 
                    <div class="sub-news main-theme with-data">
                    
                        <div class="sub-news_img">
                            
                        <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) > 0): ?>
                    <img src="/uploads/logos_small/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg">
                                        <?php endif; ?> 
                    </div>
                    <div class="sub-news_heading">
                    <?php if (! $this->_tpl_vars['data']->i_link): ?>
                           <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a>  
                    <?php else: ?> 
                            <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
"><?php echo $this->_tpl_vars['data']->i_name; ?>
 </a>    
                    <?php endif; ?>
                    </div>
                    <span class="sub-news_date"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
 <?php echo $this->_tpl_vars['data']->hour; ?>
</span>  
                                
                    
                  </div>
               <?php endforeach; endif; unset($_from); ?> 
                    
                  
              <div class="section-heading"> <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
">Переглянути ще</a></div>
              

                <div class="section-heading">Тематичні розділи</div>

                <a href="#" class="tags">урочисті заходи</a>
                <a href="#" class="tags">семінар-тренінг</a>
                <a href="#" class="tags">РЕФОРМИ</a>
                <a href="#" class="tags">засідання</a>
                <a href="#" class="tags">голос україни</a>
                <a href="#" class="tags">комітет з питань охорони здоров’я</a>
                <a href="#" class="tags">офіційний візит</a>


                <!-- digest -->
                <div class="full-mob-width">
                    <div class="digest-section digest-small">
                        <div class="content">
                                                        <div class="digest-section__heading">
                                <span class="fa-2x">
                                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1" data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                                </span>
                                <p>Підписка на анонси та новини</p>                
                            </div>

                            <p>Отримуйте головне з вебпорталу у свою скриньку</p>

                            <form method="post" action="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/subscribe/index">
                                                                <div class="input-group">
                                    
                                    <button class="btn btn-white" type="submit">Налаштувати</button>

                                </div>

                            </form>

                        </div>
                    </div>
                </div>
                <!-- /digest -->

            </div>
            <!-- /col-md-3 -->
        </div>
    <!-- /row -->
</div>
<!-- /right_col -->
    
    













