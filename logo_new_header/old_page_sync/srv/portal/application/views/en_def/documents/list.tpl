{if $is_news_subsite}
   {include file='news_subsite/newcenter_menu.tpl'}
{/if}

{if $current_node->t_name}

                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/">Home</a></li> 
{*                    <a href="{$lang_prefix}/">Головна</a> *}
                    {foreach item=data from=$path_way}
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/{$data->t_parents}/">{$data->t_name}</a></li>  
                    {/foreach}                    
                    <li class="breadcrumb-item">{$current_node->t_name}</li>
                </ol>                 

        {/if}  


<div class="right_col">
    <!-- information_block -->
<div class="page-heading">

    <h3>
        {if $current_node->t_name == "Текстові публікації (UA)"}
        {$current_node->t_name}
        {else} 
        Усі текстові публікації
        {/if}    
    
    </h3>
</div>    

 <!-- form -->
{*<form class="publications-form">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label for="exampleCategory">Категорії</label>
                    <select class="selectpicker" id="exampleCategory">
                        <optgroup label="Первинна категорія 1">
                            <option class="ttt">Вторинна категорія 1</option>
                            <option>Вторинна категорія 2</option>
                            <option>Вторинна категорія 3</option>
                            <option>Вторинна категорія 4</option>
                            <option>Вторинна категорія 5</option>
                        </optgroup>
                        <optgroup label="Первинна категорія 2">
                            <option>Вторинна категорія 1</option>
                            <option>Вторинна категорія 2 Вторинна категорія Вторинна категорія</option>
                            <option>Вторинна категорія 3</option>
                            <option>Вторинна категорія 4</option>
                            <option>Вторинна категорія 5</option>
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="exampleTheme">Теми публікацій</label>
                    <select class="selectpicker" id="exampleTheme">
                        <option>Усі теми</option>
                        <option>Пошук за реквізитами</option>
                        <option>Правила оформлення проектів законів та основні вимоги законодавчої техніки</option>
                        <option>Зареєстровані за поточний тиждень</option>
                        <option>Надано народним депутатам</option>
                        <option>Знаходяться на розгляді в комітетах</option>
                        <option>Прийняті на поточній сесії</option>
                    </select>
                </div>
            </div>
            <div class="col-md-2 col-6">
                <div class="form-group">
                    <label>Дата або період</label>
                    <input type="text" name="start" class="datepicker form-control" placeholder="Оберіть дату">
                </div>

            </div>
            <div class="col-md-2 col-6">
                <div class="form-group">
                    <label>по</label>
                    <input type="text" name="end" class="datepicker form-control" placeholder="Оберіть дату">
                </div>
            </div>
        </div>
</form>
 <!-- /form -->*}
 
 
 <hr>

