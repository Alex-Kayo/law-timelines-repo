<div id="header" class="logo_rada">
    <div id="mainhead" class="header_body">
        <div class="logo-main">
            <div class="logo-container">
                <div class="logo-flag-line"></div>
                <a href="/" class="logo-gerb-container">
                    <div class="logo-gerb"></div>
                    <div class="logo-gerb-title">
                        РАДА
                    </div>
                </a>
                <div class="logo-text">
                    <div class="logo-text-top">
                        <a href="/" class="logo-text-top-main">
                            РАДА
                        </a>
                        <div class="logo-text-top-secondary">
                            <span>
                                ВЕРХОВНА
                                <div class="rada-online rada-online-mobile">
                                    <a href="https://www.rada.gov.ua/video/rada-tv/64430.html" target="_blank">ONLINE</a>
                                </div>
                            </span>
                            <span>
                                РАДА УКРАЇНИ
                                <div class="rada-online">
                                    <a href="https://www.rada.gov.ua/video/rada-tv/64430.html" target="_blank">ONLINE</a>
                                </div>
                            </span>
                        </div>
                    </div>
                    <div class="logo-text-bottom">
                        Офіційний вебпортал парламенту України
                    </div>
                </div>
            </div>
        </div>
        <div class="services w-228">
            <div class="services-block" data-toggle="modal" data-target="#govModal">
                <div class="btn btn-primary services-line w-mc gov-ua-line">
                    <i class="fa fa-bookmark i-gov-ua" title="Державні сайти"></i> GOV.UA
                </div>
            </div>
            <div class="d-none d-md-block profile services-block">
                <a href="https://itd.rada.gov.ua/idsrv/" target="_blank" class="btn btn-primary user-auth services-line w-mc">
                    <i class="fa fa-user-circle-o" title="Електронний кабінет"></i> Електронний кабінет
                </a>
            </div>
            <div class="lang_block_new services-block">
                <div class="dropdown">
                    <button id="lang_menu_logo" class="btn btn-primary dropdown-toggle with-caret services-line w-mc opaque" type="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-language" title="Мова інтерфейсу"></i> Українською
                    </button>
                    <div class="dropdown-menu dropdown-menu-right dropdown-primary" aria-labelledby="lang_menu_logo">
                        {*<a href="javascript:void(0)" lang="uk" title="Укр" class="dropdown-item active">Українською</a>*}
                        <a href="/en" lang="en" title="Eng" class="dropdown-item">English</a>
                    </div>
                </div>
            </div>
            {*<div class="services-block">
                <a href="http://w1.c1.rada.gov.ua/" target="_blank" class="btn btn-primary services-line w-mc opaque">
                    <i class="fa fa-history" title="Попередній"></i> Попередня версія
                </a>
            </div>*}
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
            <a href="/" class="navbar-logo-mini">
                <div class="logo-flag-line"></div>
                <span>Верховна Рада<br>України</span>
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
            <div id="navbar-social" class="form-inline services-block">
                <ul class="map_menu services-line">
                    {*<li>
                        <a class="fliker-ico" href="#" target="_blank" title="Флікер">
                            <i class="fa fa-flickr"></i>
                        </a>
                    </li>*}
                    <li>
                        <a class="telegram-ico opaque" href="https://t.me/verkhovnaradaukrainy" target="_blank"
                           title="Телеграм">
                            <i class="fa fa-paper-plane"></i>
                        </a>
                    </li>
                    <li>
                        <a class="instagram-ico opaque" href="https://www.instagram.com/verkhovna_rada_of_ukraine/"
                           target="_blank" title="Інстаграм">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </li>
                    <li>
                        <a class="youtube-ico opaque" href="https://www.youtube.com/user/RadaTVchannel" target="_blank"
                           title="Ютьюб">
                            <i class="fa fa-youtube-play"></i>
                        </a>
                    </li>
                    <li>
                        <a class="twitter-ico opaque" href="https://twitter.com/verkhovna_rada" target="_blank"
                           title="Твіттер">
                            <i class="fa fa-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a class="facebook-ico opaque" href="https://www.facebook.com/verkhovna.rada.ukraine/"
                           target="_blank" title="Фейсбук">
                            <i class="fa fa-facebook-official"></i>
                        </a>
                    </li>
                </ul>
            </div>
            {*<!-- lang block -->*}
            <div class="services">
                <div class="lang_block_new services-block">
                    <div class="dropdown">
                        <button id="lang_menu_navbar" class="btn btn-primary dropdown-toggle with-caret services-line w-228 opaque" type="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-language" title="Мова інтерфейсу"></i> Українською
                        </button>
                        <div class="dropdown-menu dropdown-primary w-100" aria-labelledby="lang_menu_navbar">
                            <a href="javascript:void(0)" lang="uk" title="Укр" class="dropdown-item active">Українською</a>
                            {*<a href="/en" lang="en" title="Eng" class="dropdown-item">English</a>*}
                        </div>
                    </div>
                </div>
                <div class="services-block" data-toggle="modal" data-target="#govModal">
                    <div class="btn btn-primary services-line w-228 gov-ua-line">
                        <i class="fa fa-bookmark i-gov-ua" title="Державні сайти"></i> GOV.UA
                    </div>
                </div>
                {*<div class="services-block">
                    <a href="http://w1.c1.rada.gov.ua/" target="_blank" class="btn btn-primary services-line w-228 opaque">
                        <i class="fa fa-history" title="Попередня версія"></i> Попередня версія
                    </a>
                </div>*}
                <div class="services-block">
                    <div class="services-line">
                    <div class="rada-online">
                        <a href="https://www.rada.gov.ua/video/rada-tv/64430.html" target="_blank">ONLINE</a>
                    </div>
                </div>
            </div>
            </div>
            {*<!-- end lang block -->*}
            </div>
            <div class="search_block">
                <form method="get" action="/search">
                    <button type="submit" class="search_button btn btn-primary services-line w-mc opaque"><i class="fa fa-search"></i><span class="search_button_text">Пошук</span></button>
                </form>
            </div>
            <div class="lang_block_new services-block with-sticky">
                <div class="dropdown">
                    <button id="lang_menu_navbar_sticky" class="btn btn-primary dropdown-toggle services-line w-mc with-caret" type="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-language" title="Мова інтерфейсу"></i> <span class="lang_block_text">Українською</span>
                    </button>
                    <div class="dropdown-menu dropdown-primary w-100" aria-labelledby="lang_menu_navbar_sticky">
                        {*<a href="javascript:void(0)" lang="uk" title="Укр" class="dropdown-item active">Українською</a>*}
                        <a href="/en" lang="en" title="Eng" class="dropdown-item">English</a>
                    </div>
                </div>
            </div>
            <div class="d-md-block profile services-block opaque d-lg-none">
                <a href="https://itd.rada.gov.ua/idsrv/" target="_blank" class="btn btn-primary user-auth services-line w-mc">
                    <i class="fa fa-user-circle-o" title="Електронний кабінет"></i>
                </a>
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