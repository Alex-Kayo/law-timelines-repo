
<div class="left_col">
{*   Main Banner     
    <div style="height: 210px; background-color: blue; margin-bottom: 10px;">
        <a href="/news/Novyny/133408.html"> <img src="\images\pres_conf.png"> </a>
    
    </div> *}
    
   
      
      {*<div style="height: 181px; background-color: blue; margin-bottom: 10px;">
        <a href="/uploads/gallery/38188.jpeg"> <img src="/images/dn24_25.png"> </a> 
    
    </div> *}
    
        <!-- news -->
        <div class="heah_news_left">
        
            <a class="rss_ico" href="/rss/news/Novyny" style="float: left; margin-right: 10px;"></a>
            <h2>Новини</h2>
    </div>
        <div class="heah_news_right">
            <img src="/img/archive.jpg"/>
{*            <a class="rss_ico" href="/archive" style="float: left; margin-right: 10px;"></a>*}
           <a href="/archive" style="color: white; text-decoration: none; float: right; margin-right: auto; padding: 2px 5px; font-weight: bold; background-color: rgb(31, 108, 165);">Архів публікацій</a>
{*            <h2>Архів публікацій</h2>*}
        </div>        
                
    

            <div class="news_list">
                
                
		<noindex>
                {foreach item=data from=$logo_news key=key} 
                    <div class="news_item">
                        <img align="left" alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg"/>
                 {* <img align="left" alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" width="120" height="80"/>*}
                        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}</span>
                        <p>{$data->i_name} {*$data->i_anons|truncate:200*}</p>
                        {if $data->i_link}
			<span class="details"><a href="{$data->i_link}">посилання</a></span>
			{else}
			<span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">докладніше</a></span>
                        {/if}
			
			</div>                    
                {/foreach}
		</noindex>
                <div class="go_to_section"><a href="{$lang_prefix}/news/Novyny/page/2">Перейти до розділу</a><a class="rss_ico" href="{$lang_prefix}/rss/news/Novyny"></a></div>
            </div>    
        <!-- end news -->
       
       {if $is_plenar}
            <div class = soc_net>
            {*Відеотрансляція пленарних засідань*} 
            <p>
                <a href = "/video/rada-tv/64430.html"><img src="/img/rada_on_air.jpeg" alt="Канал Рада"></a>&nbsp;
                          
            </p>
            </div>
            {/if}
            <div class = soc_net>
            {*Відеотрансляція пленарних засідань*} 
            <p>
                <a href = "/news/Novyny/142259.html"><img src="/images/3D_rada.png" alt="Канал Рада"></a>&nbsp;
                          
            </p>
            </div>
            
            <div class = soc_net>
            Верховна Рада України у соціальних мережах
            <p>
                <a href = "https://twitter.com/verkhovna_rada"><img src="/img/twitter.jpg" alt="twitter"></a>&nbsp;
                <a href = "http://www.facebook.com/pages/%D0%92%D0%B5%D1%80%D1%85%D0%BE%D0%B2%D0%BD%D0%B0-%D0%A0%D0%B0%D0%B4%D0%B0-%D0%A3%D0%BA%D1%80%D0%B0%D1%97%D0%BD%D0%B8/125509584140256"><img src="/img/facebook.jpg" alt="facebook"></a>&nbsp;
                <a href = "http://www.youtube.com/user/RadaTVchannel"><img src="/img/youtube.png" alt="youtube"></a>
           
            </p>
            </div>
			<br/>
            <div class="list_banner">
{*     розміщено 20151203 наказ Слешинського ->  Сидоренко (телефон)        *}
{*                <a href = "http://data.rada.gov.ua/open"><img src="/img/baner/opendata.gif"/></a> *}
{*     розміщено 20160829 прохання Сергія Щербакова за накозом  Сидоренко (телефон) *}
				<a href = "http://opendata.rada.gov.ua/"><img src="/img/baner/opendata.gif" alt="Портал відкритих даних"/></a>
                <br/>
                
                <a href = "http://constitution.gov.ua/"><img src="/img/baner/vr_KK.gif" alt="Конституційна комісії"/></a>
                <br/>
                <a href = "http://decentralization.gov.ua/"><img src="/img/baner/vr_dec.gif" alt="Децентралізація влади"/></a>
                
{*                <img src="/img/baner/gols_uk.jpeg"/>*}
            </div>  
            
</div>

                        
