{foreach item=data from=$item_commets}
    <div class="one_comment">
        <div class="comment_author"><strong>{$data->c_name}</strong><div class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}:{$data->minute}</div></div>
        <p>{$data->c_comment}</p>
    </div>    
{/foreach}

{$pagination} 
