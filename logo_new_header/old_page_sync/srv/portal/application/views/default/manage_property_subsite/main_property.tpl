{include file= "gospfin_subsite/gospfin_menu.tpl"}

<div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item active"> Діяльність</li>
             <li class="breadcrumb-item active"><a href="/gospfin">Фінансово-господарська діяльність</a></li>
            <li class="breadcrumb-item active"> Управління державним майном</li>
{*            <li class="breadcrumb-item active"><a href="/manage_property">Управління державним майном  </a></li>*}
        </ol>

        <div class="page-heading">           
 
Управління державним майном (веб-сторінка)

        </div>
</div>

<hr class="full-width">

<div class="container">  
    <div class="row">
            <div class="col-md-auto col-lg-3 ">
                <div class="contents-pages">
                    <h4 class="section-heading">Зміст сторінки</h4>

                     <!-- Excursion M -->
                      
{*            <div class="parline-block">*}
            {*<div class="excursion_b size-m">
                <div class="excursion-heading">Законодавчі акти, що стосуються призначень на посади</div>
 

                <a href="#" class="details-link">Детальніше</a>
            </div>*}
{*            </div>*}
            <!-- /Excursion M -->
                    <ul>
                        <li><a href="#menu1" class="scrollLink">  Майно, що забезпечує діяльність Верховної Ради України</a></li>
                        <li><a href="#menu2" class="scrollLink">  Майно, що не використовується</a></li>
                        <li><a href="#menu3" class="scrollLink">Користування та розпорядження майном</a></li>
                        <li><a href="#menu4" class="scrollLink">Інше</a></li>
{*                        <li><a href="#menu5" class="scrollLink">Кандидати, оголошення</a></li>*}
                    </ul>
                </div>
                        {*<div class="excursion_b size-m">
                            <div class="excursion-heading">Законодавчі акти, що стосуються призначень на посади</div>
                            

                            <a href="#" class="details-link">Детальніше</a>
                        </div>*}
                         
                         <div class="excursion_b size-m" style="background: url('/img/logo_prozorrosale.svg') center center no-repeat;  background-size: contain; max-width: 90%;">                             

                            <div class="excursion-heading"> </div>
                            
                             <a href="https://prozorro.gov.ua/search/tender?buyer=20064120" class="link" title=" Перейти за посиланням на офіційний веб-сайт Prozorro.sale" target="_blank" rel="noopener noreferrer" style="position: relative;{*margin-top: 5.5em;*}color: #0f0d2d;top: 3.0em;left:5.3em;font-weight: bold;"> Детальніше  <i class="icn-external"></i> </a>
                        </div> 
                        {*<br><hr>*}
                        <div class="contents-pages" style="margin-top: 3em;"></div>

                {*<h4 class="section-heading">Європейська інтеграція</h4>
                <ul class="section__list">
                    <li><a href="https://zakon4.rada.gov.ua/rada/show/984_a11">Угода про асоціацію між Україною та Європейським Союзом</a></li>*}
                    {*<li><a href="/documents/interparlam/110358.html">Стан ратифікації Угоди про асоціацію між Україною та Європейським Союзом</a></li>*}
                {*</ul>*}
                <!-- Excursion M -->
             
            <!-- /Excursion M -->

                {*<div class="parline-block">
                    <img src="img/parline.jpg" alt="">
                    <p>
                        <a href="https://www.ipu.org/national-parliaments" target="_blank">
                            <b>Національні парламенти</b> <i class="icn-external"></i>
                        </a>
                    </p>
                    <a href="https://data.ipu.org/" target="_blank">База даних «РARLINE»</a>*}
{*                    <a href="http://archive.ipu.org/parline-e/parlinesearch.asp" target="_blank">База даних «РARLINE»</a>*}
{*                </div>*}
            </div>
            <div class="col-md-9">
                <h2 class="hub-page__heading">
                    <a id="menu1"></a>
                    Майно, що забезпечує діяльність Верховної Ради України{*<br>Верховна Рада України*}
                    <i class="link-ico"></i>
                </h2>
                     
                <ul class="link-list">
                    
                    <div class="news-group__list  {*column-2-list*} {*column-list*} ">  
                
                {*----------Динаміка - вивід новин депутатських груп з міжпарламентських зв’язків із зарубіжними країнами---------*}               
                                 <div class="row">
                    {*{foreach item=data from=$block_data.6.items}*}
                    {foreach item=data from=$property_parlam}
                        <div class="  col-lg-4  col-md-6   ">
                             
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <div class="hub-request__heading ">
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </div>
                                </div>
                            {if $data->cntat}
                                <a href="#" class="paperclip-link">
                                    <i class="fas fa-paperclip"></i>
                                    {$data->cntat} вкладені файли
                                </a>
                            {/if} 
                    
                             
                          
                        </div>
                    {/foreach}


                </div>
                     <div class="more-link text-right   "><a href="{$lang_prefix}/{$data->i_categories}">Вся інформація розділу</a> </div>
            </div>
                    
                    
                    
                    
                    {*<div class="td-block">
                        <div class="more-link full-bg">
                            <a id="menu" href="/appointments/actual_appntm"> Перелік майна  </a>
                        </div><br>
                    </div>*}
                    {*<li><a href="http://w1.c1.rada.gov.ua/pls/mpz2/organizations.mpo_info?o_id=73">Кабінет Міністрів України
(посилання на Постанови Верховної Ради України)</a></li>
                    <li><a href="#">Голова Рахункової палати та інші члени Рахункової палати </a></li>
                    <li><a href="#">Уповноважений Верховної Ради України з прав людини </a></li>*}
                     
                     
                </ul>
                    
                  <div class="row">  
                    
                    <div class="table-block  ">
                <h2 class="hub-page__heading">
                    <a id="menu2"></a>                    
               Майно, що не використовується   
                    <i class="link-ico"></i>
                </h2>

                <ul class="link-list">
                    <div class="tr-block">
                     <div class="td-block">
                        <div class="more-link full-bg">
                            <a {*id="menu2"*}  href="/documents/manage_property_seo/unused_property"> Відомості про майно  </a>
                        </div>
                    </div>
                     </div>
                </ul></div>
                </div>

                 
            {*</div>
            <div class="col-md-9">*}
               
        
            {*<div class="table-block">
                <div class="tr-block">
                    <div class="td-block">
                        <h2>Новини депутатських груп з міжпарламентських зв’язків із зарубіжними країнами</h2>
                    </div>
                    <div class="td-block">
                        <div class="more-link full-bg">
                            <a id="menu5" href="http://w1.c1.rada.gov.ua/pls/mpz2/organizations.dep_groups">Список усіх депутатських груп</a>
                        </div>
                    </div>
                </div>
                
                
            </div>*}
            <section class="news-group">
        {*<div class="container">*}
            <div class="table-block  ">
                 <a id="menu3"></a>
                <div class="tr-block">
                    <div class="td-block1 "><a  id="menu3"  href="https://www.rada.gov.ua/">  </a>
                       <h2> Користування та розпорядження майном</h2>
{*                       <div class="more-link full-bg">*}
                            
                        {*</div>*}
                    </div>
                    {*<div class="td-block">
                        <div class="more-link full-bg">
                            <a id="menu" href="http://w1.c1.rada.gov.ua/pls/mpz2/organizations.dep_groups"> Усі оголошення про призначення</a>
                        </div>
                    </div>*}
                    {*<div class="td-block1">
                        
                    </div>*}
                </div>
                
                
            </div>
{*            <div id="newsc">*}
           <div class="news-group__list  {*column-2-list*} {*column-list*} ">  
                
                {*----------Динаміка - вивід новин депутатських груп з міжпарламентських зв’язків із зарубіжними країнами---------*}               
                {*{foreach item=data from=$block_data.6.items}
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                    {/foreach}*}
{*                    <div id="newsc">*}
{*                <h4>Новини комітетів</h4>*}
                <br>
                <div class="row">
                    {*{foreach item=data from=$block_data.6.items}*}
                    {foreach item=data from=$use_property}
                        <div class="  col-lg-4  col-md-6   ">
                             
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                </div>
                            {if $data->cntat}
                                <a href="#" class="paperclip-link">
                                    <i class="fas fa-paperclip"></i>
                                    {$data->cntat} вкладені файли
                                </a>
                            {/if} 
                    
                             
                           {* <div class="multimedia-item">
                                {if strlen($data->i_logoname) > 0}
                                    <div class="multimedia-item__img">
                                        <img src="/uploads/logos_small/{$data->i_logoname}.jpeg" class="borderimg" alt="" />
                                        <span class="time">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>
                                    </div>
                                {/if}
                                <div class="multimedia-item__heading">
                                    {if $data->is_video}
                                      <span class="btn-video">Відео</span>
                                      {/if}
                                    <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name} </a> </h4>
                                    
                                    {if strlen($data->i_logoname) == 0} <span class="time grey">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>
                                        {/if}
                                    <text>{$data->i_anons} </text><br />


                                     
                                </div>
                                          
                            </div>*}
                        </div>
                    {/foreach}


                </div>
            </div>
                     <div class="more-link text-right   "><a href="{$lang_prefix}/{$data->i_categories}">Вся інформація розділу</a> </div>
{*                     <div class="more-link text-right   "><a href="/{$block_data.6.topic->i_categories}">Всі новини розділу</a> </div>*}

{*<div class="row">*}
<h2 class="hub-page__heading">
                    <a id="menu4"></a>
                 Інше
                    <i class="link-ico"></i>
                </h2>
<div class="td-block"> 
                        <div class="more-link full-bg">
                            <a  id="menu4"  href="/documents/manage_property_seo/other_pr">Дані  (архів)</a>
                        </div>
                    </div>
                <ul class="link-list">
{*                    <li><b>Дані про осіб призначених Верховною Радою України</b></li>*}
                     
                    
                     
{*                    <li><a href="#">Детальніше </a></li>*}
                     
                </ul>

{*            </div>         *}

                     
                
               
            
        {*</div>*}<!--/container-->
         
    </section>
       
         
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