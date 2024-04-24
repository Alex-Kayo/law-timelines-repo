<div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item active"><a href="/appointments">Призначення на посади</a></li>
            <li class="breadcrumb-item active">Кандидати на посади</li>
{*            <li class="breadcrumb-item active"><a href="/tsk">Тимчасові комісії Верховної Ради України</a></li>    *}
        </ol>

        <div class="page-heading">           
 
   Кандидати на посади, на які призначає, звільняє, надає згоду на призначення Верховна Рада України 

        </div>
</div>

<hr class="full-width">

<div class="container">  
    <div class="row">
            <div class="col-md-auto col-lg-3 ">
                <div class='fixed-block'>
                <div class="contents-pages">
                    <h4 class="section-heading">Зміст сторінки</h4>

                     <!-- Excursion M -->
                      
{*            <div class="parline-block">*}
            {*<div class="excursion_b size-m">
                <div class="excursion-heading">Законодавчі акти, що стосуються призначень на посади</div>
 

                <a href="#" class="details-link">Детальніше</a>
            </div>*}
{*            </div>*}
            <!-- /Excursion M -->
                    <ul>
                         
                        <li><a href="#menu1" class="scrollLink">Оголошення комітету, до предмета відання якого належить питання призначення </a></li>
                        {*<li><a href="#menu1" class="scrollLink">Кандидати на посади, на які призначає, звільняє, надає згоду на призначення Верховна Рада України </a></li>*}
                        <li><a href="#menu2" class="scrollLink">Інформація та повідомлення про початок прийому пропозицій депутатських фракцій (депутатських груп) стосовно кандидатів на посаду</a></li>
                        <li><a href="#menu3" class="scrollLink">Інформація про кандидатів на посаду</a></li>
                        <li><a href="#menu4" class="scrollLink">Інша інформація відповідно до закону </a></li>
                         
                    </ul>
                </div>
                        <div class="excursion_b size-m">
                            <div class="excursion-heading">Законодавчі акти, що стосуються призначень на посади</div>
                            {*                <p class="mob-hide">Для організованих груп представників підприємств, установ, організацій, навчальних закладів та громадських об'єднань країни</p>*}

                            <a href="#" class="details-link">Детальніше</a>
                        </div>

                {*<h4 class="section-heading">Європейська інтеграція</h4>
                <ul class="section__list">
                    <li><a href="https://zakon4.rada.gov.ua/rada/show/984_a11">Угода про асоціацію між Україною та Європейським Союзом</a></li>*}
                    {*<li><a href="/documents/interparlam/110358.html">Стан ратифікації Угоди про асоціацію між Україною та Європейським Союзом</a></li>*}
                {*</ul>*}
                <!-- Excursion M -->
             
            <!-- /Excursion M -->

                {*<div class="parline-block">
                    <img src="img/parline.jpg" alt="">
                    <p>
                        <a href="https://www.ipu.org/national-parliaments" target="_blank">
                            <b>Національні парламенти</b> <i class="icn-external"></i>
                        </a>
                    </p>
                    <a href="https://data.ipu.org/" target="_blank">База даних «РARLINE»</a>*}
{*                    <a href="http://archive.ipu.org/parline-e/parlinesearch.asp" target="_blank">База даних «РARLINE»</a>*}
{*                </div>*}
            </div>
            </div>
            <div class="col-md-9">
                <h2 class="hub-page__heading">
                    <a id="menu1"></a>
                    Оголошення комітету, до предмета відання якого належить питання призначення
                    <i class="link-ico"></i>
                </h2>
                
                {*            <div id="newsc">*}
           <div class="news-group__list  {*column-2-list*} {*column-list*} ">  
                
                {*----------Динаміка - вивід новин депутатських груп з міжпарламентських зв’язків із зарубіжними країнами---------*}               
                {*{foreach item=data from=$block_data.6.items}
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                    {/foreach}*}
{*                    <div id="newsc">*}
{*                <h4>Новини комітетів</h4>*}
                <br>
                <div class="row">
                    {if !$adv_main_committee[0]->i_id}
                        <div class="bill-item" style="background: #e5ecf9;">
                            <span class="btn-border"style="border: 2px solid #e5ecf9; color: #004bc1;"><b> Інформація оновлюється</b>   </span>
                            <p>  </p></div>
                    {/if}
                    {*{foreach item=data from=$block_data.6.items}*}
                    {foreach item=data from=$adv_main_committee}
                        <div class="  col-lg-4  col-md-6   ">
                             
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p style="font-size: 1.1em;">
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                   
                             
                           {* <div class="multimedia-item">
                                {if strlen($data->i_logoname) > 0}
                                    <div class="multimedia-item__img">
                                        <img src="/uploads/logos_small/{$data->i_logoname}.jpeg" class="borderimg" alt="" />
                                        <span class="time">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>
                                    </div>
                                {/if}
                                <div class="multimedia-item__heading">
                                    {if $data->is_video}
                                      <span class="btn-video">Відео</span>
                                      {/if}
                                    <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name} </a> </h4>
                                    
                                    {if strlen($data->i_logoname) == 0} <span class="time grey">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>
                                        {/if}
                                    <text>{$data->i_anons} </text><br />


                                     
                                </div>
                                          
                            </div>*}
                        </div>
                    {/foreach}


                </div>
            </div>
                     <div class="more-link text-right   "><a href="{$lang_prefix}/{$data->i_categories}">Вся інформація розділу</a> </div>
{*                     <div class="more-link text-right   "><a href="/{$block_data.6.topic->i_categories}">Всі новини розділу</a> </div>*}
 
 

                {*<ul class="link-list">
                    <li><a href="http://w1.c1.rada.gov.ua/pls/mpz2/organizations.mpo_info?o_id=73">Кабінет Міністрів України
(посилання на Постанови Верховної Ради України)</a></li>
                    <li><a href="#">Голова Рахункової палати та інші члени Рахункової палати </a></li>
                    <li><a href="#">Уповноважений Верховної Ради України з прав людини </a></li>
                     
                </ul>*}

                 
            {*</div>
            <div class="col-md-9">*}
               
        
            {*<div class="table-block">
                <div class="tr-block">
                    <div class="td-block">
                        <h2>Новини депутатських груп з міжпарламентських зв’язків із зарубіжними країнами</h2>
                    </div>
                    <div class="td-block">
                        <div class="more-link full-bg">
                            <a id="menu5" href="http://w1.c1.rada.gov.ua/pls/mpz2/organizations.dep_groups">Список усіх депутатських груп</a>
                        </div>
                    </div>
                </div>
                
                
            </div>*}
            <section class="news-group">
        {*<div class="container">*}
                     <a id="menu2" {*href="https://www.rada.gov.ua/"*}>  </a>
                       <h2>Інформація та повідомлення про початок прийому пропозицій депутатських фракцій (депутатських груп) стосовно кандидатів на посаду</h2>
{*                       <div class="more-link full-bg">*}
                            
                        {*</div>*}                    
                     
           {* <div class="table-block  ">
                <div class="tr-block">
                    <div class="td-block">
                        <div class="more-link full-bg">
                            <a id="menu" href="/documents/info_startdoc"> До розділу</a>
                        </div>
                    </div>
                    
                </div>
                
                
            </div>*}
{*            <div id="newsc">*}
           <div class="news-group__list  {*column-2-list*} {*column-list*} ">  
                
                {*----------Динаміка - вивід новин депутатських груп з міжпарламентських зв’язків із зарубіжними країнами---------*}               
                {*{foreach item=data from=$block_data.6.items}
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                    {/foreach}*}
{*                    <div id="newsc">*}
{*                <h4>Новини комітетів</h4>*}
                <br>
                <div class="row">
                    {if !$info_startnews[0]->i_id}
                        <div class="bill-item" style="background: #e5ecf9;">
                            <span class="btn-border"style="border: 2px solid #e5ecf9; color: #004bc1;"><b> Інформація оновлюється</b>   </span>
                            <p>  </p></div>
                    {/if}                    
                    {*{foreach item=data from=$block_data.6.items}*}
                    {foreach item=data from=$info_startnews}
                        <div class="  col-lg-4  col-md-6   ">
                             
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p style="font-size: 1.1em;">
                                     {if $data->i_link}
                        <a href="{$data->i_link}">{$data->i_name}</a>
                        {else}
                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>    
                    {/if}
                                     
                            {*<a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>*}
                                 </p>
                                 </div>
                   
                             
                           {* <div class="multimedia-item">
                                {if strlen($data->i_logoname) > 0}
                                    <div class="multimedia-item__img">
                                        <img src="/uploads/logos_small/{$data->i_logoname}.jpeg" class="borderimg" alt="" />
                                        <span class="time">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>
                                    </div>
                                {/if}
                                <div class="multimedia-item__heading">
                                    {if $data->is_video}
                                      <span class="btn-video">Відео</span>
                                      {/if}
                                    <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name} </a> </h4>
                                    
                                    {if strlen($data->i_logoname) == 0} <span class="time grey">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>
                                        {/if}
                                    <text>{$data->i_anons} </text><br />


                                     
                                </div>
                                          
                            </div>*}
                        </div>
                    {/foreach}


                </div>
            </div>
                     <div class="more-link text-right   "><a href="{$lang_prefix}/{$data->i_categories}">Вся інформація розділу</a> </div>
{*                     <div class="more-link text-right   "><a href="/{$block_data.6.topic->i_categories}">Всі новини розділу</a> </div>*} 
 {*<div class="row">*}<h2 class="hub-page__heading">
                    <a id="menu3"></a>
                  Інформація про кандидатів на посаду
                    <i class="link-ico"></i>
                </h2>

                        {*<div class="more-link full-bg">
                            <a id="menu" href="/appointments/arhive_appntm">Дані про осіб призначених <br>Верховною Радою України</a>
                        </div>*}
                   
