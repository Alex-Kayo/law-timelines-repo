{foreach item=data from=$events}
    <option title="{$data->i_name}" value="{$data->i_name}">{$data->i_name|truncate:65:"..."}</option>
{/foreach}   

