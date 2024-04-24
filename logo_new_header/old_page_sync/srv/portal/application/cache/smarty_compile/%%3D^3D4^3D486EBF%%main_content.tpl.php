<?php /* Smarty version 2.6.22, created on 2024-04-11 10:41:29
         compiled from main_page/main_content.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'truncate', 'main_page/main_content.tpl', 112, false),)), $this); ?>
<!-- main content -->


<!-- news-section -->
<section>




<!--javir20102023-->
 <!--javir20102023-->


    <div class="news-line">
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs" id="myTab2" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="newsp-tab" data-toggle="tab" href="#newsp" role="tab" aria-controls="newsp" aria-selected="true">
                News from Ukrainian parliament
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="newsc-tab" data-toggle="tab" href="#newsc" role="tab" aria-controls="newsc" aria-selected="false">
                Committee news
            </a>
        </li>
           </ul>
         <a href="en/rss/news" class="rss-btn">RSS</a>
           
        
</div>
              

<div class="tab-content" id="myTabContent">

        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="newsp" role="tabpanel" aria-labelledby="newsp-tab">


            <div id="menu1" class="tab-pane fade show active">
                <div class="row">
                    <div class="col-lg-8">
                        <ul class="main-news-list">
                            
                            <?php $_from = $this->_tpl_vars['top_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
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
                            
                                          
                
                             <?php $_from = $this->_tpl_vars['top_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>  
                    <?php if (($this->_foreach['i']['iteration']-1) > 1 && ($this->_foreach['i']['iteration']-1) < 4): ?>
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
                        
                        
                        <?php $_from = $this->_tpl_vars['logo_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?> 
<?php if (($this->_foreach['i']['iteration']-1) < 4): ?>
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

                            </div>

              <div class="more-link text-right"><a target ="_blank" href="/en/newscenter">All news website</a> </div>
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


                                                                    </div>
                                           
                            </div>
                        </div>
                    <?php endforeach; endif; unset($_from); ?>


                </div>
 <div class="more-link text-right"><a href="/<?php echo $this->_tpl_vars['block_data']['6']['topic']->i_categories; ?>
">All committee news</a> </div>
                <div class="more-link text-right"><a href="/<?php echo $this->_tpl_vars['block_data']['6']['topic']->i_categories; ?>
">Go to section  </a> </div>
            </div>
            
        </div>
        <!-- /tab 2 -->

                <hr style="border-bottom: 1px solid #D0D3D7;background: none;" >
    </div>
            
            
            
            
    </div>
    <!--javir20102023-->
   <!--javir20102023-->
</section>

 

                                     
        <!-- col 1 -->
                              
                                                                                        <!--<span class="live-btn">Наживо</span>-->
                                                                                                                          

                                                        
        <!-- /col 1 -->
      
        <!-- col 2 -->
                
                        
                                                            <!-- /col 2 -->

                <!-- col 3 -->
                                <!-- /col 3 -->

    
                    <!--  -section-workVRU -->
                    
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
        <!--section-work VRU end -->            
                    

        
        <section class="request-online" id="visit_to_parlament"style="border: 1px solid #D0D3D7;border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid;">
    <div class="container">
    <div class="row">
        <div class="col-lg-6 col-sm-12">
            
            
            <div class="data-ukr__block">
                            <div class="data-ukr-heading">Український <br>парламентаризм</div>
                            <ul class="data-ukr__links">
                                <li><a href="https://www.google.com/maps/@50.4471293,30.5372882,3a,90y,320.72h,109.31t/data=!3m7!1e1!3m5!1sAF1QipPOQAVyRBdT_NfS8AJLHxEilvX6PEizMTqAQbJN!2e10!3e12!7i11000!8i5500"  class="tour-link" target="_blank">3D тур парламентом</a></li>
                                <li><a href="#" class="history-link">Історія</a><span class="soon-txt">Незабаром</span></li>
                                <li><a href="#" class="modernity-link">Сучасність</a><span class="soon-txt">Незабаром</span></li>
                            </ul>


                        </div>
            
        </div>
            <div class="col-lg-3 col-sm-12">

                        <div class="open-data__block size-sm">
                            <div class="open-data__heading">Ukrainian Parliament <br>Open Data</div>
                            <div class="open-data__text mob-hide">Ukrainian Parliament Open Data</div>
                            <a href="https://opendata.rada.gov.ua" target="_blank" class="open-data__link"><b>Go to site</b></a>
                        </div>

                    </div>
                    <div class="col-lg-3 col-sm-12">
                        <div class="faq-blocks">
                            <div class="faq-online size-s">
                                <img src="img/icn-emoji.png" width="64" height="64" alt="" />
                                <div class="faq-tooltip">
                                    <div class="message-row">
                                        <span>Наші вітання!</span>
                                    </div>
                                    <div class="message-row">
                                        <span>Any questions to Verkhovna Rada?</span>
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
    <h2 class="block-heading">Draft laws</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="true">
                The last to register
            </a>
        </li>
                
    </ul>
    <a href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc2" class="search-by-link">Search <span class="tab-hide"> by attributes</span></a>
    
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
" class="bill-item">  
                        <?php else: ?>
                            <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html" class="bill-item">
                        <?php endif; ?>

                            <span class="btn-fill"><b><?php echo $this->_tpl_vars['data']->i_name; ?>
</b> at <b> <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 <?php echo $this->_tpl_vars['data']->year; ?>
</b></span>
                            <span class="btn-red">New</span>

                            <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                             
                        </a>
                    <?php endforeach; endif; unset($_from); ?> 
    
                     
</div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">Legislative business</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc555">
                                       Registered over the week elapsed
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/pkg_zpsended.by_date">
                                        Provided to MPs
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc3_current">
                                        Under consideration at committees 
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/lawList">
                                        Passed during the current session
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                    
                    <hr class="light">

                            <div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    <i class="icn-paperclip"></i> Legislative drafting rules and major requirements to lawmaking techniques                                   
                                </a>
                                <p class="attachment-format">PDF 3,5 МBytes</p>
                            </div>

                            <hr class="light">
                                
                                    </div>
            </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="more-link ">
                        <a href="<?php echo $this->_tpl_vars['block_data']['3']['topic']->i_categories; ?>
">Go to section</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
            Popular Content
        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->
        <div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
            Accepted at the current session Content
        </div>
        <!-- /tab 3 -->
    </div>
</div>
</section>



<section class="articles-block">
<div class="container">
    <h2 class="block-heading">Legislation</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab4" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#popular2" role="tab" aria-controls="popular2" aria-selected="true">
                Latest additions of parliamentary enactments
            </a>
        </li>
            </ul>
    <a href="https://zakon.rada.gov.ua/rada/main/a?lang=en" class="search-by-link">Search <span class="tab-hide">by attributes</span></a>
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
                        <div class="bill-item">
                            <div class="law-heading">
                                <?php if ($this->_tpl_vars['data']->i_link): ?>                    
                                    <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
">
                                <?php else: ?>
                                    <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html">
                                <?php endif; ?>
                            
                                <?php echo $this->_tpl_vars['data']->i_name; ?>
 від  <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 <?php echo $this->_tpl_vars['data']->year; ?>

                                
                                </a>
                            </div>

                            
                            <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                        </div>
                    <?php endforeach; endif; unset($_from); ?>
                    
                    <div class="more-link">
                        <a href="<?php echo $this->_tpl_vars['block_data']['4']['topic']->i_categories; ?>
">Go to section</a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <ul class="gerb-list">
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/show/254%D0%BA/96-%D0%B2%D1%80?lang=en">Constitution of Ukraine</a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/t21?lang=en">Ukraine’s codes</a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/tt1001?lang=en">Laws of Ukraine</a></li>
                    </ul>
                    <ul class="ul-list">
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/country?lang=en">International Acts <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/g22?lang=en">Translation of EU legal acts<i class="icn-external"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/perv?lang=en">Primary legislation  <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/koms?lang=en"> Documents by Committees<i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/annot?lang=en">Abstracts of Documents<i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/term?lang=en">Legislative glossary <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/klas?lang=en">Legal classification of documents<i class="icn-chevron-right"></i> </a></li>
                                                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/days?lang=en">Calendar of official dates  <i class="icn-chevron-right"></i></a></li>
                    </ul>
                </div>
            </div>


        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="valid" role="tabpanel" aria-labelledby="valid-tab">
            Laws enured Content
        </div>
        <!-- /tab 2 -->
    </div>
</div>
</section>
                                
                                <section class="blocks-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-sm-12">
                        <div class="rada-tv__block">
                            <img src="img/rada-line.svg" width="269" height="55" alt="" />
                            <div class="rada-tv__text">
                                Парламентський телеканал
                            </div>

                            <a href="/video/rada-tv/64430.html" class="btn-white">Дивитись онлайн </a>
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
                        <a href="https://www.facebook.com/educationcenterofVRU/" target="_blank" class="educational__block">
                            <span class="educational__heading">Освітній центр</span>
                            <span>
                                Верховної Ради України у Facebook
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </section>


 



<!-- end main content -->