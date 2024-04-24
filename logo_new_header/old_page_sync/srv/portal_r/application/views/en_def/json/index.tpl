<?xml version="1.0" encoding="utf-8" ?>
[

    {foreach item=data from=$posts}
        {literal}{
        "name":"{/literal}{$data->i_name}{literal}",
        "link":"{/literal}{$url}{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html{literal}",
        "descriptor":"{/literal}{$data->i_anons|strip_tags}{literal}",
            "date":"{/literal}{$data->i_date}{literal}"
            },{/literal}
    {/foreach}
]


