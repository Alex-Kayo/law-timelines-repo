<div class="heading">
    <h3><span>Фотогалерея</span></h3>
</div>  
<div class="gallery_content">

    {include file="main_page/module_filter.tpl" url="gallery"}


<div class="gallery_list">

    {assign var="index_media" value="0"}
    {assign var="index_cell" value="0"}
    {foreach item=media_data from=$list_gallery}
        {if $index_cell == 0}
            <div class="gallery_row">
        {/if}


            <div class="gallery_item">
                <div class="item_foto"><img alt="{$media_data->i_name}" src="/uploads/gallery_prev/{$media_data->filename}" height="100" width="148"/></div>
                {*<div class="date">{$media_data->day}&nbsp;{$media_data->month},&nbsp;{$media_data->year}</div>*}
                <h3><a href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html?{$show_request}">{$media_data->i_name}</a>
                    {if $media_data->flag_new}
                            <span class="warn">(оновлено)</span>											
                    {/if}
                
                </h3>
                <div class="foto_num">{$media_data->foto_cnt} фото</div>
            </div>                    

        {if $index_cell == 3 or $index_media + 1 == $list_gallery|@count}
            </div>
            {assign var="index_cell" value="-1"}
        {/if}                    

        {assign var="index_cell" value=$index_cell+1}
        {assign var="index_media" value=$index_media+1}                    

      {/foreach}   

       {$pagination}   
      
</div>  
      
