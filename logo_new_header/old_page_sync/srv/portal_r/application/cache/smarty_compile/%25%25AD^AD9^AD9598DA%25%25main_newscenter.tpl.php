<?php /* Smarty version 2.6.22, created on 2024-02-06 10:17:35
         compiled from news_subsite/main_newscenter.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'truncate', 'news_subsite/main_newscenter.tpl', 83, false),)), $this); ?>
<div id="fb-root"></div>
 
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/uk_UA/sdk.js#xfbml=1&version=v16.0"></script>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "news_subsite/newcenter_menu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>


<div class="news-section">
    <div class="container">
        <div class="row">

            
            <?php $_from = $this->_tpl_vars['top_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>  

                <?php if (($this->_foreach['i']['iteration']-1) == 0): ?>
                    <div class="col-lg-6 col-md-12">
                        <div class="main-news">
                            <img alt="" src="/uploads/logos/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg">
                            <div class="main-news_heading">
                                <small>Важлива тема:</small>
                                <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a>
                            </div>
                        </div>
                    </div>
                <?php elseif (($this->_foreach['i']['iteration']-1) >= 1 && ($this->_foreach['i']['iteration']-1) < 3): ?>
                    <div class="col-lg-3 col-md-6">
                        <div class="sub-news with-data">
                            <div class="sub-news_img">
                                <img alt="" src="/uploads/logos/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg">
                            </div>
                            <div class="sub-news_heading">
                                <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a>
                            </div>
                            <span class="sub-news_date"><?php echo $this->_tpl_vars['data']->hour; ?>
, <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 <?php echo $this->_tpl_vars['data']->year; ?>
</span>
                        </div>
                    </div>
                <?php endif; ?>
            <?php endforeach; endif; unset($_from); ?>       
            
        </div>
    </div>
</div>



<!-- ALL THEME SCREEN -->
<section class="news-list-section">
    <span id="parl_news" class="anchor-section"></span>
    <div class="container">
        <div class="select-custom">
            
        </div>
        <div class="tab-content">

            <!-- tab 1 -->
            <div id="menu1" class="tab-pane fade show active">
                <div class="row">
                    <div class="col-lg-8">
                        <ul class="main-news-list">
                            
                            <?php $_from = $this->_tpl_vars['logo_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>  
                    <?php if (($this->_foreach['i']['iteration']-1) <= 1): ?>
                        <li>

                        <div class="multimedia-item">
                             <div class="multimedia-item__img">
                                 <img alt="" src="/uploads/logos_small/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg" />
                                   <span class="time"> <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
,<?php echo $this->_tpl_vars['data']->hour; ?>
</span>
                             </div>
                                 <div class="multimedia-item__heading">
                                       <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                            <?php echo $this->_tpl_vars['data']->i_name; ?>

                                        </a>
                                 </div>
                                    <div class="multimedia-item__anons"><?php echo ((is_array($_tmp=$this->_tpl_vars['data']->i_anons)) ? $this->_run_mod_handler('truncate', true, $_tmp, 250) : smarty_modifier_truncate($_tmp, 250)); ?>

                                    </div>
                                    </div>
                                    </li>
                    <?php endif; ?>
                <?php endforeach; endif; unset($_from); ?> 
                            
                                          
                
                             <?php $_from = $this->_tpl_vars['logo_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>  
                    <?php if (($this->_foreach['i']['iteration']-1) > 1 && ($this->_foreach['i']['iteration']-1) < 8): ?>
                        <li>

                        <div class="news-list-item">
                             <div class="news-list-item__title">
                                 <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                     <?php echo $this->_tpl_vars['data']->i_name; ?>

                                 </a>
                              </div>
                                 <span class="time grey">
                                       <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
,<?php echo $this->_tpl_vars['data']->hour; ?>

                                    </span>
                                                                        </div>
                                    </li>
                    <?php endif; ?>
                <?php endforeach; endif; unset($_from); ?> 

                            

                        </ul>
                    </div>


                    <div class="col-lg-4">
                        
                        
                        <?php $_from = $this->_tpl_vars['logo_news_mp']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?> 
                                                          <?php if (($this->_foreach['i']['iteration']-1) > 4): ?>            
                            <div class="news-item">
                                <span class="date"><?php echo $this->_tpl_vars['data']->hour; ?>
, <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 <?php echo $this->_tpl_vars['data']->year; ?>
</span>                                                                          
                                <p>                                     <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                        <?php echo $this->_tpl_vars['data']->i_name; ?>

                                    </a> 
                                </p>
                            </div>
                        <?php endif; ?>
                    <?php endforeach; endif; unset($_from); ?>

  



                    </div>
                    


                </div><!--/row-->

                <div class="more-link text-right">
                    <a href="/news/">Архів новин</a>
                </div>
            </div>
            <!-- /tab 1 -->

            <!-- tab 2 -->
            <div id="menu2" class="tab-pane fade">
                2
            </div>
            <!-- /tab 2 -->

            <!-- tab 3 -->
            <div id="menu3" class="tab-pane fade">
                3
            </div>
            <!-- /tab 3 -->
        </div>
    </div>
</section>
<!-- /ALL THEME SCREEN -->

<hr class="full-width" />

<div   class="summary-week-section">
    <div class="container">       
        <div class="row">            
             <div class="col-lg-4 col-md-5">
                 <?php $_from = $this->_tpl_vars['block_data']['13']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>  
                        
                <?php if (($this->_foreach['i']['iteration']-1) == 0): ?>
                                           <div class="main-news" style="max-height: 280px;">
                            <img alt="" src="/uploads/logos/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg" style="height: 280px; object-fit: unset;" >
                            <div class="main-news_heading">
                                <small>Година запитань до уряду:</small>
                                <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a>
                            </div>
                        </div>
                                <?php endif; ?>
            <?php endforeach; endif; unset($_from); ?>      
                                            </div>
      
            <div class="col-lg-8 col-md-7">
                <div class="time-table bg2" style="min-height: 280px;">
                    <div class="block-heading">
                        Підсумки  пленарного тижня
                    </div>
                    <div class="block-heading__date">
                                <?php echo $this->_tpl_vars['next_planar_week_dates']['backward']->day_s; ?>
  <?php echo $this->_tpl_vars['next_planar_week_dates']['backward']->mon_s; ?>

                                – <?php echo $this->_tpl_vars['next_planar_week_dates']['backward']->day_e; ?>
 <?php echo $this->_tpl_vars['next_planar_week_dates']['backward']->mon_e; ?>

                                </div>

                    <span  class="more-link white-link">
                        <a href="/news/pidsumky_plt/">Переглянути</a>
                    </span>

                </div>
            </div>
        </div><!--/row-->
    </div>
</div><!--/summary-week-section-->

<!-- ALL THEME SCREEN 2 -->
<section  class="news-committee">
    <span id="kom_news" class="anchor-section"></span>
    <div class="container">
        <h2  class="block-heading">
            Новини парламентських комітетів
        </h2>

        
        <div class="tab-content">

            <!-- tab 1 -->
            
            
            
                          <div id="menu1-2" class="tab-pane fade show active">
                            <div class="column-3-list">
                    <?php $_from = $this->_tpl_vars['block_data']['6']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                            <div class="news-item">
                                 <span class="date"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
;<?php echo $this->_tpl_vars['data']->hour; ?>
</span>
                                 <p>
                            <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                 <?php echo $this->_tpl_vars['data']->i_name; ?>

                            </a>
                                 </p>
                                 </div>
                    <?php endforeach; endif; unset($_from); ?>
                                </div>
                                          
                             
                        </div>

            <!-- /tab 1 -->

            <!-- tab 2 -->
            <div id="menu2-2" class="tab-pane fade">
                2
            </div>
            <!-- /tab 2 -->


        </div>

        <div class="more-link text-right">
            <a href="/<?php echo $this->_tpl_vars['block_data']['6']['topic']->i_categories; ?>
">Архів новин комітетів</a>
        </div>
    </div>
</section>
<!-- /ALL THEME SCREEN 2 -->

<hr class="full-width" />

<section class="review-section">
    
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <span id="press_review" class="anchor-section"></span>
                <div class="review-section__heading">
                    Огляд газети «Голос України»
                </div>
                <div class="review-section__img">
                    <img src="/files/review1.jpg" alt="" />
                </div>

                
                  
                             
                    <?php $_from = $this->_tpl_vars['block_data']['8']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                            <div class="news-item">
                                 <span class="date"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
;<?php echo $this->_tpl_vars['data']->hour; ?>
</span>
                                 <p>
                            <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                 <?php echo $this->_tpl_vars['data']->i_name; ?>

                            </a>
                                 </p>
                                 </div>
                    <?php endforeach; endif; unset($_from); ?>
                                 
                <div class="more-link text-right">
                    <a href="/<?php echo $this->_tpl_vars['block_data']['8']['topic']->i_categories; ?>
">Більше оглядів газети</a>
                </div>

            </div><!--/col-lg-4-->

            <div class="col-lg-4 col-md-6">
                <div class="review-section__heading">
                    Огляд вісника «Відомості Верховної Ради України»
                </div>
                <div class="review-section__img">
                    <img src="/files/review2.jpg" alt="" />
                </div>

                
                 <?php $_from = $this->_tpl_vars['block_data']['9']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                            <div class="news-item">
                                 <span class="date"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
;<?php echo $this->_tpl_vars['data']->hour; ?>
</span>
                                 <p>
                            <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                 <?php echo $this->_tpl_vars['data']->i_name; ?>

                            </a>
                                 </p>
                                 </div>
                    <?php endforeach; endif; unset($_from); ?>
           

                <div class="more-link text-right">
                    <a href="/<?php echo $this->_tpl_vars['block_data']['9']['topic']->i_categories; ?>
">Більше оглядів вісника</a>
                </div>
            </div><!--/col-lg-4-->

            <div class="col-lg-4 col-md-12 announcement-column">
                <span id="advertisement" class="anchor-section"></span>
                <div class="review-section__heading">
                    Оголошення
                </div>

                                <?php $_from = $this->_tpl_vars['block_data']['10']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                            <div class="news-item">
                                 <span class="date"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
;<?php echo $this->_tpl_vars['data']->hour; ?>
</span>
                                 <p>
                            <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                 <?php echo $this->_tpl_vars['data']->i_name; ?>

                            </a>
                                 </p>
                                 </div>
                    <?php endforeach; endif; unset($_from); ?>

               

                <div class="more-link text-right">
                    <a href="/<?php echo $this->_tpl_vars['block_data']['10']['topic']->i_categories; ?>
">Більше оголошень</a>
                </div>
            </div><!--/col-lg-4-->

        </div><!--/row-->
    </div>
</section>

<hr class="full-width" />





<div class="social-section">
    <div class="container">
        <div class="row">
            
            <div class="col-lg-6">
                <div class="social-section__heading">
                    <i class="fab fa-facebook-square"></i>
                    Фейсбук
                </div>

                <div class="fb-page" data-href="https://www.facebook.com/verkhovna.rada.ukraine/" data-tabs="timeline,events" data-width="500" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/verkhovna.rada.ukraine/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/verkhovna.rada.ukraine/">Верховна Рада України</a></blockquote></div>

            </div>

            <div class="col-lg-6">
                <div class="social-section__heading">
                    <i class="fab fa-twitter"></i>
                    Твіттер
                </div>

                <a class="twitter-timeline" data-lang="uk" data-height="500" href="https://twitter.com/verkhovna_rada?ref_src=twsrc%5Etfw">Tweets by verkhovna_rada</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
            </div>
        </div><!--/row-->
    </div>
</div><!--/social-section-->



<section class="digest-section">  
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
                                        
                                       <button class="btn btn-white" type="submit" title="Налаштувати підписку на анонси">Налаштувати підписку на анонси</button>
                </div>
            </form>             
            
                </div>
</section>

<?php echo '
<script>
    $(document).ready(function(){
        $( "a.nav-link" ).click(function( event ) {
           // event.preventDefault();
            $("html, body");//.animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 0);
        });
    });   
</script>
'; ?>
