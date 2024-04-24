<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{$site_title}</title>
<meta name="description" content="{$meta.description}">
<meta name="keywords" content="{$meta.keywords}">

<link rel="shortcut icon" href="favicon.ico" />
{literal}
<script type="text/javascript" src="/sources{/literal}{$th_folder}{literal}/main_page/jquery.js"></script>
<script type="text/javascript">
if (!window.qmad){qmad=new Object();qmad.binit="";qmad.bvis="";qmad.bhide="";}


$(document).ready(function(){       
    
    $('#calend').click(function(){                
        if($('#calendar_div').css('display') == 'none'){
            $.ajax({
                url: '{/literal}{$lang_prefix}{literal}/archive/callendar_main_page',
                success: function (data, textStatus){
                    $('#calendar_div').html(data);
                    $("#calendar_div").show("fast");
                    
                    
                } 
            });        
        }    else {
            $('#calendar_div').hide("slide");
            
        }
    })
    
}); 

function changeMonth(strURI){
    $.ajax({
        url: strURI,
        success: function (data, textStatus){            
            $('#calendar_div').html(data);
        } 
    });        
}

</script>



{/literal}
{*<script type="text/javascript" src="/sources{$th_folder}/main_page/jquery.min.js"></script>
<script type="text/javascript" src="/sources{$th_folder}/main_page/jquery.cssfix.js"></script>
<script type="text/javascript" src="/sources{$th_folder}/main_page/jquery.hoverIntent.minified.js"></script>
<script type="text/javascript" src="/sources{$th_folder}/main_page/menu_ext.js"></script>
<link rel="stylesheet" href="/sources{$th_folder}/main_page/style.css" type="text/css" media="all"  />
<link rel="stylesheet" href="/sources{$th_folder}/main_page/menu_div.css" type="text/css" media="all"  />   *}

<script type="text/javascript" src="/sources/default/main_page/jquery.min.js"></script>
<script type="text/javascript" src="/sources/default/main_page/jquery.cssfix.js"></script>
 
<link rel="stylesheet" href="/sources/default/main_page/style.css" type="text/css" media="all"  />
<link rel="stylesheet" href="/sources/default/main_page/menu_div.css" type="text/css" media="all"  />


<!--[if lte IE 7]>
<link rel="stylesheet" href="/sources/default/main_page/style_ie.css" type="text/css" media="all"  />
<link rel="stylesheet" href="/sources/default/main_page/menu_div_ie.css" type="text/css" media="all"  />

<![endif]-->

</head>
<body>
<div id="wrapper">
<div id="bw_prompt"> <strong>На жаль у Вас застаріла версія браузера.</strong> <br /><br /> <b>Для перегляду тестової версії нового порталу рекомендується використовувати:</b>  <br />
  
  <img src="/img/firefox32.png" width="24" height="24" align="absmiddle" />Mozilla Firefox версії 6 і вище;<br />
  <img src="/img/chrom32.png" width="24" height="24" align="absmiddle" />Google Chrome версії 12 і вище; <br />
  <img src="/img/opera32.png" width="24" height="24" align="absmiddle" />Opera версії 10 і вище; <br />
  <img src="/img/ie32.png" width="24" height="24" align="absmiddle" />Microsoft IE версії 7 і вище. 
  <br />
  <br />
  <br />
  <a href="http://portal.rada.gov.ua/rada/control/uk/index"><span style="font-size: 16pt;">Перехід на діючий сайт <img src="/img/old_rada.jpg" alt="" /></span></a> 
  
  </div>
  <div id="header">
    <div id="head" >
      <div class="content-left0"> <a href="/" id="logo"></a></div>
      </div>
        <div class="temp"> 
         <a href="http://portal.rada.gov.ua/rada/control/uk/index"><span>Перехід на діючий сайт</span></a> 
       </div>
      <div class="content-right0">
        <div class="lang"> {foreach item=data from=$lang_selector}
          {if $data.active==1} <a href="{$data.anchor}" class="lang_active"><span>{$data.name}</span></a> {else} <a href="#{*$data.anchor*}" class="lang_deactive"><span>{$data.name}</span></a> {/if}
          {/foreach} 
        
        <div id="searchbox">
          <form method="get" action="/search">
            <fieldset>
            <input type="text" name="search" maxlength="40" id="qs" />
            <input type="submit" name="submit"  value="Знайти" id="go" />
            </fieldset>
          </form>
          <a href="/search/" class="myrit"><span>розширений пошук</span></a> </div>
        <div id="calend" class="clr qmrcorner"><a href="#" class="search_button" style="margin-top:-3px; width: 60px; "><span style="height: 40px;">>> архів</span></a> <span style="margin-right: 10px; background-color: rgb(228, 236, 238); padding: 1px 4px; font-size: 12px;"> 
        {literal}
          <script type="text/javascript">
