      <div class="panel">
        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr"> <a href="{$root_hid_zasidan->i_categories}" class="ybutton"><span>Перейти до розділу</span></a>
              <h3>{$root_hid_zasidan->t_name}</h3>
              <a href="https://gska2.rada.gov.ua/pls/radac_gs09/golos_rss" class="rss">RSS</a> </div>
            <div class="clr2"> <a href="/news/Novyny/Povidomlennya/" class="bbutton"><span>Міжнародна діяльність</span></a> <a href="/news/Novyny/Parlamentski_slukhannya/" class="bbutton"><span>Склад ВР України</span></a> <a href="/news/Novyny/Dni_Uryadu/" class="bbutton"><span>Конституція України</span></a></div>
            <div class="white2-panel">
              <div class="white2-panel1">
                <ul>
                {foreach item=data from=$rss_hid_zasidan}
                    <li>
						{if $data->i_link}                    
                    		<a href="{$data->i_link}" target="_blank">{$data->i_name}</a>
                    	{else}
                    		<a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                    		{if $rss_hid_zasidan_ft}<br />{$data->i_anons}{/if}
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
              <a href="https://zakon.rada.gov.ua/cgi-bin/laws/main.cgi?user=xml" class="rss">RSS</a> </div>
            <div class="clr2"> <a href="/news/Novyny/Povidomlennya/" class="bbutton"><span>Діяльність</span></a> <a href="/news/Novyny/Parlamentski_slukhannya/" class="bbutton"><span>Склад ВР України</span></a> <a href="/news/Novyny/Dni_Uryadu/" class="bbutton"><span>Конституція України</span></a> <a href="/news/Zakonotvorcha_diyalnist_Verkhovnoji_Rady_Ukrajiny/Zakonoproekty/" class="bbutton"><span>Інформація</span></a></div>
            <div class="white2-panel">
              <div class="white2-panel1">
                <ul>
                {foreach item=data from=$rss_zakonodavstvo}
                    <li>
						{if $data->i_link}                    
                    		<a href="{$data->i_link}" target="_blank">{$data->i_name}</a>
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
            <div class="panel-head clr"> <a href="{$root_zakanoproekty->i_categories}" class="ybutton"><span>Перейти до розділу</span></a>
              <h3>{$root_zakanoproekty->t_name}</h3>
              <a href="https://gska2.rada.gov.ua/pls/zweb_n/pkg_rss.new_zp" class="rss">RSS</a> </div>
            <div class="clr2"> <a href="/news/Novyny/Dni_Uryadu/" class="bbutton"><span>Міжнародна діяльність</span></a> <a href="/news/Novyny/Parlamentski_slukhannya/" class="bbutton"><span>Склад ВР України</span></a> <a href="/news/Zakonotvorcha_diyalnist_Verkhovnoji_Rady_Ukrajiny/Zakonoproekty/" class="bbutton"><span>Конституція України</span></a></div>
            <div class="white2-panel">
              <div class="white2-panel1">
                <ul>
                {foreach item=data from=$rss_zakanoproekty}
                    <li>
						{if $data->i_link}                    
                    		<a href="{$data->i_link}" target="_blank">{$data->i_name}</a>
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
      
      
      
</div>