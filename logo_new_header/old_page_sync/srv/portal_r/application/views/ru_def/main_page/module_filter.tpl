    <div class="gallery_filtr">
        <div class="category_search">
                <form action="{$lang_prefix}/{$url}/" class="jNice" method="get">
                <label>Пошук за категоріями</label>
                <input type="submit" class="gallerysearch_but" value="Пошук" name="submit">
                <div class="category_select">
                    <select name="search_topic_id">
                        <option value="0" {if $search_params.search_topic_id == 0}selected="true"{/if}>всі категорії</option>
                        {foreach from=$categories item=item}
                            <option value="{$item.t_id}" {if $search_params.search_topic_id == $item.t_id}SELECTED{/if}>{$item.t_name}</option>
                        {/foreach}                            
                    </select>
                </div>
                <div class="month_select">
                    <select name="search_month">
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
                    <select name="search_year">
                        <option value="0" {if $search_params.search_year == 0}SELECTED{/if}>всі</option>                       
                        {section name=year_list start=1990 loop=2030 step=1}
                        <option value="{$smarty.section.year_list.index}" {if $search_params.search_year == $smarty.section.year_list.index}SELECTED{/if}>{$smarty.section.year_list.index}</option>
                        {/section}
                    </select>
                </div>
                </form>
        </div>
        <div class="name_search">
                <form action="{$lang_prefix}/{$url}" class="jNice" method="get">
                <label>Пошук за назвою</label>
                <input type="submit" class="gallerysearch_but" value="Пошук" name="submit">
                <input type="text" class="namesearch_input" value="{$search_params.search_substr}" name="search_substr" id="search_substr"/>
                </form>
        </div>
        <div class="clear"></div>
    </div>