    <div class="gallery_filtr">
        <div class="category_search">
	    

                
            <form class="publications-form" action="{$lang_prefix}/{$url}/"  method="get">

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
                    <label>Місяць-рік</label>
                    <input type="text" name="date_point_my"  value="{$search_params.date_point_my}" class="datepicker_my datepicker form-control" placeholder="Оберіть місяць та рік">
                </div>

            </div>
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group "name_search">
                        <label>Пошук за назвою</label>
                
                <input type="text" class="form-control" placeholder="Будь ласка введіть пошуковий текст" class="namesearch_input" value="{$search_params.search_substr}" name="search_substr" id="search_substr"/>
                        </div>
                    </div>
                        
                        <div class="col-lg-2 col-md-6">
                <div class="form-group">
                    <label>&nbsp;</label>

                    <input type="submit" class="btn btn-yellow gallerysearch_but" value="Шукати" name="submit">
                </div>
            </div>
                </div>
            </form>
        </div>
    </div>
                        