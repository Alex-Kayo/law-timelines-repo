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
                            <input name="search" class="form-control" placeholder="Введіть текст свого пошукового запиту" type="text" size="50" value="{$var_data.search}"/><span class="warn">{$errors.search}</span>                            
{*                            <input type="text" class="form-control" placeholder="Введіть текст свого пошукового запиту">*}
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
                        {*<div class="form-group">
                            <label class="inset">Розділ</label>
                            <select class="selectpicker" id="exampleTheme">
                                <option>Усі розділи</option>
                                <option>Пошук за реквізитами</option>
                                <option>Зареєстровані за поточний тиждень</option>
                                <option>Надано народним депутатам</option>
                                <option>Знаходяться на розгляді в комітетах</option>
                                <option>Прийняті на поточній сесії</option>
                            </select>
                        </div>*}
                        {*<div class="form-group">
                            <label class="inset">Тема</label>
                            <select class="selectpicker" id="exampleTheme">
                                <option>Усі теми</option>
                                <option>Пошук за реквізитами</option>
                                <option>Зареєстровані за поточний тиждень</option>
                                <option>Надано народним депутатам</option>
                                <option>Знаходяться на розгляді в комітетах</option>
                                <option>Прийняті на поточній сесії</option>
                            </select>
                        </div>*}
                        <div class="form-group">
                            <label class="inset">Дата публікації</label>
                            <input type="text" name="start" class="datepicker form-control" placeholder="Виберіть дату">
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
                                <label class="form-check-label" for="exampleRadios1">
                                    Всюди
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
                                <label class="form-check-label" for="exampleRadios2">
                                    У заголовку
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios3" value="option3">
                                <label class="form-check-label" for="exampleRadios3">
                                    У анонсі
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios4" value="option4">
                                <label class="form-check-label" for="exampleRadios4">
                                    У тексті
                                </label>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="search-heading">
                                Сортувати
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="Radios" id="exampleRadios6" value="option6" checked>
                                <label class="form-check-label" for="exampleRadios6">
                                    По даті публікації
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="Radios" id="exampleRadios5" value="option5">
                                <label class="form-check-label" for="exampleRadios5">
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
                         </form>
                    </div><!--/col-md-4-->
                    
        </div>
                        
                        <!--/row-->
            
    </div>
    

</div>
    
