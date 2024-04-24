<div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Головна</a></li>
            <li class="breadcrumb-item active">Громадськості</li>
        </ol>

        <div class="page-heading">
          Адміністративно-територіальний устрій України
        </div>
</div>

<hr class="full-width">

<div class="container">  
    <div class="row">
            <div class="col-lg-3 col-md-9">
                <div class="contents-pages">
                    <h4 class="section-heading">Зміст сторінки</h4>

                    <ul>
                        <li><a href="#menu1" class="scrollLink">Статистика</a></li>
                        <li><a href="#menu2" class="scrollLink">Пошук за реквізитами</a></li>
                        <li><a href="#menu3" class="scrollLink">Довідники</a></li>
                        <li><a href="#menu4" class="scrollLink">Нормативно-правові акти з питань адміністративно-територіального устрою України</a></li>
                        <li><a href="#menu5" class="scrollLink">Місцеві вибори</a></li>
                    </ul>
                </div>
                
                {*
                <h4 class="section-heading">Європейська інтеграція</h4>
                <ul class="section__list">
                    <li><a href="https://zakon4.rada.gov.ua/rada/show/984_a11">Угода про асоціацію між Україною та Європейським Союзом</a></li>
                    <li><a href="/documents/interparlam/110358.html">Стан ратифікації Угоди про асоціацію між Україною та Європейським Союзом</a></li>
                </ul>

                <div class="parline-block">
                    <img src="img/parline.jpg" alt="">
                    <p>
                        <a href="http://archive.ipu.org/parline-e/parlinesearch.asp" target="_blank">
                            <b>Національні парламенти</b> <i class="icn-external"></i>
                        </a>
                    </p>
                    <a href="http://archive.ipu.org/parline-e/parlinesearch.asp" target="_blank">База даних «РARLINE»</a>
                </div>
                *}
                
            </div>
            <div class="col-md-9">
                <h2 class="hub-page__heading">
                    <a id="menu1"></a>
                    Статистика
                    <i class="link-ico"></i>
                </h2>

                <ul class="link-list">
                    <li><a href="http://w1.c1.rada.gov.ua/pls/z7503/povidom">Переглянути статистику</a></li>
                </ul>

                <h2 class="hub-page__heading">
                    <a id="menu2"></a>
                    Пошук за реквізитами
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="http://w1.c1.rada.gov.ua/pls/z7503/zv.cf1">Здійснити пошук</a></li>
                </ul>

                <h2 class="hub-page__heading">
                    <a id="menu3"></a>
                    Довідники
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="http://static.rada.gov.ua/zakon/new/NEWSAIT/ADM/zmist.html">Адміністративно-територіальний устрій</a></li>
                    {*<li><a href="https://static.rada.gov.ua/site/ukr/atuu/dovidnyk/tel_dovidnyk_rad.pdf">Довідник телефонів та поштових адрес місцевих рад об'єднаних територіальних громад</a></li>*}
                    <li><a href="https://static.rada.gov.ua/zakon/new/NEWSAIT/ADM/dov/zmist.html">Довідник телефонів та поштових адрес Верховної Ради Автономної Республіки Крим та місцевих рад</a></li>
                </ul>

                <h2 class="hub-page__heading">
                    <a id="menu4"></a>
                    Нормативно-правові акти з питань адміністративно-територіального устрою України
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="http://w1.c1.rada.gov.ua/pls/z7503/A035">Пошук по областях</a></li>
                    <li><a href="http://w1.c1.rada.gov.ua/pls/z7503/a034">Пошук по роках</a></li>
                </ul>
                
                <h2 class="hub-page__heading">
                    <a id="menu5"></a>
                    Місцеві вибори 
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="/documents/atuu/205955.html">Місцеві вибори 2020</a></li>
                    <li><a href="/documents/atuu/205954.html">Позачергові вибори</a></li>
                    <li><a href="/documents/atuu/46076.html">Місцеві вибори попереднього скликання</a></li>
                    {*<li><a href="https://iportal.rada.gov.ua/fsview/46076.html">Місцеві вибори 2015</a></li>
                    <li><a href="https://iportal.rada.gov.ua/fsview/46086.html">Позачергові місцеві вибори</a></li>*}
                </ul>

            </div>
        </div><!--/row-->
        
    </div><!--/container-->
    
{literal}
<script>
    $(document).ready(function(){
        $( "a.scrollLink" ).click(function( event ) {
            event.preventDefault();
            $("html, body").animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 500);
        });
    });   
</script>
{/literal}