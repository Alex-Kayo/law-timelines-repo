<!-- main content -->

<section class="news-line">
    <div class="container">
                 
                <div class="row">
{*                    <div class="col-lg-8">*}
{*                     <div class="col-lg-8 col-md-12">*}
                     <div class="col-lg-6 col-md-12">
            <div class="main-news">
                <div id="carouselExampleControls" class="carousel slide" data-pause="false" data-interval="10000" data-ride="carousel">
                    <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleControls" data-slide-to="0" class="active"><span></span></li>
                                    <li data-target="#carouselExampleControls" data-slide-to="1"><span></span></li>
                                    <li data-target="#carouselExampleControls" data-slide-to="2"><span></span></li>
                                    {*<li data-target="#carouselExampleControls" data-slide-to="3"><span></span></li>
                                    <li data-target="#carouselExampleControls" data-slide-to="4"><span></span></li>*}
                    </ol>
                    <div class="carousel-inner">
                {foreach item=data from=$top_news key=key name = j}  
                   {if $smarty.foreach.j.index <= 2} 
                    <div class="carousel-item {if $smarty.foreach.j.index == 0}active{/if}">
                    <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg" {*height="410"*}/>
                    <div class="main-news_heading">
                        <small>Важлива тема:</small>
                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                    </div>
                    </div>
                    {/if}
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


