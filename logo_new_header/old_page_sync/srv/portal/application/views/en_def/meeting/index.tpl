


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

{*<div >*}
{*<div id="page">*}
{*      <div class="panel">*}

{*        <div class="panel1">*}
{*          <div class="panel2">*}
{*            <div class="panel-head clr">*}

{*  BreadCrumps      *}
        {if $current_node->t_name}
          
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/">Home</a></li> 
{*                    <a href="{$lang_prefix}/">Головна</a> *}
                    {foreach item=data from=$path_way}
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/{$data->t_parents}/">{$data->t_name}</a></li>  
                    {/foreach}                    
                    <li class="breadcrumb-item">{$current_node->t_name}</li>
                </ol>
                   

        {/if} 

            
            <div class="page-heading with-search">
                {$main_title}
                {*<a class="search-by-link" data-toggle="collapse" href="#collapseSearch" role="button" aria-expanded="false" aria-controls="collapseSearch">
                    <i class="ico-search"></i>
                    Пошук <span class="mob-hide">у порядках денних</span>
                </a>*}
            </div>
{*          </div>*}
              
            {*<div class="grey-wrap">
                <div class="collapse show" id="collapseSearch">
                    <!-- Filter -->
                    <form class="publications-form" action="{$lang_prefix}/meeting/search">
                            <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="form-group">
                                        <label>Пошуковий запит</label>
                            <input class="form-control" type="text" value="" name="search_string" id="search_string"/>
                                    </div>


                            </div>
                            <div class="col-lg-2 col-md-6">
                                    <div class="form-group">
                                        <label>Cесії</label>

                            <select  class="selectpicker" id="search_session" name="search_session">

                                <option value="0">Всі сесії</option>

                            </select>
                                    </div>
                            </div>    
                            <div class="col-lg-2 col-md-6">
                                 <div class="form-group">
                                        <label>Cкликання</label>
                            <select class="selectpicker" onchange="changeConvocation()" name="search_convocation" id="search_convocation">
                                <option value="0">Всі скликання</option>
                                {foreach from=$convocations_data item=convocation key=key}                              
                                    <option value="{$key}">{$convocation.mc_name}</option>
                                {/foreach}
                            </select>
                                </div>   
                            </div>    
                            <input type="hidden" value="{$type_callendar}" name="search_type" id="search_type"/>
                            <div class="col-lg-2 col-md-6">
                                    <div class="form-group">
                                        <label>&nbsp;</label>
                                        <button type="submit" class="btn btn-primary">
                                            Шукати
                                        </button>
                                    </div>
                            </div>    
                            </div>
                        </form>
                        <div class="cc"></div>
                    <!-- Filter end -->              
                </div>
            </div>*}
              
              
            <div class="white3-panel">
              <div class="white3-panel1">
              
                <div class="clr">                

                    
         <!-- calendar -->
                 <div class="b_calendar">
                     {*<div class="session-slide">
                        <a href="#">
                            <i class="icn-arrow-left"></i>
                            9-та сесія
                        </a>
                        <a href="#">
                            11-та сесія
                            <i class="icn-arrow-right"></i>
                        </a>
                    </div>*}
                    <div class="publications-heading__block no-border">
                        <h3>{$session->ms_name} of the Verkhovna Rada of Ukraine {$session->mc_name} </h3>
                        <p class="small-text calendar-icn">{$session->ms_month_start_month} {$session->ms_month_start_year} року  - {$session->ms_month_end_month} {$session->ms_month_end_year} року</p>
                    </div>
                    
                    {*<ul class="b_hint">
                        {foreach from=$day_types item=item_type}
                            <li class="{$item_type->front_style}">{$item_type->name}</li>
                        {/foreach}
                    </ul>*}
                    
                    <div class="b_hint">

                        <div class="form-check">

                            <input class="form-check-input show-all" type="checkbox" name="" id="show-all" value="">
                            <label class="form-check-label" for="show-all">
                                Show All
                            </label>
                        </div>
                        <div class="form-check">

                            <input class="form-check-input" type="checkbox" name="" id="purple" value="_purple">
                            <label class="form-check-label" for="purple">
                                Conciliation Council
                            </label>
                        </div>
                        <div class="form-check">

                            <input class="form-check-input" type="checkbox" name="" id="yellow" value="_yellow">
                            <label class="form-check-label" for="yellow">
                                Plenary meeting
                            </label>
                        </div>
                        <div class="form-check">

                            <input class="form-check-input" type="checkbox" name="" id="red" value="_red">
                            <label class="form-check-label" for="red">
                                Questions to the Government
                            </label>
                        </div>
                        <div class="form-check">

                            <input class="form-check-input" type="checkbox" name="" id="green" value="_green">
                            <label class="form-check-label" for="green">
                                Work on committees, commissions, factions and groups
                            </label>
                        </div>
                        <div class="form-check">

                            <input class="form-check-input" type="checkbox" name="" id="blue" value="_blue">
                            <label class="form-check-label" for="blue">
                                Work with voters
                            </label>
                        </div>
                    </div>
                    
                    <ul class="calendar_list">
                        
                      {foreach from=$months_data item=month}  
                        {include file="meeting/month.tpl" month="$month"}                            
                      {/foreach}
                        

                    </ul>
                    {*<ul class="b_hint">
                        {foreach from=$day_types item=item_type}
                            <li class="{$item_type->front_style}">{$item_type->name}</li>
                        {/foreach}
                    </ul>*}
                                            
                     {if $session->ms_description} 
                        <div class="block_text center">
                           {$session->ms_description} 
                        </div>
                    {/if}
                    
                    <div class="block_text">                     
                      {foreach from=$convocations_data item=convocation}  
                        <div class="conv_text"> {$convocation.mc_name} </div>
              
                          {assign var="count_sessions" value="0"}
                          {foreach from=$convocation.sessions item=session_item}
                              {if $session_item.ms_id != $session->ms_id}                              
                                {assign var="count_sessions" value="$count_sessions+1"}
                                {*
                                {if $count_sessions == 0}  {else} , {/if}
                                *}
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

   {*<script type="text/javascript" src="/sources/js/jquery.cookie.js"></script>*}
 {literal}
    

    
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
               $('.selectpicker').selectpicker('refresh'); // !Важливо mirs
          //    $.jNice.SelectUpdate(element);  
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


        $( document ).ready(function() {

        /* --- calendar --- */
        var sections = $('.calendar_list td');
        
     //   $(".show-all").prop( "checked", true );

        $('.show-all').click(function()
        {
        $(".b_hint :checkbox").prop( "checked", false );
                updateContentVisibility();
         //   if ($(this).is(':checked')) {
         //       $(".calendar_list").addClass('show-all');
         //   } else {
         //       $(".calendar_list").removeClass('show-all');
         //   }
        });

        function updateContentVisibility(){
            var checked = $(".b_hint :checkbox:not('.show-all'):checked");
            if(checked.length > 0){
                sections.addClass('td-disable');
                checked.each(function(){
                    $("[class*='" + $(this).val() + "']").removeClass('td-disable').addClass('td-checked');

                });
            } else {
                sections.removeClass('td-disable');
            }
        }

        $(".b_hint :checkbox").click(updateContentVisibility);
        //updateContentVisibility();
        /* --- /calendar --- */
    });
    </script>
{/literal}
