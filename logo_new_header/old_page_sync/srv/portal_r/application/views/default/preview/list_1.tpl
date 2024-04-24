                                    

{foreach item=data from=$anonses}

    <p>
        <span class="announce_date">{$data->day}&nbsp;{$data->month}. {$data->hour}</span>
{*        <span class="announce_date">{$data->day}&nbsp;{$data->month} {if $data->hour == 11} об {else} о {/if}{$data->hour}</span>*}
<!--                                    <span class="announce_txt"><a href="{$data->i_link}">{$data->i_name}</a></span>-->
        <span class="announce_txt"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></span>
    </p>
{/foreach}                                 
