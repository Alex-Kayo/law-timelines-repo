<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=9">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>{$site_title}</title>
{*        <meta name="description" content="">*}
{*        <meta property="og:image" content="/img/print-logo.png" />*} 
{*        <meta property="og:image:width" content="600" />*}
{*        <meta property="og:image:height" content="315" />*}
         <meta property="og:title" content="{$item->i_name}" />
<meta property="og:image" content="
      {if strlen($item->i_logoname) > 0}
          {$site_domain}uploads/logos_middle/{$item->i_logoname}.jpeg
          {else} {$site_domain}/img/rada-logo.png 
      {/if}"/>
      <meta property="og:description" content= "{$item->i_name}" />
      <meta name="twitter:title" content="{$site_title}"/>
      <meta name="twitter:description" content="{$item->i_name}"/>
      <meta name="twitter:image" content=" 
      {if strlen($item->i_logoname) > 0}
          {$site_domain}uploads/logos_middle/{$item->i_logoname}.jpeg
      {else} mportal.rada.gov.ua/img/rada-logo.png
      {/if}" />
        <link rel="stylesheet" type="text/css" href="/sources/css/bootstrap.min.css">       
        <link rel="stylesheet" type="text/css" href="/sources/fonts/ProbaPro/stylesheet.css" />
        <link rel="stylesheet" type="text/css" href="/sources/css/slick/slick.css"/>
        <link rel="stylesheet" type="text/css" href="/sources/css/slick/slick-theme.css"/>
        <link rel="stylesheet" type="text/css" href="/sources/css/nice-select.css" />
        <link rel="stylesheet" type="text/css" href="/sources/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="/sources/css/bootstrap-datepicker.min.css" />
        <link rel="stylesheet" type="text/css" href="/sources/css/bootstrap-select.min.css">
        <link rel="stylesheet" type="text/css" href="/sources/css/jquery.scrollbar.css" />
        <link rel="stylesheet" type="text/css" href="/sources/css/ui-lightness/jquery-ui-1.8.18.custom.css"  />
        <link rel="stylesheet" type="text/css" href="/sources/css/atomic-bulldog-grid.min.css" media="screen and (min-width: 768px)">
        <link rel="stylesheet" type="text/css" href="/sources/css/atomic-bulldog-grid-fallback.min.css" media="screen and (min-width: 768px)">
        <link rel="stylesheet" type="text/css" href="/sources/css/atomic-bulldog-grid-fallback-ie.min.css" media="screen and (min-width: 768px)">
        <link rel="stylesheet" type="text/css" href="/sources/css/style.css" />
        <link rel="stylesheet" type="text/css" href="/sources/css/owl.carousel.css">

{*new logo RADA css*}
        <link rel="stylesheet" type="text/css" href="/sources/css/logo_rada.css" />
    
{*        <link rel="stylesheet" href="/sources/css/add-calendar-main.css">*}
        <script type="text/javascript" src="/sources/js/jquery-3.2.1.min.js"></script>
        
{*        <link rel="stylesheet" type="text/css" href="/sources/css/style_min.css" />*}
        
        {*<script type="text/javascript" src="/sources/js/clappr.min.js"></script>*}
        
        
        <!-- Add to calendar -->
        
        <script src="/sources/js/ouical_en.js"></script>
        
        
        
      {*   <!-- Global site tag (gtag.js) - Google Analytics --> *}
          {literal}
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-152850320-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-152850320-1');
</script>
          {/literal}
        
        
{*Hotjar Tracking Code for http://mportal.rada.gov.ua/ *}
	{literal}
<script>
    (function(h,o,t,j,a,r){
        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        h._hjSettings={hjid:1583704,hjsv:6};
        a=o.getElementsByTagName('head')[0];
        r=o.createElement('script');r.async=1;
        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        a.appendChild(r);
    })(window,document,'https://static.hotjar.com/c/hotjar-','.js?sv=');
</script>
	{/literal}

    
        <!--[if IE 9]>
        <link href="/sources/css/bootstrap-ie9.min.css" rel="stylesheet">
        <![endif]-->
        <!--[if lte IE 8]>
        <link href="/sources/css/bootstrap-ie8.min" rel="stylesheet">
        <script src="/sources/js/html5shiv@3.7"></script>
        <![endif]-->

    </head>
    <body>
        <div id="page">
            {*<!-- header -->*}
            <div id="header">
            {include file= "main_page/header.tpl"}
            </div>
            {*<!-- end header -->*}       

{* ============================ MAIN CONTENT ==================== *}

<div class="main">
{include file="$template"}
</div>
{* ==========================ENd MAIN CONTENT ====================*}


            <!-- footer -->

            {include file= "main_page/footer.tpl"} 
            
{*         <!-- end footer -->*}

        </div>

{*==============Button for ScrollUp and that icon from Fontawesome======*}
<div class="scrollup">  
  <i class="fa fa-chevron-up"></i>
</div>
{*===============END Button===========================================*}

{*        <script type="text/javascript" src="/sources/js/jquery-3.2.1.min.js"></script>*}
        <script type="text/javascript" src="/sources/js/popper.min.js"> </script>
        <script type="text/javascript" src="/sources/js/bootstrap.min.js"> </script>
        <script type="text/javascript" src="/sources/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="/sources/js/bootstrap-datepicker.min.js" charset="UTF-8"></script>
        <script type="text/javascript" src="/sources/js/locales/bootstrap-datepicker.uk.min.js" charset="UTF-8"></script>
        <script type="text/javascript" src="/sources/js/tinynav.min.js"></script>
        <script type="text/javascript" src="/sources/js/jquery.circliful.min.js"></script>
        <script type="text/javascript" src="/sources/js/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="/sources/js/slick/slick.min.js"></script>
        <script type="text/javascript" src="/sources/js/jquery.nice-select.min.js"></script>
        <script type="text/javascript" src="/sources/js/recaptcha/api.js"></script>
        <script type="text/javascript" src="/sources/js/jquery.scrollbar.min.js"></script>
        <script type="text/javascript" src="/sources/js/owl.carousel.min.js"></script>
        <script type="text/javascript" src="/sources/js/clappr.min.js"></script>
{*        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/clappr@latest/dist/clappr.min.js"></script>*}
        <script type="text/javascript" src="/sources/js/maskinput.js"></script>
        <script type="text/javascript" src="/sources/js/atc.min.js" async defer></script> 
{*        <script type="text/javascript" src="https://addevent.com/libs/atc/1.6.1/atc.min.js" async defer></script> *}
        <script src="/sources/js/vru-script.js"></script>
    </body>
</html>
