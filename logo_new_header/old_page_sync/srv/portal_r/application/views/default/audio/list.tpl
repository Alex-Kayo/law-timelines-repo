<ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item"><a href="/audio/">Медійна бібліотека</a></li>
            <li class="breadcrumb-item active">Аудіо матеріали</li>
</ol>
<div class="heading">
    <h3 class="page-heading"><span>Аудіо матеріали</span></h3>
</div>  
<div class="gallery_content">

    {include file="main_page/module_filter.tpl" url="audio"}


    <div class="gallery_list">

    {assign var="index_media" value="0"}
    {assign var="index_cell" value="0"}
    {foreach item=media_data from=$posts}
        {if $index_cell == 0}
            <div class="gallery_row row">
        {/if}


            <div class="gallery_item col-lg-3 col-sm-6">
                <div class="multimedia-item__img">
                    <img alt="{$media_data->i_name}" src="/uploads/logos/{$media_data->i_logoname}.jpeg" />
                    <span class="time">
                        {$media_data->day}&nbsp;{$media_data->month},&nbsp;{$media_data->year}
                    </span>
                </div>
                
                <div class="multimedia-item__heading">
                    <h3>   
                        <a href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html?{$show_request}">{$media_data->i_name}
                        </a>
                    </h3>
                    
                </div>
            </div>                    

        {if $index_cell == 3 or $index_media + 1 == $list_gallery|@count}
            </div>
            {assign var="index_cell" value="-1"}
        {/if}                    

        {assign var="index_cell" value=$index_cell+1}
        {assign var="index_media" value=$index_media+1}                    

      {/foreach}   
      
    </div>

    {$pagination}   
      
</div>  
      
