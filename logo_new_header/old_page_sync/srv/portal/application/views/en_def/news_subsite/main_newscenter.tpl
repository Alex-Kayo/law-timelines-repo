<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v3.3"></script>

{*  Хедер та меню новинного сайту      *}
{include file= "news_subsite/newcenter_menu.tpl"}
{*/  Хедер та меню новинного сайту      *}


<div class="news-section">
    <div class="container">
        <div class="row">

            {*         =======================               *}

            {foreach item=data from=$top_news key=key name = i}  

                {if $smarty.foreach.i.index == 0}
                    <div class="col-lg-6 col-md-12">
                        <div class="main-news">
                            <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg">
                            <div class="main-news_heading">
                                <small>Topic of great moment:</small>
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                            </div>
                        </div>
                    </div>
                {elseif $smarty.foreach.i.index >= 1 && $smarty.foreach.i.index < 3}
                    <div class="col-lg-3 col-md-6">
                        <div class="sub-news with-data">
                            <div class="sub-news_img">
                                <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg">
                            </div>
                            <div class="sub-news_heading">
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                            </div>
                            <span class="sub-news_date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>
                        </div>
                    </div>
                {/if}
            {/foreach}       
            {*         =======================               *}

        </div>
    </div>
</div>



<!-- ALL THEME SCREEN -->
<section class="news-list-section">
    <span id="parl_news" class="anchor-section"></span>
    <div class="container">
        <div class="select-custom">
            {*<div class="news-list-theme">
                <ul class="sections_tabs nav nav-pills">
                    <li><a data-toggle="pill" href="#menu1" class="active">Усі теми</a></li>
                    <li><a data-toggle="pill" href="#menu2">Оборона</a></li>
                    <li><a data-toggle="pill" href="#menu3">Парламент</a></li>
                    <li><a data-toggle="pill" href="#menu4">Законотворчість</a></li>
                    <li><a data-toggle="pill" href="#menu5">Економіка</a></li>
                    <li><a data-toggle="pill" href="#menu6">Реформи</a></li>
                    <li><a data-toggle="pill" href="#menu7">Спорт</a></li>
                    <li><a data-toggle="pill" href="#menu8">Екологія</a></li>
                    <li><a data-toggle="pill" href="#menu9">Бюджет</a></li>
                    <li>
                        <div class="dropdown show">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Ще теми
                            </a>

                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu10">Action</a></li>
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu11">Another action</a></li>
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu12">Something else here</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <a href="/rss/news" class="rss-btn">RSS</a>
            </div>*}
        </div>
        <div class="tab-content">

            <!-- tab 1 -->
            <div id="menu1" class="tab-pane fade show active">
                <div class="row">
                    <div class="col-lg-8">
                        <ul class="main-news-list">
                            
                            {foreach item=data from=$logo_news key=key name=i}  
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
                            
                                          
                
                             {foreach item=data from=$logo_news key=key name=i}  
                    {if $smarty.foreach.i.index > 1 && $smarty.foreach.i.index < 8}
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
                        {if $smarty.foreach.i.index >= 8}    {*//javir*}

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

                <div class="more-link text-right">
                    <a href="/en/news/">News archive</a>
                </div>
            </div>
            <!-- /tab 1 -->

            <!-- tab 2 -->
            <div id="menu2" class="tab-pane fade">
                2
            </div>
            <!-- /tab 2 -->

            <!-- tab 3 -->
            <div id="menu3" class="tab-pane fade">
                3
            </div>
            <!-- /tab 3 -->
        </div>
    </div>
</section>
<!-- /ALL THEME SCREEN -->

<hr class="full-width" />

<div   class="summary-week-section">
    <div class="container">       
        <div class="row">            
             <div class="col-lg-4 col-md-5">
                    {foreach item=data from=$block_data.7.items}
                        
                            <div class="multimedia-item__wrap">
                                {if strlen($data->i_logoname) > 0}
                                    <div class="multimedia-item__img">
                                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="play-btn"></a>
                                        <img src="/uploads/logos_small/{$data->i_logoname}.jpeg" class="borderimg" alt="" />
                                    </div>
                                    

                                {/if}
                                <div class="multimedia-item__heading">
                                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name} </a> </div>
                                  
                                    
                                      <span class="time grey">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>
                                        
                                   
                                </div>
                            
                    {/foreach}
                        </div>
      
            <div class="col-lg-8 col-md-7">
                <div class="time-table bg2">
                    <div class="block-heading">
                        Summaries of the week
                    </div>
                    <div class="block-heading__date">
                                {$next_planar_week_dates.backward->day_s}  {$next_planar_week_dates.backward->mon_s}
                                – {$next_planar_week_dates.backward->day_e} {$next_planar_week_dates.backward->mon_e}
                                </div>

                    <span  class="more-link white-link">
                        <a href="/news/pidsumky_plt/">To review</a>
                    </span>

                </div>
            </div>
        </div><!--/row-->
    </div>
