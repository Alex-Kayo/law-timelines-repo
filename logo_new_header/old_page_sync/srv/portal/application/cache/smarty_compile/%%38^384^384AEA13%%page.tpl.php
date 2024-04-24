<?php /* Smarty version 2.6.22, created on 2024-04-04 17:34:26
         compiled from search/page.tpl */ ?>
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
        Результати запиту - "<?php echo $this->_tpl_vars['search_str']; ?>
" <?php echo $this->_tpl_vars['i18n']['results']; ?>
: <?php echo $this->_tpl_vars['total_items']; ?>

    </div>
    
    <ol class="search-result">
<?php $_from = $this->_tpl_vars['posts']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
        <li class="meeting_search_result">
            <div class="search-result__heading">
                <?php if (! $this->_tpl_vars['data']->i_link): ?>
                    <?php if ($this->_tpl_vars['data']->is_video): ?>
                                     <span class="btn-video">Відео</span>
                    <?php endif; ?>
                        <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html?search=<?php echo $this->_tpl_vars['search_str']; ?>
"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a> 
                    <?php else: ?> 
                        <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
"><?php echo $this->_tpl_vars['data']->i_name; ?>
 </a> 
                    <?php endif; ?>
                
            </div>
            <span class="date"><?php echo $this->_tpl_vars['data']->day; ?>
/<?php echo $this->_tpl_vars['data']->month; ?>
/<?php echo $this->_tpl_vars['data']->year; ?>
,&nbsp;<?php echo $this->_tpl_vars['data']->hour; ?>
:<?php echo $this->_tpl_vars['data']->minute; ?>
</span>
        </li>
<?php endforeach; endif; unset($_from); ?>
    </ol><!-- /search result -->
<?php echo $this->_tpl_vars['pagination']; ?>

            </div><!--/col-md-8-->
            
            <div class="col-md-4">
                <form action="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/search" class="search-form" method="get" id="sendForm" >
                            <?php echo $this->_tpl_vars['error']; ?>

                
                        <div class="search-heading">
                            Де шукати?
                        </div>
                    <div class="form-group">
                            <label class="inset"><?php echo $this->_tpl_vars['i18n']['str_search']; ?>
</label>
                            <input name="search" class="form-control" placeholder="Введіть текст свого пошукового запиту" type="text" size="50" value="<?php echo $this->_tpl_vars['search_str']; ?>
"/><span class="warn"><?php echo $this->_tpl_vars['errors']['search']; ?>
</span>                            
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
                                            <?php $_from = $this->_tpl_vars['topics']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                                                <?php if ($this->_tpl_vars['var_data']['topics'] == $this->_tpl_vars['data']->t_id): ?>
                                                    <option value="<?php echo $this->_tpl_vars['data']->t_id; ?>
" selected="true"><?php echo $this->_tpl_vars['data']->t_name; ?>
</option>
                                                <?php else: ?>
                                                    <option value="<?php echo $this->_tpl_vars['data']->t_id; ?>
"><?php echo $this->_tpl_vars['data']->t_name; ?>
</option>
                                                <?php endif; ?>				
                                            <?php endforeach; endif; unset($_from); ?>
                                        </select>
                                    </div>
                        
                        <div class="form-group">
                            <label class="inset">Дата публікації</label>
                            <input type="text" name="date_point" value="<?php echo $this->_tpl_vars['var_data']['date_point']; ?>
" class="datepicker form-control" placeholder="Виберіть дату">
                        </div>
                        <div class="form-group">
                            
                            <?php $this->assign($this->_tpl_vars['var_data']['field_check'], 'checked'); ?>
                            
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field1" value="0" <?php echo $this->_tpl_vars['fcheck0']; ?>
>
                                <label class="form-check-label" for="field1">
                                    Всюди
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field2" value="1" <?php echo $this->_tpl_vars['fcheck1']; ?>
>
                                <label class="form-check-label" for="field2">
                                    У заголовку
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field3" value="2" <?php echo $this->_tpl_vars['fcheck2']; ?>
>
                                <label class="form-check-label" for="field3">
                                    У анонсі
                                </label>
                            </div>

                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="field" id="field4" value="3" <?php echo $this->_tpl_vars['fcheck3']; ?>
>
                                <label class="form-check-label" for="field4">
                                    У тексті
                                </label>
                            </div>
                        </div>


                        <div class="form-group">
                            
                            <?php $this->assign($this->_tpl_vars['var_data']['sort_check'], 'checked'); ?>
                            
                            <div class="search-heading">
                                Сортувати
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="sort" id="sort1" value="2" <?php echo $this->_tpl_vars['scheck2']; ?>
>
                                <label class="form-check-label" for="sort1">
                                    За датою публікації
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="sort" id="sort2" value="1" <?php echo $this->_tpl_vars['scheck1']; ?>
>
                                <label class="form-check-label" for="sort2">
                                    За релевантністю
                                </label>
                            </div>
                            
                        </div>

                                                
                        
                                                 <!--
                    <input type="reset" value="<?php echo $this->_tpl_vars['i18n']['clear']; ?>
" />
                                <input name="submit1" type="submit" value="<?php echo $this->_tpl_vars['i18n']['submit']; ?>
" />
                            -->
                         <input  name="submit_form" type="hidden" value="true" />
                            <a href="#" onclick="$('#sendForm').submit()" class="btn btn-primary">
                                <i class="ico-search"></i>
                                <span><?php echo $this->_tpl_vars['i18n']['submit']; ?>
</span>
                            </a>
                            <input type="hidden" name="from_page_form" id="eventdate" value="1" />
                            
                         </form>
                    </div><!--/col-md-4-->
                    
        </div>
                        
                        <!--/row-->
            
    </div>
    

</div>
    