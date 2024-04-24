
<div class="left_col">
    <div class="tabs_block">                       
        <ul>
            <li class="first"><a href="#news_tab">News</a></li>
            <li><a href="#messages_tab"></a></li>
            <li><a href="#allevents_tab">All publications</a></li>
        </ul>
        <!-- news -->
        <div id="news_tab">
            <div class="news_list">
                {foreach item=data from=$logo_news key=key}                   
                    <div class="news_item">
                        <img align="left" alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" width="120" height="80">
                 {* <img align="left" alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" width="120" height="80"/>*}
                        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}</span>
                        <p>{$data->i_name} {*$data->i_anons|truncate:200*}</p>
                        <span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">more</a></span>
                    </div>                    
                {/foreach}
                <div class="go_to_section"><a href="{$lang_prefix}/news/News/News/page/2">Go to section</a><a class="rss_ico" href="{$lang_prefix}/rss/news/News/News"></a></div>
            </div>    
        </div>
        <!-- end news -->
        <div id="messages_tab">
            <div class="news_list">
                {foreach item=data from=$nologo_news key=key}                   
                    <div class="news_item">
                        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>
                        <p>{$data->i_name} {*$data->i_anons|truncate:200*}</p>
                        <span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">more</a></span>
                    </div>                    
                {/foreach}
                <div class="go_to_section"><a href="{$lang_prefix}/news">Go to section</a><a class="rss_ico" href="{$lang_prefix}/rss/news/News/News"></a></div>
            </div>
        </div>
        <div id="allevents_tab">
            <div class="news_list">
                {foreach item=data from=$all_news key=key}                   
                    <div class="news_item">
                        {if strlen($data->i_logoname) > 0}
                          <img align="left" alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg"/>
                        {*  <img align="left" alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" width="108" height="64"/>*}
                        {/if}
                        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>
                        <p>{$data->i_name} {*$data->i_anons|truncate:200*}</p>
                        <span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">more</a></span>
                    </div>                    
                {/foreach}
                <div class="go_to_section"><a href="{$lang_prefix}/news">Go to section</a><a class="rss_ico" href="{$lang_prefix}/rss/news/News/News"></a></div>
            </div>
        </div>
    </div>        

</div>
