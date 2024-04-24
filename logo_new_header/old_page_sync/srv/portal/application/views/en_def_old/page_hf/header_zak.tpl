<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
	{* header *}
    <div id="header">
    	{* lang block *}
    	<div class="lang_block">
        	<ul class="lang_menu">
                    {foreach item=data from=$lang_selector}                        
                        {if $data.active==1}
                            <li class="active">{$data.name}</li>
                        {else}
                            <li><a href="{$data.anchor}">{$data.name}</a></li> 
                        {/if}
                    {/foreach}                                 
                </ul>
        	<ul class="map_menu">
                    <li><a href="{$site_domain}en/rss/news">RSS</a></li>
             {*       <li><a href="#">архiв</a><input type="text" class="archive_date" /></li> *}
                    <li><a href="{$site_domain}en/archive/">archive</a></li>
                    <li><a href="{$site_domain}en/map/">map</a></li>
                </ul>                

        </div>
    	{* end lang block *}
        
        {* main header *}
        <div class="header_body">
        	<div class="logo">
            	<a href="{$site_domain}en/">
                {*	<h1>Verkhovna Rada of Ukraine</h1>
                    Official web portal
		    <br>*}
			    <h5 style="font-style:italic; color: #ffffff">release candidate</h5> 
			    </a>
		</div>
			<a href="https://portal.rada.gov.ua/rada/control/en/index" style="display: block; top: 90px; left: -390px; position: relative; color: #0C468E; font-size: 11px;">previous version</a>  
		
        	<div class="search_block">
                    
                <form method="get" action="{$site_domain}en/search_out">
                    <input type="submit" class="search_button" value="Search"  name="search"/><input type="text" class="search_input"  name="submit" />
                </form>                 

                <a class="wide_search" href="{$site_domain}en/search/">advanced search</a>
            </div>
        </div>
        {* end main header *}
		
        {* menu *}
	
        <div  id="nav"> 
{* static menu ---------------------------  *} 
	    
	{if !$items_munu_hide}
                {include file= "main_page/menu_ext.inc"} 
            {else}
                {include file= "main_page/menu_ext.inc"}       
        {/if}   
            
        </div>
 
        </div>
	{* end header *}