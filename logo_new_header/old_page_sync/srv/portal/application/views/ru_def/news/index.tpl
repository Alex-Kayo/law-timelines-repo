{$pagination}

{foreach item=data from=$posts}
        <div class="news-item">
          <div class="news-head"> <a href="#" class="comment">Коментарів (10)</a> <a href="#" class="view">Переглядів (30)</a> <span class="date">29 жовтня 08</span> <a href="/{$data->i_categories}/{$data->i_id}.html">Повідомлення</a> </div>

          <a href="#"><img src="/images/news1.jpg" alt="{$data->i_name}" width="81" height="54" /></a>
          <p>{$data->i_anons}<a href="/{$data->i_categories}/{$data->i_id}.html">..» </a></p>
        </div>

<!--
    <div>
    <h4><a href="/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a></h4>
    {$data->i_anons}<br />
    </div>
-->
<!-- test -->
{/foreach}
