{$pagination}

{foreach item=data from=$posts}
    <div>
        <h4><a href="{$base_url}{$data->i_id}.html">{$data->i_name}</a></h4>
        {$data->i_anons}<br />
    </div>
{/foreach}
