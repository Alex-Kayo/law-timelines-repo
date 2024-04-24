<div id="header" class="logo_rada">
    <div id="mainhead" class="header_body">
        <div class="logo-main"> <!-- +logo-committee для дизайну для комітетів -->
            <div class="logo-container">
                <div class="logo-flag-line"></div>
                <a href="https://www.rada.gov.ua/" class="logo-gerb-container">
                    <div class="logo-gerb"></div>
                    <div class="logo-gerb-title">
                        RADA
                    </div>
                </a>
                <div class="logo-text">
                    <div class="logo-text-top">
                        <a href="https://www.rada.gov.ua/" class="logo-text-top-main">
                            RADA
                        </a>
                        <div class="logo-text-top-secondary">
                            <span>
                                VERKHOVNA
                                <div class="rada-online rada-online-mobile">
                                    <a href="https://www.rada.gov.ua/video/rada-tv/64430.html" target="_blank">ONLINE</a>
                                </div>
                            </span>
                            <span>
                                RADA OF UKRAINE
                                <div class="rada-online">
                                    <a href="https://www.rada.gov.ua/video/rada-tv/64430.html" target="_blank">ONLINE</a>
                                </div>
                            </span>
                        </div>
                    </div>
                    <div class="logo-text-bottom">
                        Official Webportal of the Parliament of Ukraine
                    </div>
                </div>
            </div>
        </div>
        <div class="services">
            <div class="services-block" data-toggle="modal" data-target="#govModal">
                <div class="btn btn-primary services-line gov-ua-line">
                    <i class="fa fa-bookmark i-gov-ua" title="Державні сайти"></i> GOV.UA
                </div>
            </div>
            <div class="d-md-block profile services-block">
                <a href="https://itd.rada.gov.ua/idsrv/" target="_blank" class="btn btn-primary user-auth services-line">
                    <i class="fa fa-user-circle-o" title="Electronic cabinet"></i> Electronic cabinet
                </a>
            </div>
            <div class="lang_block_new services-block">
                <div class="dropdown">
                    <button id="lang_menu" class="btn btn-primary dropdown-toggle with-caret services-line opaque" type="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-language" title="Мова інтерфейсу"></i> English
                    </button>
                    <div class="dropdown-menu dropdown-menu-right dropdown-primary" aria-labelledby="lang_menu">
                        <a href="javascript:void(0)" lang="uk" title="Укр" class="dropdown-item" onclick="location = '/';">Українською</a>
                        <a href="javascript:void(0)" lang="en" title="Eng" class="dropdown-item active">English</a>
                    </div>
                </div>
            </div>
            <div class="services-block">
                <a href="http://w1.c1.rada.gov.ua/" target="_blank" class="btn btn-primary services-line opaque">
                    <i class="fa fa-history" title="Previous version"></i> Previous version
                </a>
            </div>
        </div>
    </div>
    {*<!-- end main header -->*}

    <!-- navbar -->
    <nav id="navbar" class="navbar navbar-dark navbar-expand-lg">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <span class="navbar-brand">
            <a href="/en" class="navbar-logo-mini">
                <div class="logo-flag-line"></div>
                <span>Verkhovna Rada<br>of Ukraine</span>
            </a>
        </span>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            {*  ----------- MAin Page MENU ------------------------------------                      *}
            {if !$items_hide}
                {include file= "main_page/main_menu.tpl"}
            {else}
                {include file= "main_page/main_menu4inet.tpl"}
            {/if}
            {*  ----------- End MAin Page MENU ------------------------------------                      *}
            <div id="navbar-social" class="form-inline my-2 my-lg-0">
                <ul class="map_menu">
                    {*<li>
                        <a class="fliker-ico" href="#" target="_blank" title="Флікер">
                            <i class="fa fa-flickr"></i>
                        </a>
                    </li>*}
                    <li>
                        <a class="telegram-ico" href="https://t.me/verkhovnaradaukrainy" target="_blank"
                           title="Telegram">
                            <i class="fa fa-paper-plane opaque"></i>
                        </a>
                    </li>
                    <li>
                        <a class="instagram-ico" href="https://www.instagram.com/verkhovna_rada_of_ukraine/"
                           target="_blank" title="Instagram">
                            <i class="fa fa-instagram opaque"></i>
                        </a>
                    </li>
                    <li>
                        <a class="youtube-ico" href="https://www.youtube.com/user/RadaTVchannel" target="_blank"
                           title="Youtube">
                            <i class="fa fa-youtube-play opaque"></i>
                        </a>
                    </li>
                    <li>
                        <a class="twitter-ico" href="https://twitter.com/verkhovna_rada" target="_blank"
                           title="Twitter">
                            <i class="fa fa-twitter opaque"></i>
                        </a>
                    </li>
                    <li>
                        <a class="facebook-ico" href="https://www.facebook.com/verkhovna.rada.ukraine/"
                           target="_blank" title="Facebook">
                            <i class="fa fa-facebook-official opaque"></i>
                        </a>
                    </li>
                </ul>
            </div>
            {*<!-- lang block -->*}
            <div class="services">
                <div class="services-block" data-toggle="modal" data-target="#govModal">
                    <div class="btn btn-primary services-line gov-ua-line">
                        <i class="fa fa-bookmark i-gov-ua" title="Government Websites"></i> GOV.UA
                    </div>
                </div>
                <div class="d-md-block profile services-block">
                    <a href="https://itd.rada.gov.ua/idsrv/" target="_blank" class="btn btn-primary user-auth services-line">
                        <i class="fa fa-user-circle-o" title="Electronic cabinet"></i> Electronic cabinet
                    </a>
                </div>
                <div class="lang_block_new services-block">
                    <div class="dropdown">
                        <button id="lang_menu_navbar" class="btn btn-primary dropdown-toggle with-caret services-line opaque" type="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-language" title="Interface language"></i> Українською
                        </button>
                        <div class="dropdown-menu dropdown-primary w-100" aria-labelledby="lang_menu_navbar">
                            <a href="/" lang="uk" title="Укр" class="dropdown-item">Українською</a>
                            <a href="javascript:void(0)" lang="en" title="Eng" class="dropdown-item active">English</a>
                        </div>
                    </div>
                </div>
                <div class="services-block">
                    <a href="http://w1.c1.rada.gov.ua/" target="_blank" class="btn btn-primary services-line opaque">
                        <i class="fa fa-history" title="Previous version"></i> Previous version
                    </a>
                </div>
                <div class="services-block">
                    <div class="rada-online">
                        <a href="https://www.rada.gov.ua/video/rada-tv/64430.html" target="_blank">ONLINE</a>
                    </div>
                </div>
            </div>
            {*<!-- end lang block -->*}
            </div>
            <div class="search_block">
                <form method="get" action="/search">
                    <button type="submit" class="search_button opaque"><i class="fa fa-search"></i></button>
                </form>
            </div>
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