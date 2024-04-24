<div class="right_col">
    <!-- cycle news -->
    <div class="cycle_block">
        <div class="cycle_pager" id="cycle_pager"></div>
        <div class="cycle">

            {foreach item=data from=$top_news key=key}     
                <div class="cycle_item">
                    <div class="cycle_photo">
                        <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg" width="265" height="195"/>
                    </div>
                    <div class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</div>
                    {if $data->i_link}
			<div class="cylce_heading"><a href="{$data->i_link}">{$data->i_name}</a></div>
			{else}
                        <div class="cylce_heading"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></div>
                    {/if}
                    <div class="cycle_txt">{$data->i_anons}</div>
                    <div class="clear"></div>
                </div>                                       
            {/foreach}                                
        </div>
    </div>
    <!-- end cycle news -->


    {if $panel_config->l_block1_status eq 1 && $block_data.1.items.total_rows}
        <div class="heading">
            <h3>
                <a href="{$lang_prefix}/{$block_data.1.topic->i_categories}" class="show_section">Go to section</a>
                <span>{$block_data.1.topic->t_name}</span> 
                <a href="/en/rss/preview/anonsy_podij" class="rss_ico"></a>
            </h3>
        </div>    




        <div class="information_block">
            <div class="announce_block">
                <div class="announce_list">
                    <div class="announce_overflow">

                        {foreach item=data from=$block_data.1.items}
                            <p>
                                <span class="announce_date">{$data->day}&nbsp;{$data->month} at {$data->hour}</span>
<!--                                    <span class="announce_txt"><a href="{$data->i_link}">{$data->i_name}</a></span>-->
                                <span class="announce_txt"><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></span>
                            </p>
                        {/foreach}                                 
                        </p>
                    </div>    
                </div>
            </div>
        </div>                


    {/if}


    {if $panel_config->l_block2_status eq 1}
        <div class="heading">
            <h3>
                <a href="{$lang_prefix}/{$block_data.2.topic->i_categories}" class="show_section">Go to section</a>
                <span>{$block_data.2.topic->t_name}</span> 
                <a href="https://w1.c1.rada.gov.ua/pls/radac_gs09/golos_rss" class="rss_ico"></a>
            </h3>

            {if $block_data.2.topic->t_name == 'Хід пленарних засідань'}
                <div class="block_submenu">
                    <ul>
                        <li><a href="https://w1.c1.rada.gov.ua/pls/radan_gs09/h_index_n">Хронологія розгляду</a></li>
                        <li class="borderl"><a href="https://w1.c1.rada.gov.ua/pls/radan_gs09/pd_index_n">Результати розгляду</a></li>
                    </ul>              
                </div>                
            {/if}
        </div>    
        <div class="information_block">
            <div class="information_block_ins">

                {foreach item=data from=$block_data.2.items}
                    <div class="info_item">
                        {if $data->i_link}                    
                            <h4><a href="{$data->i_link}">{$data->i_name}</a></h4>
                            <p>{$data->i_anons}</p>
                        {else}
                            <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                        {if $panel_config->l_block1_flag_anons eq 1}<p>{$data->i_anons}</p>{/if}
                    {/if}
                </div>                        
            {/foreach}   
        </div>
    </div>
{/if}  



{if $panel_config->l_block3_status eq 1}
    <div class="heading">
        <h3>
            <a href="{$lang_prefix}/{$block_data.3.topic->i_categories}" class="show_section">Go to section</a>
            <span>{$block_data.3.topic->t_name}</span> 
            <a href="https://w1.c1.rada.gov.ua/pls/zweb_n/pkg_rss.new_zp" class="rss_ico"></a>
        </h3>

        <div class="block_submenu">
            <ul>
                <li><a href="https://w1.c1.rada.gov.ua/pls/zweb2/webproc555">Зареєстровані за поточний тиждень</a></li>
                <li class="borderl"><a href="https://w1.c1.rada.gov.ua/pls/site2/p_bills_stand_laws">Прийняті на поточній сесії</a></li>
                <li class="borderl"><a href="https://w1.c1.rada.gov.ua/pls/zweb2/webproc2">Пошук за реквізитами</a></li>
            </ul>              
        </div>                            
    </div>    
    <div class="information_block">
        <div class="information_block_ins">

            {foreach item=data from=$block_data.3.items}
                <div class="info_item">
                    {if $data->i_link}                    
                        <h4><a href="{$data->i_link}">{$data->i_name}</a></h4>
                        <p>{$data->i_anons}</p>
                    {else}
                        <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                    {if $panel_config->l_block1_flag_anons eq 1}<p>{$data->i_anons}</p>{/if}
                {/if}
            </div>                        
        {/foreach}   
    </div>
