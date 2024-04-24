<!-- main content -->


<!-- news-section -->
<div class="news-section">
    <div class="container">
    <div class="row">
        <div class="col-lg-6 col-md-12">
            <div class="main-news">
                <div id="carouselExampleControls" class="carousel slide" data-pause="false" data-interval="10000" data-ride="carousel">
                    <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleControls" data-slide-to="0" class="active"><span></span></li>
                                    <li data-target="#carouselExampleControls" data-slide-to="1"><span></span></li>
                                    <li data-target="#carouselExampleControls" data-slide-to="2"><span></span></li>
                    </ol>
                    <div class="carousel-inner">
                {foreach item=data from=$top_news key=key name = i}  
                    
                    <div class="carousel-item {if $smarty.foreach.i.index == 0}active{/if}">
                    <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg" height="410"/>
                    <div class="main-news_heading">
                        <small>Важлива тема:</small>
                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                    </div>
                    </div>
                {/foreach} 
                </div>
                
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="48" height="48" viewBox="0 0 24 24">
                                        <defs>
                                            <path id="a" d="M18.95 11.242L14.706 7l-1.414 1.414 2.535 2.535H5v2h10.828l-2.535 2.535 1.414 1.414 4.242-4.242a.999.999 0 0 0 0-1.414"/>
                                        </defs>
                                        <use class="fill-white" fill-rule="evenodd" transform="matrix(-1 0 0 1 24.243 0)" xlink:href="#a"/>
                                    </svg>
                                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="48" height="48" viewBox="0 0 24 24">
                                        <defs>
                                            <path id="a" d="M18.95 11.242L14.706 7l-1.414 1.414 2.535 2.535H5v2h10.828l-2.535 2.535 1.414 1.414 4.242-4.242a.999.999 0 0 0 0-1.414"/>
                                        </defs>
                                        <use class="fill-white" fill-rule="evenodd" transform="matrix(-1 0 0 1 24.243 0)" xlink:href="#a"/>
                                    </svg>
                                </a>
                </div>
            </div>
        </div>

        {foreach item=data from=$block_data.5.items}
            <div class="col-lg-3 col-md-6">
                <div class="sub-news">
                    <div class="sub-news_img">
                        <img src="/uploads/logos_small/{$data->i_logoname}.jpeg" height="203">
                    </div>
                    <div class="sub-news_heading">

                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>

                    </div> 
                    <!--
                    <span class="sub-news_date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>
                    -->
                </div>
            </div>
        {/foreach}       


    </div>
    </div>

</div><!-- /news-section -->

{if $is_plenar}
{*<!-- plenary week -->*}
    {include file='main_page/plenar_week.tpl'}
{*<!-- /plenary week -->*}
{*<a href="pletar_week.tpl"></a>*}
{else}
 
{*    <!-- no_plenar_weeek -->*}
 
    {include file='main_page/no_plenar_week.tpl'}
    

{/if}

<section class="event-calendar">
    <div class="container">
    <div class="row pos_r">
        <div class="col-lg-4 col-sm-6">
            <h2 class="block-heading">Календар подій</h2>
            <div class="event-time mob-hide">
                <span>у Києві</span>
                10:34
            </div>
        </div>
        <div class="col-lg-8 col-sm-6">
            <a href="#" class="prev-event">
                <i class="icn-arrow-left"></i>
                Попередні події
            </a>
            <a href="#" class="next-event">
                Наступні подій 
                <i class="icn-arrow-right"></i>
            </a>
        </div>
    </div>
    <div class="event-calendar__slider">

        <!-- col 1 -->
        {foreach item=data key=date_anons from=$anons_info.an_date_inf name=i}
            {* when need white background add class bg-white to first div *}
            <div class="{$data[0].a_day_css_class}">
                <div class="event-date"><b>{$data[0].weekday},</b> {$data[0].day} {$data[0].name_monts} {$data[0].year}</div>

                <div class="event-list" >
                    <div class="scrollbar-inner">
                
                        {foreach item=dat from=$data name=k}

                            {*                        <div class="slice3 slice-show event-item event-item__live">*}
                            <div class="slice3 {if $smarty.foreach.k.index<3}slice-show{/if} event-item ">
                                <span class="time">{$dat.time} </span>
                                <p><a href="{$dat.a_link}"><b>{$dat.i_name}</b></a></p>
                                <!--<span class="live-btn">Наживо</span>-->
                                {*                                <span class="rada-tv__label"><b>RADA</b>TV</span>*}
                                {*                                <a href="http://iportal.rada.gov.ua/fba" class="btn-more">Акредитація</a>*}
                                {*                                <a href="#" class="youtube-btn" tabindex="0"></a>*}
                            </div>
                        {/foreach}

