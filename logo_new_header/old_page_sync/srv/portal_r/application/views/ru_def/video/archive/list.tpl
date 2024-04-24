{foreach item=data from=$posts}      
    <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>  
    {if $data->i_link}
        <div class="news_item">
            <p>{$data->i_name}</p>
            {if $data->i_anons}
                <br>
                <p>{$data->i_anons}</p>
            {/if}
            <span class="details"><a href="{$data->i_link}">посилання</a></span>
        </div>      

    {else}

        <div class="news_item">
            {if strlen($data->i_logoname) > 0}
                <img align="left" alt="" src="/uploads/logos_middle/{$data->i_logoname}.jpeg" width="108" height="64"/>
            {/if}
            {*      <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>*}
            <p>{$data->i_name}</p>
            {if $data->i_anons}
                <br>
                <p>{$data->i_anons}</p>
            {/if}
            <span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">докладніше</a></span>
        </div>      


    {/if}  



{/foreach}
{$pagination}

