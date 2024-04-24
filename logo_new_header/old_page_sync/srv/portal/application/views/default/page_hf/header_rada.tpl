<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$site_title}</title>
    {*        <meta name="description" content="">*}
    {*        <meta property="og:image" content="/img/print-logo.png" />*}
    {*        <meta property="og:image:width" content="600" />*}
    {*        <meta property="og:image:height" content="315" />*}
    <meta property="og:title" content="{$item->i_name}" />
    <meta property="og:image" content="
      {if strlen($item->i_logoname) > 0}
          {$site_domain}uploads/logos_middle/{$item->i_logoname}.jpeg
          {else} {$site_domain}/img/rada-logo.png
      {/if}"/>
    <meta property="og:description" content= "{$item->i_name}" />
    <meta name="twitter:title" content="{$site_title}"/>
    <meta name="twitter:description" content="{$item->i_name}"/>
    <meta name="twitter:image" content="
      {if strlen($item->i_logoname) > 0}
          {$site_domain}uploads/logos_middle/{$item->i_logoname}.jpeg
      {else} www.rada.gov.ua/img/rada-logo.png
      {/if}" />
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/fonts/ProbaPro/stylesheet.css" />
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/slick/slick-theme.css"/>
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/nice-select.css" />
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/jquery.scrollbar.css" />
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/ui-lightness/jquery-ui-1.8.18.custom.css"  />
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/atomic-bulldog-grid.min.css" media="screen and (min-width: 768px)">
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/atomic-bulldog-grid-fallback.min.css" media="screen and (min-width: 768px)">
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/atomic-bulldog-grid-fallback-ie.min.css" media="screen and (min-width: 768px)">
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/owl.carousel.css">

    {*        <link rel="stylesheet" href="{$site_domain }sources/css/add-calendar-main.css">*}
    <script type="text/javascript" src="{$site_domain }sources/js/jquery-3.2.1.min.js"></script>

    {*        <link rel="stylesheet" type="text/css" href="{$site_domain }sources/css/style_min.css" />*}

    {*<script type="text/javascript" src="{$site_domain }sources/js/clappr.min.js"></script>*}


    <!-- Add to calendar -->
    <script src="{$site_domain }sources/js/ouical_ua.js"></script>



    {*Hotjar Tracking Code for http://mportal.rada.gov.ua/ *}
    {*Hotjar Tracking Code знято 18-08-2021 доручення Щербакова С. *}
    {*{literal}
<script>
    (function(h,o,t,j,a,r){
        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        h._hjSettings={hjid:1583704,hjsv:6};
        a=o.getElementsByTagName('head')[0];
        r=o.createElement('script');r.async=1;
        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        a.appendChild(r);
    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
</script>
    {/literal}*}


    <!--[if IE 9]>
    <link href="{$site_domain }sources/css/bootstrap-ie9.min.css" rel="stylesheet">
    <![endif]-->
    <!--[if lte IE 8]>
    <link href="{$site_domain }sources/css/bootstrap-ie8.min" rel="stylesheet">
    <script src="{$site_domain }sources/js/html5shiv@3.7"></script>
    <![endif]-->

</head>
<body>
<div id="page">
    {*<!-- header -->*}
    <div id="header">

        {*<!-- main header -->*}
        <div class="header_body">

            <div class="logo-main">
                <a href="/">
                    <span class="rada-logo">  </span>
                </a>

                <img src="/img/print-logo.png" class="logo-print" align="left" width="60" height="100" alt="" />

                <h1><a href="{$site_domain }">Верховна Рада України</a></h1>
                <p>Офіційний вебпортал парламенту України <br> <i><b>&nbsp;</b></i>{*<i><b>тестова версія</b></i>*}</p>
                {*<p style="text-align: center; position:absolute;  right: 30px; top:150px;">
                    <span style="display: inline-block;  padding: 0px 10px;">Тестова версія</span>
                </p>*}
                {*                         <span class="rada-cab">*}
                {*                        <p class="mob-hide hide-select" style="text-align: left; position:absolute; opacity: 1;font-weight: 600; right: 55px; top:150px;">*}
                {*                            <a href="https://itd.rada.gov.ua/idsrv/"><span class="mob-hide hide-select" style="display: inline-block;  padding: 0px 10px;">Електронний <br> кабінет громадянина</span></a></p> </span>*}

            </div>

        </div>
        {*<!-- end main header -->*}

        <!-- navbar -->
        <nav id="navbar" class="navbar navbar-dark navbar-expand-lg">
                    <span class="navbar-brand">
                        <a href="/" class="vru__logo">Верховна Рада України</a>
                    </span>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                {*                <div class="collapse navbar-collapse" id="navbarSupportedContent">*}


                {*  ----------- MAin Page MENU ------------------------------------                      *}

                    {include file= "page_hf/main_menu_rada.tpl"}

                {*  ----------- End MAin Page MENU ------------------------------------                      *}
                <div class="form-inline my-2 my-lg-0">
                    <ul class="map_menu">
                        {*<li>
                            <a class="fliker-ico" href="#" target="_blank" title="Флікер">
                                <i class="fab fa-flickr"></i>
                            </a>
                        </li>*}
                        <li>
                            <a class="telegram-ico" href="https://t.me/verkhovnaradaukrainy" target="_blank"
                               title="Телеграм">
                                <i class="fab fa-telegram-plane"></i>
                            </a>
                        </li>
                        <li>
                            <a class="instagram-ico" href="https://www.instagram.com/verkhovna_rada_of_ukraine/"
                               target="_blank" title="Інстаграм">
                                <i class="fab-fa-instagram"></i>
                            </a>
                        </li>
                        <li>
                            <a class="youtube-ico" href="https://www.youtube.com/user/RadaTVchannel" target="_blank"
                               title="Ютьюб">
                                <i class="fab fa-youtube"></i>
                            </a>
                        </li>
                        <li>
                            <a class="twitter-ico" href="https://twitter.com/verkhovna_rada" target="_blank"
                               title="Твіттер">
                                <i class="fab fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a class="facebook-ico" href="https://www.facebook.com/verkhovna.rada.ukraine/"
                               target="_blank" title="Фейсбук">
                                <i class="fab fa-facebook-square"></i>
                            </a>
                        </li>
                    </ul>
                </div>

                {*<!-- lang block -->*}
                <div class="lang_block">

                    <select class="selectpicker" onchange="location = this.value;">
                        <option value="/">Українською</option>
                        <option value="/">Українською</option>
{*                        <option value="/en">In English</option>*}

                    </select>
                    <svg class="icn-world" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                         viewBox="0 0 24 24">
                        <path class="icn-world__fill" fill-rule="evenodd"
                              d="M16.55 18.571c.497-.958.883-2.078 1.13-3.314a11.339 11.339 0 0 0 1.902-.725 8.026 8.026 0 0 1-3.031 4.04m-12.133-4.04a11.35 11.35 0 0 0 1.902.725c.248 1.236.633 2.356 1.129 3.314a8.032 8.032 0 0 1-3.031-4.039m3.03-9.104c-.26.503-.49 1.048-.685 1.633-.335-.162-.56-.314-.67-.437a8.08 8.08 0 0 1 1.356-1.196m10.454 1.19c-.114.127-.338.278-.666.44a11.431 11.431 0 0 0-.686-1.63c.495.345.946.747 1.352 1.19m-.164 2.41a5.426 5.426 0 0 0 1.326-.773 7.946 7.946 0 0 1 .915 3.347c-.1.415-.78.978-2.012 1.455.02-.347.032-.7.032-1.057 0-1.039-.092-2.036-.261-2.973m-4.74 4.95V9.972a17.732 17.732 0 0 0 2.81-.354 15.08 15.08 0 0 1 .102 4.018c-.847.17-1.816.294-2.911.341m0 5.726v-3.726a22.416 22.416 0 0 0 2.51-.244c-.552 1.974-1.502 3.39-2.51 3.97m-2-3.726v3.726c-1.008-.58-1.958-1.996-2.51-3.97.812.126 1.657.21 2.51.244m0-11.68v3.668a15.244 15.244 0 0 1-2.326-.29C9.24 6.01 10.097 4.817 11 4.296m4.326 3.377c-.656.14-1.432.243-2.326.291V4.297c.904.52 1.76 1.712 2.326 3.377M8 12c0-.844.07-1.64.192-2.382.885.19 1.842.307 2.808.354v4.005a18.937 18.937 0 0 1-2.911-.34A15.08 15.08 0 0 1 7.999 12m-3.978-.398a7.932 7.932 0 0 1 .915-3.347 5.4 5.4 0 0 0 1.325.772A16.773 16.773 0 0 0 6 12c0 .357.012.71.032 1.057-1.232-.477-1.913-1.04-2.011-1.455M22 11.5c0-.06-.023-.112-.034-.168C21.62 6.13 17.288 2 12 2c-5.288 0-9.62 4.13-9.966 9.332-.01.056-.034.108-.034.168 0 .054.014.106.018.16-.004.114-.018.225-.018.34 0 5.513 4.487 10 10 10 5.514 0 10-4.487 10-10 0-.115-.013-.226-.017-.34.004-.054.017-.106.017-.16"/>
                    </svg>
                    <div id="cab_grom">
                        <a href="https://itd.rada.gov.ua/idsrv/" target="_blank" class="rada_cab">Електронний кабінет</a>
                        {*    <a href="https://iportal.rada.gov.ua" target="_blank" class="old-version">Попередня версія</a>*}
                        {*    <a href="https://www.youtube.com/user/RadaTVchannel" class="rada-tv__label hide-select">*}
                        <a href="https://rada.gov.ua/video/rada-tv/64430.html" class="rada-tv__label hide-select">
                            <b>RADA &nbsp;</b>ОНЛАЙН</a>
                        {*<a href="https://www.rada.gov.ua/video/rada-tv/64430.html" class="rada-tv__label hide-select">
                            <b>RADA &nbsp;</b>ОНЛАЙН</a>*}
                    </div>

                </div>
                {*<!-- end lang block -->*}

                <a data-toggle="modal" data-target="#govModal" class="gov-ua__logo">
                    <span>Gov.ua</span>
                    Державні сайти України
                </a>
            </div>
{*
            <div class="search_block">
                <form method="get" action="/search">
                    <input type="submit" class="search_button" value="Пошук">
                </form>
            </div>
*}
        </nav>
        {*<!-- /navbar -->*}

        <!-- govModal -->
        <div class="modal gov" id="govModal" tabindex="-1" role="dialog" aria-labelledby="govModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content gov-ua">
                    <div class="icon-close" data-dismiss="modal"></div>
                    <h3   style="padding-bottom: 0.5rem;"> Державні сайти України </h3>
                    <ul class="outer-links">
                        <li><a href="https://president.gov.ua/" target="_blank" rel="nofollow">Президент України</a></li>
                        {*<li><a href="http://rada.gov.ua/" target="_blank" rel="nofollow">Верховна Рада України</a></li>*}
                        <li><a href="https://www.kmu.gov.ua/" target="_blank" rel="nofollow">Кабінет Міністрів України</a></li>
                        <li><a href="http://www.ccu.gov.ua/" target="_blank" rel="nofollow">Конституційний суд України</a></li>
                        <li><a href="http://www.rnbo.gov.ua/" target="_blank" rel="nofollow">Рада національної безпеки і оборони України</a></li>
                        <li><a href="https://www.kmu.gov.ua/ua/catalog/" target="_blank" rel="nofollow">Центральні та місцеві органи виконавчої влади</a></li>
                    </ul>
                </div>
            </div>


        </div>
        <!-- /govModal -->

    </div>
    {*<!-- end header -->*}

    {* ============================ MAIN CONTENT ==================== *}


    {* ==========================ENd MAIN CONTENT ====================*}

    <!-- footer -->



    {*         <!-- end footer -->*}

</div>

{*==============Button for ScrollUp and that icon from Fontawesome======*}
<div class="scrollup">
    <i class="fa fa-chevron-up"></i>
</div>
{*===============END Button===========================================*}

{*        <script type="text/javascript" src="{$site_domain }sources/js/jquery-3.2.1.min.js"></script>*}
<script type="text/javascript" src="{$site_domain }sources/js/popper.min.js"> </script>
<script type="text/javascript" src="{$site_domain }sources/js/bootstrap.min.js"> </script>
<script type="text/javascript" src="{$site_domain }sources/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/bootstrap-datepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="{$site_domain }sources/js/locales/bootstrap-datepicker.uk.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="{$site_domain }sources/js/tinynav.min.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/jquery.circliful.min.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/slick/slick.min.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/jquery.nice-select.min.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/fontawesome/all.min.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/recaptcha/api.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/jquery.scrollbar.min.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/clappr.min.js"></script>
{*        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/clappr@latest/dist/clappr.min.js"></script>*}
<script type="text/javascript" src="{$site_domain }sources/js/maskinput.js"></script>
<script type="text/javascript" src="{$site_domain }sources/js/atc.min.js" async defer></script>
{*        <script type="text/javascript" src="https://addevent.com/libs/atc/1.6.1/atc.min.js" async defer></script> *}
<script src="{$site_domain }sources/js/vru-script.js"></script>
</body>
</html>
