<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=9">
        <title>{$site_title}</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="{$site_domain}sources/fonts/ProbaPro/stylesheet.css" />
        <link rel="stylesheet" type="text/css" href="{$site_domain}sources{$th_folder}/main_page/css/style.css" />
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <script src="/sources/js/tinynav.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/circliful/1.2.1/css/jquery.circliful.min.css" rel="stylesheet" type="text/css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/circliful/1.2.1/js/jquery.circliful.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" />
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
        <link rel="stylesheet" type="text/css" href="{$site_domain}sources{$th_folder}/main_page/css/skin.css" />
        
         {literal}
            <script>

    $(function () {


        $('.sections_tabs li a.active').parent().addClass('selected');

        // TinyNav.js 1
        $('.sections_tabs').tinyNav();

    });


    $( document ).ready(function() {


        if ($('.sections_tabs li a').hasClass('active')) {
            $(this).parent().addClass('selected');
                     }
                     
                    $("#test-circle").circliful({
                        animationStep: 5,
                        foregroundBorderWidth: 15,
                        backgroundBorderWidth: 15,
                        percent: 72,
                        fgcolor: "#556b2f",
                        textColor: '#333'
                    });

        $('select').niceSelect();


                    /*$(".event-date .nice-select .current, .event-date .nice-select li").html(function(){
                     var text= $(this).text().trim().split(" ");
                     var first = text.shift();
                     var last = text.pop();
                     return (text.length > 0 ? "<b>"+ first + "</b> " : first) + text.join(" ") + (text.length > 0 ? " <span class='lite-grey'>" + last + "</span>" : last);
                     });*/


                });




            </script>
        {/literal}
        
        
    </head>
    <body>
        <div id="page">
            <!-- header -->
            <div id="header">
                
                <!-- main header -->
                <div class="header_body">

                    <div class="logo-main">
                        <a href="/" class="rada-logo">  </a>
                        <h1>Верховна Рада України</h1>
                        <p>Офіційний веб-портал парламенту України</p>
                    </div>

                    <!-- lang block -->
                    <div class="lang_block">

                        <select class="nice-select">
                            <option>Українською</option>
                            <option>English</option>
                            <option>Русский</option>
                        </select>

                        <a href="#" class="old-version">Стара версія</a>

                    </div>
                    <!-- end lang block -->


                </div>
                <!-- end main header -->

                <!-- navbar -->
                <nav class="navbar navbar-dark navbar-expand-lg">
                    <a class="navbar-brand" href="#"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        
{*  ----------- MAin Page MENU ------------------------------------                      *}
                        {if !$items_munu_hide}
                            {include file= "main_page/menu_ext.tpl"} 
                        {else}
                            {include file= "main_page/menu_ext_i.tpl"}       
                        {/if} 
{*  ----------- End MAin Page MENU ------------------------------------                      *}                        
                        <div class="form-inline my-2 my-lg-0">
                            <ul class="map_menu">
                                <li><a class="fliker-ico" href="#" target="_blank"></a></li>
                                <li><a class="youtube-ico" href="https://www.youtube.com/user/RadaTVchannel" target="_blank"></a></li>
                                <li><a class="twitter-ico" href="https://twitter.com/verkhovna_rada" target="_blank"></a></li>
                                <li><a class="facebook-ico" href="https://www.facebook.com/verkhovna.rada.ukraine/" target="_blank"></a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="search_block">
                        <form method="get" action="/search">
                            <input type="submit" class="search_button" value="Пошук">
                        </form>
                    </div>
                </nav>
                <!-- /navbar -->

            </div>
            <!-- end header -->