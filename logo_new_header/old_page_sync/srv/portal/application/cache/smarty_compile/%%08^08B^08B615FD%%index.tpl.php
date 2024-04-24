<?php /* Smarty version 2.6.22, created on 2024-04-08 08:51:55
         compiled from search/index.tpl */ ?>
<ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Головна</a></li>
    <li class="breadcrumb-item active">Пошук</li>
</ol>

<div id="content-all">
    <div class="panel">
        <div class="panel1">
            <div class="panel2">
                <div class="panel-head clr">
                    <h3 class="page-heading">Пошук публікацій порталу</h3>
                </div>
                <hr>

                <div class="white3-panel">
                    <div class="feedback">

                        <form action="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/search" class="search-form" method="get" id="sendForm" >
                            <?php echo $this->_tpl_vars['error']; ?>


                            <div class="row">
                                <!-- col-md-8 -->
                                <div class="col-md-8">
                                    
                                    <div class="form-group">
                                        <label class="search_lable">
                                            <?php echo $this->_tpl_vars['i18n']['str_search']; ?>

                                            <small>(мінімум 3 символи)</small>
                                        </label>

                                        <input name="search" class="form-control" placeholder="Будь ласка введіть пошуковий текст" type="text" size="50" value="<?php echo $this->_tpl_vars['var_data']['search']; ?>
"/><span class="warn"><?php echo $this->_tpl_vars['errors']['search']; ?>
</span>
                                        
                                        <!-- advanced request -->
                        <a href="javascript://" class="search-info" data-toggle="collapse" data-target="#advanced">Дізнайтесь як сформувати розширений запит</a>
                            
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
                                        <label>Дата публікації</label>
                                        <div class="form-group">

                                        <div class="form-check display-inline">
                                            
                                            <input class="form-check-input" type="radio" name="date_type" id="date_type" value="1" checked >
                                            <label class="form-check-label" for="date_type" for="date_type">
                                                Дорівнює
                                            </label>
                                        </div>
                                        <div class="form-check display-inline">    
                                            
                                            <input class="form-check-input" type="radio" name="date_type" id="date_type1" value="2" >
                                            <label class="form-check-label" for="date_type1">
                                                Раніше ніж
                                            </label>
                                        </div>
                                        <div class="form-check display-inline">
                                            <input class="form-check-input" type="radio" name="date_type" id="date_type2" value="3">
                                            <label class="form-check-label" for="date_type2">
                                                Пізніше за
                                            </label>
                                        </div>

                                        
                                    </div>
                                        <input type="text" name="date_point" class="datepicker form-control" data-date-end-date="0d" placeholder="При потребі оберіть дату">
                                    </div>
                                        
                                        
                                        
                                </div>
                                        
                                <!-- /col-md-8 -->

                                <!-- col-md-4 -->
                                <div class="col-md-4">

                                    <div class="form-group">
                                        <label>Місце пошуку</label>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="field" id="exampleRadios1" value="0" checked>
                                            <label class="form-check-label" for="exampleRadios1">
                                                Всюди
                                            </label>
                                        </div>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="field" id="exampleRadios2" value="1">
                                            <label class="form-check-label" for="exampleRadios2">
                                                У заголовку
                                            </label>
                                        </div>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="field" id="exampleRadios3" value="2">
                                            <label class="form-check-label" for="exampleRadios3">
                                                У анонсі
                                            </label>
                                        </div>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="field" id="exampleRadios4" value="3">
                                            <label class="form-check-label" for="exampleRadios4">
                                                У тексті
                                            </label>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label>Сортування</label>

                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="sort" id="exampleRadios5" value="2" checked>
                                            <label class="form-check-label" for="exampleRadios5">
                                                За датою публікації
                                            </label>
                                        </div>
                                        
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="sort" id="exampleRadios6" value="1" >
                                            <label class="form-check-label" for="exampleRadios6">
                                                За релевантністю
                                            </label>
                                        </div>


                                    </div>


                                </div>
                                <!-- /col-md-4 -->

                            </div>
                            <!--
                    <input type="reset" value="<?php echo $this->_tpl_vars['i18n']['clear']; ?>
" />
                                <input name="submit1" type="submit" value="<?php echo $this->_tpl_vars['i18n']['submit']; ?>
" />
                            -->
                            <input  name="submit_form" type="hidden" value="true" />
                            <a href="#" onclick="$('#sendForm').submit()" class="btn btn-yellow sendcomm" title="Пошук публікацій">
                                <i class="ico-search"></i>
                                <span><?php echo $this->_tpl_vars['i18n']['submit']; ?>
</span>
                            </a>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>