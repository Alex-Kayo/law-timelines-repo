<div id="content-all">
  <div class="panel">
    <div class="panel1">
      <div class="panel2">
        <div class="panel-head clr">
          <h3>Поиск</h3>
        </div>
        <div class="white3-panel">
          <div class="white3-panel1 clr">
          
{$i18n.results}: {$total_items}

{if $total_items}

<hr />

{$pagination}


{foreach item=data from=$posts}


          <div>
            <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}:{$data->minute}</span>
            <h4 class="title">{$data->i_name}</h4>
            <p>{$data->i_anons}</p>
            <div><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" style="text-decoration:none"><i>ссылка</i></a></div>
          </div>
          <div class="dots">&nbsp;</div>
    
{/foreach}



{/if}


</div>
      </div>
    </div>
  </div>
</div>