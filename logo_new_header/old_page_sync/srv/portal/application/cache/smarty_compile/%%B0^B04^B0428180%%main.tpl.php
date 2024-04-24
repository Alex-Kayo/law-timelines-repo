<?php /* Smarty version 2.6.22, created on 2024-04-11 10:41:29
         compiled from main_page/main.tpl */ ?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=9">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><?php echo $this->_tpl_vars['site_title']; ?>
</title>
 
         <meta property="og:title" content="<?php echo $this->_tpl_vars['item']->i_name; ?>
" />
<meta property="og:image" content="
      <?php if (strlen ( $this->_tpl_vars['item']->i_logoname ) > 0): ?>
          <?php echo $this->_tpl_vars['site_domain']; ?>
uploads/logos_middle/<?php echo $this->_tpl_vars['item']->i_logoname; ?>
.jpeg
          <?php else: ?> <?php echo $this->_tpl_vars['site_domain']; ?>
/img/rada-logo.png 
      <?php endif; ?>"/>
      <meta property="og:description" content= "<?php echo $this->_tpl_vars['item']->i_name; ?>
" />
      <meta name="twitter:title" content="<?php echo $this->_tpl_vars['site_title']; ?>
"/>
      <meta name="twitter:description" content="<?php echo $this->_tpl_vars['item']->i_name; ?>
"/>
      <meta name="twitter:image" content=" 
      <?php if (strlen ( $this->_tpl_vars['item']->i_logoname ) > 0): ?>
          <?php echo $this->_tpl_vars['site_domain']; ?>
uploads/logos_middle/<?php echo $this->_tpl_vars['item']->i_logoname; ?>
.jpeg
      <?php else: ?> mportal.rada.gov.ua/img/rada-logo.png
      <?php endif; ?>" />
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

        <link rel="stylesheet" type="text/css" href="/sources/css/logo_rada.css" />
    
        <script type="text/javascript" src="/sources/js/jquery-3.2.1.min.js"></script>
        
        
                
        
        <!-- Add to calendar -->
        
        <script src="/sources/js/ouical_en.js"></script>
        
        
        
                <?php echo '
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-152850320-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag(\'js\', new Date());

  gtag(\'config\', \'UA-152850320-1\');
</script>
          '; ?>

        
        
	<?php echo '
<script>
    (function(h,o,t,j,a,r){
        h.hj=h.hj||function(){(h.hj.q=h.hj.q||[]).push(arguments)};
        h._hjSettings={hjid:1583704,hjsv:6};
        a=o.getElementsByTagName(\'head\')[0];
        r=o.createElement(\'script\');r.async=1;
        r.src=t+h._hjSettings.hjid+j+h._hjSettings.hjsv;
        a.appendChild(r);
    })(window,document,\'https://static.hotjar.com/c/hotjar-\',\'.js?sv=\');
</script>
	'; ?>


    
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
                        <div id="header">
            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "main_page/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
            </div>
                   


<div class="main">
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['template']), 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</div>


            <!-- footer -->

            <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "main_page/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?> 
            

        </div>

<div class="scrollup">  
  <i class="fa fa-chevron-up"></i>
</div>

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
        <script type="text/javascript" src="/sources/js/maskinput.js"></script>
        <script type="text/javascript" src="/sources/js/atc.min.js" async defer></script> 
        <script src="/sources/js/vru-script.js"></script>
    </body>
</html>