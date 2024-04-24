
<div class="left_col">
    <div class="tabs_block">                       
        <ul>
            <li class="first"><a href="#news_tab">Повідомлення</a></li>
            <li><a href="#messages_tab"></a></li>
            <li><a href="#allevents_tab">Усi публікації</a></li>
        </ul>
        <!-- news -->
        <div id="news_tab">
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
        </div>
        <!-- end news -->
        <div id="messages_tab">
            <div class="news_list">
		<noindex>
                {foreach item=data from=$nologo_news key=key}                   
                    <div class="news_item">
                        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>
                        <p>{$data->i_name} {*$data->i_anons|truncate:200*}</p>
                        {if $data->i_link}
			<span class="details"><a href="{$data->i_link}">посилання</a></span>
			{else}
			<span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">докладніше</a></span>
                        {/if}
                    </div>                    
                {/foreach}
		</noindex>
                <div class="go_to_section"><a href="{$lang_prefix}/news">Перейти до розділу</a><a class="rss_ico" href="{$lang_prefix}/rss/news/Novyny"></a></div>
            </div>
        </div>
        <div id="allevents_tab">
            <div class="news_list">
		<noindex>
                {foreach item=data from=$all_news key=key}                   
                    <div class="news_item">
                        {if strlen($data->i_logoname) > 0}
                          <img align="left" alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg"/>
                        {*  <img align="left" alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" width="108" height="64"/>*}
                        {/if}
                        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>
                        <p>{$data->i_name} {*$data->i_anons|truncate:200*}</p>
                        <span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">докладніше</a></span>
                    </div>                    
                {/foreach}
		</noindex>
                <div class="go_to_section"><a href="{$lang_prefix}/news">Перейти до розділу</a><a class="rss_ico" href="{$lang_prefix}/rss/news/Novyny"></a></div>
            </div>
        </div>
    </div>  
            
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
            
            <div class = soc_net>
            {*Відеотрансляція пленарних засідань*} 
            <p>
                <a href = "/video/rada-tv/64430.html"><img src="/img/rada_on_air.jpeg" alt="Канал Рада"></a>&nbsp;
                          
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
</div>

                        
