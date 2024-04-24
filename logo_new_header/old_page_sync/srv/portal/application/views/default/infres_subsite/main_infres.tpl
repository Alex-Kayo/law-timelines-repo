{*<div class="main">*}
<div class="container">
     
    <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item active">Інформаційні ресурси </li>
{*            <li class="breadcrumb-item"><a href="/zapyt_inf">Запити на публічну інформацію</a></li>*}
    </ol>
    <div id="menu1" class='anchor-page-section'>
    <div class="page-heading">
           Інформаційні ресурси (веб-сторінка):

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
    <h2 class="block-heading">Інформаційні ресурси Верховної Ради України </h2> </div> <br> 
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="true">
               Бібліотечно-бібліографічні ресурси
               
            </a>
        </li>
         {* <li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Види інформації
            </a>
        </li> *} 
        {*<li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Прийняті на поточній сесії
            </a>
        </li>*}

    </ul>
         
        <a target ="_blank" href="http://lib.rada.gov.ua/"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide">    </span>Перейти на сайт     </a>
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest" role="tabpanel" aria-labelledby="latest-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">
{*                    {foreach item=data from=$block_data.3.items}*}
{*<a href="#!" class="bill-item"> 
<span class="btn-border"><b>Бібліотечно-бібліографічні ресурси</b>  </span></a>*}
                    {foreach item=data from=$biblinfres}
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

                {*<div class="col-lg-4 col-sm-12">
                    
                </div>*}
            </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
 
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        {*<div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
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

                            <span class="btn-fill"><b>{$data->i_name}</b>  </span>
                            

                            <p>{$data->i_anons}</p>
                             
                        </a> 
                    {/foreach} 
</div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">До уваги:</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc555">
                                        Інформація про супроводження петицій до Верховної Ради України
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/pkg_zpsended.by_date">
                                        Форма для створення електронної петиції (посилання на форму)
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                 
                            </ul>
                    
                    <hr class="light">

                            <div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    <i class="icn-paperclip"></i> Правила оформлення...
                                </a>
                                <p class="attachment-format">PDF 3,5 МБайт</p>
                            </div>

                            <hr class="light">
                                
             
       
                                
                  
                </div>
            </div>
        </div>
        </div>*}
        <!-- /tab 2 -->

        <!-- tab 3 -->
        {*<div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
              Content
        </div>*}
        <!-- /tab 3 -->
    </div>
</div>
        <hr>
