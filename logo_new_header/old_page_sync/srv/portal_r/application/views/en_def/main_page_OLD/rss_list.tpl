
{literal}

<style type="text/css">
 #anons_select .jcarousel-skin-tango .jcarousel-container-horizontal   {
    width: 100%;
    padding: 0 40px;
}
#anons_select .jcarousel-skin-tango .jcarousel-clip-horizontal{
    /*position: relative;*/
    overflow: hidden;
    width: 90%;
}
#anons_select .jcarousel-skin-tango .jcarousel-item-horizontal{
    
    margin: 0 -8px 0 2x;
    /*padding: 0 0px 0 0px;*/
    max-height: 14px;
    width: 79px;
}

#anons_select .jcarousel-skin-tango .jcarousel-next-horizontal {
    right: 75px;
    top: -6px;
}
#anons_select .jcarousel-skin-tango .jcarousel-prev-horizontal {
    left: -1px;
    top: -6px;
}

</style>    
    
<script>
    $(document).ready(function(){SelAnons({/literal}{$anons_dates[0].fulldate}{literal});
                $('#carousel_anons').jcarousel({
            // Configuration goes here
                 });
    });

function SelAnons( id )
{
        $.ajax({
         type: "POST",
         url: "/selpreview/"+id,
         data: {"reque":id},
        success: function(msg){
                   $("#anons_select a").css({"color":"#000"})
                   $("#"+id).css({"color":"#2474b2"})
                   $("#div2").html(msg);
                     $('.announce_overflow').jScrollPane({showArrows: true});
                     $(".jspDrag").css("top","0");
                     $(".jspPane").css("top","0");
                  }
                 
    });
}
</script>
{/literal}


<div class="right_col">
{*    {$panel_config|print_r}*}
    <!-- cycle news -->
    <div class="cycle_block">
                <div class="cycle_pager" id="cycle_pager"></div>
        <div class="cycle">

        {foreach item=data from=$top_news key=key}     
            <div class="cycle_item">
                <div class="cycle_photo">
                        <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg" width="265" height="195"/>
                </div>
                <div class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</div>
                {if $data->i_link}
			<div class="cylce_heading"><a href="{$data->i_link}">{$data->i_name}</a></div>
			{else}
                        <div class="cylce_heading"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></div>
                {/if}
                <div class="cycle_txt">{$data->i_anons}</div>
                <div class="clear"></div>
            </div>                                       
        {/foreach}                                
        </div>
    </div>
    <!-- end cycle news -->


