<?php /* Smarty version 2.6.22, created on 2024-01-31 13:07:03
         compiled from gallery/module_filter.tpl */ ?>
    <div class="gallery_filtr">
        <div class="category_search">
	    

                
            <form class="publications-form" action="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['url']; ?>
/"  method="get">
                
		                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="form-group category_select">
                   
                    <label>Пошук за категоріями</label>
                    <select class="selectpicker" name="search_topic_id">
                        <option value="0" <?php if ($this->_tpl_vars['search_params']['search_topic_id'] == 0): ?>selected="true"<?php endif; ?>>всі категорії</option>
                        <?php $_from = $this->_tpl_vars['categories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['item']):
?>
                            <option value="<?php echo $this->_tpl_vars['item']['t_id']; ?>
" <?php if ($this->_tpl_vars['search_params']['search_topic_id'] == $this->_tpl_vars['item']['t_id']): ?>SELECTED<?php endif; ?>><?php echo $this->_tpl_vars['item']['t_name']; ?>
</option>
                        <?php endforeach; endif; unset($_from); ?>                            
                    </select>
                </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-6">
                <div class="form-group">
                    <label>Дата</label>
                    <input type="text" name="date_point" class="datepicker form-control" placeholder="Оберіть дату">
                </div>

            </div>
                    
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group "name_search">
                        <label>Пошук за назвою</label>
                
                <input type="text" class="form-control" placeholder="Будь ласка введіть пошуковий текст" class="namesearch_input" value="<?php echo $this->_tpl_vars['search_params']['search_substr']; ?>
" name="search_substr" id="search_substr"/>
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