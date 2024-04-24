<div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item active"><a href="/appointments">Призначення на посади</a></li>
             <li class="breadcrumb-item active"> Призначені особи</li>
{*            <li class="breadcrumb-item active"><a href="/tsk">Тимчасові комісії Верховної Ради України</a></li>    *}
        </ol>

        <div class="page-heading">           
 
   Призначені особи

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
                         
                        <li><a href="#menu1" class="scrollLink">Актуальна інформація про призначених осіб</a></li>
                        <li><a href="#menu2" class="scrollLink"> Оголошення комітетів про призначення на посади</a></li>
                        <li><a href="/appointments/arhive_appntm"  >Інформація про раніше призначених осіб (архів)</a><span class="icn-external" style="opacity: 1;"></span></li>
{*                        <li><a href="#menu3" class="scrollLink">Інформація про раніше призначених осіб (архів)</a></li>*}
{*                        <li><a href="#menu5" class="scrollLink">Кандидати, оголошення</a></li>*}
                    </ul>
                </div>
                        <div class="excursion_b size-m">
                            <div class="excursion-heading">Законодавчі акти, що стосуються призначень на посади</div>
                            {*                <p class="mob-hide">Для організованих груп представників підприємств, установ, організацій, навчальних закладів та громадських об'єднань країни</p>*}

                            <a href="https://zakon.rada.gov.ua/go" class="details-link">Детальніше</a>
                        </div>

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
                    Актуальна інформація про призначених осіб
                    <i class="link-ico"></i>
                </h2>
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
                    {if !$actual_app_position[0]->i_id}
                        <div class="bill-item" style="background: #e5ecf9;">
                            <span class="btn-border"style="border: 2px solid #e5ecf9; color: #004bc1;"><b> Інформація оновлюється</b>   </span>
                            <p>  </p></div>
                    {/if} 
                    {*{foreach item=data from=$block_data.6.items}*}
{*                    {foreach item=data from=$notice9skl}*}
                    {foreach item=data from=$actual_app_position}
                        <div class="  col-lg-4  col-md-6   ">
                             
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p style="font-size: 1.1em;">
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                   
                             
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
 
 

                {*<ul class="link-list">
                    <li><a href="http://w1.c1.rada.gov.ua/pls/mpz2/organizations.mpo_info?o_id=73">Кабінет Міністрів України
(посилання на Постанови Верховної Ради України)</a></li>
                    <li><a href="#">Голова Рахункової палати та інші члени Рахункової палати </a></li>
                    <li><a href="#">Уповноважений Верховної Ради України з прав людини </a></li>
                     
                </ul>*}

                 
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
                <div class="tr-block">
                    <div class="td-block1 "><a id="menu2" href="https://www.rada.gov.ua/">  </a>
                       <h2>Оголошення комітету, до предмета відання якого належить питання призначення</h2>
{*                       <div class="more-link full-bg">*}
                            
                        {*</div>*}
                    </div>
                    <div class="td-block">
                        <div class="more-link full-bg">
                            <a id="menu" href="/documents/app_position/adv_main_committee"> Усі оголошення {*про призначення*}</a>
                        </div>
                    </div>
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
                    {if !$adv_main_committee[0]->i_id}
                        <div class="bill-item" style="background: #e5ecf9;">
                            <span class="btn-border"style="border: 2px solid #e5ecf9; color: #004bc1;"><b> Інформація оновлюється</b>   </span>
                            <p>  </p></div>
                    {/if} 
                    {*{foreach item=data from=$block_data.6.items}*}
                    {foreach item=data from=$adv_main_committee}
                        <div class="  col-lg-4  col-md-6   ">
                             
                            <div class="news-item">
                                 <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year};{$data->hour}</span>
                                 <p style="font-size: 1.1em;">
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                 {$data->i_name}
                            </a>
                                 </p>
                                 </div>
                   
                             
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
                     <div class="more-link text-right   "><a href="{$lang_prefix}/{$data->i_categories}">Всі оголошення розділу</a> </div>
{*                     <div class="more-link text-right   "><a href="/{$block_data.6.topic->i_categories}">Всі новини розділу</a> </div>*}
<h2 class="hub-page__heading">
                    <a id="menu3"></a>
                   Інформація про раніше призначених осіб (архів)
                    <span class="icn-external" style="opacity: 1;"></span>
                </h2>
<div class="td-block">
                        <div class="more-link full-bg">
                            <a id="menu" href="/appointments/arhive_appntm">Дані про осіб призначених <br>Верховною Радою України (архів)</a>
                        </div>
                    </div>
                <ul class="link-list">
{*                    <li><b>Дані про осіб призначених Верховною Радою України</b></li>*}
                     
                    
                     
{*                    <li><a href="#">Детальніше </a></li>*}
                     
                </ul>

                     

                     
                
               
            
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