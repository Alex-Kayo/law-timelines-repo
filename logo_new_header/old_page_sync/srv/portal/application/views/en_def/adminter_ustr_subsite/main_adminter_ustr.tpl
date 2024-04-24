<div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active">The public</li>
        </ol>

        <div class="page-heading">
          Administrative and territorial division
        </div>
</div>

<hr class="full-width">

<div class="container">  
    <div class="row">
            <div class="col-md-3">
                <div class="contents-pages">
                    <h4 class="section-heading">Page content</h4>

                    <ul>
                        <li><a href="#menu1" class="scrollLink">Statistics</a></li>
                        <li><a href="#menu2" class="scrollLink">Search for details</a></li>
                        <li><a href="#menu3" class="scrollLink">Directories</a></li>
                        <li><a href="#menu4" class="scrollLink">Legal acts on the issues of the administrative and territorial structure of Ukraine</a></li>
                        <li><a href="#menu5" class="scrollLink">Local elections</a></li>
                    </ul>
                </div>
                
                {*
                <h4 class="section-heading">Європейська інтеграція</h4>
                <ul class="section__list">
                    <li><a href="https://zakon4.rada.gov.ua/rada/show/984_a11">Угода про асоціацію між Україною та Європейським Союзом</a></li>
                    <li><a href="/documents/interparlam/110358.html">Стан ратифікації Угоди про асоціацію між Україною та Європейським Союзом</a></li>
                </ul>

                <div class="parline-block">
                    <img src="img/parline.jpg" alt="">
                    <p>
                        <a href="http://archive.ipu.org/parline-e/parlinesearch.asp" target="_blank">
                            <b>Національні парламенти</b> <i class="icn-external"></i>
                        </a>
                    </p>
                    <a href="http://archive.ipu.org/parline-e/parlinesearch.asp" target="_blank">База даних «РARLINE»</a>
                </div>
                *}
                
            </div>
            <div class="col-md-9">
                <h2 class="hub-page__heading">
                    <a id="menu1"></a>
                    Statistics
                    <i class="link-ico"></i>
                </h2>

                <ul class="link-list">
                    <li><a href="http://w1.c1.rada.gov.ua/pls/z7503/povidom">View statistics</a></li>
                </ul>

                <h2 class="hub-page__heading">
                    <a id="menu2"></a>
                    Search for details
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="http://w1.c1.rada.gov.ua/pls/z7503/zv.cf1">Search</a></li>
                </ul>

                <h2 class="hub-page__heading">
                    <a id="menu3"></a>
                    Directories
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="http://static.rada.gov.ua/zakon/new/NEWSAIT/ADM/zmist.html">Administrative and territorial division</a></li>
                    <li><a href="https://static.rada.gov.ua/site/ukr/atuu/dovidnyk/tel_dovidnyk_rad.pdf">Directory of Phones and Postal Addresses of Local Councils of United Territorial Communities</a></li>
                    <li><a href="https://static.rada.gov.ua/zakon/new/NEWSAIT/ADM/dov/zmist.html">Directory of telephones and postal addresses of the Verkhovna Rada of the Autonomous Republic of Crimea and local councils</a></li>
                </ul>

                <h2 class="hub-page__heading">
                    <a id="menu4"></a>
                    Legal acts on the issues of the administrative and territorial structure of Ukraine
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="http://w1.c1.rada.gov.ua/pls/z7503/A035">Search by region</a></li>
                    <li><a href="http://w1.c1.rada.gov.ua/pls/z7503/a034">Search by years</a></li>
                </ul>
                
                <h2 class="hub-page__heading">
                    <a id="menu5"></a>
                    Local elections
                    <i class="link-ico"></i>
                </h2>
                <ul class="link-list">
                    <li><a href="https://iportal.rada.gov.ua/fsview/46076.html">Local elections 2015</a></li>
                    <li><a href="https://iportal.rada.gov.ua/fsview/46086.html">Extraordinary local elections</a></li>
                </ul>

            </div>
        </div><!--/row-->
        
    </div><!--/container-->
    
{literal}
<script>
    $(document).ready(function(){
        $( "a.scrollLink" ).click(function( event ) {
            event.preventDefault();
            $("html, body").animate({ scrollTop: $($(this).attr("href")).offset().top - 100 }, 500);
        });
    });   
</script>
{/literal}