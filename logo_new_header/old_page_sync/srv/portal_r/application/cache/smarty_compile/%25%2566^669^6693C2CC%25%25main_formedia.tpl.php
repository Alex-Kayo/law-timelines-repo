<?php /* Smarty version 2.6.22, created on 2024-01-30 11:25:03
         compiled from formedia_subsite/main_formedia.tpl */ ?>
<?php echo '
    <style>
    @media screen and (max-width: 810px) {
    .event-press{

  }
  }
  </style>
'; ?>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v3.3"></script>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "formedia_subsite/formedia_menu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>


<section class="blocks-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-sm-12">
                <div class="data-ukr__block">

                    <div class="data-ukr-heading">Акредитація</div>
                    <ul class="data-ukr__links">
                        <li>
                            <a href="/news/Poryadok_akredytatsiji/43835.html" class="bi-card-heading" target="_blank">Положення про акредитацію</a></li>
                        <li><a href="#!" class="bi-person-check">Як отримати
                                акредитацію</a></li>
                        <li><a href="/news/Poryadok_akredytatsiji/43754.html" class="bi-card-text">Зразок заяви про
                                акредитацію</a>                        </li>
                    </ul>


                </div>

            </div>

            <div class="col-lg-4 col-sm-12">
                <div class="fbi__block">
                    <div class="fbi-heading">Разова реєстрація</div>
                    <ul class="fbi__links">
                        <li>
                            <a href="/fba" class="bi-card-heading" target="_blank">Oнлайн-реєстрація ЗМІ на подію</a></li>

                    </ul>


                </div>
            </div>
            <div class="col-lg-4 col-sm-12">
                <div class="fbi__block" style="background:  url('/img/press_v3-1.png') right bottom no-repeat;">
                    <div class="fbi-heading">Інформація для акредитованих журналістів</div>
                    <ul class="fbi__links">
                        <li>
                            <a href="#!" class="bi-info-circle" target="_blank">Доступ, перебування та робота у будинках
                                Верховної Ради України</a></li>

                    </ul>

                      
                </div> 
            </div>
        </div>
     <i id="faq"></i>           
    </div>
</section> 
                <section   class="blocks-section"> 
                    
    <div     class="container">
           <h2 class="block-heading">Відповіді на найчастіші запитання (FAQ)</h2>
        <!-- advanced request -->
        <?php $_from = $this->_tpl_vars['faq_media']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['k'] => $this->_tpl_vars['data']):
?>
            <span class="bill-item"><li><h3 id="p-s"><a href="javascript://" class="multimedia-item__heading" data-toggle="collapse"
                            data-target="#advanced<?php echo $this->_tpl_vars['k']; ?>
"><?php echo $this->_tpl_vars['data']->i_name; ?>
 <img src="/img/icn-collapse.svg"> </a>
            </h3></li></span>
            <div id="advanced<?php echo $this->_tpl_vars['k']; ?>
" class="collapse advanced-request">

              <div style="padding: 20px; margin-bottom: 17px; border-left: 8px solid gold;">  <?php echo $this->_tpl_vars['data']->i_full; ?>
 </div>

            </div> 
        <?php endforeach; endif; unset($_from); ?>
    </div>
    
</section>
                
                
 



















 


<!-- ALL THEME SCREEN -->
<section class="news-list-section">

</section>
<!-- /ALL THEME SCREEN -->


<section class="blocks-section">
    <div class="container">
        <div class="row">
            <!-- /advanced request -->


            <div class="col-lg-6">
                <div class="social-section__heading">
                    <i class="fab fa-facebook-square"></i>
                    Фейсбук
                </div>

                <div class="fb-page" data-href="https://www.facebook.com/verkhovna.rada.ukraine/"
                     data-tabs="timeline,events" data-width="500" data-height="" data-small-header="false"
                     data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
                    <blockquote cite="https://www.facebook.com/verkhovna.rada.ukraine/" class="fb-xfbml-parse-ignore"><a
                                href="https://www.facebook.com/verkhovna.rada.ukraine/">Верховна Рада України</a>
                    </blockquote>
                </div>

            </div>

            <div class="col-lg-6">
                <div class="social-section__heading">
                    <i class="fab fa-twitter"></i>
                    Твіттер
                </div>

                <a class="twitter-timeline" data-lang="uk" data-height="500"
                   href="https://twitter.com/verkhovna_rada?ref_src=twsrc%5Etfw">Tweets by verkhovna_rada</a>
                <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
            </div>
        </div><!--/row-->
    </div>
    <!--/social-section-->
</section>











<section class="digest-section">
    <div class="content">
                <div class="digest-section__heading">
                <span class="fa-2x">
                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1"
                       data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                </span>
            <p>Підписка на анонси та новини</p>
        </div>
                <p>Отримуйте головне з вебпорталу у свою скриньку</p>
        <form method="post" action="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/subscribe/index">
            

            <div class="input-group">

                <button class="btn btn-white" type="submit" title="Налаштувати підписку на анонси">Налаштувати підписку
                    на анонси
                </button>
            </div>
        </form>

            </div>
</section>

<?php echo '
    <script>
        $(document).ready(function () {
            $("a.nav-link").click(function (event) {
                // event.preventDefault();
                $("html, body").animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 0);
            });
        });
    </script>
'; ?>
