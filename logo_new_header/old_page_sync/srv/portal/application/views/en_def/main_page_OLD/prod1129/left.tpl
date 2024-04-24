    <div id="container">
      <div id="content-left">
          <ul id="qm0" class="qmmc">
              sdasd
                            <li><a href="#">Голосування за день</a><ul>
		<li><a target="_blank" href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_graf_2">Статистика голосувань</a></li>
                    <li><a target="_blank" href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_graf_3">Топ лідерів голосувань</a></li>
                    <li><a target="_blank" href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_graf_3?kod=1">Топ-25 антилідерів голосувань</a></li>
                    <li><a target="_blank" href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_graf_4">Останні 5 голосувань (онлайн)</a></li>
		</ul></li>
                            </ul>
        <div class="panel">
          <div class="panel1">
            <div class="panel2">
{*              <div class="panel-head clr2"> <a href="{$lang_prefix}/news/" class="ybutton"><span>Усі публікації</span></a> *} 
<div class="panel-head"> <a href="{$lang_prefix}/news/" class="ybutton"><span>Усі публікації</span></a>
           <a href="{$lang_prefix}/news/Novyny/Povidomlennya" class="ybutton"><span>Повідомлення</span></a>
           <a href="{$lang_prefix}/news/Novyny/Anonsy/" class="ybutton"><span>Анонси подій</span></a>
{*                <h3>Парламентські новини</h3> *}
{*              <a href="/rss/news" class="rss">RSS</a>*}
                </div>
              {foreach item=data from=$top_news}
{*              <div class="yellow-panel clr2">*}
                <div class="yellow-panel">
                <div class="yellow-panel1">
                  <div class="yellow-panel2"> <img src="/uploads/logos_middle/{$data->i_logoname}.jpeg"  alt="" class="borderimg" />
                    <h4>{$data->i_name}</h4>
                    <p>{$data->i_anons|truncate:200} <i><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="full-link">докладніше</a></i></p>
                  </div>
                </div>
              </div>
              {/foreach}
              <div class="white-panel">
 {*            <div class="white-panel clr2">*} 
                <div class="white-panel1">
                  <div class="white-panel2"> {foreach item=data from=$logo_news key=key}              
                    {if $key != 0}
                    <div class="dots">&nbsp;</div>
                    {/if} <a><img src="/uploads/logos_small/{$data->i_logoname}.jpeg" class="borderimg" alt="" /></a> <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}</span> <br />
                    <h4>{$data->i_name}</h4>
                    <p>{$data->i_anons|truncate:200}<br />
                      <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html"><i>докладніше</i></a> </p>
                    {/foreach}</div>
                </div>
              </div>
 {*             <div class="white-panel clr2" >*}
              <div class="white-panel">
                <div class="white-panel1">
                  <div class="white-panel2 ">
                    <ul>
                      {foreach item=data from=$nologo_news}
                      <li>
                       <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}</span> <br />
                          <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html" class="blue-links">{$data->i_name}</a> 
                      </li>
                      {/foreach}
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- #panel-->
        <div class="panel">
          <div class="panel1">
            <div class="panel2">
              <div class="panel-head clr2"> <a href="{$lang_prefix}/video/" class="ybutton"><span>Відео</span></a> <a href="{$lang_prefix}/gallery/" class="ybutton"><span>Фото</span></a>  <a href="{$lang_prefix}/audio/" class="ybutton"><span>Аудіо</span></a>
                <h3>Мультимедіа</h3>
                <a href="/rss/gallery" class="rss">RSS</a></div>
              <div class="white-panel clr2">
                <div class="white-panel1 clr">
                {foreach item=data from=$gallery key=key}
                  <div class="floater{$key}"> <img src="/uploads/gallery_prev/{$data->file_name}" class="borderimg" width="150" alt=""  />
                    <h4>{$data->i_name|truncate:30}</h4>
                    <p><a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html"><i>{$data->count_attach} Фото</i></a></p>
                  </div>
                {/foreach} </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- #content-->
    </div>
    <!-- #container-->
    <div id="content-right">