{*<button>Get External Content</button>*}
        
    {if !$items_munu_hide && $block_data.notice.items.total_rows }
        <div class="heading">
            <h3>
                
                 <span>Оголошення</span> 
            </h3>
        </div>    
                
            <div class="information_block">
                <div class="notis_block">
                	<div class="notis_list">
                    	<div class="notis_overflow">
                            
                            {foreach item=data from=$block_data.notice.items}
                                <p>
{*                                    <span class="notis_date">{$data->day}&nbsp;{$data->month} о {$data->hour}</span> *}
<!--                                    <span class="notis_txt"><a href="{$data->i_link}">{$data->i_name}</a></span>-->
                                    <span class="notis_txt"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html"><image src = "/img/knopka_kanc.png">{$data->i_anons}</a></span>
                                </p>
                                <span style = "font-style: italic; float: right; padding-right: 80px;">({$data->i_author}) </span>
                            {/foreach}                                 
                            </p>
                        </div>    
                    </div>
                </div>
            </div>                
                
    {/if}
    
    {if $panel_config->l_block1_status eq 1 && $block_data.1.items.total_rows}
        <div class="heading">
            <h3> 
                <a href="{$block_data.1.topic->i_categories}" class="show_section">Архів подій</a>
                <span>{$block_data.1.topic->t_name}</span> 
                <a href="rss/preview/anonsy_podij" class="rss_ico"></a>
            </h3>
                
            <div id="anons_select" class="block_submenu">
                <ul id="carousel_anons" class = "jcarousel-skin-tango">
                    {foreach item=data from=$anons_dates }
                        <li> <a id="{$data.fulldate}" style="cursor:pointer" onclick="SelAnons({$data.fulldate})"title="{$data.weekday_name}">{$data.day} {$data.month_name|lower}</a> </li> 

                    {/foreach}
                </ul>    

            </div>    
        </div>    
            <div class="information_block">
                <div class="announce_block">
                	<div class="announce_list">
                    	<div class="announce_overflow">
                            
                            <div id="div2">
{*                                    Text anons*}
                            </div>
                        </div>    
                    </div>
                </div>
            </div>                
                
                
    {/if}
   
    <!--//items-wrapper-->
    <div class="heading"><h3>Електронні сервіси</h3></div>
    
  <div  class="coocoo_box">
{*      <h3>Електронні сервіси:</h3>*}
                <div style="" class="coocoo">

                    <a href="https://itd.rada.gov.ua/petitions/" style="text-decoration: none;">
                        <div class="banners">ЕЛЕКТРОННІ ПЕТИЦІЇ  </div> 
                    </a>

                </div>
                <div style="" class="coocoo">

                    <a href="https://itd.rada.gov.ua/idsrv/" style="text-decoration: none;">
                        <div class="banners">ЕЛЕКТРОННИЙ КАБІНЕТ ГРОМАДЯНИНА </div> 
                    </a>

                </div>
                <div style="" class="coocoo">

                    <a href="https://itd.rada.gov.ua/PublicPolicy" style="text-decoration: none;">
                        <div class="banners">ПОВНИЙ ЦИКЛ ПУБЛІЧНОЇ ПОЛІТИКИ</div> 
                    </a>

                </div>
                <div style="" class="coocoo">

                    <a href="https://itd.rada.gov.ua/services/pubd/" style="text-decoration: none;">
                        <div class="banners">ГРОМАДСЬКЕ ОБГОВОРЕННЯ ЗАКОНОПРОЕКТІВ </div> 
                    </a>

                </div>
                <div style="" class="coocoo">

                    <a href="http://itd.rada.gov.ua/SessionRequest" style="text-decoration: none;">
                        <div class="banners">ЗАПИСАТИСЬ НА ВІДВІДУВАННЯ ПЛЕНАРНОГО ЗАСІДАННЯ </div> 
                    </a>

                </div>
                <div style="" class="coocoo">

                    <a href="http://w1.c1.rada.gov.ua/pls/site2/pkg_public_info.request_form" style="text-decoration: none;">
                        <div class="banners">ФОРМА ДОСТУПУ ДО ПУБЛІЧНОЇ ІНФОРМАЦІЇ </div> 
                    </a>

                </div>
               {* <div style="" class="coocoo">

                    <a href="http://gapp.rada.gov.ua/ap/session/request" style="text-decoration: none;">
                        <div class="banners">  ЗАПИСАТИСЬ НА ВІДВІДУВАННЯ ПЛЕНАРНОГО ЗАСІДАННЯ  </div> 
                    </a>

                </div>
                <div style="" class="coocoo">

                    <a href="http://iportal.rada.gov.ua/documents/origin_docum/2592.html" style="text-decoration: none;">

                        <div class="banners">
                            ЗАЛИШИТИ ЗАЯВКУ НА ЕКСКУРСІЮ ВЕРХОВНОЮ РАДОЮ
                        </div>          
                    </a>
                </div>
                
                <div style="" class="coocoo">
                    <a href="https://rada.oporaua.org/novyny/novini/10897-vy-i-narodnyi-deputat-pryntsypy-vzaiemodii" style="text-decoration: none;">
                        <div class="banners">
                            ПРИНЦИПИ ВЗАЄМОДІЇ З НАРОДНИМ ДЕПУТАТОМ
                        </div> 
                    </a>    
                </div>
                <div style="" class="coocoo">
                    <a href="/news/contact/72874.html" style="text-decoration: none;">
                        <div class="banners">
                            МАПА ПРИЙМАЛЕНЬ
                        </div> 
                    </a>    
                </div>
                
                <div style="" class="coocoo">
                    <a href="http://OPENDATA.RADA.GOV.UA" style="text-decoration: none;">
                        <div class="banners">
                            OPENDATA.RADA.GOV.UA
                        </div> 
                    </a>    
                </div>
                <div style="" class="coocoo">
                    <a href="http://RADA4YOU.ORG" style="text-decoration: none;">
                        <div class="banners">
                            RADA4YOU.ORG
                        </div>
                    </a>    
                </div>
                <div style="" class="coocoo">
                    <a href="http://RADA.OPORAUA.ORG" style="text-decoration: none;">
                        <div class="banners">
                            RADA.OPORAUA.ORG
                        </div>
                    </a>
                </div>
                <div style="" class="coocoo">
                    <a href="http://knopkodavy.chesno.org/" style="text-decoration: none;">
                        <div class="banners">
                            КНОПКОДАВИ
                        </div>
                    </a>
                </div>
                <div style="" class="coocoo">
                    <a href="http://radachallenge.org/?page_id=450&lang=uk " style="text-decoration: none;">
                        <div class="banners">
                            ЗВІТИ НАРОДНИХ ДЕПУТАТІВ
                        </div>
                    </a>
                </div>*}
                
                {*            /Banner*}
                

            </div><!--//items-wrapper-->
    

    {if $panel_config->l_block12_status eq 1}
        <div class="heading">
            <h3>
                <a href="{$block_data.12.topic->i_categories}" class="show_section">Перейти до розділу</a>
                <span>{$block_data.12.topic->t_name}</span> 
                <a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/golos_rss" class="rss_ico"></a>
            </h3>
           
            {if preg_match("/Хід пленарних/", $block_data.2.topic->t_name)}    
                
                {*            {if $block_data.2.topic->t_name == 'Хід пленарних засідань'}*}
                <div class="block_submenu">
                        <ul>
                            
                            <li><a href="http://iportal.rada.gov.ua/news/Rstr_nd">Результати реєстрації  </a></li>
                            <li class="borderl"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_h1">Хронологія розгляду</a></li>
                            <li class="borderl"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_pd1">Результати розгляду</a></li>
                            <li>
                                