{*                    <div class="col-lg-4">*}
                    <div class="col-lg-6">
                        
                        
                        {foreach item=data from=$top_news key=key name=i} 
{*                        {if $smarty.foreach.i.index >= 4}            {*//javir*}
{if $smarty.foreach.i.index > 2}
{*                            <div class="news-item">*}
                            <div class="main-news-list" style="padding-top: 0.7em;">
                                <span class="date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>                                                                          
                                <p> {*$data->i_anons|truncate:200*}
                                     {if $data->is_video}
                                      <span class="btn-video">Відео</span>
                                      {/if}
                                       <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                            {$data->i_name}
                                        </a>
                                </p>
                            </div>
                        {/if}
                    {/foreach}
                     <div class="more-link text-lg-right"><a target ="_blank" href="/news/Top-novyna/ "> Всі топ-новини</a> </div> 
                    </div>
  


                {*<div class="more-link text-right">
                    <a href="/news/">Архів новин</a>
                </div>*}




                    </div>

<hr>


                <div class="row"><!--/row-->
                    {*<div class="col-lg-12">
                        <a  href="https://www.rada.gov.ua/documents/second_parl_summit_inter_crimea_platf">
                                <img style="margin-left: 0.01rem; margin-bottom: 1.2em;" src="/img/banners/banerCr2.jpg" class="img-fluid" alt="">
                            </a>
 
                        </div>*}<!--javir20102023-->
                        
                        
                        
                    {*<div class="col-lg-12">
                    <br>
                        <a  href="/news/parl_sum">
                        <a  href="https://www.rada.gov.ua/news/parl_sum">
                                <img style="margin-left: 0.01rem; margin-bottom: 1.2em;" src="/img/banners/parlam_sumit.jpeg" class="img-fluid" alt="Кримська платформа">
                            </a>
                        </div>*}



                        {*<div class="col-lg-12">

                            <a  href="https://attacks.stopwar.team/" rel="noopener">

                                <img style=" margin-bottom: 1.2em;" src="/img/banners/timeline_658x300.jpg" class="img-fluid" alt="">
                            </a>

                            <a  href="/news/razom">
                                <img style="margin-left: 0.2rem; margin-bottom: 1.2em;" src="/img/banners/together_500x300.jpg" class="img-fluid" alt="">
                            </a>

                        </div>*}


{*                        <br>*}
{*                        <br>*}
{*                        <br>*}



{*  razom_baner  *}

                    <link rel="stylesheet" type="text/css" href="/sources/css/razom.css" />

                        <div class="col-lg-8">
                        <div class="razom__block">


                        <div class="razom__heading">МИ РАЗОМ - ПРОТИ РОСІЙСЬКОЇ АГРЕСІЇ</div>

{*                        <a  href="/news/razom" class="razom__link"style="padding-right: 0.8rem;"><b>ПЕРЕЙТИ ДО РОЗДІЛУ</b> </a>*}
                        <a href="https://www.rada.gov.ua/news/razom" class="razom__link" style="padding-right: 0.8rem;background: url('/img/icn-more-s_w.svg') right -7px top 11px no-repeat;"><b>ПЕРЕЙТИ ДО РОЗДІЛУ</b> </a>
                        <br>
                        <a href="https://zakon.rada.gov.ua/laws/main?find=2&user=a&org=1&typ=1%7C2&dat=20220224&datl=2" class="razom__link" rel="noopener" target="_blank" style="padding-right: 0.8rem;background: url('/img/icn-more-s_w.svg') right -7px top 11px no-repeat;"><b>ЗАКОНИ ТА ПОСТАНОВИ, ПРИЙНЯТІ У ВОЄННИЙ ЧАС</b> </a>
                        <br>
                        <br>
{*                        *}{**}{* {if !$items_hide}*}
{*                          <a href="news/99824.html" class="covid19__link"><b>Заходи <span class="mob-hide">по боротьбі з коронавірусом </span>у Верховній Раді <span class="mob-hide">України </span></b></a>*}
{*                         {/if}*}

                    </div>


                        </div>
                    {*  !razom_baner  *}

                    {*  glory_baner  *}
                    <div class="col-lg-4">
                        <div style="text-align: right; font-size: 2rem">
                            {*                        <a class="telegram-ico" href="https://t.me/GloryToUkraineVRU" target="_blank"*}
                            {*                           title="Телеграм">*}
                            {*                            <i class="fab fa-telegram-plane"></i>*}
                            {*                        </a>*}
                            &nbsp;&nbsp;
                            <a class="facebook-ico" href="https://www.facebook.com/CharitableFoundationGloryToUkraine/"
                               target="_blank" title="Фейсбук">
                                <i class="fa fa-facebook-official"></i>
                            </a>
                        </div>

                        {*<h3 style="margin-left: 3rem; margin-bottom: 2rem " ><img src="/img/icn-rada-transcript.svg"><a  href="https://zakon.rada.gov.ua/laws/main?find=2&user=a&org=1&typ=1%7C2&dat=20220224&datl=2" rel="noopener" target="_blank">&nbsp; Закони та постанови Верховної Ради України, прийняті у період воєнного стану <span class="icn-external" ></span></a> </h3>*}

                        <a href=" https://glory2ukraine.rada.gov.ua/ua" target="_blank">

                            <img style="margin-left: 0.77rem; margin-bottom: -0.3em;" src="/img/banners/glory3.png" class="img-fluid" alt="благодійний фонд">
                        </a>
<hr >
                        <a href=" https://u24.gov.ua/" target="_blank">

                            <img  src="/img/banners/united24.png" class="img-fluid" alt="благодійний фонд">
                        </a>
                    </div>
                    {*  !glory_baner  *}


{*                    </div>*}
{*                    </div>*}

                </div>
            
                 {*  30років_baner  *}
{*<div class="mob-hide">
<link rel="stylesheet" type="text/css" href="/sources/css/konst.css" />

    <div class="banner_block" onclick="window.location='#';">
                <div class="covid19__heading"></div>
                <div class="covid19__text mob-hide">Заходи по боротьбі з коронавірусом</div>

                <a target ="_blank" href="#" class="" style="padding-right: 0.8rem;"><b>link1</b></a> <br class="mob-hide">
<span class="mob-hide"><a target ="_blank" href="#" class="float-right align-bottom"style="padding-right: 0.8rem;"><b>Перейти до розділу </b>  <img src="/img/ico-link_white.png"> </a> </span>             

   </div>
</div>*}

{*  !30років_baner  *}
                    

 
   
    {*<h2 class="block-heading">Новини та публікації</h2>*}
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
            <a class="nav-link" id="newsf-tab" data-toggle="tab" href="#newsf" role="tab" aria-controls="newsc" aria-selected="false">
                Новини фракцій та груп

            </a>
        </li>

{*        <li class="nav-item">*}
{*            <a class="nav-link" id="adver-tab" data-toggle="tab" href="#adver" role="tab" aria-controls="newsc" aria-selected="false">*}
{*                Оголошення  про роботу парламенту*}
{*                *}
{*            </a>*}
{*        </li>*}
        <li class="nav-item">
            <a class="nav-link" id="adver1-tab" data-toggle="tab" href="#adver1" role="tab" aria-controls="newsc" aria-selected="false">
               Новини ТСК
            </a>
        </li>
{*        <li class="nav-item">*}
{*            <a class="nav-link" id="adver1-tab" data-toggle="tab" href="#adver1" role="tab" aria-controls="newsc" aria-selected="false">*}
{*               Оголошення про призначення*}
{*            </a>*}
{*        </li>*}
        {*<li class="nav-item">
            <a class="nav-link" id="poster-tab" data-toggle="tab" href="#poster" role="tab" aria-controls="poster" aria-selected="false">
                Оголошення
               <!--<span class="count">3</span>-->
            </a>
        </li>*}

    </ul>
{*    <a href="/rss/news" class="rss-btn">RSS</a>*}
{* ================================= ТЕМИ ============================================   *}
  {*  <div class="news-list-theme">
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
            <li>*}
                
                {*<div class="dropdown">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink2" data-toggle="dropdown">
                        Ще теми
                    </a>

                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink2">
                        <li><a class="dropdown-item" data-toggle="pill" href="#menu10-2">Action</a></li>
                        <li><a class="dropdown-item" data-toggle="pill" href="#menu11-2">Another action</a></li>
                        <li><a class="dropdown-item" data-toggle="pill" href="#menu12-2">Something else here</a></li>
                    </ul>
                </div>*}
 {*           </li>
        </ul>
        
        <a href="/rss/news" class="rss-btn">RSS</a>
    </div>*}
{* ================================= / ТЕМИ ============================================   *}
        
        
</div>
    <div class="tab-content" id="myTabContent">

        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="newsp" role="tabpanel" aria-labelledby="newsp-tab">


            <div id="menu1" class="tab-pane fade show active">
                <div class="row">
                    <div class="col-lg-8">
                        <ul class="main-news-list">
                            
{*                            {foreach item=data from=$logo_news_mp key=key name=i}  *}
                   {* {if $smarty.foreach.i.index <= 1}*}
{*                        <li>*}

                     {*   <div class="multimedia-item">
                             <div class="multimedia-item__img">
                                 <img alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg"  />
                                   <span class="time"> {$data->day} {$data->month},{$data->hour}</span>
                                   <a href="#" class="btn-round">Тема2</a>
                             </div>
                                 <div class="multimedia-item__heading">
                                     {if $data->is_video}
                                      <span class="btn-video">Відео</span>
                                      {/if}
                                       <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                            {$data->i_name}
                                        </a>
                                 </div>
                                    <div class="multimedia-item__anons">{$data->i_anons|truncate:250}
                                    </div>
                                    </div>
                                    </li>
                    {/if}
                {/foreach} *}
                            
                                          
                
                             {foreach item=data from=$logo_news_mp key=key name=i}
                        {if $smarty.foreach.i.index <= 5}
                        <li>

                        <div class="news-list-item">
                             <div class="news-list-item__title">
                                 <div class="multimedia-item__heading">
                                     {if $data->is_video}
                                      <a href="#" class="btn-video">Відео</a>
                                      {/if}
                                       <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                            {$data->i_name}
                                        </a>
                                 </div>
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
                        
                        
                        {foreach item=data from=$logo_news_mp key=key name=i} 
{*                        {if $smarty.foreach.i.index >= 4}            {*//javir*}
{if $smarty.foreach.i.index > 5 && $smarty.foreach.i.index <= 8}
                            <div class="news-item">
                                <span class="date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>                                                                          
                                <p> {*$data->i_anons|truncate:200*}
                                     {if $data->is_video}
                                      <span class="btn-video">Відео</span>
                                      {/if}
                                       <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                            {$data->i_name}
                                        </a>
                                </p>
                            </div>
                        {/if}
                    {/foreach}

  
                    {foreach item=data from=$fixednews key=key name=i}

                            {if  $smarty.foreach.i.index<=1}

                                <div class="news-item">
                                    {*                                <span class="date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>                                                                          *}
                                    <p> {*$data->i_anons|truncate:200*}
                                        <span class="btn-fixed">До уваги</span>
                                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                            {$data->i_name}
                                        </a>
                                    </p>
                                </div>

                            {/if}

                        {/foreach}
                    
                    {if $fixednews->count()>2}
                            <div   class="more-link text-right"><a target ="_blank" href="/news/fixed_news/ ">Всі новини до уваги</a> </div>

                        {/if}
  


                {*<div class="more-link text-right">
                    <a href="/news/">Архів новин</a>
                </div>*}

                    </div>
                    


                </div><!--/row-->

                {*<div class="more-link text-lg-left">
                    <a href="/news/">Архів новин</a>
                </div>*}
            </div>
{*            <div class="more-link text-lg-left"><a target ="_blank" href="/newscenter">  Всі Тор-новини</a> </div>*}

            <div   class="more-link text-right"><a target ="_blank" href="/newscenter">Сайт всіх новин</a> </div>
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
                                    {if $data->is_video}
                                      <span class="btn-video">Відео</span>
                               {/if}
                                    <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name} </a> </h4>   
                                    
                                    {if strlen($data->i_logoname) == 0} <span class="time grey">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {*{$data->hour}*}</span>
                                        {/if}
                                    <text>{$data->i_anons} </text><br />

                                    </span>

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

        <!-- tab 2a -->
        <div class="tab-pane fade" id="newsf" role="tabpanel" aria-labelledby="newsf-tab">
            <div class="row">
                {foreach item=data from=$block_data.17.items key=key name=i}
                    {if $smarty.foreach.i.index  < 6 }

                        <div class="col-sm-4">
                            <div class="multimedia-item">
                                {if strlen($data->i_logoname) > 0}
                                    <div class="multimedia-item__img">
                                        <img src="/uploads/logos_small/{$data->i_logoname}.jpeg" class="borderimg" alt="" />
                                        <span class="time">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {*{$data->hour}*}</span>
                                    </div>
                                {/if}
                                <div class="multimedia-item__heading">
                                    {*  <a href="#" class="btn-video">Відео</a>*}
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>

                                </div>
                                <div class="multimedia-item__anons"> {$data->i_anons|truncate:250}</div>

                                {if strlen($data->i_logoname) == 0} <span class="time grey">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {*{$data->hour}*}</span>
                                {/if}
                                <br>

                            </div>
                        </div>
                    {/if}
                {/foreach}
                {* <div class="col-sm-4">

                     {foreach item=data from=$block_data.10.items key=key name=i}
                         {if $smarty.foreach.i.index < 5}

                             <div class="news-item">
                                 <span class="date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>
                                 <p>
                                     <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </p>
                             </div>
                         {/if}
                     {/foreach}

                 </div>*}
            </div>

            <div class="more-link text-right"><a href="/{$block_data.17.topic->i_categories}"> Всі новини фракцій та груп</a> </div>


        </div>
        <!-- /tab 2a -->


        <!-- tab 3 -->
        <div class="tab-pane fade" id="adver" role="tabpanel" aria-labelledby="adver-tab">
            <div class="row">
                {foreach item=data from=$block_data.11.items key=key name=i}
                    {if $smarty.foreach.i.index  < 5 }

                        <div class="col-sm-4">
                            <div class="multimedia-item">
                                <div class="multimedia-item__img">
                                    <img alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" />

                                    <span class="time"> {$data->day} {$data->month},{$data->hour}</span>                                      
                                    <!--<a href="#" class="btn-round">Тема1</a>-->
                                </div>
                                <div class="multimedia-item__heading">
                                  {*  <a href="#" class="btn-video">Відео</a>*}
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </div>
                                <div class="multimedia-item__anons"> {$data->i_anons|truncate:250}</div>

                            </div>
                        </div>
                    {/if}
                {/foreach} 
               {* <div class="col-sm-4">

                    {foreach item=data from=$block_data.10.items key=key name=i} 
                        {if $smarty.foreach.i.index < 5}

                            <div class="news-item">
                                <span class="date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>                                                                          
                                <p>  
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </p>
                            </div>
                        {/if}
                    {/foreach}
                    
                </div>*}
            </div>
                
            <div class="more-link text-right"><a href="/{$block_data.11.topic->i_categories}"> Всі оголошення</a> </div>
                

        </div>
        <!-- /tab 3 -->
        <!-- tab 4 -->
        <div class="tab-pane fade" id="adver1" role="tabpanel" aria-labelledby="adver1-tab">
           {* <div class="row">
                {foreach item=data from=$block_data.6.items key=key name=i}
                    {if $smarty.foreach.i.index < 5}*}

                        {*<div class="col-sm-4">
                            <div class="multimedia-item">
                                <div class="multimedia-item__img">
                                    <img alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" />

                                    <span class="time"> {$data->day} {$data->month},{$data->hour}</span>*}
                                    <!--<a href="#" class="btn-round">Тема1</a>-->
                               {* </div>
                                <div class="multimedia-item__heading">*}
{*                                    <a href="#" class="btn-video">Відео</a>*}
                                   {* <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </div>
                                <div class="multimedia-item__anons"> {$data->i_anons|truncate:250}</div>

                            </div>
                        </div>
                    {/if}
                {/foreach}*}
                <div class="row">
                {*<div class="col-sm-4">*}

                    {foreach item=data from=$block_data.7.items key=key name=i}
                        {if $smarty.foreach.i.index < 6}

                            <div class="col-sm-4">
                                <div class="news-item">
                                <span class="date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>
                                <p> <!-- $data->i_anons|truncate:200 -->
                                    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </p>
                            </div></div>
                        {/if}
                    {/foreach}

                
            </div>

            <div class="more-link text-right"><a href="/{$block_data.7.topic->i_categories}"> Всі новини ТСК</a> </div>


        </div>
        <!-- /tab 4 -->
    </div>
{*    </div>*}
</section>
     



{*video*}
{*<section class="event-calendar1 blocks-section">*}
{*    <div id="presclu" class="news-section">*}
{*        <div class="container">*}

{*            <h2 class="block-heading"><a  href="https://attacks.stopwar.team/" rel="noopener">Історія атак на цивільні об'єкти в Україні <span class="icn-external"></span></a> </h2>*}
{*            <i id="p-s"></i>*}

{*            <h3 style="color: #721c24"><b>Що таке «русский мир»  насправді</b></h3>*}
{*            <div class="press-team__slider">*}



{*                <div>*}
{*                    <div>*}
{*                        <div class="responsive-embed" >*}
{*                            <video  controls>*}
{*                                <source src="/uploads/video/AMSTERDAM_CLOSETHESKY.mp4" type="video/mp4">*}
{*                                *}{*  <source src="mov_bbb.ogg" type="video/ogg">*}
{*                                Ваш  веб-браузер не підтримує HTML5 відео.*}
{*                            </video>*}
{*                        </div>*}
{*                        <div class="card-body">*}

{*                            <h5 class="card-title">*}
{*                            </h5>*}
{*                            *}{*                            <p class="card-text">{$data->i_name}</p>*}
{*                            <p class="card-text"></p>*}
{*                        </div>*}
{*                    </div>*}
{*                </div>*}

{*                <div>*}
{*                    <div >*}
{*                        <div class="responsive-embed" >*}
{*                            <video  controls>*}
{*                                <source src="/uploads/video/FRANKFURT_CLOSETHESKY.mp4" type="video/mp4">*}
{*                                *}{*  <source src="mov_bbb.ogg" type="video/ogg">*}
{*                                Ваш  веб-браузер не підтримує HTML5 відео.*}
{*                            </video>*}
{*                        </div>*}
{*                        <div class="card-body">*}

{*                            <h5 class="card-title">*}
{*                            </h5>*}
{*                            *}{*                            <p class="card-text">{$data->i_name}</p>*}
{*                            <p class="card-text"></p>*}
{*                        </div>*}
{*                    </div>*}
{*                </div>*}


{*                <div>*}
{*                    <div>*}
{*                        <div class="responsive-embed" >*}
{*                            <video  controls>*}
{*                                <source src="/uploads/video/PARIS_CLOSETHESKY.mp4" type="video/mp4">*}
{*                                *}{*  <source src="mov_bbb.ogg" type="video/ogg">*}
{*                                Ваш  веб-браузер не підтримує HTML5 відео.*}
{*                            </video>*}
{*                        </div>*}
{*                        <div class="card-body">*}

{*                            <h5 class="card-title">*}
{*                            </h5>*}
{*                            *}{*                            <p class="card-text">{$data->i_name}</p>*}
{*                            <p class="card-text"></p>*}
{*                        </div>*}
{*                    </div>*}
{*                </div>*}
{*                <div>*}
{*                    <div >*}
{*                        <div class="responsive-embed" >*}
{*                            <video  controls>*}
{*                                <source src="/uploads/video/ROME_CLOSETHESKY.mp4" type="video/mp4">*}
{*                                *}{*  <source src="mov_bbb.ogg" type="video/ogg">*}
{*                                Ваш  веб-браузер не підтримує HTML5 відео.*}
{*                            </video>*}
{*                        </div>*}
{*                        <div class="card-body">*}

{*                            <h5 class="card-title">*}
{*                            </h5>*}
{*                            *}{*                            <p class="card-text">{$data->i_name}</p>*}
{*                            <p class="card-text"></p>*}
{*                        </div>*}
{*                    </div>*}
{*                </div>*}
{*                <div>*}
{*                    <div >*}
{*                        <div class="responsive-embed" >*}
{*                            <video  controls>*}
{*                                <source src="/uploads/video/ROTTERDAM_CLOSETHESKY.mp4" type="video/mp4">*}
{*                                *}{*  <source src="mov_bbb.ogg" type="video/ogg">*}
{*                                Ваш  веб-браузер не підтримує HTML5 відео.*}
{*                            </video>*}
{*                        </div>*}
{*                        <div class="card-body">*}

{*                            <h5 class="card-title">*}
{*                            </h5>*}
{*                            *}{*                            <p class="card-text">{$data->i_name}</p>*}
{*                            <p class="card-text"></p>*}
{*                        </div>*}
{*                    </div>*}
{*                </div>*}
{*                <div>*}
{*                    <div >*}
{*                        <div class="responsive-embed" >*}
{*                            <video  controls>*}
{*                                <source src="/uploads/video/VATICAN_CLOSETHESKY.mp4" type="video/mp4">*}
{*                                *}{*  <source src="mov_bbb.ogg" type="video/ogg">*}
{*                                Ваш  веб-браузер не підтримує HTML5 відео.*}
{*                            </video>*}
{*                        </div>*}
{*                        <div class="card-body">*}

{*                            <h5 class="card-title">*}
{*                            </h5>*}
{*                            *}{*                            <p class="card-text">{$data->i_name}</p>*}
{*                            <p class="card-text"></p>*}
{*                        </div>*}
{*                    </div>*}
{*                </div>*}




{*            </div>*}

{*            <div class="col-lg-8 col-md-6 event-calendar-arrow " style="max-width: 99%">*}
{*                <div class="event-press *}{*mob-hide*}{* hidden-sm hidden-xs" >*}
{*                    <a href="#" class="prev-event mob-hide"style="margin-right: 80%;">*}
{*                        <i class="icn-arrow-left"></i>*}
{*                        *}{* Попередні*}
{*                    </a>*}
{*                    <a href="#" class="next-event" style="float: right; *}{*top: -1.57rem;*}{*" >*}
{*                        *}{*Наступні*}
{*                        <i class="icn-arrow-right"></i>*}
{*                    </a>*}
{*                </div>*}
{*            </div>*}

{*        </div>*}
{*    </div>*}
{*</section>*}

{*!video*}

{*<br>*}
{*<h3 style="color: #c82333"><b>Обережно!</b> Не викладайте у соцмережах фото та координати влучань ворожих снарядів зразу після удару. Не допомогайте ворогу корегувати вогонь.</h3>*}

{* *}
{*<br>*}
{*<br>*}
{*<br>*}
{*<br>*}


{*        *}{*  covid_baner  *}

<link rel="stylesheet" type="text/css" href="/sources/css/memorial.css" />

    <div class="memory__block" onclick="location.href='/memorial'" style="cursor:pointer">
         {*<p> <a target ="_blank" href=" /memorial" class="memory__heading"  > Пам'яті народних депутутів України   </a>   </p> 
         <p>   <a target ="_blank" href=" /memorial" class="memory__heading"  > та працівників Апарату Верховної Ради України,   </a>  </p>  
         <p>   <a target ="_blank" href=" /memorial" class="memory__heading"  > які загинули внаслідок російської збройної агресії  </a>  </p> *}
         <div class="memory__heading " style="padding-top: 0.7em;">   Пам'яті народних депутатів України  </div>
                <div class="memory__heading">  та працівників Апарату Верховної Ради України,  </div>
                <div class="memory__heading"> які загинули внаслідок російської збройної агресії </div>
<div class="text-right">
    
     
                {*<a target ="_blank" href=" /memorial" class="covid19__link text-right" style="padding-right: 0.8rem;"><b>Меморіал пам'яті<span class="mob-hide"> </span>  </b></a> <br class="mob-hide">*} </div>
{*                <a target ="_blank" href="https://moz.gov.ua/koronavirus-2019-ncov" class="covid19__link"style="padding-right: 0.8rem;"><b>АКТУАЛЬНО ПРО COVID-19</b> </a> <br class="mob-hide">*}
{*       *} {*{if !$items_hide}
         <a href="news/99824.html" class="covid19__link"><b>Заходи <span class="mob-hide">по боротьбі з коронавірусом </span>у Верховній Раді <span class="mob-hide">України </span></b></a>
        {/if}*}
 
            </div>

{*  !covid_baner  *}


 


{*<hr >*}
    {*  razom_baner  *}

                  {*  <link rel="stylesheet" type="text/css" href="/sources/css/razom.css" />*}

{*                        <div class="col-lg-12">*}
{*                        <div class="razom__block">*}


{*                        <div class="razom__heading">МИ РАЗОМ - ПРОТИ РОСІЙСЬКОЇ АГРЕСІЇ</div>*}

{*                        <a  href="/news/razom" class="razom__link"style="padding-right: 0.8rem;"><b>ПЕРЕЙТИ ДО РОЗДІЛУ</b> </a>*}
                        {*<a href="https://www.rada.gov.ua/news/razom" class="razom__link" style="padding-right: 0.8rem;background: url('/img/icn-more-s_w.svg') right -7px top 11px no-repeat;"><b>ПЕРЕЙТИ ДО РОЗДІЛУ</b> </a>*}
{*                        <br>*}
                        {*<a href="https://zakon.rada.gov.ua/laws/main?find=2&user=a&org=1&typ=1%7C2&dat=20220224&datl=2" class="razom__link" rel="noopener" target="_blank" style="padding-right: 0.8rem;background: url('/img/icn-more-s_w.svg') right -7px top 11px no-repeat;"><b>ЗАКОНИ ТА ПОСТАНОВИ, ПРИЙНЯТІ У ВОЄННИЙ ЧАС</b> </a>
                        <br>
                        <br>*}
{*                        *}{**}{* {if !$items_hide}*}
{*                          <a href="news/99824.html" class="covid19__link"><b>Заходи <span class="mob-hide">по боротьбі з коронавірусом </span>у Верховній Раді <span class="mob-hide">України </span></b></a>*}
{*                         {/if}*}

{*                    </div>*}


{*                        </div>*}
                    {*  !razom_baner  *}
    
<br>
{*<a  href="/documents/wparl">
    <img style="margin-bottom: 1.5em;" src="/img/banners/wparl.jpg" class="img-fluid" alt="">

</a> *}

<hr >
<br>
<a  href="/documents/wparl">
    <img style="margin-bottom: 1.5em;" src="/img/banners/wparl.jpg" class="img-fluid" alt="">

</a> <hr> 
<br>
<a  href="/documents/seleb">
    <img style="margin-bottom: 1.5em;" src="/img/banners/seleb.jpg" class="img-fluid" alt="">
</a>

  {* <div class="row"> 
    <div class="col-lg-6" style="padding-left: 5px;padding-right: 5px;">
<a  href="/documents/wparl">
    <img style="margin-bottom: 1.5em; padding-left: 0.5em;" src="/img/banners/wparl.jpg" class="img-fluid" alt="">

</a> </div>
<div class="col-lg-6" style="padding-left: 5px;padding-right: 5px;">
 
<a  href="/documents/seleb">
    <img style="margin-bottom: 1.5em; padding-right: 0.5em;" src="/img/banners/seleb.jpg" class="img-fluid" alt="">
</a></div>
</div>*}
    
    
    
{*<br>
<a  href="/documents/seleb">
    <img style="margin-bottom: 1.5em;" src="/img/banners/seleb.jpg" class="img-fluid" alt="">
</a>*}
    
    

    
    
<section class="event-calendar">
    <div class="container">
    <div class="row pos_r">
        <div class="col-lg-4 col-md-6 event-calendar-titlle">
            <h2 class="block-heading">Календар подій</h2>
            <div class="event-time mob-hide">
{*                <span>у Києві</span>{$smarty.now|date_format:"%H:%M"}*}
                {*{php}
date_default_timezone_set('Europe/Kiev');
$localtime = localtime();
$localtime_assoc = localtime(time(), true);
//print_r($localtime);
echo $localtime_assoc['tm_hour'].':'.$localtime_assoc['tm_min'];
{/php}*}
            </div>
        </div>
        <div class="col-lg-8 col-md-6 event-calendar-arrow">
            <a href="#" class="prev-event">
                <i class="icn-arrow-left"></i>
                Попередні події
            </a>
            <a href="#" class="next-event">
                Наступні події 
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
                    <div class="scrollbar-block">
                
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
                            Поки що, запланованих подій на майбутнє більше немає
                        </div>
                        

                        <p>Завітайте пізніше, можливо, наші менеджери як раз працюють над додаванням нових подій.</p>

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
        <a href="/preview/anonsy_podij">Усі анонсовані події</a>
    </div>
    </div>
</section>


{*<!-- news-section -->
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

                    {if $data->i_link}
                        <a href="{$data->i_link}">{$data->i_name}</a>
                        {else}
                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>    
                    {/if}
                    </div> 
                   <!-- <div class="sub-news_heading">

                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>

                    </div> -->
                    <!--
                    <span class="sub-news_date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>
                    -->
                </div>
            </div>
        {/foreach}       


    </div>
    </div>

</div><!-- /news-section -->*}
{if $is_plenar}
{*<!-- plenary week -->*}

    {include file='main_page/plenar_week.tpl'}
{*<!-- /plenary week -->*}
{*<a href="pletar_week.tpl"></a>*}
{else}
 
{*    <!-- no_plenar_weeek -->*}
 
    {include file='main_page/no_plenar_week.tpl'}
    

{/if}


<section class="request-online" id="visit_to_parlament"style="border: 1px solid #D0D3D7;border-top-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-bottom-style: solid; border-left-width: 0px; border-right-width: 0px;">
    <div class="container">
    <div class="row">
        <div class="col-lg-6 col-sm-12">
            
            
            <div class="data-ukr__block">
                            <div class="data-ukr-heading">Український <br>парламентаризм</div>
                            <div class="baner_col" style="display: table-cell;width: 20%;">
                            <ul class="data-ukr__links">
                                <li><a href="https://www.google.com/maps/@50.4471293,30.5372882,3a,90y,320.72h,109.31t/data=!3m7!1e1!3m5!1sAF1QipPOQAVyRBdT_NfS8AJLHxEilvX6PEizMTqAQbJN!2e10!3e12!7i11000!8i5500"  class="tour-link" target="_blank">3D тур парламентом</a></li>
                                <li><a href="#" class="history-link">Історія</a><span class="soon-txt">Незабаром</span></li>
                                <li><a href="#" class="modernity-link">Сучасність</a><span class="soon-txt">Незабаром</span></li>
                            </ul>
                            </div>
{*                            <div class="baner_col" style="display: table-cell;width: 1%;">*}

{*                            </div>*}
{*                            <div class="baner_col" style="display: table-cell;width: 20%;">*}
{*                            <ul class="data-ukr__links">*}
{*                                <li><a href="#" class="modernity-link">Реєстрація на екскурсії</a><span class="soon-txt">Незабаром</span></li>*}
{*                                <li><a href="#" class="history-link">Історія</a><span class="soon-txt">Незабаром</span></li>*}

{*                            </ul>*}
{*                            </div>*}

                        </div>
            
        </div>
            <div class="col-lg-3 col-sm-12">

                        <div class="open-data__block size-sm">
                            <div class="open-data__heading">Відкриті <br>парламентські дані</div>
                            <div class="open-data__text mob-hide">Ukrainian Parliament Open Data</div>
                            <a href="https://opendata.rada.gov.ua" target="_blank" class="open-data__link"><b>Перейти на портал</b></a>
                        </div>

                    </div>
            {*<div class="col-lg-3 col-sm-12">
                <link rel="stylesheet" type="text/css" href="/sources/css/advert-data.css" />

                        <div class="open-data__block size-sm" style="height: 270px;">
                            <div class="open-data__heading" style="padding-bottom: unset;padding-bottom: 0.4rem;"  >Оголошується конкурс<br> на зайняття посади члена Рахункової палати</div>
                            <div class="open-data__text mob-hide">Умови та строки проведення конкурсу </div>
                            <a href="https://www.rada.gov.ua/news/Novyny/197724.html" target="_blank" class="open-data__link"><b>Переглянути умови</b></a>
                    </div>

                    </div>*}
                    <div class="col-lg-3 col-sm-12">
                        <div class="faq-blocks" {*style="height: 270px;"*}>
                            <div class="faq-online size-s" style="height: 270px;">
                                <img src="img/icn-emoji.png" width="64" height="64" alt="" />
                                <div class="faq-tooltip">
                                    <div class="message-row">
                                        <span>Наші вітання!</span>
                                    </div>
                                    <div class="message-row">
                                        <span>Маєте запитання до Верховної Ради України?</span>
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






<section class="bill-section">
<div class="container">
    <h2 class="block-heading">Законопроекти</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular-tab" data-toggle="tab" href="#latest" role="tab" aria-controls="latest" aria-selected="true">
                Останні зареєстровані
            </a>
        </li>
       {* <li class="nav-item">
            <a class="nav-link" id="latest-tab" data-toggle="tab" href="#popular" role="tab" aria-controls="popular" aria-selected="false">
                Популярні
            </a>
        </li>*}
         <li class="nav-item">
            <a class="nav-link" id="session-tab" data-toggle="tab" href="#session" role="tab" aria-controls="session" aria-selected="false">
                Архів законопроектів
            </a>
        </li> 

    </ul>
    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo" class="search-by-link">Пошук <span class="tab-hide">за реквізитами</span></a>
{*    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc2" class="search-by-link">Пошук <span class="tab-hide">за реквізитами</span></a>*}
    
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
                            <a href="{$data->i_link}" target="_blank" class="bill-item">
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" target="_blank" class="bill-item">
                        {/if}

                            <span class="btn-fill"><b>{$data->i_name}</b> від <b>{*{$data->hour},*} {$data->day} {$data->month} {$data->year}</b></span>
                            <span class="btn-red">Новий</span>
{*                            <span class="btn-border">Соціальна політика</span>*}

                            <p>{$data->i_anons}</p>
                             
                        </a>
                    {/foreach} 
</div>
                </div>

                <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">Законотворча діяльність</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/period">
                                        Зареєстровані за поточний тиждень
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/ProvidedDeputy">
                                        Надано народним депутатам
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li><a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/providedDeputyRelDoc">Надано народним депутатам до законопроектів <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                        
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/commBillProc">
                                        Знаходяться на розгляді в комітетах
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="https://itd.rada.gov.ua/billInfo/Bills/lawList">
                                        Прийняті на поточній сесії
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                            </ul>
                    
                    <hr class="light">

                            <div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    <i class="icn-paperclip"></i> Правила оформлення проектів законів та основні вимоги законодавчої техніки                                    
                                </a>
                                <p class="attachment-format">PDF 3,5 МБайт</p>
                            </div>

                            <hr class="light">
                                
            {*<div class="request-online__block">
                <div class="request-online__heading">Відвідай пленарне засідання!</div>
                <div class="request-online__text mob-hide">Станьте свідком роботи парламенту крaїни — подайте заяву на відвідання пленарного засідання онлайн!</div>

                <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/Account/Login?ReturnUrl=%2Fidsrv%2Fconnect%2Fauthorize%2Fcallback%3Fclient_id%3DUsersProfileSrv%26redirect_uri%3Dhttps%253A%252F%252Fitd.rada.gov.ua%252FSessionRequest%252Fsignin-oidc%26response_type%3Did_token%26scope%3Dopenid%2520profile%26response_mode%3Dform_post%26nonce%3D636970600622382000.Mjg1YTgxYzEtZDJlNC00ODU1LTlmZDUtNzdmNjQyYmNhNTNlNjM2NzE2ZDQtODU4My00MTRiLThmMjQtNTZjYzgzMTQzZGFj%26state%3DCfDJ8EEXp3S8g7FJiUCgWEsGHgi8qUbSRM07Id2Jrgwi58X-DHS35kuJyeS1k3HkI0rdUk1IyJEhpcg8sj43nYN-Xcf96JLtZBs-a0EiBdU5xo8MexiLxSiNZX3Ti9t2BNJ6mTHFRkTK-isfj_afx0Mz3EqANMEt4F4C99qnF7Nq2ny_V87JZT0S50Sz6L3ybis51JzN4n5p-CMl8Dozz3Qzp3ppQSfzHXAhcDTFgFDluD_49PO5CSJSWp1TX4eRgnBY1PlQChv_lAXruklKtIR6KDS3f00pUOQRScohIUNZR_UK4t4QAUvfHCxetRgxCNo7MitQCjRtIjn1kFBNixqE_tvjq58Qn0OYDvBNNnPmoVGb4l3_i5VFBFLsaiQNiq4rQg%26x-client-SKU%3DID_NET%26x-client-ver%3D2.1.4.0" class="btn-white">Подати заявку</a>
                <a href="news/99824.html" class="request-online__link"><b>Правила <span class="mob-hide">перебування</span></b></a>

            </div>*}
       
                                
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
                        <a href="{$block_data.3.topic->i_categories}">Перейти до розділу</a>
                    </div>
                </div>
            </div>
            
        </div>
        <!-- /tab 1 -->

        <!-- tab 2 -->
        <div class="tab-pane fade" id="popular" role="tabpanel" aria-labelledby="popular-tab">
            Популярні Content
        </div>
        <!-- /tab 2 -->

        <!-- tab 3 -->
        <div class="tab-pane fade" id="session" role="tabpanel" aria-labelledby="session-tab">
            {*Прийняті на поточній сесії Content*}
            <div class="row">
            <div class="col-lg-8 col-sm-12">
<div class="scrollbar-inner">
                    {foreach item=data from=$block_data.15.items}
                        {if $data->i_link}
                            <a href="{$data->i_link}" class="bill-item">
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="bill-item">
                        {/if}

                            <span class="btn-fill"><b>{$data->i_name}</b> від <b>{*{$data->hour},*} {$data->day} {$data->month} {$data->year}</b></span>
                           {* <span class="btn-red">Новий</span>*}
{*                            <span class="btn-border">Соціальна політика</span>*}

                            <p>{$data->i_anons}</p>

                        </a>
                    {/foreach}
</div>
                </div>
           
 
                    <div class="col-lg-4 col-sm-12">
                    
                    <h2 class="discussion-heading">Архів законопроектів <br> (III–IX скликання 1-6 сесії )</h2>
                    <ul class="ul-list">
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc2">
                                        Пошук законопроектів
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                <li>
                                    <a target ="_blank" href="http://w1.c1.rada.gov.ua/pls/zweb2/pkg_zpsended.by_date">
                                        Надано народним депутатам
                                        <i class="icn-chevron-right"></i>
                                    </a>
                                </li>
                                
                            </ul>
                    
                   <hr class="light">

                      {*       <div class="attachment-name">
                                <a target ="_blank" href="http://static.rada.gov.ua/site/bills/info/zak_rules.pdf">
                                    <i class="icn-paperclip"></i> Правила оформлення проектів законів та основні вимоги законодавчої техніки                                    
                                </a>
                                <p class="attachment-format">PDF 3,5 МБайт</p>
            </div>

                            <hr class="light">*}
                                
            {*<div class="request-online__block">
                <div class="request-online__heading">Відвідай пленарне засідання!</div>
                <div class="request-online__text mob-hide">Станьте свідком роботи парламенту крaїни — подайте заяву на відвідання пленарного засідання онлайн!</div>

                <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/Account/Login?ReturnUrl=%2Fidsrv%2Fconnect%2Fauthorize%2Fcallback%3Fclient_id%3DUsersProfileSrv%26redirect_uri%3Dhttps%253A%252F%252Fitd.rada.gov.ua%252FSessionRequest%252Fsignin-oidc%26response_type%3Did_token%26scope%3Dopenid%2520profile%26response_mode%3Dform_post%26nonce%3D636970600622382000.Mjg1YTgxYzEtZDJlNC00ODU1LTlmZDUtNzdmNjQyYmNhNTNlNjM2NzE2ZDQtODU4My00MTRiLThmMjQtNTZjYzgzMTQzZGFj%26state%3DCfDJ8EEXp3S8g7FJiUCgWEsGHgi8qUbSRM07Id2Jrgwi58X-DHS35kuJyeS1k3HkI0rdUk1IyJEhpcg8sj43nYN-Xcf96JLtZBs-a0EiBdU5xo8MexiLxSiNZX3Ti9t2BNJ6mTHFRkTK-isfj_afx0Mz3EqANMEt4F4C99qnF7Nq2ny_V87JZT0S50Sz6L3ybis51JzN4n5p-CMl8Dozz3Qzp3ppQSfzHXAhcDTFgFDluD_49PO5CSJSWp1TX4eRgnBY1PlQChv_lAXruklKtIR6KDS3f00pUOQRScohIUNZR_UK4t4QAUvfHCxetRgxCNo7MitQCjRtIjn1kFBNixqE_tvjq58Qn0OYDvBNNnPmoVGb4l3_i5VFBFLsaiQNiq4rQg%26x-client-SKU%3DID_NET%26x-client-ver%3D2.1.4.0" class="btn-white">Подати заявку</a>
                <a href="news/99824.html" class="request-online__link"><b>Правила <span class="mob-hide">перебування</span></b></a>

            </div>*}
       
                                
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
                        <a href="{$block_data.15.topic->i_categories}">Перейти до розділу</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /tab 3 -->
    </div>
                 
</div>
        <!-- /tab 3 -->
 
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
    <h2 class="block-heading">Законодавство</h2>
<div class="select-custom">
    <ul class="sections_tabs nav nav-tabs float-left" id="myTab4" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="popular2-tab" data-toggle="tab" href="#popular2" role="tab" aria-controls="popular2" aria-selected="true">
                Останні надходження
            </a>
        </li>
        {*<li class="nav-item">
            <a class="nav-link" id="valid-tab" data-toggle="tab" href="#valid" role="tab" aria-controls="valid" aria-selected="false">
                Набули чинності
            </a>
        </li>*}
    </ul>
    <a href="https://zakon.rada.gov.ua/go/find" class="search-by-link">Пошук <span class="tab-hide">за реквізитами</span></a>
    <hr class="light">
</div>
    <div class="tab-content" id="myTabContent4">
        <!-- tab 1 -->
        <div class="tab-pane fade show active" id="popular2" role="tabpanel" aria-labelledby="popular2-tab">

            <div class="row">
                <div class="col-md-8 col-sm-12">
                    
                    {foreach item=data from=$block_data.4.items}
     
                            {if $data->i_link}                    
                                    <a class="bill-item" href="{$data->i_link}" target="_blank">
                                {else}
                                    <a class="bill-item" href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" target="_blank">
                                {/if}
                            <span class="law-heading">
                                
                            
                                {$data->i_name} {*від {$data->hour}, {$data->day} {$data->month} {$data->year}*}
                                
                               
                            </span>
{*                            <span class="btn-red">Новий</span>*}
{*                            <span class="btn-border">Соціальна політика</span>*}

                            
                            <p class="color-g">{$data->i_anons}</p>
                        </a>
                    {/foreach}
                    
                    <div class="more-link">
                        <a href="{$block_data.4.topic->i_categories}">Перейти до розділу</a>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12">
                    <ul class="gerb-list">
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/254%D0%BA/96-%D0%B2%D1%80">Конституція України</a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/t21">Кодекси України</a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/tt1001">Закони України</a></li>
                    </ul>
                    <ul class="ul-list">
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/country">Міжнародні документи <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/translation">Переклади документів <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/klas">Розподіл документів, згідно юридичної класифікації<i class="icn-chevron-right"></i> </a></li>
{*                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/g22">Переклади актів acquis ЄС <i class="icn-chevron-right"></i></a></li>*}
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/perv">Первинні законодавчі акти <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/koms">Розподіл прийнятих законодавчих актів за комітетами Верховної Ради <i class="icn-chevron-right"></i></a></li>
{*                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/annot">Анотації англійською мовою <i class="icn-chevron-right"></i></a></li>*}
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/termin">Термінологія законодавства <i class="icn-chevron-right"></i></a></li>
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/eurovoc">Тезаурус «Eurovoc» <br>(українська версія) <i class="icn-chevron-right"></i></a></li>
                                {*<li><a target ="_blank" href="https://zakon.rada.gov.ua/rada/main/klas">Юридична класифікація<i class="icn-chevron-right"></i> </a></li>*}
                                <li><a target ="_blank" href="https://zakon.rada.gov.ua/go/days">Календар офіційних дат <i class="icn-chevron-right"></i></a></li>
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
                                
                                
        <section class="blocks-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-12">
                        <div class="rada-tv__block">
                            <img src="img/rada-line.svg" width="269" height="55" alt="" />
                            <div class="rada-tv__text">
                                Парламентський телеканал
                            </div>

                            <a href="/video/rada-tv/64430.html" class="btn-white">Дивитись </a>
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
                       <div class="golos__block"  >
                            <img src="img/internship_1.jpg" alt="" />
                            <div class="golos__txt" style="min-height: 140px;">
                                <p> В Апараті реалізується Програма стажування </p>

                                <a href="http://vrkadry.rada.gov.ua/news/dijalnist/stazhuvania/Molod/73244.html" class="golos__link">Перейти на сайт <span class="icn-external"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-12">
                        <a href="https://osvita.rada.gov.ua/" target="_blank" class="educational__block">
{*                        <a href="https://www.facebook.com/educationcenterofVRU/" target="_blank" class="educational__block">*}
                            <span class="educational__heading ">Освітній центр</span> 
                            <span  >
                                Верховної Ради України                        
                            </span><br><br><span class="golos__link">Перейти на сайт </span><span class="icn-external" style="opacity: 1;"></span>
                        </a>
                    </div>
                </div>
            </div>
        </section>

{*==========Begin Digest======================*}

<!--<section class="digest-section">  
    <div class="content">
            {*   <span class="mail-ico"><span class="messages">1</span></span>   *}          
            <div class="digest-section__heading">
                <span class="fa-2x">
                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1" data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                </span>
                <p>Парламентський дайджест</p>                
            </div>
            {* <p>Отримуйте головне з вебпорталу Верховної Ради України у свою скриньку</p> *}
            <p>Отримуйте головне з вебпорталу у свою скриньку</p>
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
</section> -->

{*=========End Digest=========================*}


<!-- end main content -->
