<div id="content-all">
  <div class="panel">
    <div class="panel1">
      <div class="panel2">
        <div class="panel-head clr">
          <h3>Пошук публікацій порталу</h3>
        </div>
        <div class="white3-panel">
          <div class="feedback">
          
<form action="{$lang_prefix}/search" method="get" id="sendForm" >
{$error}
<table width="60%" border="0">

	<tr>
		<td colspan="2" align="center">
			{$i18n.header}
		</td>			
	<tr>

	<tr>
	    <td><span class="search_lable">{$i18n.str_search}</span></td>	
		<td><input name="search" type="text" size="50" value="{$var_data.search}"/><br><span class="warn">{$errors.search}</span></td>			
	<tr>
	

	<tr>
	    <td><span class="search_lable">{$i18n.field.description}</span></td>	
		<td>
		<select name="field" value="{$var_data.field}">
			{foreach item=data from=$i18n.field.data key=key}			
					{if $var_data.field==$key}
						<option value="{$key}" selected="true">{$data}</option>
					{else}
						<option value="{$key}">{$data}</option>
					{/if}
			{/foreach}
		</select>
		{$errors.field}
		</td>			
	<tr>		
	
	
	<tr>
	    <td><span class="search_lable">{$i18n.date.description}</span></td>	
		<td>
		
			<select name="date_type">
				{foreach item=data from=$i18n.date.type key=key}
					{if $var_data.date_type==$key}
						<option value="{$key}" selected="true">{$data}</option>
					{else}
						<option value="{$key}">{$data}</option>
					{/if}
				{/foreach}
			</select>		
		
			<select name="year">
				<option value="0"></option>
				{foreach item=data from=$year}
					{if $var_data.year==$data}
						<option value="{$data}" selected="true">{$data}</option>
					{else}
						<option value="{$data}">{$data}</option>
					{/if}				
				{/foreach}
			</select>
			{$errors.year}
			
			<select name="month">
				<option value="0"></option>
				{foreach item=data from=$i18n.date.months key=key}
					{if $var_data.month==$key}
						<option value="{$key}" selected="true">{$data}</option>
					{else}
						<option value="{$key}">{$data}</option>
					{/if}				
				{/foreach}
			</select>
			{$errors.month}		
			
			<select name="day">
				<option value="0"></option>
				{foreach item=data from=$day}
					{if $var_data.day==$data}
						<option value="{$data}" selected="true">{$data}</option>
					{else}
						<option value="{$data}">{$data}</option>
					{/if}					
				{/foreach}
			</select>		
			
		</td>			
	<tr>		

{*	<tr>
		<td>{$i18n.topics_description}</td>	
		<td>		
			<select name="topics">
				<option value="0"></option>
				{foreach item=data from=$topics}
					{if $var_data.topics==$data->t_id}
						<option value="{$data->t_id}" selected="true">{$data->t_name}</option>
					{else}
						<option value="{$data->t_id}">{$data->t_name}</option>
					{/if}				
				{/foreach}
			</select>	
			{$errors.topics_description}	
		</td>			
	<tr>	*}
	
	
	<tr>
	    <td><span class="search_lable">{$i18n.sort.description}</span></td>	
		<td>		
			<select name="sort">
				{foreach item=data from=$i18n.sort.data key=key}
					{if $var_data.sort==$key}
						<option value="{$key}"  selected="true">{$data}</option>
					{else}
						<option value="{$key}">{$data}</option>>
					{/if}				
				{/foreach}
			</select>	
			{$errors.sort}		
		</td>			
	<tr>		
	
	
	<tr>
	    <td></td>	
	    <td colspan="2" align="left">
			<!--
            <input type="reset" value="{$i18n.clear}" />
			<input name="submit1" type="submit" value="{$i18n.submit}" />
            -->
            <input  name="submit_form" type="hidden" value="true" />
            <a href="#" onclick="$('#sendForm').submit()" class="sendcomm"><span>{$i18n.submit}</span></a>
		</td>			
	<tr>
	
</table>

</form>

</div>
      </div>
    </div>
  </div>
</div>