{*                        {if $smarty.foreach.k.last && $smarty.foreach.k.index>2}    *}

{*                        {/if}      *}
                            {if $smarty.foreach.k.index>2}
                            <div class=" event-item load-more">
{*                                Наступні події цього дня*}
                                <a href="#" class="other-event">Наступні події цього дня</a>
                            </div>
                            {/if}
                    </div>

                </div>


            </div>
        {/foreach}  
        <!-- /col 1 -->
      
        <!-- col 2 -->
                <div>
                    <div class="zero-events">
                        <div class="zero-events__title">
                            Поки що, запланованих подій на майбутньє більше немає
                        </div>
                        

                        <p>Завітайте пізніше, можливо, наші менеджери як раз працюють над додаванняном нових подій.</p>

                        <p>Приєднуйтесь до нашого календаря, для того, щоб залишатись в курсі усіх подій, що відбуваються у парламенті:</p>

                        <div class="calendar-link">
                            <a href="#">
                                <i class="fa-calendar-alt"></i>
                                Приєднатися до календаря
                            </a>
                            
                
                            <small>
                                За посиланням — URL на підписку до календаря у форматі iCalendar
                            </small>
                        </div>
                    </div>

                </div>
                <!-- /col 2 -->

                <!-- col 3 -->
                <div>
                    <div class="quote__title">
                        Наступний, весело освітлений день — плід учорашнього, так само як добра старість — нагорода гарної юності.
                    </div>

                    <div class="quote__author">
                        <a href="#">
                            Григорій Сковорода
                            <i class="icn-external"></i>
                        </a>
                    </div>
                    <div class="quote__data">
                        (1722—1794)
                    </div>
                    <p>
                        видатний український філософ-містик, богослов, поет, педагог, можливо, і композитор літургійної музики
                    </p>

                </div>
                <!-- /col 3 -->

    </div>
    <div class="more-link">
        <a href="#">Усі анонсовані події</a>
    </div>
    </div>
</section>

<section class="request-online" id="visit_to_parlament">
    <div class="container">
    <div class="row">
        <div class="col-lg-6 col-sm-12">
            <div class="request-online__block">
                <div class="request-online__heading">Відвідай пленарне засідання!</div>
                <div class="request-online__text mob-hide">Станьте свідком роботи парламенту крaїни — подайте заяву на відвідання пленарного засідання онлайн!</div>

                <a href="#" class="btn-white">Подати заявку</a>
                <a href="#" class="request-online__link"><b>Правила <span class="mob-hide">перебування</span></b></a>

            </div>
        </div>
        <div class="faq-blocks col-lg-6 col-sm-12">
            <div class="faq-online">
                <div class="faq-tooltip">Маєте запитання до Верховної Ради?</div>
                <p class="text-right">
                    <a href="#" class="faq-link_online">Звернення онлайн</a>
                </p>
            </div>

            <div class="faq-online"></div>

            <div class="faq-online"></div>

            <div class="faq-online"></div>
        </div>
    </div>
    </div>
</section>



