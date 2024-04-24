<div class="right_col">
        <!-- information_block -->
    <div class="heading">
        <h3><span>{$current_node->t_name}</span></h3>
    </div>    
    <div class="information_block archieve_block">
        <div class="one_new">
            <a name="top"></a>
            <span class="date">{$item->day}&nbsp;{$item->month}&nbsp;{$item->year},&nbsp;{$item->hour}:{$item->minute}</span>
            <h1>{$item->i_name}</h1>

            {if $item->i_author}
            <p class="author">(&nbsp{$item->i_author}&nbsp)</p>

            {/if}                    
	    <div class="item_content">
		 {if $item->i_full}
		     {$item->i_full}
		 {else}
		     {$item->i_anons}
		 {/if}                    
	    </div>
	<div class="clear"></div>
            
            <div class="up"><a href="#top">top</a></div>
        </div>

        {if $item->comment_type > 0}
            {include file="news/comments.tpl"}
        {/if}

    </div>
        <!-- end information_block -->