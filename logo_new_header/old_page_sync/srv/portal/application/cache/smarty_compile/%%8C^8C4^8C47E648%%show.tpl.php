<?php /* Smarty version 2.6.22, created on 2024-04-10 12:43:50
         compiled from news/show.tpl */ ?>

<?php if ($this->_tpl_vars['is_news_subsite']): ?>
   <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'news_subsite/newcenter_menu.tpl', 'smarty_include_vars' => array()));
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

                    
        <div class="publications-heading__block no-border-top">
            <h2><?php echo $this->_tpl_vars['item']->i_name; ?>

            </h2>
            <p>
                <?php if ($this->_tpl_vars['item']->i_author): ?>
                    <?php echo $this->_tpl_vars['item']->i_author; ?>
<br>

            <?php endif; ?> 
                Опубліковано <?php echo $this->_tpl_vars['item']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['item']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['item']->year; ?>
, о <?php echo $this->_tpl_vars['item']->hour; ?>
:<?php echo $this->_tpl_vars['item']->minute; ?>

            </p>

                    </div>

        <!-- main-content -->
        <div class="main-content">
            <div class="row">
                <div class="text-column col-md-6">
                    <div class="item_content">
                        <?php if ($this->_tpl_vars['item']->i_full): ?>
                        <?php echo $this->_tpl_vars['item']->i_full; ?>

                    <?php else: ?>
                        <?php echo $this->_tpl_vars['item']->i_anons; ?>

                    <?php endif; ?>  
                    
                    
                    </div>
                    
                    <!-- social-aside -->
                    <div class="social-aside">
                        <div>
                            <div class="share-block">
                                                                <div class="like-item">
                                                        <div class="fb-share-button" data-href="https://www.rada.gov.ua<?php echo $this->_tpl_vars['base_url']; ?>
<?php echo $this->_tpl_vars['i_id']; ?>
.html" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://www.rada.gov.ua<?php echo $this->_tpl_vars['base_url']; ?>
<?php echo $this->_tpl_vars['i_id']; ?>
.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поділитись</a></div>
                                                        
                                                                                                          </div>
                        <div class="like-item">
                            <span class="twitter-share-button-ico">
<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</span>
                        </div>
                        <div class="like-item">
                            <a href="https://telegram.me/share/url?url=https://www.rada.gov.ua<?php echo $this->_tpl_vars['base_url']; ?>
<?php echo $this->_tpl_vars['i_id']; ?>
.html&text=<?php echo $this->_tpl_vars['item']->i_name; ?>
" target="_blank">
<i class="fab fa-telegram-plane"></i>
</a>
                        </div>
                                                <div class="like-item">
                            <a href="http://m.me/" target="_blank">
<i class="fab fa-facebook-messenger"></i>
</a>
                        </div>

                            </div>

                        </div>
                    </div>
                    <!-- /social-aside -->

                    <a href="<?php echo $this->_tpl_vars['base_url']; ?>
" class="back-to">
                        <i class="fas fa-long-arrow-alt-left"></i>
                        Повернутись до публікацій
                    </a>

                    <p class="text-center float_right">
                        <a href="/print/<?php echo $this->_tpl_vars['i_id']; ?>
.html" class="btn btn-print"><span>Версія для друку</span></a>
                    </p>

                </div>
                    <span class="social-aside-stop"></span>
                <div class="aside-column col-md-3">
                    <div class="section-heading">
                                                <span>Ще за розділом</span>   
                        <h3>&ldquo;<?php echo $this->_tpl_vars['current_node']->t_name; ?>
&rdquo;</h3>   </div>

                    
<div>
<?php $_from = $this->_tpl_vars['other_items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?> 
    <div class="public-date">
                        <?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
 <?php echo $this->_tpl_vars['data']->hour; ?>
:<?php echo $this->_tpl_vars['data']->minute; ?>

                    </div>  
                    
                    <div>
                            
                    
                    <?php if (! $this->_tpl_vars['data']->i_link): ?>
                        <h6>  <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a> </h6>
                    <?php else: ?> 
                        <h6>    <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
"><?php echo $this->_tpl_vars['data']->i_name; ?>
 </a> </h6>
                    <?php endif; ?>
                    
                                
                    </div>
                               
               <?php endforeach; endif; unset($_from); ?> 

               
              <div class="more-link text-right"> 
                  <a href="<?php echo $this->_tpl_vars['base_url']; ?>
">Переглянути ще</a>
              </div>
               
</div> 
               

                </div>
            </div>
        
                    <?php if ($this->_tpl_vars['item']->comment_type > 0): ?>
                                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "news/comments.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
                            <?php endif; ?>
                    <hr>
                    
                    
                    
                    
                    </div>
        <!-- /main-content -->

<?php echo '
<script>

    $(function () {


        $(\'.sections_tabs li a.active\').parent().addClass(\'selected\');

        // TinyNav.js 1
        $(\'.sections_tabs\').tinyNav();

    });
    
    if (($(window).width() > 768)){
        $(function(){
            var a = document.querySelector(\'.social-aside\'), b = null, P = 200;

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
                    R = Math.round(Ra.top + b.getBoundingClientRect().height - document.querySelector(\'.social-aside-stop\').getBoundingClientRect().bottom);
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


    $( document ).ready(function() {


        if ($(\'.sections_tabs li a\').hasClass(\'active\')) {
            $(this).parent().addClass(\'selected\');
        }

        $("#test-circle").circliful({
            animationStep: 5,
            foregroundBorderWidth: 15,
            backgroundBorderWidth: 15,
            percent: 72,
            fgcolor: "#556b2f",
            textColor: \'#333\'
        });

        $(\'.nice-select\').niceSelect();

        $(\'.slider-main\').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: \'.slider-nav\'
        });
        $(\'.slider-nav\').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            asNavFor: \'.slider-main\',
            focusOnSelect: true,
            centerMode: true,
            centerPadding: "40px",
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        dots: true,
                        infinite: true,
                        slidesToShow: 1,


                    }
                }
            ]
        });


    });




</script>

'; ?>
