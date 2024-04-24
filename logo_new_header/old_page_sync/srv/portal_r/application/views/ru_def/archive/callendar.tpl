{literal}
<script type="text/javascript">

	var get_param = {'type_sort': '{/literal}{$type_sort}{literal}', 'page_count': {/literal}{$page_count}{literal}};
	var cur_base_url = '{/literal}{$baseURL}{literal}';			

	$(document).ready(function(e) {		
		$('#yeardropdcown').val('{/literal}{$current_year}{literal}');
		$('#monthdropdcown').val('{/literal}{$current_month}{literal}');
		$('#type_sort').val('{/literal}{$type_sort}{literal}');
		$('#page_count').val('{/literal}{$page_count}{literal}');
	   }
		   
	)

	function sel_year(val){
		var cur_month = '{/literal}{$selected_month}{literal}';	
		document.location = '{/literal}{$lang_prefix}{literal}/archive/' + val + '/' + cur_month.substr(4) + '{/literal}{$get_param}{literal}';
		
	}


	function sel_month(val){
		var cur_year = '{/literal}{$current_year}{literal}';	
		document.location = '{/literal}{$lang_prefix}{literal}/archive/' + cur_year + '/' + val + '{/literal}{$get_param}{literal}';
		
	}	
	
	
	function sel_sort(val){		
		document.location = cur_base_url + '?type_sort=' + val + '&page_count=' + get_param.page_count;		

	
	}	

	function sel_page(val){		
		document.location = cur_base_url + '?type_sort=' + get_param.type_sort + '&page_count=' + val;		
	}		
	
	
	
</script>	
{/literal}

<!--
 <select id="type_sort" style="width:60px;" onchange="sel_sort(this.value)">
	 	<option value="desc">DESC</option>
	 	<option value="asc">ASC</option>
 </select>	

  <select id="page_count" style="width:60px;" onchange="sel_page(this.value)">
	 	<option value="10">10</option>
	 	<option value="50">50</option>
	 	<option value="100">100</option>
	 	<option value="200">200</option>	 	
 </select>
 -->	
 
<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b>
<div class="rcontent">

<table>
	<tr><td>

	<table border="0" cellspacing="0" cellpadding="0" id="calendar-head2">
	  <tr>
		<td>
			{if !$is_firts_month}	
				<a href="{$lang_prefix}/archive/{$callendar_header->prev_month_url}{$get_param}">&laquo;&nbsp;{$callendar_header->prev_month_name}</a>
			{/if}
			
		</td>
		
		
		<td class="calendar_month">	
			 <select id="monthdropdcown" style="width:90px;" onchange="sel_month(this.value)">
			   	 {foreach item=data from=$month_list}           	 	   	 
			   	 	<option value="{$data->month_number}"  {if $current_month eq $data->month_number}selected{/if}>{$data->month_name}</option>
			  	 {/foreach} 
			 </select>	
		</td>		
		
		
		
		<td class="calendar_year">	
			 <select id="yeardropdcown" style="width:60px;" onchange="sel_year(this.value)">
			   	 {foreach item=data from=$year_posts}           	 	   	 
			   	 	<option value="{$data->year}"  {if $sel_year eq $data->year}selected{/if}>{$data->year}</option>
			  	 {/foreach} 
			 </select>	
		</td>
		
		
		<td>
			{if !$is_current_month}			
				<a href="{$lang_prefix}/archive/{$callendar_header->next_month_url}{$get_param}">{$callendar_header->next_month_name}&nbsp;&raquo;</a>	
			{/if}	
		</td>
	  </tr>
	</table>
	
	<table border="0" cellspacing="0" cellpadding="0" id="calendar2">
		<tr>
			{foreach item=data from=$name_week_days}
				<th>{$data}</th>
			{/foreach}	
		</tr>
	
			
		{foreach item=data from=$days_list}
			<tr>
				{section name=day_index start=0 loop=7}
					 
					{assign var=num_day value=$data[$smarty.section.day_index.index].num}
					{assign var=count_posts value=$data[$smarty.section.day_index.index].cnt}
				
			      <td>
				      {if $count_posts}
				        {if ($selected_month*100+$num_day) lt $current_day} 
				        	<a href="{$lang_prefix}/archive/{$month_uri}/{$num_day|string_format:"%02d"}{$get_param}" class="passed{if $red_day[$num_day]}-red{/if}" title="{$count_posts}">{if $num_day eq $sel_day}<span class="active-red">{$num_day}</span>{else}{$num_day}{/if}</a>
				        {elseif ($selected_month*100+$num_day) eq $current_day} 
				        	<a href="{$lang_prefix}/archive/{$month_uri}/{$num_day|string_format:"%02d"}{$get_param}" class="active{if $red_day[$num_day]}-red{/if}" title="{$count_posts}">{if $num_day eq $sel_day}<span class="active-red">{$num_day}</span>{else}{$num_day}{/if}</a> 
				        {else} 
				        	<a href="{$lang_prefix}/archive/{$month_uri}/{$num_day|string_format:"%02d"}{$get_param}" class="passed{if $red_day[$num_day]}-red{/if}" title="{$count_posts}">{if $num_day eq $sel_day}<span class="active-red">{$num_day}</span>{else}{$num_day}{/if}</a> 
				        {/if}	
				        
				        {else}
				        
				        {if ($selected_month*100+$num_day) lt $current_day} <span class="passed{if $red_day[$num_day]}-red{/if}">{$num_day}</span> {elseif ($selected_month*100+$num_day) eq $current_day} <span class="active{if $red_day[$num_day]}-red{/if}">{$num_day}</span> {else}	
				        
				        	{if $num_day eq $sel_day}<span class="active-red">{$num_day}</span>{else}{$num_day}{/if}
				        
				        
				        {/if}	
				        
				      {/if} 
			       </td>		 
	
			
				
				{/section}
			</tr>
		{/foreach}
		
	</table>

</td>

<td id="sort_block">
	<table id="table_sort_block" >
		<tr><td>		
			 Сортировать новости<br />		
			 <select id="type_sort" onchange="sel_sort(this.value)">
				 	<option value="desc">Новые в начале</option>
				 	<option value="asc">Новые в конце</option>
			 </select>			
		</td></tr>
		
		<tr><td>		
		  Публикай на странице<br />
		  <select id="page_count" onchange="sel_page(this.value)">
			 	<option value="10">10</option>
			 	<option value="50">50</option>
			 	<option value="100">100</option>
			 	<option value="200">200</option>	 	
			 	<option value="9999999">Все найденые</option>	 	
		  </select>		
		</td></tr>
	
	
	</table>
</td>

</table>


</div>
<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>