<?php /* Smarty version 2.6.22, created on 2024-01-31 16:55:36
         compiled from control_function_subsite/main_control_function.tpl */ ?>
<div class="container">
     
    <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item active">Контрольна діяльність</li>
    </ol>
    <div id="menu1" class='anchor-page-section'>
    <div class="page-heading">
         Здійснення контрольних функцій Верховною Радою України   


    </div>
    </div>
</div>

<hr class="full-width">

<div class="container">
    
    <div class="row">
            
        <div class="col-lg-9 order-lg-2">
             <div class="row">
            <div class="col-lg-10 col-md-12">
<div id="menu1" class='anchor-page-section'>
                <div class="time-table bg2" style="background: #153c7d url('/img/bg_zapyt-2.jpg') center center no-repeat;min-height: 270px;">
                    <div class="block-heading" style="padding: 40px;">
                        Депутатські запити

                    </div>
                    <span class="more-link white-link" style="font-size: 1.3rem;">
                        <a href="http://w1.c1.rada.gov.ua/pls/zweb2/pkg_depzap.search_form">Пошук запитів народних депутатів України </a>
                    </span>

                </div>
                </div>


                <div class="resume-text table-block  ">
                    
                    <div class="tr-block">
                        <div class="td-block">
                            <ul class="ul-list with-ico">
                                          
                </ul>
                           
                        </div>
                       
                    </div>
                </div>
                    <div id="menu2" class='anchor-page-section' style="padding-top: 1.3em;"></div>
            </div>
             
        </div> 
                           
                
                     
                <section class="bill-section">
<div class="container">
    <div >
    <h2 class="block-heading">Контроль за діяльністю Кабінету Міністрів України  </h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="true">
               Документи  
            </a>
        </li>
          <li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Звіти і доповіді
            </a>
        </li>  
         <li class="nav-item">
            <a class="nav-link" id="session_cab-tab" data-toggle="tab" href="#session_cab" role="tab" aria-controls="session_cab" aria-selected="false">
               Година запитань до Уряду
            </a>
        </li> 

    </ul>
         
            
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest" role="tabpanel" aria-labelledby="latest-tab">

            <div class="row">
                <div class="col-lg-10 col-sm-12">
