<link rel="stylesheet" type="text/css" href="http://static.rada.gov.ua/css/vru_stenogr.css" />
<div id="content-all">
    <div class="panel">

        <div class="panel1">
            <div class="panel2">
                <div class="panel-head clr">
{*                    mirs*}
                    {if preg_match("/юлетень/", $item->mi_name)} 
                    
                        <h3>{$item->mi_name|upper}</h3>
                      {else}  
                        <h3>{$main_title}</h3>
                    {/if}
                        
                </div> 
                <div class="white3-panel">
                    <div class="white3-panel1-lock">
                        <span class="date">{$item->day}&nbsp;{$item->month_name}&nbsp;{$item->year}</span> 
{*                        {$item->mi_name}*}
                        <div class="sten_item_content">
                        {$item->mi_text}                
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
