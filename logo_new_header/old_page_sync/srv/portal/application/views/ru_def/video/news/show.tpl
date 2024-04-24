<div class="right_col">
    <!-- information_block -->
    <div class="heading">
        <a href="/print/{$i_id}.html" class="print">Надрукувати</a>        
        <a href="/fsview/{$i_id}.html" class="fslink">Збільшити зону перегляду</a>
        <h3><span>{$current_node->t_name}</span></h3>
    </div>    
    <div class="information_block archieve_block">
        <div class="one_new">
            <a name="top"></a>
            <span class="date">{$item->day}&nbsp;{$item->month}&nbsp;{$item->year},&nbsp;{$item->hour}:{$item->minute}</span>

            {if $item->i_author}
                <span class="author">(&nbsp&nbsp{$item->i_author}&nbsp)</span>

            {/if} 

            <h1>{$item->i_name}</h1>


            <div class="item_content">
                {if $item->i_full}
                    {$item->i_full}
                {else}
                    {$item->i_anons}
                {/if}                    
            </div>
            <div class="clear"></div>

            <div class="up"><a href="#top">До початку новини</a></div>
        </div>

        {if $item->comment_type > 0}
            {include file="news/comments.tpl"}
        {/if}

    </div>
    <!-- end information_block -->