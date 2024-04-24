                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/">Home</a></li> 
{*                    <a href="{$lang_prefix}/">Головна</a> *}
                    {foreach item=data from=$path_way}
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/{$data->t_parents}/">{$data->t_name}</a></li>  
                    {/foreach}                    
                    <li class="breadcrumb-item">{$current_node->t_name}</li>
                </ol>
<h3 class="page-heading"><span>{$current_node->t_name}</span></h3>   
    

    <div class="main-content">
        <!-- information_block -->
    
    <div class="information_block archieve_block">
        <a name="top"></a>
            <div class="publications-heading__block">
                <h1>{$item->i_name}</h1>
    {if $item->hour !== "00" } {*Mirs не виводити дату якщо час публікації 00:00 - 00:59*}
         <span class="date"> Published on {$item->day}&nbsp;{$item->month}&nbsp;{$item->year}, at {$item->hour}:{$item->minute}</span>
{*            <span class="date">{$item->day}&nbsp;{$item->month}&nbsp;{$item->year}</span>*}
        
         {/if}
         
         
         {if $item->i_author}
            <p class="small-text author">&nbsp{$item->i_author}&nbsp</p>
            
         {/if} 
{*            <a href="#" class="tags">кадрова політика</a>*}
            </div>
            
        <div class="middle-column one_new">

            <div class="admin-content">
                {if $item->i_full}
                {$item->i_full}
                {else}
                {$item->i_anons}
                {/if}
            </div>
   
                <div class="attachment-list">
                    {*<p><b>Прикріплені файли</b></p>

                    <a href="#" class="download-link" title="Завантажити всі">
                        Завантажити всі
                    </a>*}
                    <ul>
                    {foreach item=data from=$attachments}

                        {foreach item=doc from=$data}                                        
                            <li>
                                <p>
                                    <a class="attachment-list__name" href="/uploads/documents/{$doc->ia_id}.{$doc->ia_type}">
                                    <i class="fas fa-paperclip"></i>
                                    {$doc->ia_name}
                                    </a>
                                    <span class="attachment-list__format">
                                        ( {$doc->ia_type}, {$doc->ia_size/1024/1024|round:2} Mb )
                                    </span>
                                </p>
                                <a title="To review" href="/uploads/documents/{$doc->ia_id}.{$doc->ia_type}" class="to-look">
                                    <i class="far fa-eye"></i>
                                    To review
                                </a>
                                    <a href="#" title="Download" class="download-link"></a>
                            </li>   

                        {/foreach }

                    {/foreach}  
                    </ul>
                </div>   
            
            <div class="clear"></div>
            {if $item->i_full|count_characters > 40000}
            <div class="up"><a href="#top">До початку</a></div>
            {/if}    
{*         {$item->i_full|count_characters}   *}
        </div>

        {if $item->comment_type > 0}
            {include file="news/comments.tpl"}
        {/if}

    </div>
        <!-- end information_block -->
    </div>
        <!-- /main-content -->
