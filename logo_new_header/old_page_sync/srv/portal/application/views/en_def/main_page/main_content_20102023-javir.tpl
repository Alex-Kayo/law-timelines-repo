<!-- main content -->


<!-- news-section -->
<section>


{*    <a href="https://bit.ly/rada-glory-en" target="_blank">*}
{*    <a href="https://www.glory2ukraine.com.ua">*}

{*        <img style="margin-left: 0.77rem; margin-top: 1.5em;" src="/img/banners/1200_en.jpg" class="img-fluid" alt="charitable foundation">*}
{*    </a>*}



    <div class="news-line">
{*    <h2 class="block-heading"> </h2>*}
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs" id="myTab2" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="newsp-tab" data-toggle="tab" href="#newsp" role="tab" aria-controls="newsp" aria-selected="true">
                News from Ukrainian parliament
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="newsc-tab" data-toggle="tab" href="#newsc" role="tab" aria-controls="newsc" aria-selected="false">
                Committee news
            </a>
        </li>
       {* <li class="nav-item">
            <a class="nav-link" id="poster-tab" data-toggle="tab" href="#poster" role="tab" aria-controls="poster" aria-selected="false">
                Announcements 
                <span class="count">3</span>
            </a>
        </li>*}
    </ul>
         <a href="en/rss/news" class="rss-btn">RSS</a>
{* ================================= ТЕМИ ============================================   *}
   {* <div class="news-list-theme">
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
        </ul>*}
{*        <a href="/rss/news" class="rss-btn">RSS</a>*}
{*        <a href="/rss/news" class="rss-btn">RSS</a>*}
{*    </div>*}
{* ================================= / ТЕМИ ============================================   *}
        
        
</div>
              
{*           del-old-block*}

