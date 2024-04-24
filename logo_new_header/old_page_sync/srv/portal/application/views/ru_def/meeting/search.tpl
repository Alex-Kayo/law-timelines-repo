<div id="content-all">
  <div class="panel">
    <div class="panel1">
      <div class="panel2">
        <div class="panel-head clr">
          <h3>Пошук</h3>
        </div>
        <div class="white3-panel">
          <div class="white3-panel1 clr">
          
{if $type_callendar == 1}
    {assign var="method" value='stenogr'}
{elseif $type_callendar == 2}
    {assign var="method" value='awt'}
{elseif $type_callendar == 3}
    {assign var="method" value='faxiv'}
{/if}              
              
Всього знайдено: {$search_result.total_count}

{if $search_result.total_count}

    <hr />

    {$pagination}


    {foreach item=data from=$search_result.items}

            <div>
                <span class="date">{$data->md_date}</span>
                <h4 class="title">{$data->mc_name} - {$data->ms_name} </h4>
                <p>{$data->mi_name}</p>
                <div><a href="{$lang_prefix}/meeting/{$method}/show/{$data->mi_id}.html" style="text-decoration:none"><i>далі</i></a></div>
            </div>
            <div class="dots">&nbsp;</div>

    {/foreach}



{/if}


</div>
      </div>
    </div>
  </div>
</div>