<div class="scrollbar-inner">

                    <?php $_from = $this->_tpl_vars['program_dij_kmu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
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

                            <span class="btn-border"><b><?php echo $this->_tpl_vars['data']->i_name; ?>
</b>  </span>
                            
                            <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                             
                        </a>
                    <?php endforeach; endif; unset($_from); ?> 
</div>
                </div>

                            </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="more-link">
                        <a href="/<?php echo $this->_tpl_vars['data']->i_categories; ?>
">Перейти до розділу</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
        <div id="session">
             <div class="row">
                <div class="col-lg-10 col-sm-12">
<div class="scrollbar-inner">  
                    <?php $_from = $this->_tpl_vars['reports_kmu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
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

                            <span class="btn-border"><b><?php echo $this->_tpl_vars['data']->i_name; ?>
</b>  </span>
                            
                            <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                             
                        </a> 
                    <?php endforeach; endif; unset($_from); ?> 
</div>
                </div>

                            </div>
             <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="more-link">
                        <a href="/<?php echo $this->_tpl_vars['data']->i_categories; ?>
">Перейти до розділу</a>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->         
         
        <div class="tab-pane fade" id="session_cab" role="tabpanel" aria-labelledby="session_cab-tab">
        <div id="session_cab">
             <div class="row">
                <div class="col-lg-10 col-sm-12">
<div class="scrollbar-inner">  
                     <?php $_from = $this->_tpl_vars['request_kmu']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
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

                            <span class="btn-border"><b><?php echo $this->_tpl_vars['data']->i_name; ?>
</b>  </span>
                            
                            <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                             
                        </a> 
                    <?php endforeach; endif; unset($_from); ?> 
</div>
                </div>

                            </div>
             <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="more-link">
                          <a href="/<?php echo $this->_tpl_vars['block_data']['13']['topic']->i_categories; ?>
">Перейти до розділу</a>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- /tab 3 -->
    </div>
</div>
</section>
                
            
           
                                <div class="row">
            
                                    <div id="menu3" class='anchor-page-section' style="padding-top: 1.3em;"></div>
                                </div>
                                
                                    
           
                                     
                <section class="bill-section">
<div class="container">
    <div >
    <h2 class="block-heading"> Звіти, доповіді та інша інформація державних органів та посадових осіб</h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#latest2" role="tab" aria-controls="latest2" aria-selected="true">
             Звіти і доповіді
            </a>
        </li>
          <li class="nav-item">
            <a class="nav-link" id="session_inf-tab" data-toggle="tab" href="#session_inf" role="tab" aria-controls="session_inf" aria-selected="false">                
                Інша інформація
            </a>
        </li>  
        
    </ul>
          
            
    
        
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent4">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest2" role="tabpanel" aria-labelledby="latest2-tab">

            <div class="row">
                <div class="col-lg-10 col-sm-12">
<div class="scrollbar-inner">
                     <?php $_from = $this->_tpl_vars['other_reports']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>
                         <?php if (($this->_foreach['i']['iteration']-1) <= 15): ?>
                        <?php if ($this->_tpl_vars['data']->i_link): ?>                    
                            <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
" class="bill-item">  
                        <?php else: ?>
                            <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html" class="bill-item">
                        <?php endif; ?>

                            <span class="btn-border"><b><?php echo $this->_tpl_vars['data']->i_name; ?>
</b>  </span>
                            
                            <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                             
                        </a><?php endif; ?>
                    <?php endforeach; endif; unset($_from); ?> 
</div>
                </div>

                           </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="more-link">
                         <a href="/<?php echo $this->_tpl_vars['data']->i_categories; ?>
">Перейти до розділу</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="session_inf" role="tabpanel" aria-labelledby="session_inf-tab">
        <div id="session_inf">
             <div class="row">
                <div class="col-lg-10 col-sm-12">
<div class="scrollbar-inner"> 
    <div id="menu" class='anchor-page-section' style="padding-top: 1em;">
                    <?php $_from = $this->_tpl_vars['other_inf']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>
                         <?php if (($this->_foreach['i']['iteration']-1) <= 3): ?>
                        <?php if ($this->_tpl_vars['data']->i_link): ?>                    
                            <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
" class="bill-item">  
                        <?php else: ?>
                            <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html" class="bill-item">
                        <?php endif; ?>

                            <span class="btn-border"><b><?php echo $this->_tpl_vars['data']->i_name; ?>
</b>  </span>
                            
                            <p><?php echo $this->_tpl_vars['data']->i_anons; ?>
</p>
                             
                        </a> 
                            <?php endif; ?>
                    <?php endforeach; endif; unset($_from); ?> 
</div>
                </div>                </div>


                <div class="col-lg-2 col-sm-12">
                    
                                                    
             
       
                                
                                    </div>
            </div>
                 <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="more-link">
                         <a href="/<?php echo $this->_tpl_vars['data']->i_categories; ?>
">Перейти до розділу</a>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->
                <!-- /tab 3 -->
    </div>
          
</div>
</section>
                
                
                
                
                
                
                
                
               
                
                
                
                            
             

                            
             
                
             
                
            
                
             

            </div>
            
            
            
            
        <div class="col-lg-3 order-lg-1">
            <div class='fixed-block'>
                <div class="contents-pages">
                    <h4 class="section-heading">Зміст сторінки</h4>

                    <ul>
                        <li><a href="#menu1" class="scrollLink">Депутатські запити</a></li>
                        <li><a href="#menu2" class="scrollLink">Контроль за діяльністю Кабінету Міністрів України </a></li>
                        <li><a href="#menu3" class="scrollLink">Звіти, доповіді та інша інформація державних органів та посадових осіб</a></li>
                                                                    </ul>
                </div>
                           </div>
                           </div>
    
    </div><!--/row-->
        
    </div><!--/container-->
    
    <span class='fixed-block-stop'></span>
    
    <?php echo '
<script>
/*$(document).ready(function(){
        $( "a.scrollLink" ).click(function( event ) {
            event.preventDefault();
            $("html, body").animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 500);
        });
    });   */
    
 

function onScroll(event){
    var scrollPos = $(document).scrollTop();
    $(\'.contents-pages a\').each(function () {
        var currLink = $(this);
        var refElement = $(currLink.attr("href"));
        if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
            $(\'.contents-pages ul li a\').removeClass("active");
            currLink.addClass("active");
        }
        else{
            currLink.removeClass("active");
        }
    });
}

    function onScroll(event){
        var scrollPos = $(document).scrollTop();
        $(\'.contents-pages a\').each(function () {
            var currLink = $(this);
            var refElement = $(currLink.attr("href"));
            if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
                $(\'.contents-pages ul li a\').removeClass("active");
                currLink.addClass("active");
            }
            else{
                currLink.removeClass("active");
            }
        });
    };   




    if (($(window).width() > 768)){
        $(function(){
            var a = document.querySelector(\'.fixed-block\'), b = null, P = 100;

            if(a !== null) {
                window.addEventListener( \'scroll\', Ascroll, false );
                document.body.addEventListener( \'scroll\', Ascroll, false );
            }
            function Ascroll() {
                if (b == null) {
                    var Sa = getComputedStyle(a, \'\'), s = \'\';
                    for (var i = 0; i < Sa.length; i++) {
                        if (Sa[i].indexOf(\'overflow\') == 0 || Sa[i].indexOf(\'padding\') == 0 || Sa[i].indexOf(\'border\') == 0 || Sa[i].indexOf(\'outline\') == 0 || Sa[i].indexOf(\'box-shadow\') == 0 || Sa[i].indexOf(\'background\') == 0) {
                            s += Sa[i] + \': \' +Sa.getPropertyValue(Sa[i]) + \'; \'
                        }
                    }
                    b = document.createElement(\'div\');
                    b.style.cssText = s + \' box-sizing: border-box; width: \' + a.offsetWidth + \'px;\';
                    a.insertBefore(b, a.firstChild);
                    var l = a.childNodes.length;
                    for (var i = 1; i < l; i++) {
                        b.appendChild(a.childNodes[1]);
                    }
                    a.style.height = b.getBoundingClientRect().height + \'px\';
                    a.style.padding = \'0\';
                    a.style.border = \'0\';
                }
                var Ra = a.getBoundingClientRect(),
                    R = Math.round(Ra.top + b.getBoundingClientRect().height - document.querySelector(\'.fixed-block-stop\').getBoundingClientRect().bottom);
                if ((Ra.top - P) <= 0) {
                    if ((Ra.top - P) <= R) {
                        b.className = \'stop\';
                        b.style.top = - R +\'px\';
                    } else {
                        b.className = \'sticky\';
                        b.style.top = P + \'px\';
                    }
                } else {
                    b.className = \'\';
                    b.style.top = \'\';
                }
                window.addEventListener(\'resize\', function() {
                    a.children[0].style.width = getComputedStyle(a, \'\').width
                }, false);
            }
        });
    }

</script>
'; ?>