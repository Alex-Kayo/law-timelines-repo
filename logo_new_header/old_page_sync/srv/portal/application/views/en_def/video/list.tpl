
{if $is_news_subsite}
   {include file='news_subsite/newcenter_menu.tpl'}
{/if}
<ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item"><a href="/video/">Медійна бібліотека</a></li>
            <li class="breadcrumb-item active">Відеоматеріали</li>
</ol>
<div>
    <h3 class="page-heading"><span>Відео матеріали</span></h3>
</div>  
<div class="gallery_content">

{*    {include file="main_page/module_filter.tpl" url="video"}*}


    <div class="video-list">

    {assign var="index_media" value="0"}
    {assign var="index_cell" value="0"}
    
{*        <div class="timeline-block strong-block">*}
            {*<div class="timeline-block__date">
                14 грудня 2018
            </div>
            <div class="timeline-block__day">
                п’ятниця
            </div>*}
        
{*            <div class="timeline__conteiner">*}
                <div class="row">
                {foreach item=media_data from=$posts}
                   {* {if $index_cell == 0}
                    <div class="row">

                    {/if}*}


                    {* ===== SMALL =====*}
                    
                    <div class="col-md-4">
                        <div class="multimedia-item__img">
                            <a href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html?{$show_request}" class="play-btn"></a>
                            <img alt="{$media_data->i_name}" src="/uploads/logos/{$media_data->i_logoname}.jpeg" height="100" width="148"/>
                            <div class="time">
                                {$media_data->day}&nbsp;{$media_data->month},&nbsp;{$media_data->year}
                            </div>
                        </div>

                        <h3 class="multimedia-item__heading">
                            <a href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html?{$show_request}">{$media_data->i_name}
                            </a>
                        </h3>
                    </div>
                            
                    {* ===== /SMALL =====*}
       
                {* {if $index_cell == 2 or $index_media + 1 == $list_gallery|@count}
            </div>
            {assign var="index_cell" value="-1"}
                {/if}    *}                

                    {assign var="index_cell" value=$index_cell+1}
                    {assign var="index_media" value=$index_media+1}                    

                {/foreach}   
                </div><!--/row-->
{*            </div><!--/timeline__conteiner-->*}
{*        </div><!--/timeline-block-->*}
        
     
        
        
        
        
        
        
        
    </div> 
    {$pagination}  
</div>
