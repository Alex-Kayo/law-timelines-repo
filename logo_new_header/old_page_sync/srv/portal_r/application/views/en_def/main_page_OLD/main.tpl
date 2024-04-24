<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=9"> 
    <title>{$site_title}</title>
    
    <link rel="stylesheet" type="text/css" href="/sources{$th_folder}/main_page/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/sources{$th_folder}/main_page/css/jNice.css" />
    <link rel="stylesheet" type="text/css" href="/sources{$th_folder}/main_page/css/ui-lightness/jquery-ui-1.8.18.custom.css" />
    
    <link rel="stylesheet" type="text/css" href="/sources{$th_folder}/main_page/css/skin.css" />
    <link rel="stylesheet" href="/sources{$th_folder}/main_page/css/menu.css" type="text/css" media="all"  />
    <link rel="stylesheet" href="/sources{$th_folder}/main_page/css/jquery.fancybox-1.3.4.css" type="text/css" media="all"  />
    
{*    <script type="text/javascript" src="/sources{$th_folder}/main_page/jquery.js"></script>*}
    <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery.jNice.js"></script> 
     
    <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery-ui.js"></script> 
    <script type="text/javascript" src="/sources{$th_folder}/main_page/js/cufon/cufon-yui.js"></script>
    <script type="text/javascript" src="/sources{$th_folder}/main_page/js/cufon/Helvetica-L_400.font.js"></script>
    <script type="text/javascript" src="/sources{$th_folder}/main_page/js/cufon/cufon-settings.js"></script>
    <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery.cycle.all.js"></script> 
    <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery.jcarousel.min.js"></script> 
    <script type="text/javascript" src="/sources{$th_folder}/main_page/js/jquery.fancybox-1.3.4.pack.js"></script> 
    <script type="text/javascript" src="/sources{$th_folder}/main_page/js/clappr.min.js"></script> 
{*  <script type="text/javascript" src="/sources{$th_folder}/main_page/js/menu.js"></script>*}
    
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
    if (!window.qmad){qmad=new Object();qmad.binit="";qmad.bvis="";qmad.bhide="";}          
                    
		$(document).ready(function() {
			$( ".tabs_block" ).tabs();
			$( ".multimedia .tabs_block" ).tabs("option", "selected", 1);
                        $( ".multimedia .tabs_block" ).bind( "tabsselect", function(event, ui) {
                              $('#media_show').attr('href', $(".multimedia .tabs_block .multimedia_tab:eq("+ui.index+")").attr('url_show'));
                        });                            
                            
                            
			$('.cycle').cycle({
				fx:     'fade', 
				pager:  '#cycle_pager',
				timeout:  9000    
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
                            
                     //--------------------------------  Menu navigation      
                        var position = -1;
                        $('#nav a.root').click(function(){
                            var li = $(this).parents('li');                                
                            var leftposition = li.position();
                            if (leftposition.left == position) return false;
                            
                            li.children('.submenu').hide();
                            $('#nav li').removeClass('active');
                            li.addClass('active');
                                
                                     li.children('.submenu').show();
                                     position = leftposition.left;
                                     if (leftposition.left > 0) 
                                     li.children('.submenu').css('margin-left', -leftposition.left - 1 + 'px');
                                
                                                     
                          return false;                                

                        });
                        //TimeOur ID
                            
                            var TimeOutId; 
                            
                        
                        $('#nav').mouseleave(function(){
                            var NavLi = $(this).children('.submenu');
                            TimeOutId = setTimeout(function(){NavLi.hide();
                             $('#nav li').removeClass('active');},400);
                             position = -1;   
                        });
                         $('#nav').mouseenter(function(){
                            clearTimeout(TimeOutId);
                          });
                 //-------------------------------------------------------------------- 
                 
                 //--------------- menu fixed ----------------------------------
                 var menu = $("#nav");
                 var scrollNavigator = $("#scroll_top");
                 var TopPublication = 550;
                 var TopPosition = 150;
	        $(window).scroll(function(){
	            if ( $(this).scrollTop() > TopPublication){
                            scrollNavigator.show();
                        } else scrollNavigator.hide();
                        
                    if ( $(this).scrollTop() > TopPosition){
                        menu.css('position', 'fixed');
	                menu.css('top', 0);
                        } else menu.css('position', 'relative');
                  });   //scroll
                 
               //  $("#snav").click(function(){
                 scrollNavigator.click(function(){
                    $("html, body").animate({scrollTop:190}, '300');
                });
//-----------------------------------------------------------------------
                 
                 
                 
			$('.announce_overflow').jScrollPane({showArrows: true});
			$('.notis_overflow').jScrollPane({showArrows: true});
                        

                        
});                    
                    
	</script>
        {/literal}
        
        {if $print_style}
            <link rel="stylesheet" href="/sources{$th_folder}/main_page/css/style_print.css" type="text/css" media="all"  />
        {/if}


        {*         Google analytics   *}
        {literal}
                <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-34073782-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

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
                            <li><a href="{$data.anchor}">{$data.name}</a></li> 
                        {/if}
                    {/foreach}                                 
                </ul>
        	<ul class="map_menu">
                    <li><a style= "top: 1px" href="{$lang_prefix}/rss/news">RSS</a></li>
             {*       <li><a href="#">архiв</a><input type="text" class="archive_date" /></li> *}
{*                    <li><a href="{$lang_prefix}/archive/">архiв</a></li>*}
                    <li><a style= "top: 1px" href="{$lang_prefix}/map/">мапа сайту</a></li>
                    <li><img src="/img/tel_cont.jpg"/><a style= "top: -5px" href="http://w1.c1.rada.gov.ua/pls/site2/p_aparat">контакти</a></li>
                    <li><img src="/img/rada_online.jpg"/><a style= "top: -5px" href="/video/rada-tv/64430.html">рада онлайн</a></li>
                    <li><img src="/img/press_center.jpg"/><a style= "top: -5px" href="http://iportal.rada.gov.ua/documents/contacts/117555.html">прес-служба</a></li>
                    <li><img style= "margin-top: 1px" src="/img/badge1.png"/><a style= "top: -5px" href="http://iportal.rada.gov.ua/fba">акредитація</a></li>
                </ul>                

        </div>
    	<!-- end lang block -->
        
        <!-- main header -->
        <div class="header_body">
        	<div class="logo">
            	<a href="http://iportal.rada.gov.ua/">
      		   
			
			    
			    </a>
	
		
		</div>
		    
                 
                        
                    
                    <div class="sign_info">
                        <ul id="qm1" class="qmmc">
                            <li><a href="#">Електронні сервіси</a><ul>
		<li><a target="_blank" href="#">Електронні петиції</a></li>
                    <li><a target="_blank" href="#">Громадське обговорення законопроектів</a></li>
                    <li><a target="_blank" href="#">Електронний кабінет громадянина</a></li>
                    <li><a target="_blank" href="#">Повний цикл публічної політики</a></li>
		</ul></li>
                       </ul>
    
                    
                    </div>
                    {*<div class="sign_info">
                        <a href="https://itd.rada.gov.ua/petitions/" target="_blank" ><img style="margin-top: -4px;" src="http://iportal.rada.gov.ua/img/sign.jpg" title="Електронні петиції"/><span style="top: -5px; position: relative;"> Електронні петиції</span></a>
                    
                    </div>*}
                    <br/>
                    {*<div class="session_info" style="margin-left: 100px">
                        <a href="https://itd.rada.gov.ua/services/pubd/" style="text-decoration: none;" target="_blank" ><img style="margin-top: -6px;" src="http://iportal.rada.gov.ua/img/sign.jpg" title="Електронні петиції"/><span style="top: -8px; position: relative; "> Громадське обговорення законопроектів</span></a>
                    
                    </div>*}
                    <br>
                    {*<div class="session_info" style="margin-left: 100px">
                        <a href="https://itd.rada.gov.ua/idsrv/" style="text-decoration: none;" target="_blank" ><img style="margin-top: -7px;" src="http://iportal.rada.gov.ua/img/sign.jpg" title="Електронні петиції"/><span style="top: -5px; position: relative; "> Електронний кабінет громадянина</span></a>
                    
                    </div>*}
                        <br/><br/>
                        <div class="session_info" style="margin-top: -14px;">
                     <a href="http://iportal.rada.gov.ua/meeting/awt" style="text-decoration: none;"  target="_blank"><img style="margin-top: 2px;" src="http://iportal.rada.gov.ua/img/calend_ses.jpg" title="Порядки денні пленарних засідань"/><span style="top: -5px; position: relative;"> Сьома сесія VIII скликання</span></a>
                                        
                    </div>
                        
                   <br/><br/>
                   <div class="search_block" style="margin-top: -20px">
                    
                <form method="get" action="http://iportal.rada.gov.ua//search">
                    <input type="submit" class="search_button" value="Пошук" /><input type="text" class="search_input"  name="search" />
                    <input  name="submit_form" type="hidden" value="true" />
                    <input  name="sort" type="hidden" value="2" />
                </form>                 
            </div>
            
            
        </div>
        <!-- end main header -->
		
        <!-- menu -->
	
        <div  id="nav"> 
{* static menu ---------------------------  *} 
	    
	{if !$items_munu_hide}
                {include file= "main_page/menu_ext.tpl"} 
            {else}
                {include file= "main_page/menu_ext_i.tpl"}       
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
    
    <!-- main content -->
    
    {if $class == 'video' or $class == 'documents' or $class == 'audio'}
        {assign var="main_class" value="gallery"}
    {else}
        {assign var="main_class" value=$class}
    {/if}
    
      <div class="main">   {*  {$main_class}    *}
        
        {if $current_node->t_name}
            <div class="breadcrumbs">
                    <a href="{$lang_prefix}/">Головна</a> >
                    {foreach item=data from=$path_way}
                        <a href="{$lang_prefix}/{$data->t_parents}/">{$data->t_name}</a> > 
                    {/foreach}                    
                    {$current_node->t_name}
            </div>                    

        {/if}        
        

        
        {if $front}
            
            {include file="main_page/left.tpl"}
            
        {/if}        
                
       {include file="$template"}
                            
        <div class="clear"></div>
    </div>
    <!-- end main content -->
    
    <div class="block_rotator">
    	<ul id="mycarousel"  class="jcarousel-skin-tango">
        	<li class="constitution"><a href="http://zakon.rada.gov.ua/go/254%D0%BA/96-%D0%B2%D1%80">Конституція України</a></li>
        	<li class="president"><a href="http://www.president.gov.ua/">Президент України</a></li>
        	<li class="chairman"><a href="http://chairman.rada.gov.ua/">Голова Верховної Ради України</a></li>
                <li class="portal"><a href="http://www.kmu.gov.ua/">Урядовий портал</a></li>
	 		<li class="court"><a href="http://www.ccu.gov.ua">Конституційний суд</a></li>        
        	<li class="constitution"><a href="http://zakon.rada.gov.ua/go/254%D0%BA/96-%D0%B2%D1%80">Конституція України</a></li>
        	<li class="president"><a href="http://www.president.gov.ua/">Президент України</a></li>
        	<li class="chairman"><a href="http://chairman.rada.gov.ua/">Голова Верховної Ради України</a></li>
        	<li class="portal"><a href="http://www.kmu.gov.ua/">Урядовий портал</a></li>
	 		<li class="court"><a href="http://www.ccu.gov.ua">Конституційний суд</a></li>        
        </ul>
    </div>
	
    <!-- footer -->
    <div id="empty"></div>
    <div id="footer">
    	<div class="footer">
        	<div class="footer_ins">
        		<div class="footer_mask"></div>
                <div class="copy">
                	 &copy; Верховна Рада України 1994-{$smarty.now|date_format:"%Y"}<br>
                     програмно-технічна підтримка — Управління комп'ютеризованих систем<br>
					 
                         {if $footer_info_support}
                             
                             {$footer_info_support}</br>
                             {else}
                                 Iнформаційна підтримка — Інформаційне управління,<br>
                     Прес-служба Апарату Верховної Ради України <br>
                         
                         {/if}
                     <span class=test_mas> Окремі функції порталу працюють у тестовому режимі</span>
                </div>
            </div>    
        </div>
    </div>
    <!-- end footer -->
    {literal}
        
    <script>
        
        $(document).ready(function() {
        
        //----------------------FANCYBOX---------------------------------------
                       $("a[rel=pub_img_group]").fancybox({
				'transitionIn'	: 'elastic',
				'transitionOut'	: 'elastic',
				'overlayColor'		: '#bbb',
				'overlayOpacity'	: 0.7,
				'titlePosition' 	: 'outside',
				'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
					return '<span id="fancybox-title-over">ФОТО ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
				}
			});
                    });              
    </script>
    
    
    <script type="text/javascript"> Cufon.now(); </script>
    {/literal}
</div>
</body>
</html>
