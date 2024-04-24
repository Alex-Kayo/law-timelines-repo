{*  Хедер та меню новинного сайту      *}
{include file= "gospfin_subsite/gospfin_menu.tpl"}
{*/  Хедер та меню новинного сайту      *}
<div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item active"> Діяльність</li>
            <li class="breadcrumb-item active"><a href="/gospfin">Фінансово-господарська діяльність</a></li>
            <li class="breadcrumb-item active"> Публічні закупівлі</li>
            
        </ol>

        <div class="page-heading">        
        Публічні закупівлі 
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
                        <li><a href="#menu1" class="scrollLink">  Обґрунтування закупівель</a></li>
                        <li><a href="#menu2" class="scrollLink">  Архів</a></li>
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
                        <div class="contents-pages" style="margin-top: 3em;"></div>

                 
            </div>
            <div class="col-md-9">
               <a id="menu1" style="padding-top: 12rem;margin-top: -10rem;"></a>
                         {*<a id="menu1"></a> *}
                <div class="table-block  ">
               
                    
                <h2 class="hub-page__heading">
                    Обґрунтування закупівель{*<br>Верховна Рада України*}
                    <i class="link-ico"></i>
                </h2>
                </div>      
                <ul class="link-list">
                    
                    <div class="news-group__list  {*column-2-list*} {*column-list*} ">  
                
                {*----------Динаміка - вивід новин депутатських груп з міжпарламентських зв’язків із зарубіжними країнами---------*}               
                                 <div class="row">
                    {*{foreach item=data from=$block_data.6.items}*}
                    {foreach item=data from=$der_zak}
{*                    {foreach item=data from=$justification_pr}*}
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
                     
                </ul>
                    

                    
               {*     <div class="table-block  ">
                <h2 class="hub-page__heading">
                    <a id="menu2"></a>                    
             Інформація про закупівлі, плани закупівель, тендерна документація за попередні роки 
                    <i class="link-ico"></i>
                </h2>

                <ul class="link-list">
                    <div class="tr-block">
                     <div class="td-block">
                        <div class="more-link full-bg">
                            <a    href="/ "> Архів </a>
                        </div>
                    </div>
                     </div>
                </ul></div>*}


                 
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
{*        <a id="menu2" style="padding-top: 12rem;margin-top: -10rem;"></a>*}
                 <a id="menu2"></a>
            <div class="table-block  ">
                <div class="tr-block">
                    <div class="td-block1 "><a  id="menu3"  href="https://www.rada.gov.ua/">  </a>
                       <h2> Інформація про закупівлі, плани закупівель, тендерна документація за попередні роки </h2>
                        <ul class="link-list">
                    <div class="tr-block">
                     <div class="td-block">
                        <div class="more-link full-bg">
                            <a {*id="menu2"*}  href="/documents/gosp_fin_dij_doc/der_zak/arh_derzhzak "> Архів </a>
                        </div>
                    </div>
                     </div>
                </ul>
 
                    </div>
                 
                </div>
                
                
            </div>
{*            <div id="newsc">*}
           <div class="news-group__list  {*column-2-list*} {*column-list*} ">  
                <br>
                <div class="row">
                    {*{foreach item=data from=$block_data.6.items}*}
{*                    {foreach item=data from=$procurement_archive}*}
                    {foreach item=data from=$arh_derzhzak}
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