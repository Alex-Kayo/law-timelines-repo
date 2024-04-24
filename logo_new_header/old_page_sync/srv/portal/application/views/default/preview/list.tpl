{literal}
<style>
    #insert_search_data {

        /*font-size: 0.5em;*/
        color: #6e7073;
        /*font-style: italic;*/
        /*text-transform: lowercase;*/
        font-family: "Myriad Pro", Arial;
        /*margin-top: -1em;*/
        position: relative;
        top: -20px;
        /*left: 20px;*/


    }


</style>
{/literal}



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

</div>    

 
 <h3 class="page-heading with-search">
     <span>{$current_node->t_name}</span>


</h3>
    <span id="insert_search_data"> {$months_s} {$year_s}</span>

    <h4 style="padding: 0 0 20px 0; color: #14419F " ><b>{$search_params.search_topic_name}</b></h4>

    {include file="preview/module_filter.tpl" url="preview"}
    </div>


 
 
 <hr>

<div class="row">
    <!-- col-md-9 -->
    <div class="col-md-9">
                
        <div id="list_archive">
       
    <div class="information_block archieve_block">        

        
        
{*        {$posts|var_dump}*}
{*Знайдено {$count_items} анонсів*}
            {foreach item=data from=$posts} 
                <!-- timeline-block -->
            <div class="timeline-block">
                <div class="timeline-block__date">
                        {$data->day}&nbsp;{$data->month}&nbsp;{$data->year}
                </div>

                    
                <div class="timeline__conteiner">
                    <span class="time">{$data->hour}{$data->minute}</span>
                    
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
                
               <div class="col-md-3">
                   <div class="request-online__block1">
                        <div class="faq-blocks" {*style="height: 270px;"*}>
                            <div class="faq-online size-s" style="height: 180px;">
{*                                <img src="img/icn-emoji.png" width="64" height="64" alt="" />*}
                                <div class="faq-tooltip">
                                    <div class="message-row">
                                        <span>Наші вітання!</span>
                                    </div>
                                    <div class="message-row">
                                        <span>Маєте запитання до Комітету?</span>
                                    </div>
                                </div>
                                <p>
                                    <a target ="_blank" href="/feedback" class="faq-link_online">Напишіть нам</a>
                                </p>
                            </div>
                        </div>
                    </div>
                   <div class="section-heading">{*Цікава інформація:*}</div>
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
{foreach item=data from=$block_data.3.items} 
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


                <div class="section-heading">Тематичні матеріали</div>


               <div class="section-heading"> <a href="{$lang_prefix}/news"> АРХІВ ПУБЛІКАЦІЙ <span class="icn-external" style="margin-bottom: 0.3em;" ></span></a></div>

                    </div>

            </div>
            <!-- /col-md-3 -->
        </div>
    <!-- /row -->
</div>
<!-- /right_col -->
    
    