<section>
    <div class="container">
    <h2 class="block-heading">Новини та публікації</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs" id="myTab2" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="newsp-tab" data-toggle="tab" href="#newsp" role="tab" aria-controls="newsp" aria-selected="true">
                Новини парламенту
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="newsc-tab" data-toggle="tab" href="#newsc" role="tab" aria-controls="newsc" aria-selected="false">
                Новини комітетів
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="poster-tab" data-toggle="tab" href="#poster" role="tab" aria-controls="poster" aria-selected="false">
                Оголошення
                <span class="count">3</span>
            </a>
        </li>

    </ul>
    <div class="news-list-theme">
        <ul class="sections_tabs nav nav-pills">
            <li><a data-toggle="pill" href="#menu1-2" class="active">Усі теми</a></li>
            <li><a data-toggle="pill" href="#menu2-2">Оборона</a></li>
            <li><a data-toggle="pill" href="#menu3-2">Парламент</a></li>
            <li><a data-toggle="pill" href="#menu4-2">Законотворчість</a></li>
            <li><a data-toggle="pill" href="#menu5-2">Економіка</a></li>
            <li><a data-toggle="pill" href="#menu6-2">Реформи</a></li>
            <li><a data-toggle="pill" href="#menu7-2">Спорт</a></li>
            <li><a data-toggle="pill" href="#menu8-2">Екологія</a></li>
            <li><a data-toggle="pill" href="#menu9-2">Бюджет</a></li>
            <li>
                
                <div class="dropdown">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink2" data-toggle="dropdown">
                        Ще теми
                    </a>

                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink2">
                        <li><a class="dropdown-item" data-toggle="pill" href="#menu10-2">Action</a></li>
                        <li><a class="dropdown-item" data-toggle="pill" href="#menu11-2">Another action</a></li>
                        <li><a class="dropdown-item" data-toggle="pill" href="#menu12-2">Something else here</a></li>
                    </ul>
                </div>
            </li>
        </ul>
        <a href="/rss/news" class="rss-btn">RSS</a>
    </div>