<div class="container">
    <div id="menu2" class='anchor-page-section'>
{*    <h2 class="block-heading">Інформаційні ресурси Верховної Ради України </h2> *}</div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab4" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#latest2" role="tab" aria-controls="latest2" aria-selected="true">
               Інші інформаційні ресурси парламенту
            </a>
        </li>
          <li class="nav-item">
{*               <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">*}
            <a class="nav-link" id="session2-tab" data-toggle="tab" href="#session2" role="tab" aria-controls="session2" aria-selected="false">
                Електронний архів документів
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

    <div class="tab-content" id="myTabContent4">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest2" role="tabpanel" aria-labelledby="latest2-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">
    <a target ="_blank" href="https://research.rada.gov.ua/" class="bill-item"> 
        <span class="btn-border"style="border: 2px solid #cec57e;"><b> Дослідницька служба Верховної Ради України</b> <i class="icn-external"></i> </span>
        <p>  </p></a>
    <a target ="_blank"href="https://osvita.rada.gov.ua/" class="bill-item"> 
        <span class="btn-border"style="border: 2px solid #cec57e;"><b> Освітній Центр Верховної Ради України</b> <i class="icn-external"></i> </span>
        <p>  </p></a>
    <a target ="_blank" href="http://tv.rada.gov.ua/" class="bill-item"> 
        <span class="btn-border"style="border: 2px solid #cec57e;"><b> Державне підприємство "Парламентський телеканал "Рада"</b> <i class="icn-external"></i> </span>
        <p>  </p></a>
                    {*{foreach item=data from=$doc_zapyt}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-fill"><b>{$data->i_name}</b>  </span>
                         

                            <p>{$data->i_anons}</p>
                             
                        </a>
                    {/foreach} *}
</div>
                </div>

                {*<div class="col-lg-4 col-sm-12">
                    
                </div>*}
            </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
 
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
{*                    {foreach item=data from=$block_data.3.items}*}
<a href="/documents" class="bill-item"> 
<span class="btn-border"style="border: 2px solid #cec57e;"><b>Електронний архів документів</b>  </span>
<p>Перелік останніх документів, оприлюднених у рубриках та розділах офіційного веб-сайту Верховної Ради України </p></a>
                     
                            {*<span class="btn-red">Новий</span>*}
{*                            <span class="btn-border">Соціальна політика</span>*}

                            
</div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading"> </h2>
                  {*  <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc555">
                                        Інформація про супроводження петицій до Верховної Ради України
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/pkg_zpsended.by_date">
                                        Форма для створення електронної петиції (посилання на форму)
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                 
                            </ul>*}
                    
                  {*  <hr class="light">

                            <div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    <i class="icn-paperclip"></i> Правила оформлення...
                                </a>
                                <p class="attachment-format">PDF 3,5 МБайт</p>
                            </div>

                            <hr class="light">
                                *}
             
       
                                
                  
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
                
            
            <div id="menu3" class='anchor-page-section' style="padding-top: 1em;">
                <hr>
                {*<h2 class="hub-page__heading">
                  Органи державної влади
                
                </h2>*}
                <h2 class="block-heading"> Органи державної влади</h2> 
                            <div class="attachment-name">
                                <a target ="_blank" href="https://president.gov.ua/">  
                                    <i {*class="icn-paperclip"*}></i>  Президент України
                                </a>
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="https://www.kmu.gov.ua/ua">
                                    <i {*class="icn-paperclip"*}></i>   Кабінет Міністрів України
                                </a>
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="https://supreme.court.gov.ua/supreme/">
                                    <i {*class="icn-paperclip"*}></i>   Верховний Суд
                                </a>
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="https://ccu.gov.ua/">
                                    <i {*class="icn-paperclip"*}></i>   Конституційний Суд України
                                </a>
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="https://hcac.court.gov.ua/hcac/">
                                    <i {*class="icn-paperclip"*}></i> Вищий антикорупційний суд
                                </a>
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="https://cvk.gov.ua/">
                                    <i {*class="icn-paperclip"*}></i> Центральна виборча комісія України
                                </a>
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="https://www.rnbo.gov.ua/">
                                    <i {*class="icn-paperclip"*}></i> Рада національної безпеки і оборони України
                                </a>
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="https://ombudsman.gov.ua/">
                                    <i {*class="icn-paperclip"*}></i> Уповноважений з прав людини
                                </a>
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="https://rp.gov.ua/">
                                    <i {*class="icn-paperclip"*}></i> Рахункова палата України
                                </a>
                            </div>
                  
            </div>
                                
                <br>
                <div id="menu4" class='anchor-page-section'></div><hr>
                <section class="bill-section">
                    
<div class="container">
    
    <h2 class="block-heading"> Зовнішні інформаційні ресурси:</h2>   
    <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">
    <a href="http://radabook.com/" class="bill-item"> 
        <span class="btn-border"style="border: 2px solid #cec57e;"><b>Видавництво Верховної Ради України</b> <i class="icn-external"></i> </span>
        <p>  </p></a>
    <a href="http://www.golos.com.ua/" class="bill-item"> 
        <span class="btn-border"style="border: 2px solid #cec57e;"><b> Газета Верховної Ради України "Голос України"</b> <i class="icn-external"></i> </span>
        <p>  </p></a>
    {*<a href="http://www.interns.org.ua/" class="bill-item"> 
        <span class="btn-border"style="border: 2px solid #cec57e;"><b> ГО "Ліга інтернів"</b> <i class="icn-external"></i> </span>
        <p>  </p></a>*}
    {*<a href="http://radaprogram.org/" class="bill-item"> 
        <span class="btn-border"style="border: 2px solid #cec57e;"><b> Веб-сайт Програми USAID "РАДА" </b> <i class="icn-external"></i> </span>
        <p>  </p></a>*}
                    {*{foreach item=data from=$doc_zapyt}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-fill"><b>{$data->i_name}</b>  </span>
                         

                            <p>{$data->i_anons}</p>
                             
                        </a>
                    {/foreach} *}
</div>
                </div>
 
    
    <hr class="light">
{*</div>*}

    
</div>
</section>
               <br>  

            </div>
            
            
            
            
        <div class="col-lg-3 order-lg-1">
            <div class='fixed-block'>
                <div class="contents-pages">
                    <h4 class="section-heading">Зміст сторінки</h4>

                    <ul>
                        <li><a href="#menu1" class="scrollLink">Інформаційні ресурси Верховної Ради України</a></li>
                        <li><a href="#menu3" class="scrollLink">Органи державної влади</a></li>
                        <li><a href="#menu4" class="scrollLink">Зовнішні інформаційні ресурси</a></li>
                         
                    </ul>
                </div>
                
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