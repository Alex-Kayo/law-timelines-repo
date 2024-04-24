{*<div class="main">*}
<div class="container">
     
    <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item active">Звернення громадян</li>
    </ol>
    <div id="menu" class='anchor-page-section'>
    <div class="page-heading">
            Звернення громадян (веб-сторінка)

    </div>
    </div>
</div>

<hr class="full-width">

<div class="container">
    
    <div class="row">
            
        <div class="col-lg-9 order-lg-2">
            <div class="row">
{*            <div class="col-lg-8 col-md-7">*}
            <div class="col-lg-8 col-md-12 col-sm-6">
<div id="menu1" class='anchor-page-section'>
                <div class="time-table bg2" style="background: #153c7d url('/img/zvernen_main.jpg') center center no-repeat;min-height: 270px;">
                    <div class="block-heading">
                        Електронний кабінет громадянина

                    </div>

                    {*<div class="block-heading__date">
                        {$next_planar_week_dates.backward->day_s}  {$next_planar_week_dates.backward->mon_s}
                        – {$next_planar_week_dates.backward->day_e} {$next_planar_week_dates.backward->mon_e}
                    </div>*}
                    <span class="more-link white-link">
                        <a href="https://itd.rada.gov.ua/idsrv/">Перейти на сайт </a>
                    </span>

                </div>
                </div>


                <div class="resume-text table-block  ">
                    
                    <div class="tr-block">
                        <div class="td-block">
                            <ul class="ul-list with-ico">
                      <li  class="icn-results"> <a href="https://itd.rada.gov.ua/idsrv/">   
 Подати запит на інформацію</a></li>
                    <li class="icn-chronology"><a href="https://itd.rada.gov.ua/idsrv/">Переглянути Портал відкритих даних та базу даних «Законодавство України» </a></li>
                    
                </ul>
                           
                        </div>
                       
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-12">
                <h2 class="hub-page__heading mob-hide" style="margin-top: -3rem; margin-bottom: -1rem;">
                       Пропонуємо:
                </h2>
                <ul class="ul-list with-ico" style="margin-left: 1.5rem;">
                    <li class="icn-results"><a href="https://itd.rada.gov.ua/idsrv/"> 

Подати звернення громадянина </a></li>
                    <li class="icn-results"><a href="https://itd.rada.gov.ua/idsrv/"> Подати електронну петицію</a></li>
                    <li  class="icn-results"{*class="icn-table">*}><a href="http://">Записатися на особистий прийом</a></li>
                    <li  class="icn-results"{*class="icn-transcript">*}><a href="/">Взяти участь в обговоренні законопроектів</a></li>
                </ul>
            </div>
        </div>
                <hr>
                
                <section class="bill-section">
<div class="container">
    <div id="menu2" class='anchor-page-section'>
    <h2 class="block-heading">Електронне звернення </h2> 