<div class="row">
    <!-- col-md-9 -->
    <div class="col-md-9">
                
        <div id="list_archive">
       
    <div class="information_block archieve_block">        
        
        
        
            {foreach item=data from=$posts} 
                <!-- timeline-block -->
                <div class="timeline-block">
                <div class="timeline-block__date">
                        {$data->day}&nbsp;{$data->month}&nbsp;{$data->year}
                </div>
                <div class="timeline-block__day">
                        п’ятниця
                </div>
                    
                <div class="timeline__conteiner">
                    <span class="time">{$data->hour}:{$data->minute}</span>
                    
                    {if $data->i_link}
                    <div class="news_item">
	
                        {if strlen($data->i_logoname) > 0}
            
                        <div class="timeline-block_img">
                            <img alt="" src="/uploads/logos_middle/{$data->i_logoname}.jpeg"/>
                        </div>
            
                        {/if}
                        <div class="timeline-block_text">
                            <div class="timeline-block__label">Новина</div>
                            <div class="timeline-block__heading f-bold">
                                <a href="{$data->i_link}">
                                    {$data->i_name}
                                </a>
                            </div>
	
                            {if $data->i_anons}
                                <p>{$data->i_anons}</p>
                            {/if}

                            <!--<span class="details"><a href="{$data->i_link}">посилання</a></span>-->
                            <a href="{$data->i_link}" class="tags">
                                посилання
                            </a>
                        </div>
                        
                    </div>      

                    {else}
      
                    <div class="news_item">
                        {if strlen($data->i_logoname) > 0}
                            <div class="timeline-block_img">
                                <img align="left" alt="" src="/uploads/logos_middle/{$data->i_logoname}.jpeg" />
                            </div>
                        {/if}
                        <div class="timeline-block_text">
                            <div class="timeline-block__label">Новина</div>
                            {*<span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>*}
                            <div class="timeline-block__heading f-bold">
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                    {$data->i_name}
                                </a>
                                
                            </div>
                            {if $data->i_anons}
                                <p>{$data->i_anons}</p>
                            {/if}
                            {if $data->cntat}
                                <a href="#" class="paperclip-link">
                                    <i class="fas fa-paperclip"></i>
                                    {$data->cntat} вкладені файли
                                </a>
                            {/if}    
                            <!--<span class="details">
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">докладніше</a>
                            </span>-->
                            {*<a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="tags">
                                докладніше 
                            </a>*}
                            <span class="details">
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                докладніше 
                            </a>
                            </span>
                    
                        </div>
     
                    </div>      
      

                    {/if} 
                </div>
                
                </div>
            <!-- /timeline-block -->
            {/foreach}
        
  
        

  {$pagination}        
        
    </div>
        <!-- end information_block -->
        </div>
    
    
    </div>
    <!-- /col-md-9 -->
    
    <!-- col-md-3 -->
          {*  <div class="col-md-3">
                <div class="section-heading">Важлива тема</div>


                <div class="sub-news main-theme">
                    <div class="sub-news_img">
                        <img src="/uploads/logos_small/043e087b66719b89d711437b75c22afd.jpeg">
                    </div>
                    <div class="sub-news_heading">
                        <b>
                            <a href="#">
                                Голова Верховної Ради України Андрій Парубій: «З передачею Томосу фактично офіційно затверджено створення Української помісної автокефальної церкви»
                            </a>
                        </b>
                    </div>
                    <span class="sub-news_date">06 січня 2018 о 13:58</span>
                </div>*}
                
                
               <div class="col-md-3 right-column-content">
                   <div class="section-heading">Важлива тема</div>
{foreach item=data from=$top_news} 
                    <div class="sub-news main-theme with-data">
                    
                        <div class="sub-news_img">
                            
                        {if strlen($data->i_logoname) > 0}
                        <img src="/uploads/logos_small/{$data->i_logoname}.jpeg">
                        {/if} 
                        </div>
                    <div class="sub-news_heading">
                        <b>
                    {if !$data->i_link}
                           <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>  
                    {else} 
                            <a href="{$data->i_link}">{$data->i_name} </a>    
                    {/if}
                    </b>
                    </div>
                    <span class="sub-news_date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>  
                                
                    
                    </div>
               {/foreach} 
{foreach item=data from=$block_data.5.items} 
                    <div class="sub-news main-theme with-data">
                    
                        <div class="sub-news_img">
                            
                        {if strlen($data->i_logoname) > 0}
                    <img src="/uploads/logos_small/{$data->i_logoname}.jpeg">
                    {* {else}
                        <h3 class="primary badge float-left" style="margin-right: 1%; font-weight: bold;">i</h3> *}
                    {/if} 
                    </div>
                    <div class="sub-news_heading">
                    {if !$data->i_link}
                           <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>  
                    {else} 
                            <a href="{$data->i_link}">{$data->i_name} </a>    
                    {/if}
                    </div>
                    <span class="sub-news_date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>  
                                
                    
                  </div>
               {/foreach} 
                    
                  
              <div class="section-heading"> <a href="{$lang_prefix}/{$data->i_categories}">Переглянути ще</a></div>
              

                <div class="section-heading">Тематичні розділи</div>

                <a href="#" class="tags">урочисті заходи</a>
                <a href="#" class="tags">семінар-тренінг</a>
                <a href="#" class="tags">РЕФОРМИ</a>
                <a href="#" class="tags">засідання</a>
                <a href="#" class="tags">голос україни</a>
                <a href="#" class="tags">комітет з питань охорони здоров’я</a>
                <a href="#" class="tags">офіційний візит</a>


                <!-- digest -->
                <div class="full-mob-width">
                    <div class="digest-section digest-small">
                        <div class="content">
                            {* <span class="mail-ico"><span class="messages"></span></span>  *}
                            <div class="digest-section__heading">
                                <span class="fa-2x">
                                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1" data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                                </span>
                                <p>Парламентський дайджест</p>                
                            </div>

                            <p>Отримуйте головне з вебпорталу у свою скриньку</p>

                            <form method="post" action="{$lang_prefix}/subscribe/index">
                                {*  <label>Залиште вашу електрону пошту</label>  *}
                                <div class="input-group">
                                    {*  <input type="email" class="form-control" placeholder="Your E-mail" aria-label="Your E-mail" aria-describedby="button-addon2">

                                    <div class="info-ico">
                                        <i class="fas fa-info"></i>
                                        На наступному кроці ви зможете налаштувати категорії матеріалів у розсилці та її частоту
                                    </div>  *}

                                    <button class="btn btn-white" type="submit">Налаштувати</button>

                                </div>

                            </form>

                        </div>
                    </div>
                </div>
                <!-- /digest -->

            </div>
            <!-- /col-md-3 -->
        </div>
    <!-- /row -->
</div>
<!-- /right_col -->
    
    















