<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=8">
            <title>{$site_title}</title>

            <link rel="stylesheet" type="text/css" href="/sources{$th_folder}/main_page/css/style.css" />
            <link rel="stylesheet" type="text/css" href="/sources{$th_folder}/main_page/css/jNice.css" />
            <link rel="stylesheet" type="text/css" href="/sources{$th_folder}/main_page/css/ui-lightness/jquery-ui-1.8.18.custom.css" />

            <link rel="stylesheet" type="text/css" href="/sources{$th_folder}/main_page/css/skin.css" />

            <script type="text/javascript" src="/sources{$th_folder}/main_page/jquery.js"></script>
            <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery-1.7.1.min.js"></script>
            <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery.jNice.js"></script> 

            <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery-ui.js"></script> 
            <script type="text/javascript" src="/sources{$th_folder}/main_page/js/cufon/cufon-yui.js"></script>
            <script type="text/javascript" src="/sources{$th_folder}/main_page/js/cufon/Helvetica-L_400.font.js"></script>
            <script type="text/javascript" src="/sources{$th_folder}/main_page/js/cufon/cufon-settings.js"></script>
            <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery.cycle.all.js"></script> 
            <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery.jcarousel.min.js"></script> 

            {if $site_lang == 'en'}
                <script type="text/javascript" src="/sources{$th_folder}/main_page/js/datepicker_local/jquery.ui.datepicker-en-GB.js"></script>     
            {elseif $site_lang == 'ru'}
                <script type="text/javascript" src="/sources{$th_folder}/main_page/js/datepicker_local/jquery.ui.datepicker-ru.js"></script>     
            {elseif $site_lang == 'ua'}           
                <script type="text/javascript" src="/sources{$th_folder}/main_page/js/datepicker_local/jquery.ui.datepicker-uk.js"></script>     
            {/if}

            <!-- jScrollPane -->
            <link type="text/css" href="/sources{$th_folder}/main_page/css/jquery.jscrollpane.css" rel="stylesheet" media="all" />
            <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery.jscrollpane.min.js"></script>    
            <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery.mousewheel.js"></script>
            <!-- end jScrollPane -->

            <!--[if !IE 9]>
                <link rel="stylesheet" href="/sources{$th_folder}/main_page/css/ie.css" type="text/css" media="screen" />
            <![endif]-->


            {literal}
                <script>

                    $(document).ready(function() {
                        $(".tabs_block").tabs();
                        $(".multimedia .tabs_block").tabs("option", "selected", 1);
                        $(".multimedia .tabs_block").bind("tabsselect", function(event, ui) {
                            $('#media_show').attr('href', $(".multimedia .tabs_block .multimedia_tab:eq(" + ui.index + ")").attr('url_show'));
                        });


                        $('.cycle').cycle({
                            fx: 'fade',
                            pager: '#cycle_pager',
                            timeout: 9000
                        });
                        $('#mycarousel').jcarousel({
                            // Configuration goes here
                        });
                        $('.archive_date').datepicker({
                            onClose: function() {
                                $(this).parent().removeClass('active');
                            },
                            beforeShow: function(input, inst) {
                                inst.dpDiv.css({marginTop: -input.offsetHeight + 20 + 'px', marginLeft: input.offsetWidth - 185 + 'px'});
                                $(this).parent().addClass('active');
                            },
                            onSelect: function(dateText, inst) {
                                document.location.href = '{/literal}{$lang_prefix}{literal}/archive/' + dateText;
                            }


                        });

                        //--------------------------------  Menu navigation      
                        $('#nav a.root').click(function() {
                            var li = $(this).parents('li');
                            li.children('.submenu').hide();

                            var leftposition = li.position();
                            $('#nav li').removeClass('active');
                            li.addClass('active');
                            li.children('.submenu').show();
                            if (leftposition.left > 0)
                                li.children('.submenu').css('margin-left', -leftposition.left - 1 + 'px');
                            return false;

                        });
                        //TimeOur ID

                        var TimeOutId;


                        $('#nav').mouseleave(function() {
                            var NavLi = $(this).children('.submenu');
                            TimeOutId = setTimeout(function() {
                                NavLi.hide();
                                $('#nav li').removeClass('active');
                            }, 400);

                        });
                        $('#nav').mouseenter(function() {
                            clearTimeout(TimeOutId);
                            //    $('#nav li').children('.submenu').show();    
                        });
                        //--------------------------------------------------------------------
                        $('.announce_overflow').jScrollPane({showArrows: true});
                    });

                </script>
            {/literal}
    </head>
    <body>
        <div id="page">
            <!-- header -->
            <div id="header">
                <!-- lang block -->
                <div class="lang_block">
                    <ul class="lang_menu">
                        {foreach item=data from=$lang_selector}                        
                            {if $data.active==1}
                                <li class="active">{$data.name}</li>
                                {else}
                                <li><a href="https://iportal.rada.gov.ua{$data.anchor}">{$data.name}</a></li> 
                                {/if}
                            {/foreach}                                 
                    </ul>
                    <ul class="map_menu">
                        <li><a href="{$lang_prefix}/rss/news">RSS</a></li>
                            {*       <li><a href="#">архiв</a><input type="text" class="archive_date" /></li> *}
                        <li><a href="{$lang_prefix}/archive/">archive</a></li>
                        <li><a href="{$lang_prefix}/map/">map</a></li>
                    </ul>                

                </div>
                <!-- end lang block -->

                <!-- main header -->
                <div class="header_body">
                    <div class="logo">
                        <a href="{$lang_prefix}/">
                            {*	<h1>Verkhovna Rada of Ukraine</h1>
                            Official web portal
                            <br>*}

                        </a>
                    </div>


                    <div class="search_block">

                        <form method="get" action="{$lang_prefix}/search_out">
                            <input type="submit" class="search_button" value="Search"  name="search"/><input type="text" class="search_input"  name="submit" />
                        </form>                 

                        <a class="wide_search" href="{$lang_prefix}/search/">advanced search</a>
                    </div>
                </div>
                <!-- end main header -->

                <!-- menu -->

                <div  id="nav"> 
                    {* static menu ---------------------------  *} 

                    {if !$items_munu_hide}
                        {include file= "main_page/menu_ext.inc"} 
                    {else}
                        {include file= "main_page/menu_ext.inc"}       
                    {/if}   

                </div>

                {* dinamic menu ---------------------------- 
                {if !$items_munu_hide}
                {widget name="widget" action="menu_builder" lang_prefix="$lang_prefix" root_id="74" menu_view="main_menu_new"} 
                {else}
                {widget name="widget" action="menu_builder" lang_prefix="$lang_prefix" root_id="73" menu_view="main_menu_new"} 
                {/if}   
                </div>        
                *} 

            </div>
            <!-- end header -->