<div class="select-custom">   
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="true">
               Інформація щодо звернення
            </a>
        </li>
         {*<li class="nav-item">
            <a class="nav-link" id="latest-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="popular" aria-selected="false">
                <span class="tab-hide"> Перейти на</span> сайт 
            </a>
        </li> *}
        {*<li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Прийняті на поточній сесії
            </a>
        </li>*}

    </ul>
         
        <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide"> Перейти </span>на сайт <span class="tab-hide">цифрових сервісів</span></a>
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest" role="tabpanel" aria-labelledby="latest-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">
{*                    {foreach item=data from=$block_data.3.items}*}

                    {foreach item=data from=$ezvernen}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-fill" style="text-align: unset;"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}</span>
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
                                    <a target ="_blank" href="https://itd.rada.gov.ua/services/Account/LogOn?ReturnUrl=https%3A%2F%2Fitd.rada.gov.ua%2Fservices%2Fappeal-of-citizens%2FAppeals%2FCreateAppeal">
                                        Подати електронне звернення
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                {*<li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/pkg_zpsended.by_date">
                                      Витяг з Положення про порядок роботи з документами у Верховній Раді України
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>*}
                                 
                            </ul>
                    
                    <hr class="light">

                            {*<div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    <i class="icn-paperclip"></i> Зразок звернення до Верховної Ради України
                                </a>
                                <p class="attachment-format">PDF 3,5 МБайт</p>
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
                        {*<a href="{$block_data.3.topic->i_categories}">Перейти на сайт</a>*}
{*                        <a href="/news/zvern_gromad/ezvernen">Перейти до розділу</a>*}
                        <a href="http://vzvernen.rada.gov.ua/">Перейти на сайт</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        {*<div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
             Content
        </div>*}
        <!-- /tab 2 -->

        <!-- tab 3 -->
        {*<div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
              Content
        </div>*}
        <!-- /tab 3 -->
    </div>
</div>
</section>
        
                <section class="bill-section">
<div class="container">
    <div id="menu3" class='anchor-page-section'>
    <h2 class="block-heading">Електронні петиції </h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="true">
               Інформаційні вебресурси
            </a>
        </li>
         {*<li class="nav-item">
            <a class="nav-link" id="latest-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="popular" aria-selected="false">
                <span class="tab-hide"> Перейти на</span> сайт 
            </a>
        </li> *}
        {*<li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Прийняті на поточній сесії
            </a>
        </li>*}

    </ul>
         
        <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide"> Перейти </span>на сайт <span class="tab-hide">цифрових сервісів</span></a>
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest" role="tabpanel" aria-labelledby="latest-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">
                    {foreach item=data from=$inf_petition}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-fill" style="text-align: unset;"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}</span>
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
                                    <a target ="_blank" href="https://zakon.rada.gov.ua/rada/show/19/21-%D1%80%D0%B3#n445">
                                        Інформація про супроводження петицій до Верховної Ради України
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/services/Account/LogOn?returnUrl=%2Fservices%2FPetition%2FCreate">
                                        Форма для створення електронної петиції (посилання на форму)
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                 
                            </ul>
                    
                    <hr class="light">

                            {*<div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    <i class="icn-paperclip"></i> Правила оформлення...
                                </a>
                                <p class="attachment-format">PDF 3,5 МБайт</p>
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
                        <a href="http://vzvernen.rada.gov.ua/">Перейти на сайт</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        {*<div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
             Content
        </div>*}
        <!-- /tab 2 -->

        <!-- tab 3 -->
        {*<div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
              Content
        </div>*}
        <!-- /tab 3 -->
    </div>
</div>
</section>
                
            
{*                <hr>*}
           {* <div id="menu3" class='anchor-page-section'>
                <h2 class="hub-page__heading">
                    Усне звернення
                    <i class="link-ico"></i>
                </h2>
                            <div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    <i class="icn-external"></i>  Витяг з Положення про порядок роботи з документами у Верховній Раді України                         
                                     <i class="icn-paperclip"></i>  Витяг з Положення про порядок роботи з документами у Верховній Раді України                         
                                </a>
                                <p class="attachment-format">(посилання на веб-сайт Управління з питань звернень громадян)</p>
                            </div>
                 
            </div>
                                
                                    <hr>*}
           <section class="bill-section">
<div class="container">
    <div id="menu4" class='anchor-page-section'>
    <h2 class="block-heading">Усне звернення </h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#latest2" role="tab" aria-controls="latest2" aria-selected="true">
               Інформація
            </a>
        </li>
         {*<li class="nav-item">
            <a class="nav-link" id="latest-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="popular" aria-selected="false">
                <span class="tab-hide"> Перейти на</span> сайт 
            </a>
        </li> *}
        {*<li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Прийняті на поточній сесії
            </a>
        </li>*}

    </ul>
         
       <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide"> Перейти </span>на сайт <span class="tab-hide">цифрових сервісів</span></a>
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest2" role="tabpanel" aria-labelledby="latest2-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    {foreach item=data from=$appeal}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-border"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}  <i class="icn-external"></i></span>
                        </a>
                    {/foreach} 
                </div>
                <div class="col-lg-4 col-sm-12">
                    
{*                    <h2 class="discussion-heading">До уваги:</h2>*}
                   {* <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="https://zakon.rada.gov.ua/rada/show/19/21-%D1%80%D0%B3#n445>
                                       Витяг з Положення про порядок роботи з документами у Верховній Раді України 
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>                                
                                    
                                </li>
                                 
                            </ul>*}
                    
                    {*<hr class="light">

                             <div id="menu7" class='anchor-page-section'><div class="attachment-name">
                                <a target ="_blank" href="http://vzvernen.rada.gov.ua/uploads/documents/31786.pdf">
                                    <i class="icn-paperclip"></i> Зразок звернення до Верховної Ради України 
                                </a>
                                <p class="attachment-format">PDF 247 КБайт</p>
                            </div>
                            </div>

                            <hr class="light">*}
                                
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
{*                    <div class="more-link text-right">*}
                    <div class="more-link">
                        <a href="http://vzvernen.rada.gov.ua/">Перейти на сайт</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        {*<div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
             Content
        </div>*}
        <!-- /tab 2 -->

        <!-- tab 3 -->
        {*<div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
              Content
        </div>*}
        <!-- /tab 3 -->
    </div>
</div>
</section>
           <section class="bill-section">
<div class="container">
    <div id="menu5" class='anchor-page-section'>
    <h2 class="block-heading">Особистий прийом  </h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#latest2" role="tab" aria-controls="latest2" aria-selected="true">
               Інформація про особистий прийом
            </a>
        </li>
         {*<li class="nav-item">
            <a class="nav-link" id="latest-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="popular" aria-selected="false">
                <span class="tab-hide"> Перейти на</span> сайт 
            </a>
        </li> *}
        {*<li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Прийняті на поточній сесії
            </a>
        </li>*}

    </ul>
         
        <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide"> Перейти </span>на сайт <span class="tab-hide">цифрових сервісів</span></a>
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest2" role="tabpanel" aria-labelledby="latest2-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
{*<div class="scrollbar-inner">*}
{*                    {foreach item=data from=$block_data.3.items}*}

                    {foreach item=data from=$pers_reception}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-border"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}  <i class="icn-external"></i></span>
                            {*<span class="btn-fill">  <i class="icn-external"></i>(посилання на веб-сайт Управління з питань звернень громадян) </span>*}
                            {*<span class="btn-red">(посилання на веб-сайт Управління з питань звернень громадян)</span>*}
{*                            <span class="btn-border"> (посилання на веб-сайт Управління з питань звернень громадян)</span>*}

                           {* <p><i class="icn-external">(посилання на веб-сайт Управління з питань звернень громадян)</i> </span>{$data->i_anons}</p>*}
                             
                        </a>
                    {/foreach} 
{*</div>*}
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">До уваги:</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="#!">
                                        Запис на особистий прийом
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="https://zakon.rada.gov.ua/rada/show/43/21-%D1%80%D0%B3#Text">
                                        Порядок організації та проведення особистого прийому громадян у Верховній Раді України 
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                    
                    <hr class="light">

                            {*<div class="attachment-name">
                                <a target ="_blank" href="http://vzvernen.rada.gov.ua/uploads/documents/31786.pdf">
                                    <i class="icn-paperclip"></i> Зразок звернення до Верховної Ради України 
                                </a>
                                <p class="attachment-format">PDF 247 КБайт</p>
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
                        <a href="http://vzvernen.rada.gov.ua/">Перейти на сайт</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        {*<div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
             Content
        </div>*}
        <!-- /tab 2 -->

        <!-- tab 3 -->
        {*<div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
              Content
        </div>*}
        <!-- /tab 3 -->
    </div>
</div>
</section>
                                     
                <br>
                <hr>
                
                <section class="bill-section">
<div class="container">
    <div id="menu6" class='anchor-page-section'>
    <h2 class="block-heading">Розгляд звернень   </h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular3-tab" data-toggle="tab" href="#latest3" role="tab" aria-controls="latest3" aria-selected="true">
               {*Статистичні*} Звіти
            </a>
        </li>
         {*<li class="nav-item">
            <a class="nav-link" id="latest-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="popular" aria-selected="false">
                <span class="tab-hide"> Перейти на</span> сайт 
            </a>
        </li> *}
        {*<li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Прийняті на поточній сесії
            </a>
        </li>*}

    </ul>
         
        <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide"> Перейти </span>на сайт <span class="tab-hide">цифрових сервісів</span></a>
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest3" role="tabpanel" aria-labelledby="latest3-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
{*<div class="scrollbar-inner">*}
{*                    {foreach item=data from=$block_data.3.items}*}

                    {foreach item=data from=$consid_appeals}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-border"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}  <i class="icn-external"></i></span>
                            {*<span class="btn-fill">  <i class="icn-external"></i>(посилання на веб-сайт Управління з питань звернень громадян) </span>*}
                            {*<span class="btn-red">(посилання на веб-сайт Управління з питань звернень громадян)</span>*}
{*                            <span class="btn-border"> (посилання на веб-сайт Управління з питань звернень громадян)</span>*}

                           {* <p><i class="icn-external">(посилання на веб-сайт Управління з питань звернень громадян)</i> </span>{$data->i_anons}</p>*}
                             
                        </a>
                    {/foreach} 
{*</div>*}
                </div>

               {* <div class="col-lg-4 col-sm-12">
                    Content  col --- До уваги
                    <h2 class="discussion-heading">До уваги:</h2>
                    <div id="menu6" class='anchor-page-section'>
                     
                </div>
            </div>*}

             
                
            
        </div>
                <div class="row">
                <div class="col-lg-8 col-sm-12">
{*                    <div class="more-link text-right">*}
                    <div class="more-link">
                      <a href="http://vzvernen.rada.gov.ua/">Перейти на сайт</a>
                    </div>
                </div>
            </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        {*<div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
             Content
        </div>*}
        <!-- /tab 2 -->

        <!-- tab 3 -->
        {*<div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
              Content
        </div>*}
        <!-- /tab 3 -->
    </div>
</div>
</div>
</section>
          
      <!-- Зразок звернення до Верховної Ради України -->
      
      
       <section class="bill-section">
<div class="container">
    <div id="menu7" class='anchor-page-section'>
    <h2 class="block-heading">Зразок звернення до Верховної Ради України    </h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        {*<li class="nav-item">
            <a class="nav-link active" id="popular3-tab" data-toggle="tab" href="#latest3" role="tab" aria-controls="latest3" aria-selected="true">
               Статистичні звіти
            </a>
        </li>*}
         {*<li class="nav-item">
            <a class="nav-link" id="latest-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="popular" aria-selected="false">
                <span class="tab-hide"> Перейти на</span> сайт 
            </a>
        </li> *}
        {*<li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Прийняті на поточній сесії
            </a>
        </li>*}

    </ul>
         
       {* <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide"> Перейти </span>на сайт <span class="tab-hide">цифрових сервісів</span></a>*}
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="zvernen" role="tabpanel" aria-labelledby="zvernen-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
{*<div class="scrollbar-inner">*}
{*                    {foreach item=data from=$block_data.3.items}*}

                    {foreach item=data from=$zvernenGrm}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-border"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}  <i class="icn-external"></i></span>
                            {*<span class="btn-fill">  <i class="icn-external"></i>(посилання на веб-сайт Управління з питань звернень громадян) </span>*}
                            {*<span class="btn-red">(посилання на веб-сайт Управління з питань звернень громадян)</span>*}
{*                            <span class="btn-border"> (посилання на веб-сайт Управління з питань звернень громадян)</span>*}

                           {* <p><i class="icn-external">(посилання на веб-сайт Управління з питань звернень громадян)</i> </span>{$data->i_anons}</p>*}
                             
                        </a>
                    {/foreach} 
{*</div>*}
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">До уваги:</h2>
                    <ul class="ul-list">
                              {*  <li>
                                    <a target ="_blank" href="#!">
                                        Запис на особистий прийом
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="https://zakon.rada.gov.ua/rada/show/43/21-%D1%80%D0%B3#Text">
                                        Порядок організації та проведення особистого прийому громадян у Верховній Раді України 
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                </li>
                                 *}
                            </ul>
                    
                    <hr class="light">

                            <div class="attachment-name">
                                <a target ="_blank" href="/uploads/documents/74865.pdf">
{*                                <a target ="_blank" href="http://vzvernen.rada.gov.ua/uploads/documents/31786.pdf">*}
                                    <i class="icn-paperclip"></i> Зразок звернення до Верховної Ради України 
                                </a>
                                <p class="attachment-format">PDF 253 КБайт</p>
{*                                <p class="attachment-format">PDF 247 КБайт</p>*}
                            </div>
                            <div class="attachment-name">
                                <a target ="_blank" href="/uploads/documents/74864.doc">
{*                                <a target ="_blank" href="/uploads/documents/72519.doc">*}
                                    <i class="icn-paperclip"></i> Зразок звернення до Верховної Ради України 
                                </a>
                                 <p class="attachment-format">doc,0.03 Mb</p>
{*                                 <p class="attachment-format">doc,0.03 Mb</p>*}
                            </div>

                            <hr class="light">
                                
                </div>

             
                
            
        </div>
                {*<div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="more-link text-right">
                    <div class="more-link">
                      <a href="http://vzvernen.rada.gov.ua/">Перейти на сайт</a>
                    </div>
                </div>
            </div>*}
        <!-- /tab 1 -->

        <!-- tab 2 -->
        {*<div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
             Content
        </div>*}
        <!-- /tab 2 -->

        <!-- tab 3 -->
        {*<div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
              Content
        </div>*}
        <!-- /tab 3 -->
    </div>
</div>
</div>
</section>
        

</div>
            
            
            
            
        <div class="col-lg-3 order-lg-1">
            <div class='fixed-block'>
                <div class="contents-pages">
                    <h4 class="section-heading">Зміст сторінки</h4>

                    <ul>
                        <li><a href="#menu1" class="scrollLink">Електронний кабінет громадянина</a></li>
                        <li><a href="#menu2" class="scrollLink">Електронне звернення </a></li>
                        <li><a href="#menu3" class="scrollLink">Електронні петиції</a></li>
                        <li><a href="#menu4" class="scrollLink">Усне звернення</a></li>
                        <li><a href="#menu5" class="scrollLink">Особистий прийом</a></li>
                        <li><a href="#menu6" class="scrollLink">Розгляд звернень</a></li>
                        <li><a href="#menu7" class="scrollLink">Зразок звернення до Верховної Ради України</a></li>
                    </ul>
                </div>
               {* <ul class="section__list">
                        <li><a href="/structure_parlam/arhive_skl" target="_blank">
                            Архів за скликаннями Верховної Ради України  <i class="icn-external"></i>
                            </a></li>
                       
                        </ul>*}
            </div>
               {* <h4 class="section-heading">Конкурс на зайняття вакантних посад в Апараті</h4>
                <ul class="section__list">
                    <li><a href="http://vrkadry.rada.gov.ua/documents/Dobir_p/konkurs/Zd/73074.html">Зразки та форми документів для участі у конкурсі</a></li>
                                    </ul>

                <div class="parline-block">
                    <img src="/images/dzl-ap.jpg" alt="">
                    <p>
                        <a href="http://vrkadry.rada.gov.ua/news/ogoloshenia/73132.html" target="_blank">
                            <b>Взяти участь</b> <i class="icn-external"></i>
                        </a>
                    </p>
                </div><br>
                <h4 class="section-heading">Програма стажування молоді в Апараті Верховної Ради Україния</h4>
                <ul class="section__list">
                    <li><a href="http://vrkadry.rada.gov.ua/news/ogoloshenia/73149.html">Порядок проходження стажування молоді в Апараті Верховної Ради України</a></li>
                                    </ul>

                <div class="parline-block">
                    <img src="/images/stazh-molod-s.jpg" alt="">
                    <p>
                        <a href="http://vrkadry.rada.gov.ua/documents/Staj/" target="_blank">
                            <b>Про стажування в Апараті</b> <i class="icn-external"></i>
                        </a>
                    </p>
                </div>*}
            </div>
            <br>
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