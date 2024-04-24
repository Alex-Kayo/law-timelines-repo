      <div class="panel">
        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr"> <a href="{$root_hid_zasidan->i_categories}" class="ybutton"><span>Перейти до розділу</span></a>
              <h3>{$root_hid_zasidan->t_name}</h3>
              {if $root_hid_zasidan->t_name == 'Хід пленарних засідань'}
              <a href="http://w1.c1.rada.gov.ua/pls/radac_gs09/golos_rss" class="rss">RSS</a> </div>
            <div class="clr2"> <a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/h_index_n" class="bbutton"><span>Хронологія розгляду</span></a> <a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/pd_index_n" class="bbutton"><span>Результати розгляду</span></a> {*<a href="/news/Novyny/Dni_Uryadu/" class="bbutton"><span>Конституція України</span></a>*}
            {/if}
            </div>
            <div class="white2-panel">
              <div class="white2-panel1">
                <ul>
                {foreach item=data from=$rss_hid_zasidan}
                    <li>
						{if $data->i_link}                    
                    		<a href="{$data->i_link}" target="_blank">{$data->i_name}</a>
                            <br/>{$data->i_anons}
                    	{else}
                    		<a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                    		{if $rss_hid_zasidan_ft}<br/>{$data->i_anons}{/if}
                    	{/if}
                   </li>
                {/foreach}
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    
   <div class="panel">
        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr"> <a href="{$root_zakanoproekty->i_categories}" class="ybutton"><span>Перейти до розділу</span></a>
              <h3>{$root_zakanoproekty->t_name}</h3>
              <a href="http://w1.c1.rada.gov.ua/pls/zweb_n/pkg_rss.new_zp" class="rss">RSS</a> </div>
            <div class="clr2">  <a href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc555" class="bbutton"><span>Зареєстровані за поточний тиждень</span></a> <a href="http://w1.c1.rada.gov.ua/pls/site2/p_bills_stand_laws" class="bbutton"><span>Прийняті на поточній сесії</span></a>
            <a href="http://w1.c1.rada.gov.ua/pls/zweb2/webproc2" class="bbutton"><span>Пошук за реквізитами</span></a>
            </div>
            <div class="white2-panel">
              <div class="white2-panel1">
                <ul>
                {foreach item=data from=$rss_zakanoproekty}
                    <li>
						{if $data->i_link}                    
                    		<a href="{$data->i_link}" target="_blank">{$data->i_name}</a>
                            <br/>{$data->i_anons}
                    	{else}
                    		<a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                    		{if $rss_zakanoproekty_ft}<br />{$data->i_anons}{/if}
                    	{/if}
                   </li>
                {/foreach}
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="panel">
        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr"> <a href="{$root_zakonodavstvo->i_categories}" class="ybutton"><span>Перейти до розділу</span></a>
              <h3>{$root_zakonodavstvo->t_name}</h3>
              <a href="http://zakon2.rada.gov.ua/laws/main/xml" class="rss">RSS</a> </div>
            <div class="clr2">
 <a href="http://zakon2.rada.gov.ua/laws/show/constitution" class="bbutton"><span>Конституція України</span></a>
 <a href="http://zakon2.rada.gov.ua/laws/main/t21" class="bbutton"><span>Кодекси України</span></a>
 <a href="http://zakon2.rada.gov.ua/laws/main/o1/find?typ=1" class="bbutton"><span>Закони України</span></a>
 <a href="http://zakon2.rada.gov.ua/laws/main/a#Find" class="bbutton"><span>Пошук за реквізитами </span></a></div>
            <div class="white2-panel">
              <div class="white2-panel1">
                <ul>
                {foreach item=data from=$rss_zakonodavstvo}
                    <li>
{if $data->i_link}
<a href="{$data->i_link}" target="_blank">{$data->i_name}</a><br/>{$data->i_anons}
{else}
<a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
{if $rss_zakonodavstvo_ft}<br />{$data->i_anons}{/if}
{/if}
                   </li>
                {/foreach}
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="panel">
        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr"> 
              <h3>Новини з владних джерел</h3>
              </div>
            <div class="clr2">  <a href="http://www.president.gov.ua/" class="bbutton"><span>Сайт Президента України</span></a> 
              <a href="http://chairman.rada.gov.ua" class="bbutton"><span>Сайт Голови Верховної Ради України</span></a>
              <a href="http://www.kmu.gov.ua" class="bbutton"><span>Урядовий портал</span></a>
            </div>
            <div class="white2-panel">
              <div class="white2-panel1">
                <ul>
               {if $root_goversites} 
                {foreach item=data from=$rss_goversites}
                    <li>
                        {if $data->i_link}                    
                            <a href="{$data->i_link}" target="_blank">{$data->i_name}</a>
                            <br/>{$data->i_anons}
                        {else}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                            {if $rss_zakanoproekty_ft}<br />{$data->i_anons}{/if}
                        {/if}
                   </li>
                {/foreach}
                {/if} 
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      
</div>
