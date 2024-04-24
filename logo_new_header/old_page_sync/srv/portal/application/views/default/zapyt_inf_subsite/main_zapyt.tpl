<div class="container">
     
    <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item active">Запити на публічну інформацію</li>
{*            <li class="breadcrumb-item"><a href="/zapyt_inf">Запити на публічну інформацію</a></li>*}
    </ol>
    <div id="menu1" class='anchor-page-section'>
    <div class="page-heading">
            Запити на публічну інформацію (веб-сторінка)


    </div>
    </div>
</div>

<hr class="full-width">

<div class="container">
    
    <div class="row">
            
        <div class="col-lg-9 order-lg-2">
               
                
                <section class="bill-section">
<div class="container">
    <div id="menu1" class='anchor-page-section'>
    <h2 class="block-heading">Інформація з питань доступу до публічної інформації </h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="true">
               Документи  
            </a>
        </li>
          <li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Види інформації
{*                <span class="tab-hide"> Перейти на</span> сайт *}
            </a>
        </li>  
        {*<li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Прийняті на поточній сесії
            </a>
        </li>*}

    </ul>
         
        {*<a target ="_blank" href="https://itd.rada.gov.ua/idsrv/"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide">   Перейти </span>на сайт     </a>*}
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest" role="tabpanel" aria-labelledby="latest-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">

                    {foreach item=data from=$doc_zapyt}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-fill"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}</span>
                            {*<span class="btn-red">Новий</span>*}
{*                            <span class="btn-border">Соціальна політика</span>*}

                            <p>{$data->i_anons}</p>
                             
                        </a>
                    {/foreach} 
</div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">До уваги:</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="/documents/dostpubinfo/dodatkov_pub_info/218369.html">
                                        Інформація запитувачам щодо подання запитів
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="/uploads/documents/72481.doc">
                                       Форма для подання запитів на інформацію
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                 
                            </ul>
                    
                    <hr class="light">

                           {* <div class="attachment-name">
                                <a target ="_blank" href="/uploads/documents/65805.doc">
                                    <i class="icn-paperclip"></i> Форма для подання запитів на інформацію
                                </a>
                                <p class="attachment-format">Файл MSWord, 44 КБайт</p>
                                <p class="attachment-format">Файл Microsoft Word, 44 КБайт</p>
                            </div>*}

{*                            <hr class="light">*}
                                
             
       
                                
                    {*<h2 class="discussion-heading">Обговорення законопроектів</h2>

                    <div class="discussion-item">
                        <span class="btn-fill"><b>№9428-2</b> від <b>04.01.2019</b></span>

                        <!--<div class="rating-block">
                            <span class="fas fa-star checked"></span>
                            <span class="fas fa-star checked"></span>
                            <span class="fas fa-star checked"></span>
                            <span class="fas fa-star checked"></span>
                            <span class="fas fa-star checked"></span>
                        </div>-->

                        <div class="discussion-text"><a href="#">Проект Закону про цивільну зброю і боєприпаси</a></b></div>

                        <p>Залишилось 19 днів</p>
                        <div class="left-day"><span style="width: 71%;"></span></div>
                    </div>

                    <div class="discussion-item">
                        <span class="btn-fill"><b>№9428-2</b> від <b>04.01.2019</b></span>

                        <!--<div class="rating-block">
                            <span class="fas fa-star checked"></span>
                            <span class="fas fa-star checked"></span>
                            <span class="fas fa-star checked"></span>
                            <span class="fas fa-star"></span>
                            <span class="fas fa-star"></span>
                        </div>-->

                        <div class="discussion-text"><a href="#">Проект Закону про внесення змін до деяких законодавчих актів щодо забезпечення відкритості для суспільства інформації про фінансування діяльності громадських об'єднань та використання міжнародної технічної допомоги</a></b></div>

                        <div class="accepted-item">
                                    <i class="fas fa-check"></i>
                                    345 підтримали
                                </div>

                                <div class="declined-item">
                                    <i class="fas fa-times"></i>
                                    188 не підтримали
                                </div>

                                <div class="font14">Обговорення завершено 16 листопада</div>
                    </div>

                    <div class="discussion-item">
                        <span class="btn-fill"><b>№9428-2</b> від <b>04.01.2019</b></span>

                        <!--<div class="rating-block">
                            <span class="fas fa-star checked"></span>
                            <span class="fas fa-star checked"></span>
                            <span class="fas fa-star"></span>
                            <span class="fas fa-star"></span>
                            <span class="fas fa-star"></span>
                        </div>-->

                        <div class="discussion-text"><a href="#">Проект Закону про лобіювання</a></b></div>

                        <p>Залишилось 19 днів</p>
                        <div class="left-day"><span style="width: 71%;"></span></div>
                    </div>

                    <div class="more-link text-right"><a href="#">Усі обговорення</a> </div>*}
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
{*                    <div class="more-link text-right">*}
                    <div class="more-link">
                        <a href="/news/Zapyty_na_informatsiyu/doc_zapyt/">Перейти до розділу</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
        <div id="session">
             <div class="row">
                <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">  
                    {foreach item=data from=$infzapyt_type}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-fill"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}</span>
                            {*<span class="btn-red">Новий</span>*}
{*                            <span class="btn-border">Соціальна політика</span>*}

                            <p>{$data->i_anons}</p>
                             
                        </a> 
                    {/foreach} 
</div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">До уваги:</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="/documents/dostpubinfo/dodatkov_pub_info/218369.html">
                                        Інформація запитувачам щодо подання запитів
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="/uploads/documents/72481.doc">
                                       Форма для подання запитів на інформацію
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                 
                            </ul>
                    
                    {*<hr class="light">

                            <div class="attachment-name">
                                <a target ="_blank" href="/uploads/documents/65805.doc">
                                    <i class="icn-paperclip"></i> Форма для подання запитів на інформацію
                                </a>
                                <p class="attachment-format">Файл MSWord, 44 КБайт</p>
                                <p class="attachment-format">Файл Microsoft Word, 44 КБайт</p>
                            </div>*}

                            <hr class="light">
                                
             
                                
                </div>
            </div>
        </div>
        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->
        {*<div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
              Content
        </div>*}
        <!-- /tab 3 -->
    </div>
</div>
</section>
                
            
            <div id="menu2" class='anchor-page-section' style="padding-top: 2em;">
                <hr>
                <h2 class="hub-page__heading">
                   Зразок запиту до Апарату Верховної Ради України
                    <i class="link-ico"></i>
                </h2>
                            <div class="attachment-name">
                                <a target ="_blank" href="/documents/dostpubinfo/dodatkov_pub_info/218384.html">
{*                                <a target ="_blank" href="#">*}
                                    <i class="icn-paperclip"></i>  Зразок запиту до Апарату Верховної Ради України
                                </a>
                                  <p class="attachment-format">&nbsp; </p>
{*                                <p class="attachment-format">Формат, розмір документу</p>*}
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="/documents/dostpubinfo/dodatkov_pub_info/218369.html">
                                    <i class="icn-paperclip"></i>   Стисле пояснення щодо оформлення та направлення запиту
                                </a>
                                <p class="attachment-format"> &nbsp;</p>
{*                                <p class="attachment-format">Формат, розмір документу</p>*}
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="/documents/dostpubinfo/dodatkov_pub_info/218383.html">
{*                                <a target ="_blank" href="#">*}
                                    <i class="icn-paperclip"></i>   Пояснення щодо оформлення та направлення звернення громадянина
                                </a>
                                <p class="attachment-format"> &nbsp;</p>
{*                                <p class="attachment-format">Формат, розмір документу</p>*}
                            </div>
                 
            </div>
                                
                                    
           
                                     
                <br>
                <hr>
                <section class="bill-section">
<div class="container">
    <div id="menu3" class='anchor-page-section'style="padding-top: 2em;">
    <h2 class="block-heading"> Подання запиту</h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#latest2" role="tab" aria-controls="latest2" aria-selected="true">
             Форми подання запиту
            </a>
        </li>
          <li class="nav-item">
            <a class="nav-link" id="session2-tab" data-toggle="tab" href="#session2" role="tab" aria-controls="session2" aria-selected="false">
                Звіти
{*                <span class="tab-hide"> Перейти на</span> сайт *}
            </a>
        </li>  
        {*<li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Прийняті на поточній сесії
            </a>
        </li>*}

    </ul>
         
        <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide">   Перейти </span>на сайт     </a>
    
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent4">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest2" role="tabpanel" aria-labelledby="latest2-tab">

            <div class="row">
                
                <div class="col-lg-8 col-sm-12">
                     
                    
                    <div class="scrollbar-inner">

                    {foreach item=data from=$forms_zapyt}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-border"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}</span>
                            {*<span class="btn-red">Новий</span>*}
{*                            <span class="btn-border">Соціальна політика</span>*}

                            <p>{$data->i_anons}</p>
                             
                        </a>
                    {/foreach} 
</div>
                </div>
                

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">До уваги:</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="/documents/dostpubinfo/dodatkov_pub_info/218369.html">
                                        Інформація запитувачам щодо подання запитів
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="/uploads/documents/72481.doc">
                                       Форма для подання запитів на інформацію
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                 
                            </ul>
                    
                    <hr class="light">

                            {*<div class="attachment-name">
                                <a target ="_blank" href="/uploads/documents/65805.doc">
                                    <i class="icn-paperclip"></i> Форма для подання запитів на інформацію
                                </a>
                                <p class="attachment-format">Файл MSWord, 44 КБайт</p>
                                <p class="attachment-format">Файл Microsoft Word, 44 КБайт</p>
                            </div>

                            <hr class="light">*}

                                
                     
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
{*                    <div class="more-link text-right">*}
                    <div class="more-link">
                        {*<a href=" /news/Zapyty_na_informatsiyu/doc_zapyt/">Перейти до розділу</a>*}
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="session2" role="tabpanel" aria-labelledby="session2-tab">
        <div id="session2">
             <div class="row">
                <div class="col-lg-8 col-sm-12">
                    
<div class="scrollbar-inner"> 
{*    <div id="menu3" class='anchor-page-section'style="padding-top: 2em;">*}
                    {foreach item=data from=$zvity_pubinf key=key name=i}
                         {if $smarty.foreach.i.index <= 2}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-border"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}</span>
                            {*<span class="btn-red">Новий</span>*}
{*                            <span class="btn-border">Соціальна політика</span>*}

                            <p>{$data->i_anons}</p>
                             
                        </a> 
                            {/if}
                    {/foreach} 
{*</div>*}
                </div> 
                <div class="more-link">
                        <a href="/documents/dostpubinfo/zvity_pubinf/">Перейти до розділу</a>
                    </div>
                </div>


                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">До уваги:</h2>
                    <ul class="ul-list">
                        <li>
                            <a target ="_blank" href="/documents/dostpubinfo/dodatkov_pub_info/218369.html">
                                Інформація запитувачам щодо подання запитів
                                <i class="icn-chevron-right"></i>
                            </a>
                        </li>
                        <li>
                            <a target ="_blank" href="/uploads/documents/72481.doc">
                                Форма для подання запитів на інформацію
                                <i class="icn-chevron-right"></i>
                            </a>
                        </li>

                    </ul>
                    
                    <hr class="light">

                           {* <div class="attachment-name">
                                <a target ="_blank" href="/uploads/documents/65805.doc">
                                    <i class="icn-paperclip"></i> Форма для подання запитів на інформацію
                                </a>
                                <p class="attachment-format">Файл MSWord, 44 КБайт</p>
                                <p class="attachment-format">Файл Microsoft Word, 44 КБайт</p>
                            </div>

                            <hr class="light">*}
                                
                </div>
            </div>
        </div>
        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->
        {*<div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
              Content
        </div>*}
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
                        <li><a href="#menu1" class="scrollLink">Інформація з питань доступу до публічної інформації</a></li>
                        <li><a href="#menu2" class="scrollLink">Зразок запиту до Апарату Верховної Ради України</a></li>
                        <li><a href="#menu3" class="scrollLink">Форми подання запиту</a></li>
                        <li><a href="#menu3" class="scrollLink">Звіти</a></li>
                    </ul>
                </div>
               {* <ul class="section__list">
                        <li><a href="/structure_parlam/arhive_skl" target="_blank">
                            Архів за скликаннями Верховної Ради України  <i class="icn-external"></i>
                            </a></li>
                       
                        </ul>*}
            </div>
            </div>
    
    </div><!--/row-->
        
    </div><!--/container-->
    
    <span class='fixed-block-stop'></span>
    
    {*<hr class="full-width">*}
{literal}
<script>
/*$(document).ready(function(){
        $( "a.scrollLink" ).click(function( event ) {
            event.preventDefault();
            $("html, body").animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 500);
        });
    });   */
    
 

function onScroll(event){
    var scrollPos = $(document).scrollTop();
    $('.contents-pages a').each(function () {
        var currLink = $(this);
        var refElement = $(currLink.attr("href"));
        if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
            $('.contents-pages ul li a').removeClass("active");
            currLink.addClass("active");
        }
        else{
            currLink.removeClass("active");
        }
    });
}

    function onScroll(event){
        var scrollPos = $(document).scrollTop();
        $('.contents-pages a').each(function () {
            var currLink = $(this);
            var refElement = $(currLink.attr("href"));
            if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
                $('.contents-pages ul li a').removeClass("active");
                currLink.addClass("active");
            }
            else{
                currLink.removeClass("active");
            }
        });
    };   




    if (($(window).width() > 768)){
        $(function(){
            var a = document.querySelector('.fixed-block'), b = null, P = 100;

            if(a !== null) {
                window.addEventListener( 'scroll', Ascroll, false );
                document.body.addEventListener( 'scroll', Ascroll, false );
            }
            function Ascroll() {
                if (b == null) {
                    var Sa = getComputedStyle(a, ''), s = '';
                    for (var i = 0; i < Sa.length; i++) {
                        if (Sa[i].indexOf('overflow') == 0 || Sa[i].indexOf('padding') == 0 || Sa[i].indexOf('border') == 0 || Sa[i].indexOf('outline') == 0 || Sa[i].indexOf('box-shadow') == 0 || Sa[i].indexOf('background') == 0) {
                            s += Sa[i] + ': ' +Sa.getPropertyValue(Sa[i]) + '; '
                        }
                    }
                    b = document.createElement('div');
                    b.style.cssText = s + ' box-sizing: border-box; width: ' + a.offsetWidth + 'px;';
                    a.insertBefore(b, a.firstChild);
                    var l = a.childNodes.length;
                    for (var i = 1; i < l; i++) {
                        b.appendChild(a.childNodes[1]);
                    }
                    a.style.height = b.getBoundingClientRect().height + 'px';
                    a.style.padding = '0';
                    a.style.border = '0';
                }
                var Ra = a.getBoundingClientRect(),
                    R = Math.round(Ra.top + b.getBoundingClientRect().height - document.querySelector('.fixed-block-stop').getBoundingClientRect().bottom);
                if ((Ra.top - P) <= 0) {
                    if ((Ra.top - P) <= R) {
                        b.className = 'stop';
                        b.style.top = - R +'px';
                    } else {
                        b.className = 'sticky';
                        b.style.top = P + 'px';
                    }
                } else {
                    b.className = '';
                    b.style.top = '';
                }
                window.addEventListener('resize', function() {
                    a.children[0].style.width = getComputedStyle(a, '').width
                }, false);
            }
        });
    }

</script>
{/literal}