<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>{$site_title} - {$service_title}</title>
        <meta name="description" content="{$meta.description}">
            <meta name="keywords" content="{$meta.keywords}">
                <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/jquery.min.js"></script> 
                <script type="text/javascript" src="{$site_domain}sources{$th_folder}/main_page/jquery.cssfix.js"></script>
                <link rel="stylesheet" href="{$site_domain}sources{$th_folder}/main_page/style.css" type="text/css" media="all"  />
                <link rel="stylesheet" href="{$site_domain}sources/{$th_folder}/main_page/menu_div.css" type="text/css" media="all" />


                </head><body>
                    <div id="wrapper">
                        <div id="header">
                            <div id="head" >
                                <div class="content-left0"> <a href="{$site_domain}" id="logo"></a></div>
                                <div class="content-right0">

                                    <div id="calend" class="clr qmrcorner"> <span style="margin-right:10px; background-color: #E4ECEE; padding-right: 2px;"> 
                                            {*<!--{literal}
                                                <script type="text/javascript">
                                                          
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
                                                    var date = ((now.getDate() < 10) ? "0" : "") + now.getDate();
                                                    function fourdigits(number) {
                                                        return (number < 1000) ? number + 1900 : number;
                                                    }
                                                    today = "Сьогодні " + date + " " + months[now.getMonth()] + " " +
                                                            " " + (fourdigits(now.getYear())) +
                                                            ", " + days[now.getDay()];
                                                    document.write(today);
                                                    
                                                </script>
                                            {/literal}*}
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
                                {include file="page_hf/menu_ext_zak$menu_active.inc"}       
                                <div class="subh2">

                                </div>
                            </div>
                            {*========= End Нове меню ===========*}
                        </div>

                        <!-- #header-->
                </body>
                </html>

