<ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/">Головна</a></li> 
{*                    <a href="{$lang_prefix}/">Головна</a> *}
                    {foreach item=data from=$path_way}
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/{$data->t_parents}/">{$data->t_name}</a></li>  
                    {/foreach}                    
                    <li class="breadcrumb-item">{$current_node->t_name}</li>
                </ol>
<h3 class="page-heading with-search">
    <span>Фотогалерея</span>
    
    <a class="search-by-link" data-toggle="collapse" href="#collapseSearch" role="button" aria-expanded="false" aria-controls="collapseSearch">
        <i class="ico-search"></i>
        Пошук <span class="mob-hide">у фотоальбомах</span>
    </a>
</h3>  
<div class="gallery_content">

    <div class="collapse" id="collapseSearch">
    {include file="main_page/module_filter.tpl" url="gallery"}
    </div>

    <hr />
    
    <div class="mediagallery-list">
        <div class="grid has-cols-4 has-grid-gap-2 is-dense sub-example">

        {*{assign var="index_media" value="0"}
        {assign var="index_cell" value="0"}*}
           
            {foreach item=media_data from=$list_gallery name=i}
                
             {if $smarty.foreach.i.index == 0}  
            {* ======= BIG STATIC CODE ======= *}
            <div class="has-row-md-3 has-col-md-3">
                    <div class="gallery_item example--item">
                       {*<a href="#"><img src="https://iportal.rada.gov.ua/uploads/gallery_prev/55682.jpeg"></a>*}
                        <a href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html?{$show_request}">
                        <img alt="{$media_data->i_name}" src="/uploads/gallery_prev/{$media_data->filename}" />
                    </a>
                        <a class="item-caption" href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html?{$show_request}">
                        <h3>
                       
                        {$media_data->i_name}
                        
                        {if $media_data->flag_new}
                                <span class="warn">(оновлено)</span>											
                        {/if}

                        </h3>
                        <div class="foto_num">
                            <i class="camera-icn"></i>
                            {$media_data->foto_cnt} фото
                        </div>
                    </a>
                    </div>
                </div>
            {* ======= /BIG STATIC CODE ======= *}
            {elseif $smarty.foreach.i.index == 1}
            {* ======= MEDIUM STATIC CODE ======= *}
            <div class="has-row-md-2 has-col-md-2">
                    <div class="gallery_item example--item">
                       {*<a href="#"><img src="https://iportal.rada.gov.ua/uploads/gallery_prev/55682.jpeg"></a>*}
                        <a href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html?{$show_request}">
                        <img alt="{$media_data->i_name}" src="/uploads/gallery_prev/{$media_data->filename}" />
                    </a>
                        <a class="item-caption" href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html?{$show_request}">
                        <h3>
                       
                        {$media_data->i_name}
                        
                        {if $media_data->flag_new}
                                <span class="warn">(оновлено)</span>											
                        {/if}

                        </h3>
                        <div class="foto_num">
                            <i class="camera-icn"></i>
                            {$media_data->foto_cnt} фото
                        </div>
                    </a>
                    </div>
            </div>
            {* ======= /MEDIUM STATIC CODE ======= *}
            {else}
            {* ======= SMALL ======= *}
       {* {if $index_cell == 0}
            <div class="gallery_row row">
        {/if} *}

            {* ======= SMALL =======*}
            <div class="has-row-md-1 has-col-md-1">
                <div class="gallery_item example--item">

                    <a href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html?{$show_request}">
                        <img alt="{$media_data->i_name}" src="/uploads/gallery_prev/{$media_data->filename}" />
                    </a>

                    {*<div class="date">{$media_data->day}&nbsp;{$media_data->month},&nbsp;{$media_data->year}</div>*}
                    <a class="item-caption" href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html?{$show_request}">
                        <h3>
                       
                        {$media_data->i_name}
                        
                        {if $media_data->flag_new}
                                <span class="warn">(оновлено)</span>											
                        {/if}

                        </h3>
                        <div class="foto_num">
                            <i class="camera-icn"></i>
                            {$media_data->foto_cnt} фото
                        </div>
                    </a>
           
                </div>                    
            </div><!--/has-row-md-1 has-col-md-1-->
            {* ======= /SMALL =======*}

       {* {if $index_cell == 3 or $index_media + 1 == $list_gallery|@count}
            </div>
            {assign var="index_cell" value="-1"}
        {/if}  *}                  
{*
        {assign var="index_cell" value=$index_cell+1}
        {assign var="index_media" value=$index_media+1}*}                    
{/if}
      {/foreach}
      {* ======= SMALL ======= *}
            
            
            
          
    </div>
      
    {$pagination}
</div>  
      
