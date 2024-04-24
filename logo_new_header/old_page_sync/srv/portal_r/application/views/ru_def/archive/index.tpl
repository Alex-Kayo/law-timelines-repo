{literal}
<script type="text/javascript">
        var lang_prefix = '{/literal}{$lang_prefix}{literal}';
    
        $(document).ready(function() {

                $('#archieve_date').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        onSelect: function(dateText, inst) {
                            $('#archive_search').attr('action', lang_prefix + '/archive/' + dateText);
                        }
                });
                {/literal}    
                    {if $sel_day>0 and $sel_month>0 and $sel_year>0} 
                        $("#archieve_date").datepicker("setDate", new Date({$sel_year}, {$sel_month}-1,{$sel_day}));
                    {/if}
                {literal}                      
    
        });
    
    
	$(document).ready(function(){       
	    clickPagination();
	    
	}); 

	function clickPagination(){
	   $('.pages a').click(function(){   
			$.ajax({
				type: "POST",
				data: "ajax_processing=1",
			    url: $(this).attr('href'),
			    success: function (data, textStatus){
			    	$('#list_archive').html(data);
			    	clickPagination();
		    	    return false;
			    }
			});  		
			return false;
	 	
			
		});
		return false;	
	}

</script>
{/literal}

<div class="right_col">
    <!-- information_block -->
<div class="heading">
    <h3><span>Архив</span></h3>
</div>    
<div class="information_block archieve_block">
    {assign var="form_url" value="$lang_prefix/archive"}
    {if $sel_year>0}
        {assign var="form_url" value="$form_url/$sel_year"}
        {if $sel_month>0}
            {assign var="sel_month" value=$sel_month|str_pad:2:'0':$smarty.const.STR_PAD_LEFT}
            {assign var="form_url" value="$form_url/$sel_month"}
                        
            {if $sel_day>0}            
                {assign var="sel_day" value=$sel_day|str_pad:2:'0':$smarty.const.STR_PAD_LEFT}
                {assign var="form_url" value="$form_url/$sel_day"}                                
            {/if}
        {/if}
    {/if}
    
    <form class="jNice" id="archive_search" method="get" action="{$form_url}">
            <div class="archieve_datepicker">
            <div class="datepicker_block">
                <div id="archieve_date"></div>
            </div>    
            <div class="sort_news">
                    <label>Сортировать новости</label>
                <select name="type_sort">
                    <option value="desc">Новые в начале</option>
                    <option value="asc">Новые в конце</option>
                </select>
            </div>
            <div class="show_news">
                    <label>Публикаций на странице</label>
                 <select name="page_count">
                    <option value="10">10</option>
                    <option value="20">50</option>
                    <option value="100">100</option>
                    <option  value="200">200</option>
                </select>
            </div>
            <input type="submit" value="Поиск" />
            <div class="clear"></div>
        </div>    
    </form> 
       
    <div id="list_archive">        
        {include file="archive/list.tpl"}
    </div>
</div>
    <!-- end information_block -->