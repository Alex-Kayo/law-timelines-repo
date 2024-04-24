
<div class="right_col">
    <!-- information_block -->
<div class="heading">

    <h3><span>{$current_node->t_name}</span></h3>
</div>    
<div class="information_block archieve_block">
       
    <div id="list_archive">   
{foreach item=data from=$posts}      
{*    {$posts|@print_r}*}
{*{$data->i_categories|truncate:9:""}*}
  {if $data->i_link}
    <div class="news_item">
        {if strlen($data->i_logoname) > 0}
            {if $data->i_categories|truncate:9:"" == 'documents'}
                <div><img align="left" alt="" src="/uploads/logos_middle/{$data->i_logoname}.jpeg" /></div>
            {else}
            <img align="left" alt="" src="/uploads/logos_middle/{$data->i_logoname}.jpeg" />
            {/if}
         {/if}
         {if $data->hour !== "00" } {*Mirs не виводити дату якщо час публікації 00:00 - 00:59*}
        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}&nbsp;{$data->hour}:{$data->minute}</span>
         {/if}
        <p>{$data->i_name}</p>
        <span class="details"><a href="{$data->i_link}">посилання</a></span>
    </div>      

  {else}
      
    <div class="news_item">
        {if strlen($data->i_logoname) > 0}
            {if $data->i_categories|truncate:9:"" == 'documents'}
                <div><img align="left" alt="" src="/uploads/logos_middle/{$data->i_logoname}.jpeg" /></div>
            {else}
            <img align="left" alt="" src="/uploads/logos_middle/{$data->i_logoname}.jpeg" />
            {/if}
         {/if}
        {if $data->hour !== "00" } {*Mirs не виводити дату якщо час публікації 00:00 - 00:59*}
        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}&nbsp;{$data->hour}:{$data->minute}</span>
         {/if}
        <p>{$data->i_name}</p>
        <span class="details"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">докладніше</a></span>
    </div>      
      

  {/if}  
    
  {/foreach}
  {$pagination}        
        
    </div>
</div>
    <!-- end information_block -->
</div>
<!-- /right_col -->














