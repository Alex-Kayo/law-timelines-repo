<div class="panel-head1">
  <div class="panel-head2">
    <div class="panel-head3 clr">
        <h3>{$current_node->t_name}</h3>
    </div>
  </div>
</div>

<div class="panel">
  <div class="panel1-0">
    <div class="panel2">
      <div class="white2-panel">
        <div class="white2-panel1">
        {foreach item=data from=$posts}          
          {if $data->i_link}
          <div>
            <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}:{$data->minute}</span>
            <h4 class="title">{$data->i_name}</h4>
            <p>{$data->i_anons}</p>
            <div><a href="{$data->i_link}" style="text-decoration:none"><i>далі</i></a></div>
          </div>
          <div class="dots">&nbsp;</div>
          {else}
          <div> {if $data->logo_null == 0} <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html"><img src="/uploads/logos_middle/{$data->i_logoname}.jpeg" alt="{$data->i_name}" class="borderimg" width="120" height="82" /></a> {/if}
            <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}:{$data->minute}</span>
            <h4 class="title">{$data->i_name}</h4>
            <p>{$data->i_anons}</p>
            <div><a href="/{$data->i_categories}/{$data->i_id}.html" style="text-decoration:none"><i>докладніше</i></a></div>
          </div>
          <div class="dots">&nbsp;</div>
          {/if}
          {/foreach}
          {$pagination}
        </div>
      </div>
    </div>
  </div>
</div>