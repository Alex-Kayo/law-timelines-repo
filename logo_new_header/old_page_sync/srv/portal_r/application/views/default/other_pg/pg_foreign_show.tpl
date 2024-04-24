
Міжнародна діяльність <br>
{$mass} <br>
А ось і вона: <br>
{foreach item=data from=$logo_news}
    {$data->i_name}<br>
    Автор: {$data->i_author}
{/foreach}    