</div><!--/summary-week-section-->

<!-- ALL THEME SCREEN 2 -->
<section  class="news-committee">
    <span id="kom_news" class="anchor-section"></span>
    <div class="container">
        <h2  class="block-heading">
           Committee news
        </h2>

        {*<div class="select-custom">
            <div class="news-list-theme">
                <ul class="sections_tabs nav nav-pills">
                    <li><a data-toggle="pill" href="#menu1-2" class="active">Усі теми1</a></li>
                    <li><a data-toggle="pill" href="#menu2-2">Оборона</a></li>
                    <li><a data-toggle="pill" href="#menu3-2">Парламент</a></li>
                    <li><a data-toggle="pill" href="#menu4-2">Законотворчість</a></li>
                    <li><a data-toggle="pill" href="#menu5-2">Економіка</a></li>
                    <li><a data-toggle="pill" href="#menu6-2">Реформи</a></li>
                    <li><a data-toggle="pill" href="#menu7-2">Спорт</a></li>
                    <li><a data-toggle="pill" href="#menu8-2">Екологія</a></li>
                    <li><a data-toggle="pill" href="#menu9-2">Бюджет</a></li>
                    <li>
                        <div class="dropdown show">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Ще теми
                            </a>

                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu10-2">Action</a></li>
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu11-2">Another action</a></li>
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu12-2">Something else here</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <a href="/rss/news" class="rss-btn">RSS</a>
            </div>
        </div>*}

        <div class="tab-content">

            <!-- tab 1 -->
            
            
            
                          <div id="menu1-2" class="tab-pane fade show active">
                            <div class="column-3-list">
                    {foreach item=data from=$block_data.6.items}
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                    {/foreach}
                                </div>
                                          
                             
                        </div>

            <!-- /tab 1 -->

            <!-- tab 2 -->
            <div id="menu2-2" class="tab-pane fade">
                2
            </div>
            <!-- /tab 2 -->


        </div>

        <div class="more-link text-right">
            <a href="/{$block_data.6.topic->i_categories}">Committees News Archive</a>
        </div>
    </div>
</section>
<!-- /ALL THEME SCREEN 2 -->

<hr class="full-width" />

<section class="review-section">
    
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <span id="press_review" class="anchor-section"></span>
                <div class="review-section__heading">
                    Review of the «Voice of Ukraine» newspaper
                </div>
                <div class="review-section__img">
                    <img src="/files/review1.jpg" alt="" />
                </div>

                
                  
                             
                    {foreach item=data from=$block_data.8.items}
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                    {/foreach}
                                 
                <div class="more-link text-right">
                    <a href="/{$block_data.8.topic->i_categories}">More newspaper reviews
</a>
                </div>

            </div><!--/col-lg-4-->

            <div class="col-lg-4 col-md-6">
                <div class="review-section__heading">
                    Review of the Bulletin of the VRU
                </div>
                <div class="review-section__img">
                    <img src="/files/review2.jpg" alt="" />
                </div>

                
                 {foreach item=data from=$block_data.9.items}
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                    {/foreach}
           

                <div class="more-link text-right">
                    <a href="/{$block_data.9.topic->i_categories}">More newspaper reviews</a>
                </div>
            </div><!--/col-lg-4-->

            <div class="col-lg-4 col-md-12 announcement-column">
                <span id="advertisement" class="anchor-section"></span>
                <div class="review-section__heading">
                    Announcements 
                </div>

               {* <div class="news-item main-news-item">
                    <span class="date">14:02, 20 грудня 2018</span>
                    <p>
                        <a href="#">
                            Про конкурс на посаду Керівника Освітнього центру при Верховній Раді України
                        </a>
                    </p>
                </div>*}
                 {foreach item=data from=$block_data.10.items}
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                    {/foreach}

               

                <div class="more-link text-right">
                    <a href="/{$block_data.10.topic->i_categories}">More ads</a>
                </div>
            </div><!--/col-lg-4-->

        </div><!--/row-->
    </div>
