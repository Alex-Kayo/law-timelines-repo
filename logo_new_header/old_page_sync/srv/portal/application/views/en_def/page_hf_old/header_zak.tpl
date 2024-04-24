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
                            <li><a href="{$data.anchor}">{$data.name}</a></li> 
                        {/if}
                    {/foreach}                                 
                </ul>
        	<ul class="map_menu">
                    <li><a style= "top: 1px" href="https://iportal.rada.gov.ua{$lang_prefix}/rss/news">RSS</a></li>
             {*       <li><a href="#">архiв</a><input type="text" class="archive_date" /></li> *}
{*                    <li><a href="{$lang_prefix}/archive/">архiв</a></li>*}
                    <li><a style= "top: 1px" href="https://iportal.rada.gov.ua{$lang_prefix}/map/">мапа сайту</a></li>
                    <li><img src="{$site_domain}img/tel_cont.jpg"/><a style= "top: -5px" href="https://w1.c1.rada.gov.ua/pls/site2/p_aparat">контакти</a></li>
                    <li><img src="{$site_domain}img/rada_online.jpg"/><a style= "top: -5px" href="https://iportal.rada.gov.ua/video/rada-tv/64430.html">рада онлайн</a></li>
                    <li><img src="{$site_domain}img/press_center.jpg"/><a style= "top: -5px" href="https://iportal.rada.gov.ua/documents/contacts/117555.html">прес-служба</a></li>
                </ul>                

        </div>
    	<!-- end lang block -->
        
        <!-- main header -->
        <div class="header_body">
        	<div class="logo">
            	<a href="{$site_domain}{$lang_prefix}">
      {*         	<h1>Верховна Рада України</h1>
                    офiцiйний вебпортал}*}
		   
			
			    
			    </a>
	
		
		</div>
		    
                 
                        
                    <div class="sign_info">
                        <a href="https://itd.rada.gov.ua/petitions/" target="_blank" ><img style="margin-top: 2px;" src="{$site_domain}/img/sign.jpg" title="Електронні петиції"/><span style="top: -5px; position: relative;"> Електронні петиції </span></a>
                    
                    </div>
                        <br/><br/>
                        <div class="session_info">
                     <a href="https://iportal.rada.gov.ua/meeting/awt" style="text-decoration: none;" ><img style="margin-top: 2px;" src="{$site_domain}/img/calend_ses.jpg" title="Порядки денні пленарних засідань"/><span style="top: -5px; position: relative;"> П'ята сесія VIII скликання</span></a>
                    
                    </div>
                        
                   <br/><br/>
        	<div class="search_block">
                    
                <form method="get" action="https://iportal.rada.gov.ua{$lang_prefix}/search">
                    <input type="submit" class="search_button" value="Пошук" /><input type="text" class="search_input"  name="search" />
                    <input  name="submit_form" type="hidden" value="true" />
                    <input  name="sort" type="hidden" value="2" />
                </form>                 
            </div>
            
            <a class="wide_search" href="https://iportal.rada.gov.ua{$lang_prefix}/search/">розширений пошук</a>
            
        </div>
        <!-- end main header -->
		
        <!-- menu -->
	
        <div  id="nav"> 
{* static menu ---------------------------  *} 
	    
	{if !$items_munu_hide}
                {include file= "main_page/menu_ext_i.tpl"} 
            {else}
                {include file= "main_page/menu_ext_i.tpl"}       
        {/if}   
            
        </div>
 
        </div>
	<!-- end header -->
<!--Content-->
	<div class="main">
