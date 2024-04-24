<?php /* Smarty version 2.6.22, created on 2024-03-18 16:58:51
         compiled from preview/show.tpl */ ?>
  
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

        <div class="publications-heading">Анонси подій</div>

        <div class="publications-heading__block">
            <h2>
                <?php echo $this->_tpl_vars['item']->i_name; ?>

            </h2>
            <p class="small-text">
                <?php if ($this->_tpl_vars['item']->i_author): ?>
               <?php echo $this->_tpl_vars['item']->i_author; ?>


            <?php endif; ?> 
            </p>
                    </div>


        <div class="main-content">
            <div class="row">
                <div class="text-column height-auto col-md-6">
                    <!-- -->
                    <div class="announcement-section">
                        <div class="announcement-block">
                            <div class="duration">
                            </div>
                            <div class="announcement-data">
                                <span class="a-data"><?php echo $this->_tpl_vars['item']->day; ?>
</span>
                                <span class="a-month"><?php echo $this->_tpl_vars['item']->month; ?>
</span>
                                <span class="a-year"><?php echo $this->_tpl_vars['item']->year; ?>
</span>
                            </div>
                        </div>

                        <div class="announcement-block">
                            <div class="duration">
                            </div>
                            <div class="announcement-data">
                                <span class="time"></span>
                                <?php echo $this->_tpl_vars['item']->hour; ?>
<sup><?php echo $this->_tpl_vars['item']->minute; ?>
</sup>
                                                            </div>
                        </div>

                        <div class="add-to-calendar">
                            <span class="new-cal-anons"></span>
                        </div>

                    </div>

                    <!-- -->
                </div>

              <?php if ($this->_tpl_vars['current_node']->t_seo_name == 'anons_acred'): ?>               
                <div class="aside-column col-md-3">
                    <div class="to-accredit">
                        <p>Представникам засобів массової інформації необхідно акредитуватися на подію</p>

                        <a href="https://iportal.rada.gov.ua/fba" class="btn-more normal">
                            Акредитуватися
                        </a>
                    </div>
               



                </div>
              <?php endif; ?>
            </div>
            <div class="row">
                <div class="text-column col-md-6">

                    <div class="item_content">
                        <p>  <?php if ($this->_tpl_vars['item']->i_full): ?>
                        <?php echo $this->_tpl_vars['item']->i_full; ?>

                    <?php else: ?>
                        <?php echo $this->_tpl_vars['item']->i_anons; ?>

                    <?php endif; ?> </p>
                    </div>

                    <br>

                    
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
                            <a href="http://m.me/verkhovna.rada.ukraine/" target="_blank">
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
                        Повернутись до календаря подій
                    </a>



                </div>
                    <span class="social-aside-stop"></span>
                <div class="aside-column col-md-3">

                    <div class="section-heading">
                        Ще анонсовані події
                    </div>

                    <div>
<?php $_from = $this->_tpl_vars['other_items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
    <div class="public-date"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
, <?php echo $this->_tpl_vars['data']->hour; ?>
:<?php echo $this->_tpl_vars['data']->minute; ?>
</div>
                    
                    <div >
                                          
                    <?php if (! $this->_tpl_vars['data']->i_link): ?>
                        <p>  <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a> </p>
                    <?php else: ?> 
                        <p>    <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
"><?php echo $this->_tpl_vars['data']->i_name; ?>
 </a> </p>
                    <?php endif; ?>
                    
                                
                    </div>
                               
               <?php endforeach; endif; unset($_from); ?> 

               
              <div class="section-heading"> <a href="/<?php echo $this->_tpl_vars['class_name']; ?>
/<?php echo $this->_tpl_vars['current_node']->t_seo_name; ?>
">Переглянути ще</a></div>
               
</div> 
                    
                    
                    
                    
                    
                    
                   
                    <div class="request-online__block">
                        <div class="request-online__heading">Відвідай пленарне засідання!</div>
                        <div class="request-online__text mob-hide">Станьте свідком роботи парламенту крaїни — подайте заяву на відвідання пленарного засідання онлайн!</div>

                        <a href="https://itd.rada.gov.ua/idsrv" class="btn-white">Подати заявку</a>
                        <a href="https://itd.rada.gov.ua/SessionRequest" class="request-online__link"><b>Правила <span class="mob-hide">перебування</span></b></a>

                    </div>

                </div>
            </div>


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
            var a = document.querySelector(\'.social-aside\'), b = null, P = 100;

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

//document.getElementsByTagName(\'.new-cal_anons\').appendChild(createCalendar({data:{title:"this is the title of my event", start: new Date(), duration: 90}}));
/*-- Add to Calendar --*/
var myCalendar = createCalendar({
      options: {
        class: \'my-class\',
        
        // You can pass an ID. If you don\'t, one will be generated for you
        id: \'my-id\'
      },
      data: {
        // Event title
        title: '; ?>
'<?php echo $this->_tpl_vars['item']->i_name; ?>
'<?php echo ',

        // Event start date

        start: new Date('; ?>
'<?php echo $this->_tpl_vars['item']->mon; ?>
 <?php echo $this->_tpl_vars['item']->day; ?>
, <?php echo $this->_tpl_vars['item']->year; ?>
 <?php echo $this->_tpl_vars['item']->hour; ?>
:<?php echo $this->_tpl_vars['item']->minute; ?>
'<?php echo '),
        
        // Event duration (IN MINUTES)
        duration: 120,

        // You can also choose to set an end time
        // If an end time is set, this will take precedence over duration
       // end: new Date(\'June 15, 2013 23:00\'),     

        // Event Address
        address: \'The internet\',

        // Event Description
        description: '; ?>
'<?php echo $this->_tpl_vars['item']->i_author; ?>
 <br> <a href = "https://www.rada.gov.ua<?php echo $this->_tpl_vars['base_url']; ?>
<?php echo $this->_tpl_vars['i_id']; ?>
.html">перейти за посиланням </a>'<?php echo '
      }
    });

    document.querySelector(\'.new-cal-anons\').appendChild(myCalendar);
    
    jQuery(function($){
          $(document).mouseup(function (e){
              var div = $(".new-cal-anons");
              if (!div.is(e.target)
                  && div.has(e.target).length === 0) {
                  $(\'.add-to-calendar-checkbox\').prop(\'checked\', false);
              }
          });
      });


    /*-- Add to Calendar --*/




    
</script>
'; ?>