</section>

<hr class="full-width" />

<section class="request-online">
    <div class="container">
    <div class="row">
        <div class="col-lg-6 col-sm-12">
            <div class="request-online__block">
                <div class="request-online__heading">Visit a plenary sitting!</div>
                <div class="request-online__text mob-hide">Feel free to view how Parliament works – just submit an online visit application!</div>

                <a target ="_blank" href="https://itd.rada.gov.ua/idsrv/Account/Login?ReturnUrl=%2Fidsrv%2Fconnect%2Fauthorize%2Fcallback%3Fclient_id%3DUsersProfileSrv%26redirect_uri%3Dhttps%253A%252F%252Fitd.rada.gov.ua%252FSessionRequest%252Fsignin-oidc%26response_type%3Did_token%26scope%3Dopenid%2520profile%26response_mode%3Dform_post%26nonce%3D636970600622382000.Mjg1YTgxYzEtZDJlNC00ODU1LTlmZDUtNzdmNjQyYmNhNTNlNjM2NzE2ZDQtODU4My00MTRiLThmMjQtNTZjYzgzMTQzZGFj%26state%3DCfDJ8EEXp3S8g7FJiUCgWEsGHgi8qUbSRM07Id2Jrgwi58X-DHS35kuJyeS1k3HkI0rdUk1IyJEhpcg8sj43nYN-Xcf96JLtZBs-a0EiBdU5xo8MexiLxSiNZX3Ti9t2BNJ6mTHFRkTK-isfj_afx0Mz3EqANMEt4F4C99qnF7Nq2ny_V87JZT0S50Sz6L3ybis51JzN4n5p-CMl8Dozz3Qzp3ppQSfzHXAhcDTFgFDluD_49PO5CSJSWp1TX4eRgnBY1PlQChv_lAXruklKtIR6KDS3f00pUOQRScohIUNZR_UK4t4QAUvfHCxetRgxCNo7MitQCjRtIjn1kFBNixqE_tvjq58Qn0OYDvBNNnPmoVGb4l3_i5VFBFLsaiQNiq4rQg%26x-client-SKU%3DID_NET%26x-client-ver%3D2.1.4.0" class="btn-white">Submit a visit application</a>
                <a href="news/99824.html" class="request-online__link"><b>Rules<span class="mob-hide"> of stay</span></b></a>

            </div>
        </div>
        <div class="col-lg-6 col-sm-12">
            <div class="faq-online size-s">
            </div>

            <div class="faq-online size-s"></div>

            <div class="faq-online size-s"></div>

            <div class="faq-online size-s"></div>
        </div>
    </div>
</div>
</section>