<!--      
    var now = new Date();

    var months = new Array(
        "січня",
        "лютого",
        "березня",
        "квітня",
        "травня",
        "червня",
        "липня",
        "серпня",
        "вересня",
        "жовтня",
        "листопада",
        "грудня");
    var days = new Array(
        "неділя",
        "понеділок",
        "вівторок",
        "середа",
        "четвер",
        "п'ятниця",
        "субота");
    var date = ((now.getDate()<10) ? "0" : "")+ now.getDate();
    function fourdigits(number)    {
      return (number < 1000) ? number + 1900 : number;}
    today = "Сьогодні " + date + " " + months[now.getMonth()] + " " +
       " " + (fourdigits(now.getYear())) +
       ", " + days[now.getDay()];
     document.write(today);
-->
</script>
          {/literal}
          </span>
          </div>
      </div>
    </div>
 {*   <div id="header-menu">

      <ul id="qm0" class="qmmc">
        {$tree}
      </ul>
      </div>
*}

{*========= Нове меню ===========*}

        <div class="subh">
                {include file= "main_page/menu_ext.inc"}       
            <div class="subh2">

            </div>
        </div>
 {*========= End Нове меню ===========*}
    </div>
  {*</div>*}
  {if $current_node->t_name}
    <div class="breadcrump">
        <div class="breadcrump2">
            <a href="/">Головна</a> >
            {foreach item=data from=$path_way}
                <a href="/{$data->t_parents}/">{$data->t_name}</a> > 
            {/foreach}
            {$current_node->t_name}
        </div>
    </div>
  {/if}
  <!-- #header-->
  <div id="middle">

  {if $front}
    {include file="main_page/left.tpl"}
  {/if}
  {include file="$template"}
  {if $front}</div>{/if}
  <div id="calendar_div"></div>
</div>
</div>
<div id="footer">
  <div class="foot">
    <div class="foot-left"><a href="{$lang_prefix}/map/" class="sitemap-link">Карта сайту</a> <a href="{$lang_prefix}/feedback/" class="contact-link">Контакти</a> <a href="#" class="adr-link">Адреса</a></div>
    <div class="foot-right">&copy; Верховна Рада України 1994-2011<br />
      програмно-технічна підтримка &mdash; Управління комп'ютеризованих систем <br />
      інформаційна підтримка &mdash; Інформаційне управління, Прес-служба Верховної Ради України
      
     </div>
  </div>
</div>
<script type="text/javascript">qm_create(0, false, 0, 1500, 'lev2', false, false, false, true);</script>
{literal}
<script type="text/javascript">


    function myDiv (){
        
       // document.getElementById('temp').style.display='none';
      //  document.getElementById('subh').style.display='none';
        
        document.getElementById('bw_prompt').style.display='block';
}

//var browser_name = navigator.appName;

var browser_version = navigator.appVersion;
//alert(browser_version);
var reg = /MSIE[\s]([\d])/i;
var matches = browser_version.match(reg);
if (browser_version.indexOf('MSIE') > 0 && matches[1] < '7') myDiv();
 
    
   // setTimeout('myDiv()', 8000);

</script>
{/literal}
</body>
</html>