</div>
    <div class="tab-content" id="myTabContent">

        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="newsp" role="tabpanel" aria-labelledby="newsp-tab">


            <div class="row">

                {foreach item=data from=$logo_news key=key name=i}  
                    {if $smarty.foreach.i.index < 2}

                        <div class="col-lg-4 col-sm-6">
                            <div class="multimedia-item">
                                <div class="multimedia-item__img">
                                    <img alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" {*width="120" height="80"*}/>
                                    <span class="time"> {$data->day} {$data->month},{$data->hour}</span>                                                                  <a href="#" class="btn-round">Тема2</a>
                                </div>
                                <div class="multimedia-item__heading">
                                    <a href="#" class="btn-video">Відео</a>
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </div>
                                <div class="multimedia-item__anons"> {$data->i_anons|truncate:250}</div>

                            </div>
                        </div>
                    {/if}
                {/foreach} 

                <div class="col-lg-4 col-sm-12">

                    {foreach item=data from=$logo_news key=key name=i} 
                        {if $smarty.foreach.i.index > 1}

                            <div class="news-item">
                                <span class="date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>                                                                          
                                <p> {*$data->i_anons|truncate:200*}
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </p>
                            </div>
                        {/if}
                    {/foreach}
                </div>


            </div>

            <div class="more-link text-right"><a href="#">Сайт всіх новин</a> </div>
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="newsc" role="tabpanel" aria-labelledby="newsc-tab">
            {*                Новини комітетів Content*}

            <!-- /tab 2 -->
            <div id="newsc">
                <h4>Новини комітетів</h4>
                <br>
                <div class="row">
                    {foreach item=data from=$block_data.6.items}
                        <div class="col-sm-4">
                            <div class="multimedia-item">
                                {if strlen($data->i_logoname) > 0}
                                    <div class="multimedia-item__img">
                                        <img src="/uploads/logos_small/{$data->i_logoname}.jpeg" class="borderimg" alt="" />
                                        <span class="time">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {*{$data->hour}*}</span>
                                    </div>
                                {/if}
                                <div class="multimedia-item__heading">
                                    <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name} </a> </h4>   
                                    
                                    {if strlen($data->i_logoname) == 0} <span class="time grey">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {*{$data->hour}*}</span>
                                        {/if}
                                    <text>{$data->i_anons} </text><br />


                                    {*                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">докладніше...</a>*}
                                </div>
                                {*<br/>           
                                <br/>*}           
                            </div>
                        </div>
                    {/foreach}


                </div>

                <div class="more-link text-right"><a href="/{$block_data.6.topic->i_categories}">Всі новини комітетів</a> </div>
            </div>
            {*               <div class="panel-head_bot"> <a class="link_topic" href="/{$block_data.6.topic->i_categories}">До розділу</a> </div>*}

        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->
        <div class="tab-pane fade" id="poster" role="tabpanel" aria-labelledby="poster-tab">
            {*Оголошення Content*}
            <div class="row">
                {foreach item=data from=$block_data.6.items key=key name=i}  
                    {if $smarty.foreach.i.index < 2}

                        <div class="col-sm-4">
                            <div class="multimedia-item">
                                <div class="multimedia-item__img">
                                    <img alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" {*width="120" height="80"*}/>

                                    <span class="time"> {$data->day} {$data->month},{$data->hour}</span>                                      
                                    <a href="#" class="btn-round">Тема1</a>
                                </div>
                                <div class="multimedia-item__heading">
                                    <a href="#" class="btn-video">Відео</a>
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </div>
                                <div class="multimedia-item__anons"> {$data->i_anons|truncate:250}</div>

                            </div>
                        </div>
                    {/if}
                {/foreach} 
                <div class="col-sm-4">

                    {foreach item=data from=$block_data.6.items key=key name=i} 
                        {if $smarty.foreach.i.index > 1}

                            <div class="news-item">
                                <span class="date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>                                                                          
                                <p> {*$data->i_anons|truncate:200*}
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </p>
                            </div>
                        {/if}
                    {/foreach}
                    <div class="more-link text-right"><a href="/{$block_data.6.topic->i_categories}"> Всі оголошення</a> </div>
                </div>
            </div>

        </div>
        <!-- /tab 3 -->
    </div>
    </div>
</section>

<section class="bill-section">
<div class="container">
    <h2 class="block-heading">Законопроекти</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="popular" aria-selected="true">
                Популярні
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="latest-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="false">
                Останні зареєстровані
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Прийняті на поточній сесії
            </a>
        </li>

    </ul>
    <a href="#" class="search-by-link">Пошук <span class="tab-hide">за реквізитами</span></a>
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="popular" role="tabpanel" aria-labelledby="popular-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">
                    {foreach item=data from=$block_data.3.items}
                        <div class="bill-item">
                            <span class="btn-fill"><b>{$data->i_name}</b> від <b>{*{$data->hour},*} {$data->day} {$data->month} {$data->year}</b></span>
                            <span class="btn-red">Новий</span>
                            <span class="btn-border">Соціальна політика</span>

                            {if $data->i_link}                    
                                <p><a href="{$data->i_link}">{$data->i_anons}</a></p>
                                    {*                            <p>{$data->i_anons}</p>*}


                                {* <div class="info_item">*}
                            {else}
                                <p><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_anons}</a></p>
                                    {*                            {if $panel_config->l_block1_flag_anons eq 1}<p>{$data->i_anons}</p>{/if}*}
                                {/if}
                                {*                    </div>                        *}
                        </div>
                    {/foreach} 