<ul class="link-list">
                    <li><a href="https://www.rada.gov.ua/documents/kand_na_pos/kand_na_radprav/">Список кандидатів на посади членів Вищої ради правосуддя</a></li>
                    <li><a href="https://www.rada.gov.ua/documents/kand_na_pos/kand_na_konst_sud/">Список кандидатів на посаду судді Конституційного Суду України </a></li>
                    <li><a href="https://www.rada.gov.ua/documents/kand_na_pos/kand_rah_pal/">Список кандидатів на посади членів Рахункової палати</a></li>
                    <li><a href="https://www.rada.gov.ua/documents/kand_na_pos/kand_advisory_group_exp/">Список кандидатів на посаду члена Дорадчої групи експертів</a></li>
                    <li><a href="https://www.rada.gov.ua/documents/kand_na_pos/kand_deputy_advisory_group_exp/">Список кандидатів на посаду заступника члена Дорадчої групи експертів</a></li>
                    <li><a href="https://www.rada.gov.ua/documents/kand_na_pos/nation_radaua_tvr/">Список кандидатів на посаду члена Національної ради України з питань телебачення і радіомовлення</a></li>
                </ul>
                

 
{* </div>*}
                       {* <hr>*}
  
                   <div class="table-block  ">
                <div class="tr-block">
                    <div class="td-block1 "><a id="menu4" href="https://www.rada.gov.ua/">  </a>
                       <h2>Інша інформація відповідно до закону <i class="link-ico"></i></h2>
                       {*                       <div class="more-link full-bg">*}
                            
                        {*</div>*}
                    </div>
                </div>
                
                
            </div> 
                    <div class="news-group__list  {*column-2-list*} {*column-list*} ">  
                
                                <br>
                <div class="row">
                     {if !$info_appnt_other[0]->i_id}
                        <div class="bill-item" style="background: #e5ecf9;">
                            <span class="btn-border"style="border: 2px solid #e5ecf9; color: #004bc1;"><b> Інформація оновлюється</b>   </span>
                            <p>  </p></div>
                    {/if}
                    {*{foreach item=data from=$block_data.6.items}*}
                    {foreach item=data from=$info_appnt_other}
                        <div class="  col-lg-4  col-md-6   ">
                             
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                           
                        </div>
                    {/foreach}


                </div>
            </div>
    <div class="more-link text-right   "><a href="/documents/app_position/info_appnt_other">До розділу</a> </div>
{*    <div class="more-link text-right   "><a href="{$lang_prefix}/{$data->i_categories}">До розділу</a> </div>*}
                

 
            
        {*</div>*}<!--/container-->
        
    </section>
             </div> 
        
    </div><!--/row-->
     <span class='fixed-block-stop'></span>
    </div><!--/container-->
            
            
 
    
        
    
    
{literal}
<script>
/*$(document).ready(function(){
        $( "a.scrollLink" ).click(function( event ) {
            event.preventDefault();
            $("html, body").animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 500);
        });
    });   */
    
$(document).ready(function () {
    $(document).on("scroll", onScroll);
    
    $('a[href^="#"]').on('click', function (e) {
        e.preventDefault();
        $(document).off("scroll");
        
        $('a').each(function () {
            $(this).removeClass('active');
        })
        $(this).addClass('active');
      
        var target = this.hash,
            menu = target; 
        $target = $(target);
        /*$('html, body').stop().animate({
            'scrollTop': $target.offset().top - 100
        }, 500, 'swing', function () {
            window.location.hash = target;
            $(document).on("scroll", onScroll);
        });*/
           $("html, body").animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 500); /* javir-  скролить в тор при відкритті мапи */
    });
});

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