<section class="media-library">
    <span id="mediaLibrary" class="anchor-section"></span>
    <div class="container">
        <h2 class="block-heading">
            Media library 
        </h2>
        <div class="select-custom">
            <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="video-tab" data-toggle="tab" href="#video" role="tab" aria-controls="video" aria-selected="true">
                        Video footage
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="photo-tab" data-toggle="tab" href="#photo" role="tab" aria-controls="photo" aria-selected="false">
                       Photo Albums
                </li>
            </ul>
            <a href="#" class="youtube-btn next-tab-link"></a>

            <hr class="light">

        </div>

        <div class="tab-content" id="myTabContent">
            <div id="video" class="tab-pane fade show active" role="tabpanel" aria-labelledby="video-tab">
                <div class="gallery_list">
                    <div class="row">
                        
                        

                    {foreach item=data from=$video key=key}
                        <div class="col-lg-3 col-md-6">
                            <div class="multimedia-item__img">
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="play-btn"></a>
{*                                <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg">*}
                                <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg"/>

                                <span class="time">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>
                            </div>
                             {if $data->i_id != 64430}   
                            <h3 class="multimedia-item__heading">
                                 <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                    {$data->i_name}
                                </a>
                            </h3>
                             {/if}
                      </div>
                      {/foreach}   
                      </div>
                      </div>
                         
             <!-- video пример  -->                                                                                                     
         

                <div class="more-link text-right">
                    <a href="{$lang_prefix}/video"> All videos</a>
                </div> 
            </div><!--/video tab -->

            <div id="photo" class="tab-pane fade" role="tabpanel" aria-labelledby="photo-tab">
                <div class="gallery_list media-photo-list">
                    <div class="row">
                        
                        {foreach item=data from=$gallery key=key}
                        <div class="col-lg-3 col-md-6">
                            <div class="gallery_item example--item">
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html"> 
                                <img alt="Робота Верховної Ради України" src="/uploads/gallery_prev/{$data->file_name}">

{*                                <span class="time">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>*}
                                </a>
                            

                            
                                <a  class="item-caption" href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                    <h3>
                                    {$data->i_name}
                                    </h3>
                                    <div class="foto_num">
                                        <i class="camera-icn"></i>
                                        {$data->count_attach} photo 
                                    </div>
                                </a>
                            </div>
                        </div>
                     {/foreach}
                       {* <div class="col-lg-3 col-md-6">
                            <div class="gallery_item example--item">

                                <a href="/gallery/robota_VRUk/45607.html?">
                                    <img alt="Робота Верховної Ради України" src="/uploads/gallery_prev/55414.jpeg">
                                </a>

                                <a class="item-caption" href="/gallery/robota_VRUk/45607.html?">
                                    <h3>

                                        Робота Верховної Ради України


                                    </h3>
                                    <div class="foto_num">
                                        <i class="camera-icn"></i>
                                        10215 фото
                                    </div>
                                </a>

                            </div>
                        </div>*}

                       {* <div class="col-lg-3 col-md-6">
                            <div class="gallery_item example--item">

                                <a href="/gallery/robota_VRUk/45607.html?">
                                    <img alt="Робота Верховної Ради України" src="/uploads/gallery_prev/55414.jpeg">
                                </a>

                                <a class="item-caption" href="/gallery/robota_VRUk/45607.html?">
                                    <h3>

                                        Робота Верховної Ради України


                                    </h3>
                                    <div class="foto_num">
                                        <i class="camera-icn"></i>
                                        10215 фото
                                    </div>
                                </a>

                            </div>
                        </div>*}




                    </div><!--/row-->


                </div>

                <div class="more-link text-right">
                    <a href="{$lang_prefix}/gallery">All photos</a>
                </div>
            </div><!--/photo tab -->
        </div><!--/tab-content-->


    </div>
</section>

<div class="social-section">
    <div class="container">
        <div class="row">
            {*<div class="col-lg-4">
                <div class="social-section__heading">
                    <i class="fa-flicker-circle"></i>
                    Flickr
                </div>
            </div>*}

            <div class="col-lg-6">
                <div class="social-section__heading">
                    <i class="fa fa-facebook-official"></i>
                    Facebook
                </div>

                <div class="fb-page" data-href="https://www.facebook.com/verkhovna.rada.ukraine/" data-tabs="timeline,events" data-width="500" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/verkhovna.rada.ukraine/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/verkhovna.rada.ukraine/">Verkhovna Rada of Ukraine</a></blockquote></div>

            </div>

            <div class="col-lg-6">
                <div class="social-section__heading">
                    <i class="fa fa-twitter"></i>
                    Twitter
                </div>

                <a class="twitter-timeline" data-lang="uk" data-height="500" href="https://twitter.com/verkhovna_rada?ref_src=twsrc%5Etfw">Tweets by verkhovna_rada</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
            </div>
        </div><!--/row-->
    </div>
</div><!--/social-section-->


{*==========Begin Digest======================*}

<section class="digest-section">  
    <div class="content">
            {*   <span class="mail-ico"><span class="messages">1</span></span>   *}          
            <div class="digest-section__heading">
                <span class="fa-2x">
                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1" data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                </span>
                <p>Parliamentary digest</p>                
            </div>
            {* <p>Отримуйте головне з вебпорталу Верховної Ради України у свою скриньку</p> *}
            <p>Get the main point from the webportal into your inbox</p>
            <form method="post" action="{$lang_prefix}/subscribe/index">
                {* <label for="digest-email">Введіть адресу Вашої електронної пошти</label> *}
                
                
                <div class="input-group">
                    {* <label for="digest-submit" title="Налаштувати підписку на анонси">Анонси новин, повідомлень та інших інформаційних матеріалів</label> *}                    
                   {*   <input type="email" name="email" id="digest-email" class="form-control" required placeholder="mail@example.com">
                       <div class="info-ico">На наступному кроці Ви зможете налаштувати категорії матеріалів для розсилки</div> *}
                    <button class="btn btn-white" type="submit" title="Arrange VRU announcements subscription">Arrange VRU announcements subscription</button>
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
    $(document).ready(function(){
        $( "a.nav-link" ).click(function( event ) {
           // event.preventDefault();
            $("html, body");//.animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 0);
        });
    });   
</script>
{/literal}
