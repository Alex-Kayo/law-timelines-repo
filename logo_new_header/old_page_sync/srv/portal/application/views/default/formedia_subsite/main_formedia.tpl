{literal}
    <style>
    @media screen and (max-width: 810px) {
    .event-press{

  }
  }
  </style>
{/literal}
<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v3.3"></script>

{*  Хедер та меню змі сайту      *}
{include file= "formedia_subsite/formedia_menu.tpl"}
{*/  Хедер та меню новинного сайту      *}


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
                                акредитацію</a>{*<span class="soon-txt">Незабаром</span>*}</li>
                        <li><a href="/news/Poryadok_akredytatsiji/43754.html" class="bi-card-text">Зразок заяви про
                                акредитацію</a>{*<span class="soon-txt">Незабаром</span>*}
                        </li>
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
{*                <div class="fbi__block" style="background:  url('/img/ref_info.png') right bottom no-repeat;">*}
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
                    
    <div  {*id="faq"*}   class="container">
           <h2 class="block-heading">Відповіді на найчастіші запитання (FAQ)</h2>
        <!-- advanced request -->
        {foreach item=data from=$faq_media key=k}
            <span class="bill-item"><li><h3 id="p-s"><a href="javascript://" class="multimedia-item__heading" data-toggle="collapse"
                            data-target="#advanced{$k}">{$data->i_name} <img src="/img/icn-collapse.svg"> </a>
            </h3></li></span>
            <div id="advanced{$k}" class="collapse advanced-request">

{*                <li>{$data->i_full}</li>*}
              <div style="padding: 20px; margin-bottom: 17px; border-left: 8px solid gold;">  {$data->i_full} </div>

            </div> 
        {/foreach}
    </div>
    
</section>
                
                
 
{*<section class="event-calendar1 blocks-section">*}
{*<div id="presclu" class="news-section">*}
{*    <div class="container">*}
{*     *}
{*        <h2 class="block-heading">Прес-служба Апарату Верховної Ради України</h2>*}
{*<i id="p-s"></i> *}

{*        *}{*        <div class="row">*}
{*        <!--Carousel Wrapper-->*}

{*        *}{*<div class="col-lg-8 col-md-6 event-calendar-arrow " style="max-width: 99%">*}
{*            <div class="event-press mob-hide hidden-sm hidden-xs" >*}
{*            <a href="#" class="prev-event mob-hide"style="margin-right: 80%;">*}
{*                <i class="icn-arrow-left"></i>*}
{*                Попередні*}
{*            </a>*}
{*            <a href="#" class="next-event">*}
{*                Наступні*}
{*                <i class="icn-arrow-right"></i>*}
{*            </a>*}
{*            </div>*}
{*        </div>*}

{* *}
{*        <div class="press-team__slider"> *}
{*           *}{* <div class="event-list" >*}
{*                    *}{*<div class="scrollbar-block">*}

{*            <!-- col slider -->*}

{*            {foreach item=data from=$press_team }*}

{*                <div>*}
{*                    <div class="card mb-2">*}
{*                        <img class="card-img-top" src="/images/press_sluzhba/{$data->i_id}.jpg" alt="">*}
{*                        <div class="card-body">*}

{*                            <h5 class="card-title"><a*}
{*                                        href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>*}
{*                            </h5>*}
{*                            <p class="card-text">{$data->i_name}</p>*}
{*                            <p class="card-text">{$data->i_anons}</p>*}
{*                        </div>*}
{*                    </div>*}
{*                </div>*}

{*            {/foreach}*}

{*           *}{* <div class="card mb-2">*}
{*                        <img class="card-img-top" src="/images/press_sluzhba/202629.jpg" alt="">*}
{*                        <div class="card-body">*}

{*                            <h5 class="card-title"><a href="/news/Sklad_i_struktura_Verkhovnoji_Rady_Ukrajiny/pressteam/202629.html" tabindex="0">Панченко Дарія</a>*}
{*                            </h5>*}
{*                            <p class="card-text">Головний консультант<br></p>*}
{*                        </div>*}
{*                    </div>*}
{*            <!-- !col slider -->*}

{*             <!-- col 2 -->*}

{*                <!-- /col 2 -->*}

{*                <!-- col 3 -->*}
{*                *}{*<div>*}
{*                    <div class="quote__title">*}
{*                        Наступний, весело освітлений день — плід учорашнього, так само як добра старість — нагорода гарної юності.*}
{*                    </div>*}

{*                    <div class="quote__author">*}
{*                        <a href="#">*}
{*                            Григорій Сковорода*}
{*                            <i class="icn-external"></i>*}
{*                        </a>*}
{*                    </div>*}
{*                    <div class="quote__data">*}
{*                        (1722—1794)*}
{*                    </div>*}
{*                    <p>*}
{*                        видатний український філософ-містик, богослов, поет, педагог, можливо, і композитор літургійної музики*}
{*                    </p>*}

{*                </div>*}
{*                <!-- /col 3 -->*}


{*        </div>*}

{*       <div class="col-lg-8 col-md-6 event-calendar-arrow " style="max-width: 99%">*}
{*            <div class="event-press *}{*mob-hide*}{* hidden-sm hidden-xs" >*}
{*            <a href="#" class="prev-event mob-hide"style="margin-right: 80%;">*}
{*                <i class="icn-arrow-left"></i>*}
{*               *}{* Попередні*}
{*            </a>*}
{*            <a href="#" class="next-event" style="float: right; *}{*top: -1.57rem;*}{*" >*}
{*                *}{*Наступні*}
{*                <i class="icn-arrow-right"></i>*}
{*            </a>*}
{*            </div>*}
{*        </div>*}

{*    </div>*}
{*</div>*}
{*</section>*}
 


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
    {*</div>*}<!--/social-section-->
</section>










{*==========Begin Digest======================*}

<section class="digest-section">
    <div class="content">
        {*   <span class="mail-ico"><span class="messages">1</span></span>   *}
        <div class="digest-section__heading">
                <span class="fa-2x">
                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1"
                       data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                </span>
            <p>Підписка на анонси та новини</p>
        </div>
        {* <p>Отримуйте головне з вебпорталу Верховної Ради України у свою скриньку</p> *}
        <p>Отримуйте головне з вебпорталу у свою скриньку</p>
        <form method="post" action="{$lang_prefix}/subscribe/index">
            {* <label for="digest-email">Введіть адресу Вашої електронної пошти</label> *}


            <div class="input-group">

                <button class="btn btn-white" type="submit" title="Налаштувати підписку на анонси">Налаштувати підписку
                    на анонси
                </button>
            </div>
        </form>

        {* <div class="info-ico">
            <i class="fas fa-info"></i>На наступному кроці Ви зможете налаштувати підписку на анонси
        </div>  *}
    </div>
</section>

{*=========End Digest=========================*}
{literal}
    <script>
        $(document).ready(function () {
            $("a.nav-link").click(function (event) {
                // event.preventDefault();
                $("html, body").animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 0);
            });
        });
    </script>
{/literal}
