<div class="heading">
    <h3><span>JSON_Parsing</span></h3>
</div>  
<div class="json_content">
     <div class="date">{$header_gallery->day} {$header_gallery->month} {$header_gallery->year}</div>
    <h1>ItemName</h1>
    
    <br>  

{*  {$jsondat->nom_gol}*}
{*    {$jsondat|json_decode}*}
    

{*nom_gol*}


    <pre>
       Номер голосування - {$jsondat->nom_gol}
 
       {$jsondat->nazva_gol}
       За - {$jsondat->za}  Проти-{$jsondat->prot} Утримались -{$jsondat->utr} Всього -{$jsondat->vsego}
{*       {$jsondat->rez_gol|print_r} *}
       {foreach from=$jsondat->rez_gol item=data }

           {$data->name} -  {$data->rez}
       {/foreach}
{*       {$jsondat->rez_gol->name *}

    </pre>
    

    
{*foreach item=data from=$attachments}

        {foreach item=audio from=$data}                                        
            {if $audio->ia_type == 'mp3'}
                <div id="player{$audio->ia_id}" style="display:block;width:540px;height:30px;"></div>
                <p>{$audio->ia_description}</p>
                <br /><br /><br />                            
                {/if}
        {/foreach }

    {/foreach}  *}    

</div>  