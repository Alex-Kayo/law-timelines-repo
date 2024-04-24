{literal}
<script type="text/javascript">
        var lang_prefix = '{/literal}{$lang_prefix}{literal}';
    
        $(document).ready(function() {

                $('#archieve_date').datepicker({
                        changeMonth: true,
                        changeYear: true,
                        monthNamesShort: ['Січень','Лютий','Березень','Квітень','Травень','Червень',
'Липень','Серпень','Вересень','Жовтень','Листопад','Грудень'],
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

{assign var='teststring' value=$baseURL}
{assign var='testsplit' value='/'|explode:$teststring}
{*{$testsplit[2]}<br />
{$testsplit[3]}
{$testsplit[4]}*}

<div class="right_col">
    <!-- information_block -->
<div class="heading">
    <h3><span style="margin-top: -5px;">Усі публікації за {if $testsplit[4]}{$testsplit[4]}.{/if}{$testsplit[3]}.{$testsplit[2]}</span></h3>
    
</div>    

    <div id="calendar_div2"> {include file="archive/callendar.tpl"} </div>   
    <div id="list_archive">        
        {include file="archive/list.tpl"}
    </div>
</div>
    <!-- end information_block -->