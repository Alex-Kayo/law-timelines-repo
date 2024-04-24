    <div class="gallery_filtr">
        <div class="category_search">
	    

                
            <form class="publications-form" action="{$lang_prefix}/{$url}/"  method="get">
{*                <form action="{$lang_prefix}/{$url}/" class="jNice" method="get">*}
                
		{*
                <input type="submit" class="gallerysearch_but" value="Пошук" name="submit">
		*}
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="form-group category_select">
                   
                    <label>Пошук за категоріями</label>
                    <select class="selectpicker" name="search_topic_id">
                        <option value="0" {if $search_params.search_topic_id == 0}selected="true"{/if}>всі категорії</option>
                        {foreach from=$categories item=item}
                            <option value="{$item.t_id}" {if $search_params.search_topic_id == $item.t_id}SELECTED{/if}>{$item.t_name}</option>
                        {/foreach}                            
                    </select>
                </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                <div class="form-group">
                    <label>Дата</label>
                    <input type="text" name="start" class="datepicker form-control" placeholder="Оберіть дату">
                </div>

            </div>
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group "name_search">
                        <label>Пошук за назвою</label>
                
                <input type="text" class="form-control" value="Будь ласка введіть пошуковий текст" class="namesearch_input" value="{$search_params.search_substr}" name="search_substr" id="search_substr"/>
                        </div>
                    </div>
                        
                        <div class="col-lg-2 col-md-6">
                <div class="form-group">
                    <label>&nbsp;</label>

                    <input type="submit" class="btn btn-yellow gallerysearch_but" value="Шукати" name="submit">
                </div>
            </div>
                </div>
                    
                
                  {* 
                <div class="month_select">
                    <label>Місяць</label> 
                    <select  name="search_month">
                        <option value="0" {if $search_params.search_month == 0}SELECTED{/if}>всі</option>
                        <option value="1" {if $search_params.search_month == 1}SELECTED{/if}>січень</option>
                        <option value="2" {if $search_params.search_month == 2}SELECTED{/if}>лютий</option>
                        <option value="3" {if $search_params.search_month == 3}SELECTED{/if}>березень</option>
                        <option value="4" {if $search_params.search_month == 4}SELECTED{/if}>квітень</option>
                        <option value="5" {if $search_params.search_month == 5}SELECTED{/if}>травень</option>
                        <option value="6" {if $search_params.search_month == 6}SELECTED{/if}>червень</option>
                        <option value="7" {if $search_params.search_month == 7}SELECTED{/if}>липень</option>
                        <option value="8" {if $search_params.search_month== 8}SELECTED{/if}>серпень</option>
                        <option value="9" {if $search_params.search_month == 9}SELECTED{/if}>вересень</option>
                        <option value="10" {if $search_params.search_month == 10}SELECTED{/if}>жовтень</option>
                        <option value="11" {if $search_params.search_month == 11}SELECTED{/if}>листопад</option>
                        <option value="12" {if $search_params.search_month == 12}SELECTED{/if}>грудень</option>
                    </select>
                </div>
                <div class="year_select">
                    <label>Рік</label>
                    {assign var="NowYear" value=$smarty.now|date_format:"%Y"}
                    <select name="search_year">
                        <option value="0" {if $search_params.search_year == 0}SELECTED{/if}>всі</option>                       
                        {section name=year_list loop=$NowYear+1 max=7 step=-1}
                        <option value="{$smarty.section.year_list.index}" {if $search_params.search_year == $smarty.section.year_list.index}SELECTED{/if}>{$smarty.section.year_list.index}</option>
                        {/section}
                    </select>
                </div>*}
		    {*
                </form>
		*}
        
        </div>
        
	    {*
                <form action="{$lang_prefix}/{$url}" class="jNice" method="get">
		*}
                
                </form>
		
    </div>