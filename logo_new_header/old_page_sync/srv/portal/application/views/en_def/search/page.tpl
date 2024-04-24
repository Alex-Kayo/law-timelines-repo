<div class="container">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active">Search</li>
    </ol>

    <div class="page-heading">
                Search the portal
            </div>
</div>
    
<hr class="full-width light2" />

<div class="search-page">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="search-heading">
        Results of the request - "{$search_str}" {$i18n.results}: {$total_items}
    </div>
    
    <ol class="search-result">
{foreach item=data from=$posts}
        <li class="meeting_search_result">
            <div class="search-result__heading">
                {if !$data->i_link}
                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html?search={$search_str}">{$data->i_name}</a> 
                    {else} 
                        <a href="{$data->i_link}">{$data->i_name} </a> 
                    {/if}
                
            </div>
            <span class="date">{$data->day}/{$data->month}/{$data->year},&nbsp;{$data->hour}:{$data->minute}</span>
        </li>
{/foreach}
    </ol><!-- /search result -->
{$pagination}
            </div><!--/col-md-8-->
            
            <div class="col-md-4">
                <form action="{$lang_prefix}/search" class="search-form" method="get" id="sendForm" >
                            {$error}
                
                        <div class="search-heading">
                            Where to search?
                        </div>
                    <div class="form-group">
                            <label class="inset">{$i18n.str_search}</label>
                            <input name="search" class="form-control" placeholder="Enter the text of your search" type="text" size="50" value="{$search_str}"/><span class="warn">{$errors.search}</span>                            
{*                            <input type="text" class="form-control" placeholder="Введіть текст свого пошукового запиту">*}
<!-- advanced request -->
                        <div>
                            <div id="advanced" class="collapse advanced-request">
                                <ul>
                                    <li>
                                        The request allows the use of logical connectors «<b>AND</b>», «<b>OR</b>» (capital letters).
                                        <div class="small-example"><b>For example:</b> Query "law OR ordinance" - will find publications that contain the word "law" or the word "ordinance".  Query "Question and Decision" - will find publications that contain the word "question" and the word "solution".</div>
                                    </li>
                                    <li>
                                       Use the asterisk (*) at the end of the search term for an "approximate" search.
                                       <div class="small-example"><b>For example:</b> query "bill No.2490-1" - will find "bill No.2490-1", and query "bill No.24*" — will find "bill No.2490-1, bill No.2432, Bill No.2419" and etc.</div>
                                    </li>
                                </ul>
                                
                                <button class="btn btn-blue" data-toggle="collapse" data-target="#advanced">To hide</a>
                            </div>
                            <a href="javascript://" class="search-info" data-toggle="collapse" data-target="#advanced">Learn how to generate an advanced query</a>
                            
                        </div>
                        <!-- /advanced request -->
                        </div>
                        <div class="form-group">
                                        <label>Section</label>
                                        <select name="topics" class="selectpicker" id="exampleTheme">
                                            <option value="0">All sections</option>
                                            {foreach item=data from=$topics}
                                                {if $var_data.topics==$data->t_id}
                                                    <option value="{$data->t_id}" selected="true">{$data->t_name}</option>
                                                {else}
                                                    <option value="{$data->t_id}">{$data->t_name}</option>
                                                {/if}				
                                            {/foreach}
                                        </select>
                                    </div>
                        
                        <div class="form-group">
                            <label class="inset">Date of publication</label>
                            <input type="text" name="date_point" value="{$var_data.date_point}" class="en-datepicker form-control" data-date-end-date="0d" placeholder="Please select a date">
                        </div>
                        <div class="form-group">
                            
                            {assign var=$var_data.field_check value="checked"}
                            
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field1" value="0" {$fcheck0}>
                                <label class="form-check-label" for="field1">
                                    Throughout
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field2" value="1" {$fcheck1}>
                                <label class="form-check-label" for="field2">
                                    In the title
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field3" value="2" {$fcheck2}>
                                <label class="form-check-label" for="field3">
                                    In the announcement
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field4" value="3" {$fcheck3}>
                                <label class="form-check-label" for="field4">
                                    In the text
                                </label>
                            </div>
                        </div>


                        <div class="form-group">
                            
                            {assign var=$var_data.sort_check value="checked"}
                            
                            <div class="search-heading">
                                Sorting
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="sort" id="sort1" value="2" {$scheck2}>
                                <label class="form-check-label" for="sort1">
                                    By date of publication
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="sort" id="sort2" value="1" {$scheck1}>
                                <label class="form-check-label" for="sort2">
                                    By relevance
                                </label>
                            </div>
                            
                        </div>

                        {*<button class="btn btn-blue">Оновити результати</button>*}
                        
                        
                        {*<button type="submit" class="btn btn-primary">
                                Шукати
                        </button>*}
                         <!--
                    <input type="reset" value="{$i18n.clear}" />
                                <input name="submit1" type="submit" value="{$i18n.submit}" />
                            -->
                         <input  name="submit_form" type="hidden" value="true" />
                            <a href="#" onclick="$('#sendForm').submit()" class="btn btn-primary">
                                <i class="ico-search"></i>
                                <span>{$i18n.submit}</span>
                            </a>
                            <input type="hidden" name="from_page_form" id="eventdate" value="1" />
                            
                         </form>
                    </div><!--/col-md-4-->
                    
        </div>
                        
                        <!--/row-->
            
    </div>
    

</div>
    
