<div id="content-all">
      <div class="panel">

        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr">
             
              <a href="/print/{$i_id}.html" class="print">Надрукувати</a>
              <a href="{$base_url}{$i_id}.html" class="shslink">Зменшити зону перегляду</a>         
              <h3>{$current_node->t_name}</h3>
       </div> 
            <div class="white3-panel">
              <div class="white3-panel1-lock">
             <span class="date">{$item->day}&nbsp;{$item->month}&nbsp;{$item->year},&nbsp;{$item->hour}:{$item->minute}</span> 
            
            {if $item->i_author}
            <span class="author">(&nbsp{$item->i_author}&nbsp)</span>
            <br>
            {/if}
            <br>
              
              <h1>{$item->i_name}</h1>
               
                <div class="item_content">
                
				{if $item->i_full}
				    {$item->i_full}
				{else}
				    {$item->i_anons}
				{/if}
                </div>
              </div>
            </div>
          </div>
        </div>
        
      </div>
</div>