</div>
{/if}    



{if $panel_config->l_block4_status eq 1}
    <div class="heading">
        <h3>
            <a href="{$lang_prefix}/{$block_data.4.topic->i_categories}" class="show_section">Go to section</a>
            <span>{$block_data.4.topic->t_name}</span> 
            <a href="https://zakon2.rada.gov.ua/laws/main/xml" class="rss_ico"></a>
        </h3>

        <div class="block_submenu">
            <ul>
                <li><a href="https://zakon2.rada.gov.ua/laws/show/constitution">Конституція України</a></li>
                <li class="borderl"><a href="https://zakon2.rada.gov.ua/laws/main/t21">Кодекси України</a></li>
                <li class="borderl"><a href="https://zakon2.rada.gov.ua/laws/main/o1/find?typ=1">Закони України</a></li>
                <li class="borderl"><a href="https://zakon2.rada.gov.ua/laws/main/a#Find">Пошук за реквізитами</a></li>
            </ul>              
        </div>                            
    </div>    
    <div class="information_block">
        <div class="information_block_ins">

            {foreach item=data from=$block_data.4.items}
                <div class="info_item">
                    {if $data->i_link}                    
                        <h4><a href="{$data->i_link}">{$data->i_name}</a></h4>
                        <p>{$data->i_anons}</p>
                    {else}
                        <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                    {if $panel_config->l_block1_flag_anons eq 1}<p>{$data->i_anons}</p>{/if}
                {/if}
            </div>                        
        {/foreach}   
    </div>
</div>
{/if}      




<!-- information_block -->
<div class="heading multimedia">
    <h3>
        <a href="{$lang_prefix}/gallery" class="show_section" id="media_show">Go to section</a>
        <span>Multimedia</span> 
    </h3>
</div> 
<div class="information_block multimedia">
    <div class="tabs_block">                       
        <ul>
            <li class="first"><a href="#video_tab">Video</a></li>
            <li><a href="#photo_tab">Photo</a></li>
            <li><a href="#audio_tab">Audio</a></li>
        </ul>
        <!-- photo -->                                                                                                     
        <div id="video_tab" class="multimedia_tab"   url_show="{$lang_prefix}/video">

            <ul>                    
                {foreach item=data from=$video key=key}
                    <li class="multimedia_item">
                        <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg" width="148" height="100"/>
                        <div class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</div>
                        <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                    </li>                        
                {/foreach}                     
            </ul>
            <div class="clear"></div>

        </div>
        <!-- end photo -->
        <!-- video tab -->
        <div id="photo_tab" class="multimedia_tab" url_show="{$lang_prefix}/gallery">
            <ul>                    
                {foreach item=data from=$gallery key=key}
                    <li class="multimedia_item">
                        <img alt="" src="/uploads/gallery_prev/{$data->file_name}" width="148" height="100"/>
                        {* <div class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</div>*}
                        <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                    </li>                        
                {/foreach}                     
            </ul>
            <div class="clear"></div>
        </div>
        <!-- end video tab -->                    
        <!-- audio tab -->
        <div id="audio_tab" class="multimedia_tab"  url_show="{$lang_prefix}/audio">

            <ul>                    
                {foreach item=data from=$audio key=key}
                    <li class="multimedia_item">
                        <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg" width="148" height="100"/>
                        <div class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}</div>
                        <h4><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
                    </li>                        
                {/foreach}                     
            </ul>
            <div class="clear"></div>                

        </div>
        <!-- end audio tab -->
    </div>
</div>    
<!-- end information_block -->
</div>