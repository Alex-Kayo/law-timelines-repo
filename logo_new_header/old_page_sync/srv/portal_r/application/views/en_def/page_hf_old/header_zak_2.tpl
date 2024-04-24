<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
            {if !$service_title}
                <title>[#title#]</title>
            {else}
                <title>{$service_title}</title>
            {/if}
            <link rel="stylesheet" type="text/css" href="{$site_domain}sources{$th_folder}/main_page/css/style.css" />
            <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery-1.7.1.min.js"></script>
            <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery-ui.js"></script> 
            <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery.cycle.all.js"></script> 
            <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery.jcarousel.min.js"></script> 
            <script type="text/javascript" src="{$site_domain}js/menu.nav_1.js"></script> 

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
                                    {* <li><a href="{$data.anchor}">{$data.name}</a></li>    *}
                                {/if}
                            {/foreach}                                 
                    </ul>
                    <ul class="map_menu">
                        <li><a href="{$site_domain}rss/news">RSS</a></li>
                        <li><a href="{$site_domain}archive/">архiв</a></li>
                        <li><a href="{$site_domain}map/">мапа сайту</a></li>
                    </ul>                

                </div>
                <!-- end lang block -->

                <!-- main header -->
                <div class="header_body">
                    <div class="logo">
                        <a href="{$lang_prefix}/">
                            {*         	<h1>Верховна Рада України</h1>
                            офiцiйний вебпортал}*}


                            <h5 style="font-style:italic; color: #ffffff">тестова версія</h5> 
                        </a>




                    </div>

                    <a href="https://portal.rada.gov.ua/rada/control/uk/index" style="display: block; top: 90px; left: -390px; position: relative; color: #0C468E; font-size: 11px;">перехід на діючий сайт</a>

                    <div class="search_block">

                        <form method="get" action="{$site_domain}search_out">
                            <input type="submit" class="search_button" value="Пошук"  name="search"/><input type="text" class="search_input"  name="submit" />
                        </form>                 

                        <a class="wide_search" href="{$site_domain}/search/">розширений пошук</a>
                    </div>
                </div>
                <!-- end main header -->
                <!--	{$RequestorIp}	-->
                <!-- menu -->

                <div  id="nav"> 
                    {* static menu ---------------------------  *} 

                    {if $menu_active}

                        {include file= "main_page/menu_ext.inc"}

                    {else}
                        {include file= "main_page/menu_ext_i.inc"}

                    {/if}   

                </div>

            </div>
            <!-- end header -->
            <!--Content-->
            <div class="main">