{*                            <div class="golos_block">*}
    <ul id="qm0" class="qmmc">
                            <li><a href="#">Голосування за день</a><ul>
		<li><a target="_blank" href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_graf_2">Статистика голосувань</a></li>
                    <li><a target="_blank" href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_graf_3">Топ лідерів голосувань</a></li>
                    <li><a target="_blank" href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_graf_3?kod=1">Топ-25 антилідерів голосувань</a></li>
                    <li><a target="_blank" href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_graf_4">Останні 5 голосувань (онлайн)</a></li>
		</ul></li>
                            </ul>
    
{*    </div>*}
                               
                            </li>
                        </ul> 
                    
                </div> 
                <div class="block_submenu">
                        <ul>
                            
                            <li><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h">Електронний протокол</a></li>
                            <li class="borderl"><a href="http://iportal.rada.gov.ua/meeting/stenogr">Стенограми пленарних засідань</a></li>
                            
                            <li class="borderl"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_stat">Статистика голосувань за обраний період</a></li>
                </div>  

            {/if}
        </div>    
        <div class="information_block">
            <div class="information_block_ins">
                
                {foreach item=data from=$block_data.12.items}
                    <div class="info_item">
                        {if $data->i_link}
			    <div class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}{$data->minute}</div> 
                            <h4><a href="{$data->i_link}">{$data->i_name}</a></h4>
                            <p>{$data->i_anons}</p>
                        {else}
                            <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                            {if $panel_config->l_block1_flag_anons eq 1}<p>{$data->i_anons}</p>{/if}
                        {/if}
                    </div>                        
                {/foreach}   
            </div>
        </div>
    {/if}  
    
    
    
    {if $panel_config->l_block3_status eq 1}
        <div class="heading">
            <h3>
                <a href="{$block_data.3.topic->i_categories}" class="show_section">Перейти до розділу</a>
                <span>{$block_data.3.topic->t_name}</span> 
                <a href="http://w1.c1.rada.gov.ua/pls/zweb2/pkg_rss.new_zp" class="rss_ico"></a>
            </h3>
           
            <div class="block_submenu">
                    <ul>
                        <li><a href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc555">Зареєстровані за поточний тиждень</a></li>
                        <li class="borderl"><a href="http://w1.c1.rada.gov.ua/pls/site2/p_bills_stand_laws">Прийняті на поточній сесії</a></li>
                        <li class="borderl"><a href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc2">Пошук за реквізитами</a></li>
                    </ul>              
            </div>                            
        </div>    
        <div class="information_block">
            <div class="information_block_ins">
                
                {foreach item=data from=$block_data.3.items}
                    <div class="info_item">
                        {if $data->i_link}                    
                            <h4><a href="{$data->i_link}">{$data->i_name}</a></h4>
                            <p>{$data->i_anons}</p>
                        {else}
                            <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                            {if $panel_config->l_block1_flag_anons eq 1}<p>{$data->i_anons}</p>{/if}
                        {/if}
                    </div>                        
                {/foreach}   
            </div>
        </div>
    {/if}    
    
    
    
    {if $panel_config->l_block4_status eq 1}
        <div class="heading">
            <h3>
                <a href="{$block_data.4.topic->i_categories}" class="show_section">Перейти до розділу</a>
                <span>{$block_data.4.topic->t_name}</span> 
                <a href="http://zakon.rada.gov.ua/laws/main/xml" class="rss_ico"></a>
            </h3>
           
            <div class="block_submenu">
                    <ul>
                        <li><a href="http://zakon.rada.gov.ua/go/254%D0%BA/96-%D0%B2%D1%80">Конституція України</a></li>
                        <li class="borderl"><a href="http://zakon.rada.gov.ua/go/t21">Кодекси України</a></li>
                        <li class="borderl"><a href="http://zakon.rada.gov.ua/go/tt1001">Закони України</a></li>
                        <li class="borderl"><a href="http://zakon.rada.gov.ua/go/a#Find">Пошук за реквізитами</a></li>
                    </ul>              
            </div>                            
        </div>    
        <div class="information_block">
            <div class="information_block_ins">
                
                {foreach item=data from=$block_data.4.items}
                    <div class="info_item">
                        {if $data->i_link}                    
                            <h4><a href="{$data->i_link}">{$data->i_name}</a></h4>
                            <p>{$data->i_anons}</p>
                        {else}
                            <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                            {if $panel_config->l_block1_flag_anons eq 1}<p>{$data->i_anons}</p>{/if}
                        {/if}
                    </div>                        
                {/foreach}   
            </div>
        </div>
    {/if}      
	