<div class="tab-content" id="myTabContent">

        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="newsp" role="tabpanel" aria-labelledby="newsp-tab">


            <div id="menu1" class="tab-pane fade show active">
                <div class="row">
                    <div class="col-lg-8">
                        <ul class="main-news-list">
                            
                            {foreach item=data from=$top_news key=key name=i}  
{*                            {foreach item=data from=$logo_news_mp key=key name=i}  *}
                    {if $smarty.foreach.i.index <= 1}
                        <li>

                        <div class="multimedia-item">
                             <div class="multimedia-item__img">
                                 <img alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" {*width="120" height="80"*}/>
                                   <span class="time"> {$data->day} {$data->month},{$data->hour}</span>
{*                                   <a href="#" class="btn-round">Тема2</a>*}
                             </div>
                                 <div class="multimedia-item__heading">
{*                                      <a href="#" class="btn-video">Відео</a>*}
                                       <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                            {$data->i_name}
                                        </a>
                                 </div>
                                    <div class="multimedia-item__anons">{$data->i_anons|truncate:250}
                                    </div>
                                    </div>
                                    </li>
                    {/if}
                {/foreach} 
                            
                                          
                
                             {foreach item=data from=$top_news key=key name=i}  
                    {if $smarty.foreach.i.index > 1 && $smarty.foreach.i.index < 4}
                        <li>

                        <div class="news-list-item">
                             <div class="news-list-item__title">
                                 <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                     {$data->i_name}
                                 </a>
                              </div>
                                 <span class="time grey">
                                       {$data->day} {$data->month},{$data->hour}
                                    </span>
                                    {*<a href="#" class="tags">
                                        Економіка
                                    </a>*}
                                    </div>
                                    </li>
                    {/if}
                {/foreach} 

                            

                        </ul>
                    </div>


                    <div class="col-lg-4">
                        
                        
                        {foreach item=data from=$logo_news key=key name=i} 
{*                        {if $smarty.foreach.i.index >= 4}            {*//javir*}
{if $smarty.foreach.i.index < 4}
                            <div class="news-item">
                                <span class="date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>                                                                          
                                <p> {*$data->i_anons|truncate:200*}
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                        {$data->i_name}
                                    </a> 
                                </p>
                            </div>
                        {/if}
                    {/foreach}

                    </div>
                </div><!--/row-->

                {*<div class="more-link text-right">
                    <a href="/news/">Архів новин</a>
                </div>*}
            </div>

{*            <div class="more-link text-right"><a target ="_blank" href="/newscenter">All news website</a> </div>*}
              <div class="more-link text-right"><a target ="_blank" href="/en/newscenter">All news website</a> </div>
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="newsc" role="tabpanel" aria-labelledby="newsc-tab">
            {*                Новини комітетів Content*}

            <!-- /tab 2 -->
            <div id="newsc">
{*                <h4>Новини комітетів</h4>*}
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
 <div class="more-link text-right"><a href="/{$block_data.6.topic->i_categories}">All committee news</a> </div>
                <div class="more-link text-right"><a href="/{$block_data.6.topic->i_categories}">Go to section  </a> </div>
            </div>
            {*               <div class="panel-head_bot"> <a class="link_topic" href="/{$block_data.6.topic->i_categories}">До розділу</a> </div>*}

        </div>
        <!-- /tab 2 -->

        {*<!-- tab 3 -->
        <div class="tab-pane fade" id="poster" role="tabpanel" aria-labelledby="poster-tab">
            <div class="row">
                {foreach item=data from=$block_data.10.items key=key name=i}  
                    {if $smarty.foreach.i.index < 2}

                        <div class="col-sm-4">
                            <div class="multimedia-item">
                                <div class="multimedia-item__img">
                                    <img alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" />

                                    <span class="time"> {$data->day} {$data->month},{$data->hour}</span>                                      
                                    <!--<a href="#" class="btn-round">Тема1</a>-->
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

                    {foreach item=data from=$block_data.10.items key=key name=i} 
                        {if $smarty.foreach.i.index > 1}

                            <div class="news-item">
                                <span class="date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>                                                                          
                                <p> <!-- $data->i_anons|truncate:200 -->
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </p>
                            </div>
                        {/if}
                    {/foreach}
                    
                </div>
            </div>
                
            <div class="more-link text-right"><a href="/{$block_data.10.topic->i_categories}"> Всі оголошення</a> </div> 
                

        </div>
        <!-- /tab 3 -->*}
        <hr style="border-bottom: 1px solid #D0D3D7;background: none;" >
{*        <hr class="full-width">*}
    </div>
            
            
            
            
    </div>
</section>

 

{*<section class="event-calendar">
    <div class="container">
    <div class="row pos_r">
        <div class="col-lg-4 col-md-6 event-calendar-titlle">
            <h2 class="block-heading">Events calendar</h2>
            {*<div class="event-time mob-hide">*}
               {* <span>in Kyiv</span>{$smarty.now|date_format:"%H:%M"} *}
                {*{php}
date_default_timezone_set('Europe/Kiev');
$localtime = localtime();
$localtime_assoc = localtime(time(), true);
//print_r($localtime);
echo $localtime_assoc['tm_hour'].':'.$localtime_assoc['tm_min'];
{/php}*}
{*            </div>*}
      {*  </div>
        <div class="col-lg-8 col-md-6 event-calendar-arrow">
            <a href="#" class="prev-event">
                <i class="icn-arrow-left"></i>
               Previous events
            </a>
            <a href="#" class="next-event">
               Ensuing events
                <i class="icn-arrow-right"></i>
            </a>
        </div>
    </div>
    <div class="event-calendar__slider">*}

        <!-- col 1 -->
       {* {foreach item=data key=date_anons from=$anons_info.an_date_inf name=i}*}
            {* when need white background add class bg-white to first div *}
           {* <div class="{$data[0].a_day_css_class}">
                <div class="event-date"><b>{$data[0].weekday},</b> {$data[0].day} {$data[0].name_monts} {$data[0].year}</div>

                <div class="event-list" >
                    <div class="scrollbar-block">
                
                        {foreach item=dat from=$data name=k}*}

                            {*                        <div class="slice3 slice-show event-item event-item__live">*}
                            {*<div class="slice3 {if $smarty.foreach.k.index<3}slice-show{/if} event-item ">
                                <span class="time">{$dat.time} </span>
                                <p><a href="{$dat.a_link}"><b>{$dat.i_name}</b></a></p>*}
                                <!--<span class="live-btn">Наживо</span>-->
                                {*                                <span class="rada-tv__label"><b>RADA</b>TV</span>*}
                                {*                                <a href="http://iportal.rada.gov.ua/fba" class="btn-more">Акредитація</a>*}
                                {*                                <a href="#" class="youtube-btn" tabindex="0"></a>*}
                          {*  </div>
                        {/foreach}*}

{*                        {if $smarty.foreach.k.last && $smarty.foreach.k.index>2}    *}

{*                        {/if}      *}
                            {*{if $smarty.foreach.k.index>2}
                            <div class=" event-item load-more">*}
{*                                Наступні події цього дня*}
                          {*      <a href="#" class="other-event">Subsequent events of the day</a>
                            </div>
                            {/if}
                    </div>

                </div>


            </div>
        {/foreach}*}  
        <!-- /col 1 -->
      
        <!-- col 2 -->
                {*<div>
                    <div class="zero-events">
                        <div class="zero-events__title">
                            No upcoming events as yet
                        </div>
                        

                        <p>Please check back later – it seems very probable that our managers are working on adding new events.</p>*}

                        {*<p>Приєднуйтесь до нашого календаря, для того, щоб залишатись в курсі усіх подій, що відбуваються у парламенті:</p>*}

                        {*<div class="calendar-link">
                            <a href="#">
                                <i class="fa-calendar-alt"></i>
                                Приєднатися до календаря
                            </a>
                            
                
                            <small>
                                За посиланням — URL на підписку до календаря у форматі iCalendar
                            </small>
                        </div>*}
                    {*</div>

                </div>*}
                <!-- /col 2 -->

                <!-- col 3 -->
                {*<div>
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

                </div>*}
                <!-- /col 3 -->

    {*</div>
    <div class="more-link">
        <a href="/en/preview/">Complete list of announced events </a>
    </div>
    </div>
</section>*}

                    <!--  -section-workVRU -->
                    
                    {if $is_plenar}
{*<!-- plenary week -->*}
    {include file='main_page/plenar_week.tpl'}
{*<!-- /plenary week -->*}
{*<a href="pletar_week.tpl"></a>*}
{else}
 
{*    <!-- no_plenar_weeek -->*}
 
    {include file='main_page/no_plenar_week.tpl'}
    

{/if}
        <!--section-work VRU end -->            
                    

        
        <section class="request-online" id="visit_to_parlament"style="border: 1px solid #D0D3D7;border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid;">
    <div class="container">
    <div class="row">
        <div class="col-lg-6 col-sm-12">
            
            
            <div class="data-ukr__block">
                            <div class="data-ukr-heading">Український <br>парламентаризм</div>
                            <ul class="data-ukr__links">
                                <li><a href="https://www.google.com/maps/@50.4471293,30.5372882,3a,90y,320.72h,109.31t/data=!3m7!1e1!3m5!1sAF1QipPOQAVyRBdT_NfS8AJLHxEilvX6PEizMTqAQbJN!2e10!3e12!7i11000!8i5500"  class="tour-link" target="_blank">3D тур парламентом</a></li>
                                <li><a href="#" class="history-link">Історія</a><span class="soon-txt">Незабаром</span></li>
                                <li><a href="#" class="modernity-link">Сучасність</a><span class="soon-txt">Незабаром</span></li>
                            </ul>


                        </div>
            
        </div>
            <div class="col-lg-3 col-sm-12">

                        <div class="open-data__block size-sm">
                            <div class="open-data__heading">Ukrainian Parliament <br>Open Data</div>
                            <div class="open-data__text mob-hide">Ukrainian Parliament Open Data</div>
                            <a href="https://opendata.rada.gov.ua" target="_blank" class="open-data__link"><b>Go to site</b></a>
                        </div>

                    </div>
                    <div class="col-lg-3 col-sm-12">
                        <div class="faq-blocks">
                            <div class="faq-online size-s">
                                <img src="img/icn-emoji.png" width="64" height="64" alt="" />
                                <div class="faq-tooltip">
                                    <div class="message-row">
                                        <span>Наші вітання!</span>
                                    </div>
                                    <div class="message-row">
                                        <span>Any questions to Verkhovna Rada?</span>
                                    </div>
                                </div>
                                <p>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/services/appeal-of-citizens/" class="faq-link_online">Напишіть своє звернення</a>
                                </p>
                            </div>
                        </div>
                    </div>
        {*<div class="faq-blocks col-lg-6 col-sm-12">
            <div class="faq-online size-s">
                <div class="faq-tooltip">
                    <div class="message-row">
                        <span>Маєте запитання до Верховної Ради?</span>
                    </div>
                </div>
                <p class="text-right">
                    <a target ="_blank" href="https://itd.rada.gov.ua/services/appeal-of-citizens/" class="faq-link_online">Звернення онлайн</a>
                </p>
            </div>

            <div class="faq-online size-s"></div>

            <div class="faq-online size-s"></div>

            <div class="faq-online size-s"></div>
        </div>*}
    </div>
    </div>
</section>
        
        {*<section class="request-online" id="visit_to_parlament">
    <div class="container">
    <div class="row">
        <div class="col-lg-6 col-sm-12">
            <div class="request-online__block">
                <div class="request-online__heading">Visit a plenary sitting!</div>
                <div class="request-online__text mob-hide">Feel free to view how Parliament works – just submit an online visit application!</div>

                <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/Account/Login?ReturnUrl=%2Fidsrv%2Fconnect%2Fauthorize%2Fcallback%3Fclient_id%3DUsersProfileSrv%26redirect_uri%3Dhttps%253A%252F%252Fitd.rada.gov.ua%252FSessionRequest%252Fsignin-oidc%26response_type%3Did_token%26scope%3Dopenid%2520profile%26response_mode%3Dform_post%26nonce%3D636970600622382000.Mjg1YTgxYzEtZDJlNC00ODU1LTlmZDUtNzdmNjQyYmNhNTNlNjM2NzE2ZDQtODU4My00MTRiLThmMjQtNTZjYzgzMTQzZGFj%26state%3DCfDJ8EEXp3S8g7FJiUCgWEsGHgi8qUbSRM07Id2Jrgwi58X-DHS35kuJyeS1k3HkI0rdUk1IyJEhpcg8sj43nYN-Xcf96JLtZBs-a0EiBdU5xo8MexiLxSiNZX3Ti9t2BNJ6mTHFRkTK-isfj_afx0Mz3EqANMEt4F4C99qnF7Nq2ny_V87JZT0S50Sz6L3ybis51JzN4n5p-CMl8Dozz3Qzp3ppQSfzHXAhcDTFgFDluD_49PO5CSJSWp1TX4eRgnBY1PlQChv_lAXruklKtIR6KDS3f00pUOQRScohIUNZR_UK4t4QAUvfHCxetRgxCNo7MitQCjRtIjn1kFBNixqE_tvjq58Qn0OYDvBNNnPmoVGb4l3_i5VFBFLsaiQNiq4rQg%26x-client-SKU%3DID_NET%26x-client-ver%3D2.1.4.0" class="btn-white">Submit a visit application</a>
                <a href="news/99824.html" class="request-online__link"><b>Rules <span class="mob-hide">of stay</span></b></a>

            </div>
            
            <div class="open-data__block">
                <div class="open-data__heading">Ukrainian Parliament <br>Open Data</div>
                <div class="open-data__text mob-hide">Ukrainian Parliament Open Data</div>
                <a href="https://opendata.rada.gov.ua" target="_blank" class="open-data__link"><b>Go to site</b></a>
        </div>
            
        </div>
        <div class="faq-blocks col-lg-6 col-sm-12">
            <div class="faq-online size-s">
                <div class="faq-tooltip">
                    <div class="message-row">
                        <span>Any questions to Verkhovna Rada?</span>
                    </div>
                </div>
                <p class="text-right">
                    <a target ="_blank" href="https://itd.rada.gov.ua/services/appeal-of-citizens/" class="faq-link_online">Online application</a>
                </p>
            </div>

            <div class="faq-online size-s"></div>

            <div class="faq-online size-s"></div>

            <div class="faq-online size-s"></div>
        </div>
    </div>
    </div>
</section>*}





<section class="bill-section">
<div class="container">
    <h2 class="block-heading">Draft laws</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="true">
                The last to register
            </a>
        </li>
        {*<li class="nav-item">
            <a class="nav-link" id="latest-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="popular" aria-selected="false">
                Popular  
            </a>
        </li>*}
        {*<li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
               Passed during the current session
            </a>
        </li>*}

    </ul>
    <a href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc2" class="search-by-link">Search <span class="tab-hide"> by attributes</span></a>
    
    <hr class="light">
</div>

    <div class="tab-content" id="myTabContent3">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="latest" role="tabpanel" aria-labelledby="latest-tab">

            <div class="row">
                <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">
    
    {foreach item=data from=$block_data.3.items}
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" class="bill-item">  
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-fill"><b>{$data->i_name}</b> at <b>{*{$data->hour},*} {$data->day} {$data->month} {$data->year}</b></span>
                            <span class="btn-red">New</span>
{*                            <span class="btn-border">Соціальна політика</span>*}

                            <p>{$data->i_anons}</p>
                             
                        </a>
                    {/foreach} 
    
                     
</div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">Legislative business</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc555">
                                       Registered over the week elapsed
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/pkg_zpsended.by_date">
                                        Provided to MPs
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc3_current">
                                        Under consideration at committees 
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/lawList">
                                        Passed during the current session
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                    
                    <hr class="light">

                            <div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    <i class="icn-paperclip"></i> Legislative drafting rules and major requirements to lawmaking techniques                                   
                                </a>
                                <p class="attachment-format">PDF 3,5 МBytes</p>
                            </div>

                            <hr class="light">
                                
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
                    <div class="more-link ">
                        <a href="{$block_data.3.topic->i_categories}">Go to section</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
            Popular Content
        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->
        <div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
            Accepted at the current session Content
        </div>
        <!-- /tab 3 -->
    </div>
</div>
</section>

{*======================================= ПЕТИЦІЇ ===================================================*}
{*<section class="petition-section">
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
</section>*}
{*======================================= / ПЕТИЦІЇ ===================================================*}


<section class="articles-block">
<div class="container">
    <h2 class="block-heading">Legislation</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab4" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#popular2" role="tab" aria-controls="popular2" aria-selected="true">
                Latest additions of parliamentary enactments
            </a>
        </li>
        {*<li class="nav-item">
            <a class="nav-link" id="valid-tab" data-toggle="tab" href="#valid" role="tab" aria-controls="valid" aria-selected="false">
                Набули чинності
            </a>
        </li>*}
    </ul>
    <a href="https://zakon.rada.gov.ua/rada/main/a?lang=en" class="search-by-link">Search <span class="tab-hide">by attributes</span></a>
    <hr class="light">
</div>
    <div class="tab-content" id="myTabContent4">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="popular2" role="tabpanel" aria-labelledby="popular2-tab">

            <div class="row">
                <div class="col-md-8 col-sm-12">
                    
                    {foreach item=data from=$block_data.4.items}
                        <div class="bill-item">
                            <div class="law-heading">
                                {if $data->i_link}                    
                                    <a href="{$data->i_link}">
                                {else}
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                {/if}
                            
                                {$data->i_name} від {*{$data->hour},*} {$data->day} {$data->month} {$data->year}
                                
                                </a>
                            </div>
{*                            <span class="btn-red">Новий</span>*}
{*                            <span class="btn-border">Соціальна політика</span>*}

                            
                            <p>{$data->i_anons}</p>
                        </div>
                    {/foreach}
                    
                    <div class="more-link">
                        <a href="{$block_data.4.topic->i_categories}">Go to section</a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <ul class="gerb-list">
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/show/254%D0%BA/96-%D0%B2%D1%80?lang=en">Constitution of Ukraine</a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/t21?lang=en">Ukraine’s codes</a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/tt1001?lang=en">Laws of Ukraine</a></li>
                    </ul>
                    <ul class="ul-list">
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/country?lang=en">International Acts <i class="icn-chevron-right"></i></a></li>
{*                                <li><a target ="_blank" href="https://www.kmu.gov.ua/ua/diyalnist/yevropejska-integraciya/perekladi-aktiv-acquis-yes">Translation of EU legal acts<i class="icn-external"></i></a></li>*}
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/g22?lang=en">Translation of EU legal acts<i class="icn-external"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/perv?lang=en">Primary legislation  <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/koms?lang=en"> Documents by Committees<i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/annot?lang=en">Abstracts of Documents<i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/term?lang=en">Legislative glossary <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/klas?lang=en">Legal classification of documents<i class="icn-chevron-right"></i> </a></li>
                                {*<li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/klas">Юридична класифікація<i class="icn-chevron-right"></i> </a></li>*}
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/days?lang=en">Calendar of official dates  <i class="icn-chevron-right"></i></a></li>
                    </ul>
                </div>
            </div>


        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="valid" role="tabpanel" aria-labelledby="valid-tab">
            Laws enured Content
        </div>
        <!-- /tab 2 -->
    </div>
</div>
</section>
                                
                                <section class="blocks-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-sm-12">
                        <div class="rada-tv__block">
                            <img src="img/rada-line.svg" width="269" height="55" alt="" />
                            <div class="rada-tv__text">
                                Парламентський телеканал
                            </div>

                            <a href="/video/rada-tv/64430.html" class="btn-white">Дивитись онлайн </a>
                        </div>

                    </div>
                    <div class="col-lg-3 col-sm-12">
                        <div class="golos__block">
                            <img src="img/golos.gif" alt="" />
                            <div class="golos__txt">
                                <p>Газета Верховної Ради України. Новини парламенту та України онлайн</p>

                                <a href="http://www.golos.com.ua/" class="golos__link">Перейти на сайт <span class="icn-external"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-12">
                        <a href="https://www.facebook.com/educationcenterofVRU/" target="_blank" class="educational__block">
                            <span class="educational__heading">Освітній центр</span>
                            <span>
                                Верховної Ради України у Facebook
                            </span>
                        </a>
                    </div>
                </div>
            </div>
        </section>

{*==========Begin Digest======================*}

 

{*=========End Digest=========================*}


<!-- end main content -->
