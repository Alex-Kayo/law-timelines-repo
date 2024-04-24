<div class="container">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Головна</a></li>
        <li class="breadcrumb-item active">Пошук</li>
    </ol>

    <div class="page-heading">
                Пошук по порталу
            </div>
</div>
    
<hr class="full-width light2" />

<div class="search-page">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="search-heading">
        Результати запиту - "{$search_str}" {$i18n.results}: {$total_items}
    </div>
    
    <ol class="search-result">
{foreach item=data from=$posts}
        <li class="meeting_search_result">
            <div class="search-result__heading">
                {if !$data->i_link}
{*                    {$data|@var_dump}*}
                    {if $data->is_video}
                                     <span class="btn-video">Відео</span>
                    {/if}
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
                            Де шукати?
                        </div>
                    <div class="form-group">
                            <label class="inset">{$i18n.str_search}</label>
                            <input name="search" class="form-control" placeholder="Введіть текст свого пошукового запиту" type="text" size="50" value="{$search_str}"/><span class="warn">{$errors.search}</span>                            
{*                            <input type="text" class="form-control" placeholder="Введіть текст свого пошукового запиту">*}
<!-- advanced request -->
                        <div>
                            <div id="advanced" class="collapse advanced-request">
                                <ul>
                                    <li>
                                        У запиті допускається використання логічних сполучників «<b>ТА</b>», «<b>АБО</b>» (великими літерами).
                                        <div class="small-example"><b>Наприклад:</b> Запит «закон АБО постанова» — знайде публікації у яких зустрічаються слово «закон» або слово «постанова». Запит «питання ТА рішення» — знайде публікації у яких зустрічаються слово «питання» та слово «рішення».</div>
                                    </li>
                                    <li>
                                       Зірочка (астеріск) «*» у кінці пошукового слова використовуйте для «наближеного» пошуку.
                                       <div class="small-example"><b>Наприклад:</b> запит «закон» — знайде «закон», а запит «закон*» — знайде «закон, законодавство, законопроект» і т.п. </div>
                                    </li>
                                </ul>
                                
                                <button class="btn btn-blue-light" data-toggle="collapse" data-target="#advanced">Сховати</a>
                            </div>
                            <a href="javascript://" class="search-info" data-toggle="collapse" data-target="#advanced">Дізнайтесь як сформувати розширений запит</a>
                            
                        </div>
                        <!-- /advanced request -->
                        </div>
                        <div class="form-group">
                                        <label>Розділ</label>
                                        <select name="topics" class="selectpicker" id="exampleTheme">
                                            <option value="0">Усі розділи</option>
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
                            <label class="inset">Дата публікації</label>
                            <input type="text" name="date_point" value="{$var_data.date_point}" class="datepicker form-control" placeholder="Виберіть дату">
                        </div>
                        <div class="form-group">
                            
                            {assign var=$var_data.field_check value="checked"}
                            
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field1" value="0" {$fcheck0}>
                                <label class="form-check-label" for="field1">
                                    Всюди
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field2" value="1" {$fcheck1}>
                                <label class="form-check-label" for="field2">
                                    У заголовку
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field3" value="2" {$fcheck2}>
                                <label class="form-check-label" for="field3">
                                    У анонсі
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field4" value="3" {$fcheck3}>
                                <label class="form-check-label" for="field4">
                                    У тексті
                                </label>
                            </div>
                        </div>


                        <div class="form-group">
                            
                            {assign var=$var_data.sort_check value="checked"}
                            
                            <div class="search-heading">
                                Сортувати
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="sort" id="sort1" value="2" {$scheck2}>
                                <label class="form-check-label" for="sort1">
                                    За датою публікації
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="sort" id="sort2" value="1" {$scheck1}>
                                <label class="form-check-label" for="sort2">
                                    За релевантністю
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
    