</div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">Законотворчість діяльність</h2>
                    <ul class="ul-list">
                                <li>
                                    <a href="#">
                                        Зареєстровані за поточний тиждень
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Надано народним депутатам
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        Знаходяться на розгляді в комітетах
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                    
                    <hr class="light">

                            <div class="attachment-name">
                                <a href="#">
                                    <i class="icn-paperclip"></i>
                                    Правила оформлення проектів законів та основні вимоги законодавчої техніки
                                </a>
                                <p class="attachment-format">PDF 3,5 МБайт</p>
                            </div>

                            <hr class="light">
                                
                    <h2 class="discussion-heading">Обговорення законопроектів</h2>

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

                    <div class="more-link text-right"><a href="#">Усі обговорення</a> </div>
                </div>
            </div>

            <div class="more-link">
                <a href="#">Перейти до розділу</a>
            </div>
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="latest" role="tabpanel" aria-labelledby="latest-tab">
            Останні зареєстровані Content
        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->
        <div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
            Прийняті на поточній сесії Content
        </div>
        <!-- /tab 3 -->
    </div>
</div>
</section>


<section class="petition-section">
    <div class="container">
    <h3 class="block-heading">Актуальні петиції до Верховної Ради</h3>

    <div class="row">
        <div class="col-lg-4 col-sm-12">
            <div class="petition-block">
                <div class="petition-block__heading"><a href="#"> Не допустити прийняття законопроекту №9260</a></div>

                <p>Зібрано 2028 голосів <span class="lite-grey">з 25000</span></p>

                <div class="votes-percent"><span style="width: 20%;"></span></div>

                <p>Залишилось 29 днів</p>
            </div>
        </div>

        <div class="col-lg-4 col-sm-12">
            <div class="petition-block">
                <div class="petition-block__heading"><a href="#">Про повернення Президенту України Законопроекту №9055 «Про адвокатуру та адвокатську діяльність» Зупинимо знищення незалежної адвокатури разом! STOP 9055</a></div>

                <p>Зібрано 657 голосів <span class="lite-grey">з 25000</span></p>

                <div class="votes-percent"><span style="width: 10%;"></span></div>

                <p>Залишилось 29 днів</p>
            </div>
        </div>

        <div class="col-lg-4 col-sm-12">
            <div class="petition-block">
                <div class="petition-block__heading"><a href="#">Відміна фінансових гарантій для резидентів при ввезенні на територію України транспортних засобів з іноземною реєстрацією. Залишення строку митного режиму транзиту.</a></div>

                <p>Зібрано 6578 голосів <span class="lite-grey">з 25000</span></p>

                <div class="votes-percent"><span style="width: 30%;"></span></div>

                <p>Залишилось 29 днів</p>
            </div>
        </div>
    </div>
    </div>
</section>


<section class="articles-block">
<div class="container">
    <h2 class="block-heading">Законодавство</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab4" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#popular2" role="tab" aria-controls="popular2" aria-selected="true">
                Популярні
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="valid-tab" data-toggle="tab" href="#valid" role="tab" aria-controls="valid" aria-selected="false">
                Набули чинності
            </a>
        </li>
    </ul>
    <a href="#" class="search-by-link">Пошук <span class="tab-hide">за реквізитами</span></a>
    <hr class="light">
