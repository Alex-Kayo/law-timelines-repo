
<div class="right_col">
    <!-- information_block -->
<div class="heading">

    <h3><span>
        {if $current_node->t_name != "Текстові публікації (UA)"}
        {$current_node->t_name}
        {else} 
        Все текстовые публикации
        {/if}    
    
    </span></h3>
</div>    
<div class="information_block archieve_block">
       
    <div id="list_archive">        

{foreach item=data from=$posts}      
    <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}:{$data->minute}</span>
  {if $data->i_link}
    <div class="news_item">
        <p>{$data->i_name}</p>
        <span class="details"><a href="{$data->i_link}">ссылка</a></span>
    </div>      

  {else}
      
    <div class="news_item">
        {if strlen($data->i_logoname) > 0}
            <img align="left" alt="" src="/uploads/logos_middle/{$data->i_logoname}.jpeg" width="96" height="76"/>
         {/if}
        {*<span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>*}
        <p>{$data->i_name}</p>
 {*       <span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">подробнее</a></span> *}
        <span class="details"><a href="{$data->i_categories}/{$data->i_id}.html">подробнее</a></span>
    </div>      
      

  {/if}  
    
  {/foreach}
  {$pagination}        
        
    </div>
</div>
    <!-- end information_block -->














