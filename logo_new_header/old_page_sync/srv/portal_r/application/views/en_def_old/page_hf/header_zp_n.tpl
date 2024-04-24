<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>{$site_title} ({$site_lang})</title>
    
    <link rel="stylesheet" type="text/css" href="{$site_domain}sources{$th_folder}/main_page/css/style.css" />
    <link rel="stylesheet" type="text/css" href="{$site_domain}sources{$th_folder}/main_page/css/jNice.css" />
    <link rel="stylesheet" type="text/css" href="{$site_domain}sources{$th_folder}/main_page/css/ui-lightness/jquery-ui-1.8.18.custom.css" />
    
    <link rel="stylesheet" type="text/css" href="{$site_domain}sources{$th_folder}/main_page/css/skin.css" />
    
    <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/jquery.js"></script>
    <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery.jNice.js"></script> 
     
    <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery-ui.js"></script> 
    <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/cufon/cufon-yui.js"></script>
    <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/cufon/Helvetica-L_400.font.js"></script>
    <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/cufon/cufon-settings.js"></script>
    <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery.cycle.all.js"></script> 
    <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery.jcarousel.min.js"></script> 
    
    {if $site_lang == 'en'}
        <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/datepicker_local/jquery.ui.datepicker-en-GB.js"></script>     
    {elseif $site_lang == 'ru'}
        <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/datepicker_local/jquery.ui.datepicker-ru.js"></script>     
    {elseif $site_lang == 'ua'}           
        <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/datepicker_local/jquery.ui.datepicker-uk.js"></script>     
    {/if}
    
    <!-- jScrollPane -->
        <link type="text/css" href="{$site_domain}sources{$th_folder}/main_page/css/jquery.jscrollpane.css" rel="stylesheet" media="all" />
        <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery.jscrollpane.min.js"></script>    
        <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/js/jquery.mousewheel.js"></script>
    <!-- end jScrollPane -->

    <!--[if !IE 9]>
    	<link rel="stylesheet" href="{$site_domain}sources{$th_folder}/main_page/css/ie.css" type="text/css" media="screen" />
    <![endif]-->
        
    
        {literal}
	<script>
                    
		$(document).ready(function() {
			$( ".tabs_block" ).tabs();
			$( ".multimedia .tabs_block" ).tabs("option", "selected", 1);
                        $( ".multimedia .tabs_block" ).bind( "tabsselect", function(event, ui) {
                              $('#media_show').attr('href', $(".multimedia .tabs_block .multimedia_tab:eq("+ui.index+")").attr('url_show'));
                        });                            
                            
                            
			$('.cycle').cycle({
				fx:     'fade', 
				pager:  '#cycle_pager'
			});
			$('#mycarousel').jcarousel({
				// Configuration goes here
			});
			$('.archive_date').datepicker({
                                onClose:function(){
                                       $(this).parent().removeClass('active');
                                },
				beforeShow: function(input, inst){
                                        inst.dpDiv.css({marginTop: -input.offsetHeight + 20 + 'px', marginLeft: input.offsetWidth - 185 + 'px'});
                                        $(this).parent().addClass('active');
                                },
                                onSelect: function(dateText, inst) {
                                    document.location.href = '{/literal}{$lang_prefix}{literal}/archive/' + dateText;
                                }    
                                    
                                    
			});
                            
                            
                        $('#nav a.root').click(function(){
                            var li = $(this).parents('li');                                
                            li.children('.submenu').hide();
                                
                            var leftposition = li.position();
                            $('#nav li').removeClass('active');
                            li.addClass('active');
                            li.children('.submenu').show();
                            li.children('.submenu').css('margin-left', -leftposition.left - 1 + 'px');
                            return false;                                

                        });
                        
                        $('#nav li').hover(function(){
                            $(this).children('.submenu').hide();
                        });
                        
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
                           {* <li><a href="{$data.anchor}">{$data.name}</a></li>    *}
                        {/if}
                    {/foreach}                                 
                </ul>
        	<ul class="map_menu">
                    <li><a href="{$lang_prefix}/rss/news">RSS</a></li>
             {*       <li><a href="#">архiв</a><input type="text" class="archive_date" /></li> *}
                    <li><a href="{$lang_prefix}/archive/">архiв</a></li>
                    <li><a href="{$lang_prefix}/map/">мапа сайту</a></li>
                </ul>                

        </div>
    	<!-- end lang block -->
        
        <!-- main header -->
        <div class="header_body">
        	<div class="logo">
            	<a href="{$lang_prefix}/">
                	<h1>Верховна Рада України</h1>
                    офiцiйний веб-портал
		    <br>
			    <h5 style="font-style:italic; color: #9D9D9D">тестова версія</h5> 
			    </a>
		</div>
			<div style="display: block; position: absolute; top: 130px; color: red">
			<a href="https://portal.rada.gov.ua/rada/control/uk/index"><h4>перехід на діючий сайт</h4></a>
		</div>	    
		
        	<div class="search_block">
                    
                <form method="get" action="{$lang_prefix}/search">
                    <input type="submit" class="search_button" value="Пошук"  name="search"/><input type="text" class="search_input"  name="submit" />
                </form>                 

                <a class="wide_search" href="{$lang_prefix}/search/">розширений пошук</a>
            </div>
        </div>
        <!-- end main header -->
		
        <!-- menu -->
	
        <div  id="nav"> 
{* static menu ---------------------------  *} 
	    
	{if !$items_munu_hide}
                {include file= "main_page/menu_ext.inc"} 
            {else}
                {include file= "main_page/menu_ext_i.inc"}       
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
    <!--Content-->
	<div class="main">