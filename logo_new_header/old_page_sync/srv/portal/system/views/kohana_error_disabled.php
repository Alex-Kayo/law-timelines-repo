<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $message['title'] ?></title>
<meta name="description" content="<?php echo $message['title'] ?>">
<meta name="keywords" content="<?php echo $message['title'] ?>">

<link rel="shortcut icon" href="favicon.ico" />

<link rel="stylesheet" href="/sources/css/bootstrap.min.css">
<script type="text/javascript" src="/sources/js/jquery-3.2.1.min.js"></script>
<script src="/sources/js/bootstrap.min.js"> </script>
<link rel="stylesheet" href="/sources/css/style.css" type="text/css" media="all"  />


<!--[if lte IE 7]>
<link rel="stylesheet" href="/sources/default/main_page/style_ie.css" type="text/css" media="all"  />
<link rel="stylesheet" href="/sources/default/main_page/menu_div_ie.css" type="text/css" media="all"  />

<![endif]-->

</head>
<body class="undefined-page">
    <div id="page">
        <div id="header">


            <div class="header_body">
                <div class="logo-main">
                    <a href="/">
                        <span class="rada-logo">  </span>
                    </a>

                    <h1><a href="/">Верховна Рада України</a></h1>
                    <p>Офіційний вебпортал парламенту України</p>

                </div>
            </div>
        </div>
    

        <div class="undefined-text">
            <hr />
            
            <div class="container">
                <div class="undefined-title">
                    <?php echo $message['header1'] ?>
                </div>
                <div class="http-error"><?php echo $message['msg1'] ?></div>
            </div>
            
            <hr />
            
            <div class="container">
                <p><?php echo $message['msg2'] ?></p>
                <!--<p><b><?php echo $message['msg3'] ?> :</b></p>
                <ul>
                    <li><?php echo $message['list'][0] ?></li>
                    <li><?php echo $message['list'][1] ?></li>
                    <li><?php echo $message['list'][2] ?></li>
                </ul>-->
                
           


               
                
                <p>
                    <?php echo $message['link'] ?>
                </p>
            </div>

            
        </div><!--/undefined-text-->
    </div><!--/#page-->

<script type="text/javascript">

	$(function(){
		$('#topnav > li').click(function(){
			$('#topnav > li').removeClass('active');
			$(this).addClass('active');
			return false;
		});

		$('#topnav .sub').hover(
		  	  function () {},
			  function () {
				  $('#topnav > li').removeClass('active');
			  }
			);
	});

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

</body>
</html>
