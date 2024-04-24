<?php /* Smarty version 2.6.22, created on 2024-04-05 09:46:15
         compiled from preview/list.tpl */ ?>
<?php echo '
<style>
    #insert_search_data {

        /*font-size: 0.5em;*/
        color: #6e7073;
        /*font-style: italic;*/
        /*text-transform: lowercase;*/
        font-family: "Myriad Pro", Arial;
        /*margin-top: -1em;*/
        position: relative;
        top: -20px;
        /*left: 20px;*/


    }


</style>
'; ?>




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

</div>    

 
 <h3 class="page-heading with-search">
     <span><?php echo $this->_tpl_vars['current_node']->t_name; ?>
</span>


</h3>
    <span id="insert_search_data"> <?php echo $this->_tpl_vars['months_s']; ?>
 <?php echo $this->_tpl_vars['year_s']; ?>
</span>

    <h4 style="padding: 0 0 20px 0; color: #14419F " ><b><?php echo $this->_tpl_vars['search_params']['search_topic_name']; ?>
</b></h4>

    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "preview/module_filter.tpl", 'smarty_include_vars' => array('url' => 'preview')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    </div>


 
 
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
                <div class="timeline-block__date">
                        <?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>

                </div>

                    
                <div class="timeline__conteiner">
                    <span class="time"><?php echo $this->_tpl_vars['data']->hour; ?>
<?php echo $this->_tpl_vars['data']->minute; ?>
</span>
                    
                    <?php if ($this->_tpl_vars['data']->i_link): ?>
                    <div class="news_item">
	
                        <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) > 0): ?>
            
                        <div class="timeline-block_img">
                            <img alt="" src="/uploads/logos_middle/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
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

                        </div>
                        
                    </div>      

                    <?php else: ?>
      
                    <div class="news_item">
                        <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) > 0): ?>
                            <div class="timeline-block_img">
                                <img align="left" alt="" src="/uploads/logos_middle/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg" />
                            </div>
                        <?php endif; ?>
                        <div class="timeline-block_text">
                                                        <div class="timeline-block__heading f-bold">
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
                
               <div class="col-md-3">
                   <div class="request-online__block1">
                        <div class="faq-blocks" >
                            <div class="faq-online size-s" style="height: 180px;">
                                <div class="faq-tooltip">
                                    <div class="message-row">
                                        <span>Наші вітання!</span>
                                    </div>
                                    <div class="message-row">
                                        <span>Маєте запитання до Комітету?</span>
                                    </div>
                                </div>
                                <p>
                                    <a target ="_blank" href="/feedback" class="faq-link_online">Напишіть нам</a>
                                </p>
                            </div>
                        </div>
                    </div>
                   <div class="section-heading"></div>
<?php $_from = $this->_tpl_vars['top_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
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
<?php $_from = $this->_tpl_vars['block_data']['3']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
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


                <div class="section-heading">Тематичні матеріали</div>


               <div class="section-heading"> <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/news"> АРХІВ ПУБЛІКАЦІЙ <span class="icn-external" style="margin-bottom: 0.3em;" ></span></a></div>

                    </div>

            </div>
            <!-- /col-md-3 -->
        </div>
    <!-- /row -->
</div>
<!-- /right_col -->
    
    














