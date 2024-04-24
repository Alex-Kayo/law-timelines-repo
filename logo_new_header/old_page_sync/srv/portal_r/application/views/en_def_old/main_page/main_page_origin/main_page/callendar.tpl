<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
<div class="rcontent">


<table border="0" cellspacing="0" cellpadding="0" id="calendar-head">
  <tr>
	    <td>
	    	{if !$is_firts_year}	
	    		<a href="javascript:changeMonth('{$lang_prefix}/archive/callendar_main_page/{$prev_year}')">&laquo;{$current_year-1}</a>
	    	{/if}
	    	
	    </td>	    
	    <td>{if $is_current_year}<span class="active">{/if}{$current_year}{if $is_current_year}</span>{/if}</td>
	    <td>
	    	{if !$is_current_year}	
	    		<a href="javascript:changeMonth('{$lang_prefix}/archive/callendar_main_page/{$next_year}')">{$current_year+1}&raquo;</a>
	    	{/if}
	    </td>   	    

	</tr>    
    
    
    <tr>
		<td>
			{if !$is_firts_month}	
				<a href="javascript:changeMonth('{$lang_prefix}/archive/callendar_main_page/{$callendar_header->prev_month}')">&laquo;{$callendar_header->prev_month_name}</a>
			{/if}		
		</td>    
		<td>{if $is_current_month}<span class="active">{/if}{$callendar_header->cur_month_name}{if $is_current_month}</span>{/if}</td>
		<td>
			{if !$is_current_month}	
				<a href="javascript:changeMonth('{$lang_prefix}/archive/callendar_main_page/{$callendar_header->next_month}')">{$callendar_header->next_month_name}&raquo;</a>	
			{/if}	
		</td>				
    </tr>
     
    
  </tr>
</table>
  
  <table border="0" cellspacing="0" cellpadding="0" id="calendar">
    <tr> {foreach item=data from=$name_week_days}
      <th>{$data}</th>
      {/foreach} 
    </tr>
      
      
    {foreach item=data from=$days_list name=day_iter}
    <tr> {section name=day_index start=0 loop=7}
      
      {assign var=num_day value=$data[$smarty.section.day_index.index].num}
      {assign var=count_posts value=$data[$smarty.section.day_index.index].cnt}
      <td>      	      
	      {if $count_posts}
	        {if ($selected_month*100+$num_day) lt $current_day} 
	        	<a href="{$lang_prefix}/archive/{$month_uri}/{$num_day|string_format:"%02d"}" class="passed{if $red_day[$num_day]}-red{/if}" title="{$count_posts}">{$num_day}</a>
	        {elseif ($selected_month*100+$num_day) eq $current_day} 
	        	<a href="{$lang_prefix}/archive/{$month_uri}/{$num_day|string_format:"%02d"}" class="active{if $red_day[$num_day]}-red{/if}" title="{$count_posts}">{$num_day}</a> 
	        {else} 
	        	<a href="{$lang_prefix}/archive/{$month_uri}/{$num_day|string_format:"%02d"}" class="passed{if $red_day[$num_day]}-red{/if}" title="{$count_posts}">{$num_day}</a> 
	        {/if}	
	        
	        {else}
	        
	        {if ($selected_month*100+$num_day) lt $current_day} <span class="passed{if $red_day[$num_day]}-red{/if}">{$num_day}</span> {elseif ($selected_month*100+$num_day) eq $current_day} <span class="active{if $red_day[$num_day]}-red{/if}">{$num_day}</span> {else}	
	        {$num_day}
	        {/if}	
	        
	      {/if} 
       </td>
      {/section} </tr>
    {/foreach}
  </table>
</div>
<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>