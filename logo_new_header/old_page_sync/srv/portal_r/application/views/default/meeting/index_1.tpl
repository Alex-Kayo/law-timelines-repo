{literal}
    <script type="text/javascript" src="/sources/js/jquery.cookie.js"></script>
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
    {assign var="paper" value='<a href="/images/awt/.jpg">докладніше</a>'}
{elseif $type_callendar == 3}
    {assign var="method" value='faxiv'}
{elseif $type_callendar == 4}
    {assign var="method" value='stenpog'}
{/if}       

<div id="page">
                        


                {*<ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Головна</a></li>
                    <li class="breadcrumb-item active">Порядки денні пленарних засідань </li>
                </ol>*}

                <div class="page-heading">{$main_title}</div>


                <form class="publications-form" action="{$lang_prefix}/meeting/search">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="form-group">
                                <label>Cкликання</label>
                                <select class="selectpicker" onchange="changeConvocation()" name="search_convocation" id="search_convocation">
                                    <option value="0">Всі скликання</option>
                                    {foreach from=$convocations_data item=convocation key=key}                              
                                        <option value="{$key}">{$convocation.mc_name}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="form-group">
                                <label>Cесії</label>
                                <select class="selec" id="search_session" name="search_session">
                                    <option value="0">Всі сесії</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="form-group">
                                <label>Пошук за назвою </label>
                                <input type="text" class="form-control" value="Будь ласка введіть пошуковий текст">
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-6">
                            <div class="form-group">
                                <label>&nbsp;</label>
                                <button type="submit" class="btn btn-yellow">
                                    <i class="ico-search"></i>
                                    Шукати
                                </button>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- calendar -->
                <div class="b_calendar">
                    <div class="publications-heading__block">
                        <h3>{$session->ms_name} Верховної Ради України {$session->mc_name} </h3>
                        <p class="small-text">({$session->ms_month_start_month} {$session->ms_month_start_year} року  - {$session->ms_month_end_month} {$session->ms_month_end_year} року)</p>
                    </div>

                    <ul class="calendar_list">


                            {foreach from=$months_data item=month}  
{*                        <li>*}
                        {include file="meeting/month.tpl" month="$month"}
{*                        </li>*}
                      {/foreach}
                            
                            


                    </ul>
                    <ul class="b_hint">
                        <li class="b_purple">Погоджувальні ради</li>
                        <li class="b_yellow">Пленарні засідання</li>
                        <li class="b_green">Робота в комітетах, комісіях і фракціях</li>
                        <li class="b_blue">Робота з виборцями</li>
                        <li class="b_red">Година запитань до Уряду</li>
                    </ul>


                    <div class="block_text">

                        {foreach from=$convocations_data item=convocation}  
                        <div class="conv_text"> {$convocation.mc_name} </div>
              
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

