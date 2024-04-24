
{foreach item=data from=$events}

    <p>
        <span id="{$data->i_date_create}-{$data->hour}_data" class="event_date">{$data->day}&nbsp;{$data->month}. {$data->hour}</span>
        <span id="{$data->i_date_create}-{$data->hour}_text" class="event_txt"><a href="#"  onclick="SetEventValue('#{$data->i_date_create}-{$data->hour}_text','#{$data->i_date_create}-{$data->hour}_data)'">{$data->i_name}</a></span>
    </p>
{/foreach}                                 
