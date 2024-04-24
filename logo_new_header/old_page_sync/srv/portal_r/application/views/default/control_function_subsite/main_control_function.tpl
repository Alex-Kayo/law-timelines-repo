{*<div class="main">*}
<div class="container">
     
    <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item active">Контрольна діяльність</li>
{*            <li class="breadcrumb-item"><a href="/zapyt_inf">Запити на публічну інформацію</a></li>*}
    </ol>
    <div id="menu1" class='anchor-page-section'>
    <div class="page-heading">
         Здійснення контрольних функцій Верховною Радою України   


    </div>
    </div>
</div>

<hr class="full-width">

<div class="container">
    
    <div class="row">
            
        <div class="col-lg-9 order-lg-2">
             <div class="row">
            <div class="col-lg-10 col-md-12">
<div id="menu1" class='anchor-page-section'>
                <div class="time-table bg2" style="background: #153c7d url('/img/bg_zapyt-2.jpg') center center no-repeat;min-height: 270px;">
                    <div class="block-heading" style="padding: 40px;">
                        Депутатські запити

                    </div>
                    <span class="more-link white-link" style="font-size: 1.3rem;">
                        <a href="http://w1.c1.rada.gov.ua/pls/zweb2/pkg_depzap.search_form">Пошук запитів народних депутатів України </a>
                    </span>

                </div>
                </div>


                <div class="resume-text table-block  ">
                    
                    <div class="tr-block">
                        <div class="td-block">
                            <ul class="ul-list with-ico">
                      {*<li  class="icn-results"> <a href="https://itd.rada.gov.ua/idsrv/">   
 Подати запит на інформацію</a></li>
                    <li class="icn-chronology"><a href="https://itd.rada.gov.ua/idsrv/">Переглянути Портал відкритих даних та базу даних «Законодавство України» </a></li>*}
                    
                </ul>
                           
                        </div>
                       
                    </div>
                </div>
                    <div id="menu2" class='anchor-page-section' style="padding-top: 1.3em;"></div>
            </div>
             
        </div> 
            {*<div class="row">
            <div class="col-lg-8 col-md-12">
<div id="menu1" class='anchor-page-section'>
                <div class="time-table bg2" style="background: #153c7d url('/img/zvernen_main.jpg') center center no-repeat;min-height: 270px;">
                    <div class="block-heading">
                        Електронний кабінет громадянина

                    </div>
                    <span class="more-link white-link">
                        <a href="https://itd.rada.gov.ua/idsrv/">Перейти на сайт</a>
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
                    <li  class="icn-results" ><a href="http://">Записатися на особистий прийом</a></li>
                    <li  class="icn-results" ><a href="/">Взяти участь в обговоренні законопроектів</a></li>
                </ul>
            </div>
        </div>*}
               
                
                     
                <section class="bill-section">
<div class="container">
    <div {*id="menu2" class='anchor-page-section'*}>
    <h2 class="block-heading">Контроль за діяльністю Кабінету Міністрів України  </h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="true">
               Документи  
            </a>
        </li>
          <li class="nav-item">
{*               <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">*}
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Звіти і доповіді
{*                <span class="tab-hide"> Перейти на</span> сайт *}
            </a>
        </li>  
         <li class="nav-item">
            <a class="nav-link" id="session_cab-tab" data-toggle="tab" href="#session_cab" role="tab" aria-controls="session_cab" aria-selected="false">
               Година запитань до Уряду
            </a>
        </li> 

    </ul>
         
        {*<a target ="_blank" href="https://itd.rada.gov.ua/idsrv/"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide">   Перейти </span>на сайт     </a>*}
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest" role="tabpanel" aria-labelledby="latest-tab">

            <div class="row">
                <div class="col-lg-10 col-sm-12">
<div class="scrollbar-inner">
{*                    {foreach item=data from=$block_data.3.items}*}

                    {foreach item=data from=$program_dij_kmu}
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
                                
             
       
                    
                </div>*}
            </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
                    <div class="more-link">
                        <a href="/{$data->i_categories}">Перейти до розділу</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
        <div id="session">
             <div class="row">
                <div class="col-lg-10 col-sm-12">
<div class="scrollbar-inner">  
{*                    {foreach item=data from=$block_data.3.items}*}
                    {foreach item=data from=$reports_kmu}
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
                                
                </div>*}
            </div>
             <div class="row">
                <div class="col-lg-8 col-sm-12">
{*                    <div class="more-link text-right">*}
                    <div class="more-link">
                        <a href="/{$data->i_categories}">Перейти до розділу</a>
{*                        <a href="/{$base_url}/{$lang_prefix}/{$data->i_categories}">Перейти до розділу</a>*}
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->         
         
        <div class="tab-pane fade" id="session_cab" role="tabpanel" aria-labelledby="session_cab-tab">
        <div id="session_cab">
             <div class="row">
                <div class="col-lg-10 col-sm-12">
