<?php /* Smarty version 2.6.22, created on 2024-04-11 10:41:29
         compiled from main_page/header.tpl */ ?>
<div id="header" class="logo_rada">
    <div id="mainhead" class="header_body">
        <div class="logo-main">
            <div class="logo-container">
                <div class="logo-flag-line"></div>
                <a href="/" class="logo-gerb-container">
                    <div class="logo-gerb"></div>
                    <div class="logo-gerb-title">
                        RADA
                    </div>
                </a>
                <div class="logo-text">
                    <div class="logo-text-top">
                        <a href="/" class="logo-text-top-main">
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
                        Official webportal of the Parliament of Ukraine
                    </div>
                </div>
            </div>
        </div>
        <div class="services w-228">
            <div class="services-block" data-toggle="modal" data-target="#govModal">
                <div class="btn btn-primary services-line w-mc gov-ua-line">
                    <i class="fa fa-bookmark i-gov-ua" title="Government websites"></i> GOV.UA
                </div>
            </div>
            <div class="d-none d-md-block profile services-block">
                <a href="https://itd.rada.gov.ua/idsrv/en" target="_blank" class="btn btn-primary user-auth services-line w-mc">
                    <i class="fa fa-user-circle-o" title="Electronic cabinet"></i> Electronic cabinet
                </a>
            </div>
            <div class="lang_block_new services-block">
                <div class="dropdown">
                    <button id="lang_menu_logo" class="btn btn-primary dropdown-toggle with-caret services-line w-mc opaque" type="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-language" title="Interface language"></i> English
                    </button>
                    <div class="dropdown-menu dropdown-menu-right dropdown-primary" aria-labelledby="lang_menu_logo">
                        <a href="/" lang="uk" title="Укр" class="dropdown-item">Українською</a>
                                            </div>
                </div>
            </div>
                    </div>
    </div>
    
    <!-- navbar -->
    <nav id="navbar" class="navbar navbar-dark navbar-expand-lg">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <span class="navbar-brand">
            <a href="/" class="navbar-logo-mini">
                <div class="logo-flag-line"></div>
                <span>Verkhovna Rada<br>of Ukraine</span>
            </a>
        </span>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <?php if (! $this->_tpl_vars['items_hide']): ?>
                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "main_page/main_menu.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            <?php else: ?>
                <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "main_page/main_menu4inet.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            <?php endif; ?>
                        <div id="navbar-social" class="form-inline services-block">
                <ul class="map_menu services-line">
                                        <li>
                        <a class="telegram-ico opaque" href="https://t.me/verkhovnaradaukrainy" target="_blank"
                           title="Telegram">
                            <i class="fa fa-paper-plane"></i>
                        </a>
                    </li>
                    <li>
                        <a class="instagram-ico opaque" href="https://www.instagram.com/verkhovna_rada_of_ukraine/"
                           target="_blank" title="Instagram">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </li>
                    <li>
                        <a class="youtube-ico opaque" href="https://www.youtube.com/user/RadaTVchannel" target="_blank"
                           title="Youtube">
                            <i class="fa fa-youtube-play"></i>
                        </a>
                    </li>
                    <li>
                        <a class="twitter-ico opaque" href="https://twitter.com/verkhovna_rada" target="_blank"
                           title="Twitter">
                            <i class="fa fa-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a class="facebook-ico opaque" href="https://www.facebook.com/verkhovna.rada.ukraine/"
                           target="_blank" title="Facebook">
                            <i class="fa fa-facebook-official"></i>
                        </a>
                    </li>
                </ul>
            </div>
                        <div class="services">
                <div class="lang_block_new services-block">
                    <div class="dropdown">
                        <button id="lang_menu_navbar" class="btn btn-primary dropdown-toggle with-caret services-line w-228 opaque" type="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-language" title="Мова інтерфейсу"></i> English
                        </button>
                        <div class="dropdown-menu dropdown-primary w-100" aria-labelledby="lang_menu_navbar">
                            <a href="/" lang="uk" title="Укр" class="dropdown-item">Українською</a>
                                                    </div>
                    </div>
                </div>
                <div class="services-block" data-toggle="modal" data-target="#govModal">
                    <div class="btn btn-primary services-line w-228 gov-ua-line">
                        <i class="fa fa-bookmark i-gov-ua" title="Government websites"></i> GOV.UA
                    </div>
                </div>
                                <div class="services-block">
                    <div class="services-line">
                        <div class="rada-online">
                            <a href="https://www.rada.gov.ua/video/rada-tv/64430.html" target="_blank">ONLINE</a>
                        </div>
                    </div>
                </div>
            </div>
                        </div>
            <div class="search_block">
                <form method="get" action="/search">
                    <button type="submit" class="search_button btn btn-primary services-line w-mc opaque"><i class="fa fa-search"></i><span class="search_button_text">Search</span></button>
                </form>
            </div>
            <div class="lang_block_new services-block with-sticky">
                <div class="dropdown">
                    <button id="lang_menu_navbar_sticky" class="btn btn-primary dropdown-toggle services-line w-mc with-caret" type="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-language" title="Мова інтерфейсу"></i> <span class="lang_block_text">English</span>
                    </button>
                    <div class="dropdown-menu dropdown-primary w-100" aria-labelledby="lang_menu_navbar_sticky">
                        <a href="javascript:void(0)" lang="uk" title="Укр" class="dropdown-item">Українською</a>
                                            </div>
                </div>
            </div>
            <div class="d-md-block profile services-block opaque d-lg-none">
                <a href="https://itd.rada.gov.ua/idsrv/en" target="_blank" class="btn btn-primary user-auth services-line w-mc">
                    <i class="fa fa-user-circle-o" title="Electronic cabinet"></i>
                </a>
            </div>
        </nav>
        <!-- govModal -->
    <div class="modal gov" id="govModal" tabindex="-1" role="dialog" aria-labelledby="govModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content gov-ua">
                <div class="icon-close" data-dismiss="modal"></div>
                <h3   style="padding-bottom: 0.5rem;"> Government websites of Ukraine </h3>
                <ul class="outer-links">
                    <li><a href="https://www.president.gov.ua/en/" target="_blank" rel="nofollow">President of Ukraine</a></li>
                    <li><a href="https://www.kmu.gov.ua/en" target="_blank" rel="nofollow">Cabinet of Ministers of Ukraine</a></li>
                    <li><a href="http://www.ccu.gov.ua/en" target="_blank" rel="nofollow">Constitutional Court of Ukraine</a></li>
                    <li><a href="http://www.rnbo.gov.ua/en/" target="_blank" rel="nofollow">National Security and Defence Council of Ukraine</a></li>
                    <li><a href="https://www.kmu.gov.ua/ua/catalog/" target="_blank" rel="nofollow">Central and local executive authorities</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- /govModal -->
</div>