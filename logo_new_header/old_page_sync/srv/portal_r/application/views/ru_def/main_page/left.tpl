
<div class="left_col">
    <div class="tabs_block">
        <ul>
            <li class="first"><a href="#news_tab">Сообщения</a></li>
           {* <li><a href="#messages_tab">Анонсы</a></li> *}
            <li><a href="#allevents_tab">Все публикации</a></li>
        </ul>
        <!-- news -->
        <div id="news_tab">
            <div class="news_list">
                {foreach item=data from=$logo_news key=key}
                    <div class="news_item">
                        <img align="left" alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg"/>
                 {* <img align="left" alt="" src="/uploads/logos_small/{$data->i_logoname}.jpeg" width="120" height="80"/>*}
                        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}</span>
                        <p>{$data->i_name} {*$data->i_anons|truncate:200*}</p>
                        <span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">подробнее</a></span>
                    </div>
                {/foreach}
                <div class="go_to_section"><a href="/ru/news/Novosty/Soobshchenyya">Перейти к разделу</a><a class="rss_ico" href="{$lang_prefix}/rss/news/Novyny"></a></div>
            </div>
        </div>
        <!-- end news -->
       {* <div id="messages_tab">
            <div class="news_list">
                {foreach item=data from=$nologo_news key=key}
                    <div class="news_item">
                        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>
                        <p>{$data->i_name} {*$data->i_anons|truncate:200*}</p>
                  {*      <span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">подробнее</a></span>
                    </div>
                {/foreach}
                <div class="go_to_section"><a href="ru/news">Перейти к разделу</a><a class="rss_ico" href="{$lang_prefix}/rss/news/Novyny"></a></div>
            </div>
        </div> *}
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
                        <span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">подробнее</a></span>
                    </div>
                {/foreach}
                <div class="go_to_section"><a href="{$lang_prefix}/news">Перейти к разделу</a><a class="rss_ico" href="{$lang_prefix}/rss/news/Novyny"></a></div>
            </div>
        </div>
    </div>

</div>