<div class="scrollbar-inner">  
{*                    {foreach item=data from=$block_data.13.items}*}
                     {foreach item=data from=$request_kmu} 
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
{*                    <div class="more-link text-right">*}
                    <div class="more-link">
{*                        <a href="/documents/control_func_kmu/reports_kmu/ ">Перейти до розділу</a>*}
                          <a href="/{$block_data.13.topic->i_categories}">Перейти до розділу</a>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- /tab 3 -->
    </div>
</div>
</section>
                
            
           
                                <div class="row">
            
                                    <div id="menu3" class='anchor-page-section' style="padding-top: 1.3em;"></div>
                                </div>
                                
                                    
           
                                     
{*                <br>*}
                <section class="bill-section">
<div class="container">
    <div {*id="menu3" class='anchor-page-section' style="padding-top: 1.3em;"*}>
    <h2 class="block-heading"> Звіти, доповіді та інша інформація державних органів та посадових осіб</h2> </div>  
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#latest2" role="tab" aria-controls="latest2" aria-selected="true">
             Звіти і доповіді
            </a>
        </li>
          <li class="nav-item">
{*               <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">*}
            <a class="nav-link" id="session_inf-tab" data-toggle="tab" href="#session_inf" role="tab" aria-controls="session_inf" aria-selected="false">                
                Інша інформація
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
    
    
    {*<a target ="_blank" href="#"  class="search-by-link-st"> <i class="icn-external"></i><span class="tab-hide">   Перейти </span>на сайт     </a>*}
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent4">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest2" role="tabpanel" aria-labelledby="latest2-tab">

            <div class="row">
                <div class="col-lg-10 col-sm-12">
<div class="scrollbar-inner">
{*                    {foreach item=data from=$block_data.3.items}*}
                     {foreach item=data from=$other_reports key=key name=i}
                         {if $smarty.foreach.i.index <=15}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-border"><b>{$data->i_name}</b> {*від <b>*}{*{$data->hour},*} {*{$data->day} {$data->month} {$data->year}</b>*}</span>
                            {*<span class="btn-red">Новий</span>*}
{*                            <span class="btn-border">Соціальна політика</span>*}

                            <p>{$data->i_anons}</p>
                             
                        </a>{/if}
                    {/foreach} 
</div>
                </div>

               {* <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading"> </h2>
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
                                
             
       
                                
                    
                </div>*}
            </div>

            <div class="row">
                <div class="col-lg-8 col-sm-12">
{*                    <div class="more-link text-right">*}
                    <div class="more-link">
                         <a href="/{$data->i_categories}">Перейти до розділу</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="session_inf" role="tabpanel" aria-labelledby="session_inf-tab">
        <div id="session_inf">
             <div class="row">
                <div class="col-lg-10 col-sm-12">
<div class="scrollbar-inner"> 
    <div id="menu" class='anchor-page-section' style="padding-top: 1em;">
{*                    {foreach item=data from=$block_data.3.items}*}
                    {foreach item=data from=$other_inf key=key name=i}
                         {if $smarty.foreach.i.index <= 3}
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
</div>
                </div>                </div>


                <div class="col-lg-2 col-sm-12">
                    
                    {*<h2 class="discussion-heading">До уваги:</h2>
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

                            <hr class="light">*}
                                
             
       
                                
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
                         <a href="/{$data->i_categories}">Перейти до розділу</a>
                    </div>
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
                
                
                
                
                
                
                
                
         {*<div id="menu6" class='anchor-page-section'>
                <h2 class="hub-page__heading">
                   Зразок звернення до Верховної Ради України
                    <i class="link-ico"></i>
                </h2>
                            <div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    
                                     <i class="icn-paperclip"></i>  Зразок звернення до Верховної Ради України
                                </a>
                                <p class="attachment-format">формат, розмір</p>
                                  <iframe src="https://onedrive.live.com/embed?cid=0E1954BDDD03C333&amp;resid=E1954BDDD03C333%21112&amp;authkey=AIHEP1ir8XdqU4w&amp;em=2" width="100%" height="288px" frameborder="0">Це вбудований документ <a target="_blank" href="https://office.com">Microsoft Office</a> на платформі <a target="_blank" href="https://office.com/webapps">Office</a>.</iframe>
                            </div>
                 
            </div>*}      
{*                                <hr>*}
                
                
                
            {*<div id="menu2" class='anchor-page-section'>
                <h2 class="hub-page__heading">

                    <a href="http://w1.c1.rada.gov.ua/pls/site2/p_kerivnyky_vru" target='_blank'>Керівництво Верховної Ради України</a>
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li> <a href="https://itd.rada.gov.ua/mps/infoChief/page/21205" target='_blank'><b>Разумков Дмитро Олександрович</b></a></li>
                    <li><b>Голова Верховної Ради України</b><br><a href="http://w1.c1.rada.gov.ua/pls/site2/p_pidrozdil2?pidid=3" target='_blank'>  Секретаріат Голови Верховної Ради України</a></li><br>
                    <li> <a href="https://itd.rada.gov.ua/mps/infochief/page/21211" target='_blank'><b>Стефанчук Руслан Олексійович</b></a></li>
                    <li><b>Перший заступник Голови Верховної Ради України</b><br><a href="http://w1.c1.rada.gov.ua/pls/site2/p_pidrozdil2?pidid=5" target='_blank'>  Секретаріат Першого заступника Голови Верховної Ради України</a></li><br>
                    <li> <a href="https://itd.rada.gov.ua/mps/infochief/page/11166" target='_blank'><b>Кондратюк Олена Костянтинівна</b></a></li>
                    <li><b>Заступник Голови Верховної Ради України</b><br><a href="http://w1.c1.rada.gov.ua/pls/site2/p_pidrozdil2?pidid=7" target='_blank'>Секретаріат заступника Голови Верховної Ради України</a></li><br>
                    
                                         
                </ul>
            </div>*}
                
             

            {*<div id="menu4" class='anchor-page-section'>
                <h2 class="hub-page__heading">

                    <a href="http://w1.c1.rada.gov.ua/pls/site2/p_fractions" target='_blank'>  Депутатські фракції і групи дев'ятого скликання</a>
                    
                    <i class="link-ico"></i>
                </h2>
                <iframe src="https://onedrive.live.com/embed?cid=0E1954BDDD03C333&amp;resid=E1954BDDD03C333%21112&amp;authkey=AIHEP1ir8XdqU4w&amp;em=2" width="100%" height="288px" frameborder="0">Це вбудований документ <a target="_blank" href="https://office.com">Microsoft Office</a> на платформі <a target="_blank" href="https://office.com/webapps">Office</a>.</iframe>
                <ul class="link-list">
                </ul>
            </div>*}
                
             
                
             
                
            
                
             

            </div>
            
            
            
            
        <div class="col-lg-3 order-lg-1">
            <div class='fixed-block'>
                <div class="contents-pages">
                    <h4 class="section-heading">Зміст сторінки</h4>

                    <ul>
                        <li><a href="#menu1" class="scrollLink">Депутатські запити</a></li>
                        <li><a href="#menu2" class="scrollLink">Контроль за діяльністю Кабінету Міністрів України </a></li>
                        <li><a href="#menu3" class="scrollLink">Звіти, доповіді та інша інформація державних органів та посадових осіб</a></li>
{*                        <li><a href="#menu4" class="scrollLink">Звіти</a></li>*}
                                                {* <li><a href="#menu7" class="scrollLink">Тимчасові комісії</a></li>
                        <li><a href="#menu8" class="scrollLink">Апарат Верховної Ради України</a></li>*}
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