<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item active">Search</li>
</ol>

<div id="content-all">
    <div class="panel">
        <div class="panel1">
            <div class="panel2">
                <div class="panel-head clr">
                    <h3 class="page-heading">Search for portal posts</h3>
                </div>
                <hr>

                <div class="white3-panel">
                    <div class="feedback">

                        <form action="{$lang_prefix}/search" class="search-form" method="get" id="sendForm" >
                            {$error}

                            <div class="row">
                                <!-- col-md-8 -->
                                <div class="col-md-8">
                                    {*                 {$i18n.header} *}

                                    <div class="form-group">
                                        <label class="search_lable">
                                            {$i18n.str_search}
                                            <small>(minimum 3 characters)</small>
                                        </label>

                                        <input name="search" class="form-control" placeholder="Please enter a search text" type="text" size="50" value="{$var_data.search}"/><span class="warn">{$errors.search}</span>
                                        
                                        <!-- advanced request -->
                        <a href="javascript://" class="search-info" data-toggle="collapse" data-target="#advanced">Learn how to generate an advanced query</a>
                            
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
     
                            </div>
                        <!-- /advanced request -->
                                    </div>
                                    
                                    

                                    {*<div class="form-group">
                                    <label>Розділ</label>
                                    <select class="selectpicker">
                                    {foreach item=data from=$i18n.field.data key=key}			
                                    {if $var_data.field==$key}
                                    <option value="{$key}" selected="true">{$data}</option>
                                    {else}
                                    <option value="{$key}">{$data}</option>
                                    {/if}
                                    {/foreach}
                                    </select>
                                    </div>*}

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
                                        <label>Date of publication</label>
                                        <div class="form-group">

                                        <div class="form-check display-inline">
                                            
                                            <input class="form-check-input" type="radio" name="date_type" id="date_type" value="1" checked >
                                            <label class="form-check-label" for="date_type" for="date_type">
                                                Is equal
                                            </label>
                                        </div>
                                        <div class="form-check display-inline">    
                                            
                                            <input class="form-check-input" type="radio" name="date_type" id="date_type1" value="2" >
                                            <label class="form-check-label" for="date_type1">
                                                Earlier than
                                            </label>
                                        </div>
                                        <div class="form-check display-inline">
                                            <input class="form-check-input" type="radio" name="date_type" id="date_type2" value="3">
                                            <label class="form-check-label" for="date_type2">
                                                Later
                                            </label>
                                        </div>

                                        {*<div class="form-check">
                                            
                                        </div>

                                        <div class="form-check">
                                            
                                        </div>*}

                                    </div>
                                        <input type="text" name="date_point" class="en-datepicker form-control" data-date-end-date="0d" placeholder="If necessary, select a date">
                                    </div>
                                        
                                        
                                        
                                </div>
                                        
                                <!-- /col-md-8 -->

                                <!-- col-md-4 -->
                                <div class="col-md-4">

                                    <div class="form-group">
                                        <label>Search location</label>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="field" id="exampleRadios1" value="0" checked>
                                            <label class="form-check-label" for="exampleRadios1">
                                                Throughout
                                            </label>
                                        </div>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="field" id="exampleRadios2" value="1">
                                            <label class="form-check-label" for="exampleRadios2">
                                                In the title
                                            </label>
                                        </div>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="field" id="exampleRadios3" value="2">
                                            <label class="form-check-label" for="exampleRadios3">
                                                In the announcement
                                            </label>
                                        </div>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="field" id="exampleRadios4" value="3">
                                            <label class="form-check-label" for="exampleRadios4">
                                                In the text
                                            </label>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label>Sorting</label>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="sort" id="exampleRadios5" value="2" checked>
                                            <label class="form-check-label" for="exampleRadios5">
                                                By date of publication
                                            </label>
                                        </div>
                                        
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="sort" id="exampleRadios6" value="1" >
                                            <label class="form-check-label" for="exampleRadios6">
                                                By relevance
                                            </label>
                                        </div>


                                    </div>


                                </div>
                                <!-- /col-md-4 -->

                            </div>
                            <!--
                    <input type="reset" value="{$i18n.clear}" />
                                <input name="submit1" type="submit" value="{$i18n.submit}" />
                            -->
                            <input  name="submit_form" type="hidden" value="true" />
                            <a href="#" onclick="$('#sendForm').submit()" class="btn btn-yellow sendcomm">
                                <i class="ico-search"></i>
                                <span>{$i18n.submit}</span>
                            </a>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>