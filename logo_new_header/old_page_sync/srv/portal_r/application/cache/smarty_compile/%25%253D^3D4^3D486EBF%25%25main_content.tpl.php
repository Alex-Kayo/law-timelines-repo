<?php /* Smarty version 2.6.22, created on 2024-02-06 11:42:41
         compiled from main_page/main_content.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'truncate', 'main_page/main_content.tpl', 494, false),)), $this); ?>
<!-- main content -->

<section class="news-line">
    <div class="container">
                 
                <div class="row">
                     <div class="col-lg-6 col-md-12">
            <div class="main-news">
                <div id="carouselExampleControls" class="carousel slide" data-pause="false" data-interval="10000" data-ride="carousel">
                    <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleControls" data-slide-to="0" class="active"><span></span></li>
                                    <li data-target="#carouselExampleControls" data-slide-to="1"><span></span></li>
                                    <li data-target="#carouselExampleControls" data-slide-to="2"><span></span></li>
                                                        </ol>
                    <div class="carousel-inner">
                <?php $_from = $this->_tpl_vars['top_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['j'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['j']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['j']['iteration']++;
?>  
                   <?php if (($this->_foreach['j']['iteration']-1) <= 2): ?> 
                    <div class="carousel-item <?php if (($this->_foreach['j']['iteration']-1) == 0): ?>active<?php endif; ?>">
                    <img alt="" src="/uploads/logos/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg" />
                    <div class="main-news_heading">
                        <small>Важлива тема:</small>
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
                
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="48" height="48" viewBox="0 0 24 24">
                                        <defs>
                                            <path id="a" d="M18.95 11.242L14.706 7l-1.414 1.414 2.535 2.535H5v2h10.828l-2.535 2.535 1.414 1.414 4.242-4.242a.999.999 0 0 0 0-1.414"/>
                                        </defs>
                                        <use class="fill-white" fill-rule="evenodd" transform="matrix(-1 0 0 1 24.243 0)" xlink:href="#a"/>
                                    </svg>
                                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="48" height="48" viewBox="0 0 24 24">
                                        <defs>
                                            <path id="a" d="M18.95 11.242L14.706 7l-1.414 1.414 2.535 2.535H5v2h10.828l-2.535 2.535 1.414 1.414 4.242-4.242a.999.999 0 0 0 0-1.414"/>
                                        </defs>
                                        <use class="fill-white" fill-rule="evenodd" transform="matrix(-1 0 0 1 24.243 0)" xlink:href="#a"/>
                                    </svg>
                                </a>
                </div>
            </div>
        </div>


                    <div class="col-lg-6">
                        
                        
                        <?php $_from = $this->_tpl_vars['top_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?> 
<?php if (($this->_foreach['i']['iteration']-1) > 2): ?>
                            <div class="main-news-list" style="padding-top: 0.7em;">
                                <span class="date"><?php echo $this->_tpl_vars['data']->hour; ?>
, <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 <?php echo $this->_tpl_vars['data']->year; ?>
</span>                                                                          
                                <p>                                      <?php if ($this->_tpl_vars['data']->is_video): ?>
                                      <span class="btn-video">Відео</span>
                                      <?php endif; ?>
                                       <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                            <?php echo $this->_tpl_vars['data']->i_name; ?>

                                        </a>
                                </p>
                            </div>
                        <?php endif; ?>
                    <?php endforeach; endif; unset($_from); ?>
                     <div class="more-link text-lg-right"><a target ="_blank" href="/news/Top-novyna/ "> Всі топ-новини</a> </div> 
                    </div>
  


                



                    </div>

<hr>


                <div class="row"><!--/row-->
                    <!--javir20102023-->
                        
                        
                        
                    


                        





                    <link rel="stylesheet" type="text/css" href="/sources/css/razom.css" />

                        <div class="col-lg-8">
                        <div class="razom__block">


                        <div class="razom__heading">МИ РАЗОМ - ПРОТИ РОСІЙСЬКОЇ АГРЕСІЇ</div>

                        <a href="https://www.rada.gov.ua/news/razom" class="razom__link" style="padding-right: 0.8rem;background: url('/img/icn-more-s_w.svg') right -7px top 11px no-repeat;"><b>ПЕРЕЙТИ ДО РОЗДІЛУ</b> </a>
                        <br>
                        <a href="https://zakon.rada.gov.ua/laws/main?find=2&user=a&org=1&typ=1%7C2&dat=20220224&datl=2" class="razom__link" rel="noopener" target="_blank" style="padding-right: 0.8rem;background: url('/img/icn-more-s_w.svg') right -7px top 11px no-repeat;"><b>ЗАКОНИ ТА ПОСТАНОВИ, ПРИЙНЯТІ У ВОЄННИЙ ЧАС</b> </a>
                        <br>
                        <br>

                    </div>


                        </div>
                    
                                        <div class="col-lg-4">
                        <div style="text-align: right; font-size: 2rem">
                                                                                                                                            &nbsp;&nbsp;
                            <a class="facebook-ico" href="https://www.facebook.com/CharitableFoundationGloryToUkraine/"
                               target="_blank" title="Фейсбук">
                                <i class="fab fa-facebook-square"></i>
                            </a>
                        </div>

                        
                        <a href=" https://glory2ukraine.rada.gov.ua/ua" target="_blank">

                            <img style="margin-left: 0.77rem; margin-bottom: -0.3em;" src="/img/banners/glory3.png" class="img-fluid" alt="благодійний фонд">
                        </a>
<hr >
                        <a href=" https://u24.gov.ua/" target="_blank">

                            <img  src="/img/banners/united24.png" class="img-fluid" alt="благодійний фонд">
                        </a>
                    </div>
                    


                </div>
            
                 
                    

 
   
    <div class="select-custom">
    <ul class="sections_tabs nav nav-tabs" id="myTab2" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="newsp-tab" data-toggle="tab" href="#newsp" role="tab" aria-controls="newsp" aria-selected="true">
                Новини парламенту
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="newsc-tab" data-toggle="tab" href="#newsc" role="tab" aria-controls="newsc" aria-selected="false">
                Новини комітетів
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" id="newsf-tab" data-toggle="tab" href="#newsf" role="tab" aria-controls="newsc" aria-selected="false">
                Новини фракцій та груп

            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link" id="adver1-tab" data-toggle="tab" href="#adver1" role="tab" aria-controls="newsc" aria-selected="false">
               Новини ТСК
            </a>
        </li>
        
    </ul>
                  
                         
        
</div>
    <div class="tab-content" id="myTabContent">

        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="newsp" role="tabpanel" aria-labelledby="newsp-tab">


            <div id="menu1" class="tab-pane fade show active">
                <div class="row">
                    <div class="col-lg-8">
                        <ul class="main-news-list">
                            
                   
                                                 
                                          
                
                             <?php $_from = $this->_tpl_vars['logo_news_mp']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>
                        <?php if (($this->_foreach['i']['iteration']-1) <= 5): ?>
                        <li>

                        <div class="news-list-item">
                             <div class="news-list-item__title">
                                 <div class="multimedia-item__heading">
                                     <?php if ($this->_tpl_vars['data']->is_video): ?>
                                      <a href="#" class="btn-video">Відео</a>
                                      <?php endif; ?>
                                       <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                            <?php echo $this->_tpl_vars['data']->i_name; ?>

                                        </a>
                                 </div>
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
<?php if (($this->_foreach['i']['iteration']-1) > 5 && ($this->_foreach['i']['iteration']-1) <= 8): ?>
                            <div class="news-item">
                                <span class="date"><?php echo $this->_tpl_vars['data']->hour; ?>
, <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 <?php echo $this->_tpl_vars['data']->year; ?>
</span>                                                                          
                                <p>                                      <?php if ($this->_tpl_vars['data']->is_video): ?>
                                      <span class="btn-video">Відео</span>
                                      <?php endif; ?>
                                       <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                            <?php echo $this->_tpl_vars['data']->i_name; ?>

                                        </a>
                                </p>
                            </div>
                        <?php endif; ?>
                    <?php endforeach; endif; unset($_from); ?>

  
                    <?php $_from = $this->_tpl_vars['fixednews']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>

                            <?php if (($this->_foreach['i']['iteration']-1) <= 1): ?>

                                <div class="news-item">
                                                                        <p>                                         <span class="btn-fixed">До уваги</span>
                                        <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                            <?php echo $this->_tpl_vars['data']->i_name; ?>

                                        </a>
                                    </p>
                                </div>

                            <?php endif; ?>

                        <?php endforeach; endif; unset($_from); ?>
                    
                    <?php if ($this->_tpl_vars['fixednews']->count() > 2): ?>
                            <div   class="more-link text-right"><a target ="_blank" href="/news/fixed_news/ ">Всі новини до уваги</a> </div>

                        <?php endif; ?>
  


                
                    </div>
                    


                </div><!--/row-->

                            </div>

            <div   class="more-link text-right"><a target ="_blank" href="/newscenter">Сайт всіх новин</a> </div>
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="newsc" role="tabpanel" aria-labelledby="newsc-tab">
            
            <!-- /tab 2 -->
            <div id="newsc">
                <br>
                <div class="row">
                    <?php $_from = $this->_tpl_vars['block_data']['6']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                        <div class="col-sm-4">
                            <div class="multimedia-item">
                                <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) > 0): ?>
                                    <div class="multimedia-item__img">
                                        <img src="/uploads/logos_small/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg" class="borderimg" alt="" />
                                        <span class="time"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
 </span>
                                    </div>
                                <?php endif; ?>
                                <div class="multimedia-item__heading">
                                    <?php if ($this->_tpl_vars['data']->is_video): ?>
                                      <span class="btn-video">Відео</span>
                               <?php endif; ?>
                                    <h4><a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
 </a> </h4>   
                                    
                                    <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) == 0): ?> <span class="time grey"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
 </span>
                                        <?php endif; ?>
                                    <text><?php echo $this->_tpl_vars['data']->i_anons; ?>
 </text><br />

                                    </span>

                                                                    </div>
                                           
                            </div>
                        </div>
                    <?php endforeach; endif; unset($_from); ?>


                </div>

                <div class="more-link text-right"><a href="/<?php echo $this->_tpl_vars['block_data']['6']['topic']->i_categories; ?>
">Всі новини комітетів</a> </div>
            </div>
            
        </div>
        <!-- /tab 2 -->

        <!-- tab 2a -->
        <div class="tab-pane fade" id="newsf" role="tabpanel" aria-labelledby="newsf-tab">
            <div class="row">
                <?php $_from = $this->_tpl_vars['block_data']['17']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>
                    <?php if (($this->_foreach['i']['iteration']-1) < 6): ?>

                        <div class="col-sm-4">
                            <div class="multimedia-item">
                                <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) > 0): ?>
                                    <div class="multimedia-item__img">
                                        <img src="/uploads/logos_small/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg" class="borderimg" alt="" />
                                        <span class="time"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
 </span>
                                    </div>
                                <?php endif; ?>
                                <div class="multimedia-item__heading">
                                                                        <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a>

                                </div>
                                <div class="multimedia-item__anons"> <?php echo ((is_array($_tmp=$this->_tpl_vars['data']->i_anons)) ? $this->_run_mod_handler('truncate', true, $_tmp, 250) : smarty_modifier_truncate($_tmp, 250)); ?>
</div>

                                <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) == 0): ?> <span class="time grey"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
 </span>
                                <?php endif; ?>
                                <br>

                            </div>
                        </div>
                    <?php endif; ?>
                <?php endforeach; endif; unset($_from); ?>
                            </div>

            <div class="more-link text-right"><a href="/<?php echo $this->_tpl_vars['block_data']['17']['topic']->i_categories; ?>
"> Всі новини фракцій та груп</a> </div>


        </div>
        <!-- /tab 2a -->


        <!-- tab 3 -->
        <div class="tab-pane fade" id="adver" role="tabpanel" aria-labelledby="adver-tab">
            <div class="row">
                <?php $_from = $this->_tpl_vars['block_data']['11']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>
                    <?php if (($this->_foreach['i']['iteration']-1) < 5): ?>

                        <div class="col-sm-4">
                            <div class="multimedia-item">
                                <div class="multimedia-item__img">
                                    <img alt="" src="/uploads/logos_small/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg" />

                                    <span class="time"> <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
,<?php echo $this->_tpl_vars['data']->hour; ?>
</span>                                      
                                    <!--<a href="#" class="btn-round">Тема1</a>-->
                                </div>
                                <div class="multimedia-item__heading">
                                                                      <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a> </div>
                                <div class="multimedia-item__anons"> <?php echo ((is_array($_tmp=$this->_tpl_vars['data']->i_anons)) ? $this->_run_mod_handler('truncate', true, $_tmp, 250) : smarty_modifier_truncate($_tmp, 250)); ?>
</div>

                            </div>
                        </div>
                    <?php endif; ?>
                <?php endforeach; endif; unset($_from); ?> 
                           </div>
                
            <div class="more-link text-right"><a href="/<?php echo $this->_tpl_vars['block_data']['11']['topic']->i_categories; ?>
"> Всі оголошення</a> </div>
                

        </div>
        <!-- /tab 3 -->
        <!-- tab 4 -->
        <div class="tab-pane fade" id="adver1" role="tabpanel" aria-labelledby="adver1-tab">
           
                                                            <!--<a href="#" class="btn-round">Тема1</a>-->
                                                                                  <div class="row">
                
                    <?php $_from = $this->_tpl_vars['block_data']['7']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>
                        <?php if (($this->_foreach['i']['iteration']-1) < 6): ?>

                            <div class="col-sm-4">
                                <div class="news-item">
                                <span class="date"><?php echo $this->_tpl_vars['data']->hour; ?>
, <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 <?php echo $this->_tpl_vars['data']->year; ?>
</span>
                                <p> <!-- $data->i_anons|truncate:200 -->
                                    <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a> </p>
                            </div></div>
                        <?php endif; ?>
                    <?php endforeach; endif; unset($_from); ?>

                
            </div>

            <div class="more-link text-right"><a href="/<?php echo $this->_tpl_vars['block_data']['7']['topic']->i_categories; ?>
"> Всі новини ТСК</a> </div>


        </div>
        <!-- /tab 4 -->
    </div>
</section>
     





























<link rel="stylesheet" type="text/css" href="/sources/css/memorial.css" />

    <div class="memory__block" onclick="location.href='/memorial'" style="cursor:pointer">
                  <div class="memory__heading " style="padding-top: 0.7em;">   Пам'яті народних депутатів України  </div>
                <div class="memory__heading">  та працівників Апарату Верховної Ради України,  </div>
                <div class="memory__heading"> які загинули внаслідок російської збройної агресії </div>
<div class="text-right">
    
     
                 </div>
  
            </div>



 


    
                  



                                                


                        
<br>

<hr >
<br>
<a  href="/documents/wparl">
    <img style="margin-bottom: 1.5em;" src="/img/banners/wparl.jpg" class="img-fluid" alt="">

</a> <hr> 
<br>
<a  href="/documents/seleb">
    <img style="margin-bottom: 1.5em;" src="/img/banners/seleb.jpg" class="img-fluid" alt="">
</a>

      
    
    
    
    

    
    
<section class="event-calendar">
    <div class="container">
    <div class="row pos_r">
        <div class="col-lg-4 col-md-6 event-calendar-titlle">
            <h2 class="block-heading">Календар подій</h2>
            <div class="event-time mob-hide">
                            </div>
        </div>
        <div class="col-lg-8 col-md-6 event-calendar-arrow">
            <a href="#" class="prev-event">
                <i class="icn-arrow-left"></i>
                Попередні події
            </a>
            <a href="#" class="next-event">
                Наступні події 
                <i class="icn-arrow-right"></i>
            </a>
        </div>
    </div>
    <div class="event-calendar__slider">

        <!-- col 1 -->
        <?php $_from = $this->_tpl_vars['anons_info']['an_date_inf']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['date_anons'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>
                        <div class="<?php echo $this->_tpl_vars['data'][0]['a_day_css_class']; ?>
">
                <div class="event-date"><b><?php echo $this->_tpl_vars['data'][0]['weekday']; ?>
,</b> <?php echo $this->_tpl_vars['data'][0]['day']; ?>
 <?php echo $this->_tpl_vars['data'][0]['name_monts']; ?>
 <?php echo $this->_tpl_vars['data'][0]['year']; ?>
</div>

                <div class="event-list" >
                    <div class="scrollbar-block">
                
                        <?php $_from = $this->_tpl_vars['data']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['k'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['k']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['dat']):
        $this->_foreach['k']['iteration']++;
?>

                                                        <div class="slice3 <?php if (($this->_foreach['k']['iteration']-1) < 3): ?>slice-show<?php endif; ?> event-item ">
                                <span class="time"><?php echo $this->_tpl_vars['dat']['time']; ?>
 </span>
                                <p><a href="<?php echo $this->_tpl_vars['dat']['a_link']; ?>
"><b><?php echo $this->_tpl_vars['dat']['i_name']; ?>
</b></a></p>
                                <!--<span class="live-btn">Наживо</span>-->
                                                                                                                            </div>
                        <?php endforeach; endif; unset($_from); ?>


                            <?php if (($this->_foreach['k']['iteration']-1) > 2): ?>
                            <div class=" event-item load-more">
                                <a href="#" class="other-event">Наступні події цього дня</a>
                            </div>
                            <?php endif; ?>
                    </div>

                </div>


            </div>
        <?php endforeach; endif; unset($_from); ?>  
        <!-- /col 1 -->
      
        <!-- col 2 -->
                <div>
                    <div class="zero-events">
                        <div class="zero-events__title">
                            Поки що, запланованих подій на майбутнє більше немає
                        </div>
                        

                        <p>Завітайте пізніше, можливо, наші менеджери як раз працюють над додаванням нових подій.</p>

                        
                                            </div>

                </div>
                <!-- /col 2 -->

                <!-- col 3 -->
                <div>
                    <div class="quote__title">
                        Наступний, весело освітлений день — плід учорашнього, так само як добра старість — нагорода гарної юності.
                    </div>

                    <div class="quote__author">
                        <a href="#">
                            Григорій Сковорода
                            <i class="icn-external"></i>
                        </a>
                    </div>
                    <div class="quote__data">
                        (1722—1794)
                    </div>
                    <p>
                        видатний український філософ-містик, богослов, поет, педагог, можливо, і композитор літургійної музики
                    </p>

                </div>
                <!-- /col 3 -->

    </div>
    <div class="more-link">
        <a href="/preview/anonsy_podij">Усі анонсовані події</a>
    </div>
    </div>
</section>


<?php if ($this->_tpl_vars['is_plenar']): ?>

    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'main_page/plenar_week.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php else: ?>
 
 
    <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'main_page/no_plenar_week.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
    

<?php endif; ?>


<section class="request-online" id="visit_to_parlament"style="border: 1px solid #D0D3D7;border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid; border-left-width: 0px; border-right-width: 0px;">
    <div class="container">
    <div class="row">
        <div class="col-lg-6 col-sm-12">
            
            
            <div class="data-ukr__block">
                            <div class="data-ukr-heading">Український <br>парламентаризм</div>
                            <div class="baner_col" style="display: table-cell;width: 20%;">
                            <ul class="data-ukr__links">
                                <li><a href="https://www.google.com/maps/@50.4471293,30.5372882,3a,90y,320.72h,109.31t/data=!3m7!1e1!3m5!1sAF1QipPOQAVyRBdT_NfS8AJLHxEilvX6PEizMTqAQbJN!2e10!3e12!7i11000!8i5500"  class="tour-link" target="_blank">3D тур парламентом</a></li>
                                <li><a href="#" class="history-link">Історія</a><span class="soon-txt">Незабаром</span></li>
                                <li><a href="#" class="modernity-link">Сучасність</a><span class="soon-txt">Незабаром</span></li>
                            </ul>
                            </div>



                        </div>
            
        </div>
            <div class="col-lg-3 col-sm-12">

                        <div class="open-data__block size-sm">
                            <div class="open-data__heading">Відкриті <br>парламентські дані</div>
                            <div class="open-data__text mob-hide">Ukrainian Parliament Open Data</div>
                            <a href="https://opendata.rada.gov.ua" target="_blank" class="open-data__link"><b>Перейти на портал</b></a>
                        </div>

                    </div>
                                <div class="col-lg-3 col-sm-12">
                        <div class="faq-blocks" >
                            <div class="faq-online size-s" style="height: 270px;">
                                <img src="img/icn-emoji.png" width="64" height="64" alt="" />
                                <div class="faq-tooltip">
                                    <div class="message-row">
                                        <span>Наші вітання!</span>
                                    </div>
                                    <div class="message-row">
                                        <span>Маєте запитання до Верховної Ради України?</span>
                                    </div>
                                </div>
                                <p>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/services/appeal-of-citizens/" class="faq-link_online">Напишіть своє звернення</a>
                                </p>
                            </div>
                        </div>
                    </div>
            </div>
    </div>
</section>






<section class="bill-section">
<div class="container">
    <h2 class="block-heading">Законопроекти</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="true">
                Останні зареєстровані
            </a>
        </li>
                <li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Архів законопроектів
            </a>
        </li> 

    </ul>
    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo" class="search-by-link">Пошук <span class="tab-hide">за реквізитами</span></a>
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest" role="tabpanel" aria-labelledby="latest-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">
                    <?php $_from = $this->_tpl_vars['block_data']['3']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                        <?php if ($this->_tpl_vars['data']->i_link): ?>                    
                            <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
" target="_blank" class="bill-item">
                        <?php else: ?>
                            <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html" target="_blank" class="bill-item">
                        <?php endif; ?>

                            <span class="btn-fill"><b><?php echo $this->_tpl_vars['data']->i_name; ?>
</b> від <b> <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 <?php echo $this->_tpl_vars['data']->year; ?>
</b></span>
                            <span class="btn-red">Новий</span>

                            <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                             
                        </a>
                    <?php endforeach; endif; unset($_from); ?> 
</div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">Законотворча діяльність</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/period">
                                        Зареєстровані за поточний тиждень
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/ProvidedDeputy">
                                        Надано народним депутатам
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li><a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/providedDeputyRelDoc">Надано народним депутатам до законопроектів <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                        
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/commBillProc">
                                        Знаходяться на розгляді в комітетах
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/lawList">
                                        Прийняті на поточній сесії
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                    
                    <hr class="light">

                            <div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    <i class="icn-paperclip"></i> Правила оформлення проектів законів та основні вимоги законодавчої техніки                                    
                                </a>
                                <p class="attachment-format">PDF 3,5 МБайт</p>
                            </div>

                            <hr class="light">
                                
                   
                                
                                    </div>
            </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="more-link">
                        <a href="<?php echo $this->_tpl_vars['block_data']['3']['topic']->i_categories; ?>
">Перейти до розділу</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
            Популярні Content
        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->
        <div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
                        <div class="row">
            <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">
                    <?php $_from = $this->_tpl_vars['block_data']['15']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                        <?php if ($this->_tpl_vars['data']->i_link): ?>
                            <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
" class="bill-item">
                        <?php else: ?>
                            <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html" class="bill-item">
                        <?php endif; ?>

                            <span class="btn-fill"><b><?php echo $this->_tpl_vars['data']->i_name; ?>
</b> від <b> <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 <?php echo $this->_tpl_vars['data']->year; ?>
</b></span>
                           
                            <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>

                        </a>
                    <?php endforeach; endif; unset($_from); ?>
</div>
                </div>
           
 
                    <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">Архів законопроектів <br> (III–IX скликання 1-6 сесії )</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc2">
                                        Пошук законопроектів
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/pkg_zpsended.by_date">
                                        Надано народним депутатам
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                
                            </ul>
                    
                   <hr class="light">

                                                      
                   
                                
                                    </div>
                </div>
<div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="more-link">
                        <a href="<?php echo $this->_tpl_vars['block_data']['15']['topic']->i_categories; ?>
">Перейти до розділу</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /tab 3 -->
    </div>
                 
</div>
        <!-- /tab 3 -->
 
</section>



 



<section class="articles-block">
<div class="container">
    <h2 class="block-heading">Законодавство</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab4" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#popular2" role="tab" aria-controls="popular2" aria-selected="true">
                Останні надходження
            </a>
        </li>
            </ul>
    <a href="https://zakon.rada.gov.ua/go/find" class="search-by-link">Пошук <span class="tab-hide">за реквізитами</span></a>
    <hr class="light">
</div>
    <div class="tab-content" id="myTabContent4">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="popular2" role="tabpanel" aria-labelledby="popular2-tab">

            <div class="row">
                <div class="col-md-8 col-sm-12">
                    
                    <?php $_from = $this->_tpl_vars['block_data']['4']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
     
                            <?php if ($this->_tpl_vars['data']->i_link): ?>                    
                                    <a class="bill-item" href="<?php echo $this->_tpl_vars['data']->i_link; ?>
" target="_blank">
                                <?php else: ?>
                                    <a class="bill-item" href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html" target="_blank">
                                <?php endif; ?>
                            <span class="law-heading">
                                
                            
                                <?php echo $this->_tpl_vars['data']->i_name; ?>
                                 
                               
                            </span>

                            
                            <p class="color-g"><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                        </a>
                    <?php endforeach; endif; unset($_from); ?>
                    
                    <div class="more-link">
                        <a href="<?php echo $this->_tpl_vars['block_data']['4']['topic']->i_categories; ?>
">Перейти до розділу</a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <ul class="gerb-list">
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/254%D0%BA/96-%D0%B2%D1%80">Конституція України</a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/t21">Кодекси України</a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/tt1001">Закони України</a></li>
                    </ul>
                    <ul class="ul-list">
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/country">Міжнародні документи <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/translation">Переклади документів <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/klas">Розподіл документів, згідно юридичної класифікації<i class="icn-chevron-right"></i> </a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/perv">Первинні законодавчі акти <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/koms">Розподіл прийнятих законодавчих актів за комітетами Верховної Ради <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/termin">Термінологія законодавства <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/eurovoc">Тезаурус «Eurovoc» <br>(українська версія) <i class="icn-chevron-right"></i></a></li>
                                                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/days">Календар офіційних дат <i class="icn-chevron-right"></i></a></li>
                    </ul>
                </div>
            </div>


        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="valid" role="tabpanel" aria-labelledby="valid-tab">
            Набули чинності Content
        </div>
        <!-- /tab 2 -->
    </div>
</div>
</section>
                                
                                
        <section class="blocks-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-12">
                        <div class="rada-tv__block">
                            <img src="img/rada-line.svg" width="269" height="55" alt="" />
                            <div class="rada-tv__text">
                                Парламентський телеканал
                            </div>

                            <a href="/video/rada-tv/64430.html" class="btn-white">Дивитись </a>
                        </div>

                    </div>
                    <div class="col-lg-3 col-sm-12">
                        <div class="golos__block">
                            <img src="img/golos.gif" alt="" />
                            <div class="golos__txt">
                                <p>Газета Верховної Ради України. Новини парламенту та України онлайн</p>

                                <a href="http://www.golos.com.ua/" class="golos__link">Перейти на сайт <span class="icn-external"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-12">
                       <div class="golos__block"  >
                            <img src="img/internship_1.jpg" alt="" />
                            <div class="golos__txt" style="min-height: 140px;">
                                <p> В Апараті реалізується Програма стажування </p>

                                <a href="http://vrkadry.rada.gov.ua/news/dijalnist/stazhuvania/Molod/73244.html" class="golos__link">Перейти на сайт <span class="icn-external"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-12">
                        <a href="https://osvita.rada.gov.ua/" target="_blank" class="educational__block">
                            <span class="educational__heading ">Освітній центр</span> 
                            <span  >
                                Верховної Ради України                        
                            </span><br><br><span class="golos__link">Перейти на сайт </span><span class="icn-external" style="opacity: 1;"></span>
                        </a>
                    </div>
                </div>
            </div>
        </section>


<!--<section class="digest-section">  
    <div class="content">
                      
            <div class="digest-section__heading">
                <span class="fa-2x">
                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1" data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                </span>
                <p>Парламентський дайджест</p>                
            </div>
                        <p>Отримуйте головне з вебпорталу у свою скриньку</p>
            <form method="post" action="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/subscribe/index">
                                
                
                <div class="input-group">
                                        
                                       <button class="btn btn-white" type="submit" title="Налаштувати підписку на анонси">Налаштувати підписку на анонси</button>
                </div>
            </form>             
            
                </div>
</section> -->



<!-- end main content -->