{*  -------------  Блок відсутніх депутатів ------------ *}
    {if $block_data.absnd.items.total_rows }
        <div class="heading">
            <h3>
                <a href="{$block_data.absnd.topic->i_categories}" class="show_section">Перейти до розділу</a>
    
                 <span>Інформація про відсутніх народний депутатів</span> 
            </h3>
        </div>    

            <div class="information_block">
                <div class="absnd_block">
                	<div class="absnd_list">
                    	<div class="absnd_overflow">

                            {foreach item=data from=$block_data.absnd.items}
                                <p>
{*                                    <span class="absnd_date">{$data->day}&nbsp;{$data->month} о {$data->hour}</span> *}
{*                                  <span class="absnd_txt"><a href="{$data->i_link}">{$data->i_name}</a></span>*}
                                    <span class="absnd_txt"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html"><image src = "/img/check-blue.png">{$data->i_name}</a></span>
                                </p>
{*                                <span style = "font-style: italic; float: right; padding-right: 80px;">({$data->i_author}) </span>*}
                            {/foreach}                                 
                            </p>
                        </div>    
                    </div>
                </div>
            </div>                
                
                
    {/if}
{*  -------------   END Блок відсутніх депутатів ------------ *}

        <!-- information_block -->
    <div class="heading multimedia">
        <h3>
            <a href="{$lang_prefix}/gallery" class="show_section" id="media_show">Перейти до розділу</a>
            <span>Мультимедiа</span> 
        </h3>
    </div> 
    <div class="information_block multimedia">
        <div class="tabs_block">                       
            <ul>
                <li class="first"><a href="#video_tab">Вiдео</a></li>
                <li><a href="#photo_tab">Фото</a></li>
                <li><a href="#audio_tab">Аудiо</a></li>
            </ul>
            <!-- photo -->                                                                                                     
            <div id="video_tab" class="multimedia_tab"   url_show="{$lang_prefix}/video">
                
                <ul>                    
                    {foreach item=data from=$video key=key}
                        <li class="multimedia_item">
                            
			    <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html"><img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg" width="148" height="100"/></a>
                            {*<div class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</div>*}
			    {if $data->i_id != 64430}
                            <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
			    {/if}
			    </li>                        
                    {/foreach}                     
                </ul>
                <div class="clear"></div>
                
            </div>
            <!-- end photo -->
            <!-- video tab -->
            <div id="photo_tab" class="multimedia_tab" url_show="{$lang_prefix}/gallery">
                <ul>                    
                    {foreach item=data from=$gallery key=key}
                        <li class="multimedia_item">
                            <img alt="" src="/uploads/gallery_prev/{$data->file_name}" width="148" height="100"/>
                           {* <div class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</div>*}
                            <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                        </li>                        
                    {/foreach}                     
                </ul>
                <div class="clear"></div>
            </div>
                                <!-- end video tab -->                    
            <!-- audio tab -->
            <div id="audio_tab" class="multimedia_tab"  url_show="{$lang_prefix}/audio">

                <ul>                    
                    {foreach item=data from=$audio key=key}
                        <li class="multimedia_item">
                            <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg" width="148" height="100"/>
                            {*<div class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</div>*}
                            <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                        </li>                        
                    {/foreach}                     
                </ul>
                <div class="clear"></div>                
                
            </div>
            <!-- end audio tab -->
        </div>
    </div>    
        <!-- end information_block -->
</div>