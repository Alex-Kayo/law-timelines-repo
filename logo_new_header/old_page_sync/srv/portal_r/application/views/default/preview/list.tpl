{if $is_news_subsite}
   {include file='news_subsite/header_newscenter.tpl'}
{/if}

{if $current_node->t_name}
            
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/">Головна</a></li> 
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

    {*<h3>
        {if $current_node->t_name != "Текстові публікації (UA)"}
        {$current_node->t_name}
        {else} 
        Усі текстові публікації
        {/if}    
    
    </h3>*}
</div>    

 
 <h3 class="page-heading with-search">
     <span>{$t_name}</span> 
     {if $is_search}
         {if $date_search} <span  style="font-size: 1em;font-weight: 10;"> 
                       на {$posts[0]->day}&nbsp;{$posts[0]->month}&nbsp;{$posts[0]->year}
                </span>
          
         
         {/if}
         {if $search_params.search_substr} <span  style="font-size: 1em;font-weight: 10;"> 
                       за назвою "{$search_params.search_substr}"
                </span>
         </h3>  
         
         {/if}
     <small>(знайдено - {$count_items})</small>
    {/if}
    {*<a class="search-by-link" data-toggle="collapse" href="#collapseSearch" role="button" aria-expanded="false" aria-controls="collapseSearch">
        <i class="ico-search"></i>
        Пошук <span class="mob-hide">в анонсах</span>
    </a>*}
</h3>  
<div class="gallery_content">

    <div >
    {include file="preview/module_filter.tpl" url="preview"}
    </div>


 
 
 <hr>

<div class="row">
    <!-- col-md-9 -->
    <div class="col-md-9">
                
        <div id="list_archive">
       
    <div class="information_block archieve_block">        

        
        
{*        {$posts|@print_r}*}
{*Знайдено {$count_items} анонсів*}
            {foreach item=data from=$posts} 
                <!-- timeline-block -->
            <div class="timeline-block">
                <div class="timeline-block__date">
                        {$data->day}&nbsp;{$data->month}&nbsp;{$data->year}
                </div>
                {*<div class="timeline-block__day">
                        п’ятниця
                </div>*}
                    
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
                            {*<div class="timeline-block__label">Новина</div>*}
                            <div class="timeline-block__heading f-bold">
                                <a href="{$data->i_link}">
                                    {$data->i_name}
                                </a>
                            </div>
	
                            {if $data->i_anons}
                                <p>{$data->i_anons}</p>
                            {/if}

                            <!--<span class="details"><a href="{$data->i_link}">посилання</a></span>-->
                            {*<a href="{$data->i_link}" class="tags">
                                посилання
                            </a>*}
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
{*                            <div class="timeline-block__label">Новина</div>*}
                            {*<span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</span>*}
                            <div class="timeline-block__heading f-bold">
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">
                                    {$data->i_name}
                                    
                                </a>
                                
                            </div>
                            {if $data->i_anons}
                                <p>{$data->i_anons}</p>
                            {/if}
                {*            <span class="details">
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">докладніше</a>
                            </span>
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="tags">
                                {$data->i_seo_name}
                               докладніше
                            </a>*}
                            
                            
                    
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
                
                
               <div class="col-md-3">
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
    
    