</div>
    <div class="tab-content" id="myTabContent4">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="popular2" role="tabpanel" aria-labelledby="popular2-tab">

            <div class="row">
                <div class="col-md-8 col-sm-12">
                    <div class="bill-item">
                        <div class="law-heading">
                            <a href="#">Закон України від 20.12.2018 № 2662-VIII</a>
                            <span class="label-new">Новий</span>
                        </div>
                        <p>Про внесення зміни до статті 12 Закону України "Про свободу совісті та релігійні організації" щодо назви релігійних організацій (об’єднань), які входять до структури (є частиною) релігійної організації (об’єднання), керівний центр (управління) якої знаходиться за межами України в державі, яка законом визнана такою, що здійснила військову агресію проти України та/або тимчасово окупувала частину території України</p>
                    </div>

                    <div class="bill-item">
                        <div class="law-heading">
                            <a href="#">Постанова Верховної Ради України від 20.12.2018 № 2664-VIII</a>
                            <span class="label-apdated">Оновлено</span>
                        </div>
                        <p>Про прийняття за основу проекту Закону України про внесення змін до деяких законодавчих актів України щодо здійснення закупівлі продукції, робіт і послуг оборонного призначення за імпортом</p>
                    </div>

                    <div class="bill-item">
                        <div class="law-heading"><a href="#">Постанова Верховної Ради України; Перелік від 20.12.2018 № 2659-VIII</a></div>
                        <p>Про внесення змін до порядку денного дев'ятої сесії Верховної Ради України восьмого скликання</p>
                    </div>

                    <div class="bill-item">
                        <div class="law-heading"><a href="#">Постанова Верховної Ради України від 20.12.2018 № 2663-VIII</a></div>
                        <p>Про направлення на повторне друге читання проекту Закону України про внесення змін до деяких законодавчих актів України щодо уточнення порядку передачі в оренду водних об'єктів у комплексі з земельними ділянками</p>
                    </div>

                    <div class="bill-item">
                        <div class="law-heading"><a href="#">Постанова Верховної Ради України від 20.12.2018 № 2663-VIII</a></div>
                        <p>Про прийняття за основу проекту Закону України про внесення змін до деяких законів України щодо забезпечення конкурентних умов виробництва електричної енергії з альтернативних джерел енергії</p>
                    </div>

                    <div class="more-link">
                        <a href="#">Перейти до розділу</a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <ul class="gerb-list">
                                <li><a href="#">Конституція України</a></li>
                                <li><a href="#">Кодекси України</a></li>
                                <li><a href="#">Закони України</a></li>
                    </ul>
                    <ul class="ul-list">
                                <li><a href="#">Міжнародні документи <i class="icn-chevron-right"></i></a></li>
                                <li><a href="#">Переклади актів acquis ЄС <i class="icn-external"></i></a></li>
                                <li><a href="#">Первинні законодавчі акти <i class="icn-chevron-right"></i></a></li>
                                <li><a href="#">Розподіл прийнятих законодавчих актів за комітетами Верховної Ради <i class="icn-chevron-right"></i></a></li>
                                <li><a href="#">Анотації англійською мовою <i class="icn-chevron-right"></i></a></li>
                                <li><a href="#">Термінологія законодавства <i class="icn-chevron-right"></i></a></li>
                                <li><a href="#">Юридична кваліфікація<i class="icn-chevron-right"></i> </a></li>
                                <li><a href="#">Календар офіційних дат <i class="icn-chevron-right"></i></a></li>
                    </ul>
                </div>
            </div>


        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="valid" role="tabpanel" aria-labelledby="valid-tab">
            Набули чинності Content
        </div>
        <!-- /tab 2 -->
    </div>
</div>
</section>

{*==========Begin Digest======================*}

<section class="digest-section">  
    <div class="content">
            {*   <span class="mail-ico"><span class="messages">1</span></span>   *}          
            <div class="digest-section__heading">
                <span class="fa-2x">
                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1" data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                </span>
                <p>Парламентський дайджест</p>                
            </div>
            {* <p>Отримуйте головне з веб-порталу Верховної Ради України у свою скриньку</p> *}
            <p>Отримуйте головне з веб-порталу у свою скриньку</p>
            <form method="post" action="{$lang_prefix}/subscribe/index">
                {* <label for="digest-email">Введіть адресу Вашої електронної пошти</label> *}
                
                
                <div class="input-group">
                    {* <label for="digest-submit" title="Налаштувати підписку на анонси">Анонси новин, повідомлень та інших інформаційних матеріалів</label> *}                    
                   {*   <input type="email" name="email" id="digest-email" class="form-control" required placeholder="mail@example.com">
                       <div class="info-ico">На наступному кроці Ви зможете налаштувати категорії матеріалів для розсилки</div> *}
                    <button class="btn btn-white" type="submit" title="Налаштувати підписку на анонси">Налаштувати підписку на анонси</button>
                </div>
            </form>             
            
            {* <div class="info-ico">
                <i class="fas fa-info"></i>На наступному кроці Ви зможете налаштувати підписку на анонси
            </div>  *}
    </div>
</section>

{*=========End Digest=========================*}


<!-- end main content -->
