{literal}
    <script type="text/javascript" src="/sources{/literal}{$th_folder}{literal}/main_page/jquery.cookie.js"></script>
    <script type="text/javascript">
        var convocation_data = {/literal}{$convocations_json}{literal};
        
        var changeConvocation = function(){         
               var element = $('#search_session')[0];
               for (i = element.options.length - 1; i>0; i--) {
                   element.remove(i);
               }       
                  
               var val = $('#search_convocation').val();   
               if(typeof(convocation_data[val]) != 'undefined'){
                   for(var i=0; i<convocation_data[val].length; i++){
                       element.options[i+1] = new Option(convocation_data[val][i].ms_name, convocation_data[val][i].ms_id, false);
                   }
               }		
               $.jNice.SelectUpdate(element);  
        };
        
   
        
        
        $(function(){
            
            $('div.b_calendar td a.sel_day').click(function(){
                if($(this).parents('td').find('div').css('display') == 'none'){
                   $('div.b_calendar td div').hide();
                   $(this).parents('td').find('div').show();    
                }else{
                    $('div.b_calendar td div').hide();
                }                
                return false;
            });
               
               
            $('#submit').click(function(){               
                $.cookie('meeting_search_convocation', $('#search_convocation').val());
                $.cookie('meeting_search_session', $('#search_session').val());
                $.cookie('meeting_search_string', $('#search_string').val());                
            });
                
             
            
                
            var val_tmp = Number($.cookie('meeting_search_convocation'));
            if(val_tmp > 0){
                 $('#search_convocation').val(val_tmp);                
                 $('#search_convocation').parent().find('.jNiceSelectText').html($('#search_convocation option[value="'+val_tmp+'"]').html());
            }
            changeConvocation();       
                
                
            var val_tmp = Number($.cookie('meeting_search_session'));
            if(val_tmp > 0){
                $('#search_session').val(val_tmp); 
                $('#search_session').parent().find('.jNiceSelectText').html($('#search_session option[value="'+val_tmp+'"]').html());
            }                
                
            var val_tmp = $.cookie('meeting_search_string');
            if(val_tmp.length > 0){
                $('#search_string').val(val_tmp); 
            }                                
            

            
        });

    </script>
{/literal}


{if $type_callendar == 1}
    {assign var="method" value='stenogr'}
{elseif $type_callendar == 2}
    {assign var="method" value='awt'}
{elseif $type_callendar == 3}
    {assign var="method" value='faxiv'}
{/if}

<div id="content-all">
      <div class="panel">

        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr">

            
              <h3>{$main_title}</h3>
              </div>
              

            <!-- Filter -->
                <div id="b_filter">
                <form action="{$lang_prefix}/meeting/search">
                <ul>
                    <li class="filter_sklyk jNice">
                    <select class="form-select" onchange="changeConvocation()" name="search_convocation" id="search_convocation">
                        <option value="0">Всі скликання</option>
                        {foreach from=$convocations_data item=convocation key=key}                              
                            <option value="{$key}">{$convocation.mc_name}</option>
                        {/foreach}
                    </select>
                    </li>
                    <li class="filter_sesiya jNice">
                    <select class="form-select" id="search_session" name="search_session">
                        <option value="0">Всі сесії</option>
                    </select>
                    </li>
                    <li class="filter_search filter_search_small">
                    <input class="form-search-text" type="text" value="" name="search_string" id="search_string"/>
                    <input type="hidden" value="{$type_callendar}" name="search_type" id="search_type"/>
                    <input class="form-search-submit" type="submit" value="Знайти" name="submit" id="submit"/>
                    </li>
                </ul>
                </form>
                </div>
                <div class="cc"></div>
            <!-- Filter end -->              

              
              
            <div class="white3-panel">
              <div class="white3-panel1">
              
                <div class="clr">                

                    
         <!-- calendar -->
                 <div class="b_calendar">
                    <h3>{$session->ms_name} Верховної Ради України {$session->mc_name} ({$session->ms_month_start_month} - {$session->ms_month_end_month} {$session->ms_month_end_year} року)</h3>
                    <ul class="calendar_list">
                        
                      {foreach from=$months_data item=month}  
                        {include file="meeting/month.tpl" month="$month"}                            
                      {/foreach}
                        

                    </ul>
                    <ul class="b_hint">
                      <li class="b_yellow">Пленарні засідання</li>
                      <li class="b_green">Робота в комітетах і фракціях</li>
                      <li class="b_blue">Робота у виборчих округах</li>
                    </ul>
                                            
                     {if $session->ms_description} 
                        <div class="block_text center">
                           {$session->ms_description} 
                        </div>
                    {/if}
                    
                    <div class="block_text">                     
                      {foreach from=$convocations_data item=convocation}  
                          {$convocation.mc_name}
                          
                          {assign var="count_sessions" value="0"}
                          {foreach from=$convocation.sessions item=session_item}
                              {if $session_item.ms_id != $session->ms_id}                              
                                {assign var="count_sessions" value="$count_sessions+1"}
                                {if $count_sessions == 0} - {else} , {/if}
                                <a href="{$lang_prefix}/meeting/{$method}/{$session_item.ms_id}" class="blue">{$session_item.ms_name}</a>
                              {/if}
                          {/foreach}
                          <br />                          
                      {/foreach}                        
                    </div>
                 </div>
         <!-- calendar end -->
                    
                    
                    
                    
                    
                    
                </div>
                
                
              </div>
            </div>
          </div>
        </div>
        
        
        
      </div>
</div>

