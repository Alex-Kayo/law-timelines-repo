<?xml version="1.0" encoding="utf-8" ?>
<rss version="2.0">
    <channel>
        <title>{$current_node->t_name} - Нові надходження</title>
        <link>{$url}</link>
        <description>Верховна Рада України</description>
            {foreach item=data from=$posts}
            <item>
                <title>{$data->i_name}</title>
                <link>{$url}{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html</link>
                <description>{$data->i_anons|strip_tags}</description>
                <pubDate>{$data->i_date}</pubDate>
                <author>{$data->i_author}</author>
            </item>
        {/foreach}
    </channel>
</rss>


