<li>
    <h5>{$month.month_name}</h5>
    <table>
        <tr>
            <th>{$common_lang.week_day_short.1}</th>
            <th>{$common_lang.week_day_short.2}</th>
            <th>{$common_lang.week_day_short.3}</th>
            <th>{$common_lang.week_day_short.4}</th>
            <th>{$common_lang.week_day_short.5}</th>
            <th>{$common_lang.week_day_short.6}</th>
            <th class="red">{$common_lang.week_day_short.7}</th>
        </tr>


        {foreach from=$month.data item=week_data}
            <tr>
                {foreach from=$week_data.days item=day_data key=day_key}
                    {assign var="td_class" value=""}
                    {if $day_data.type == 1}
                        {assign var="td_class" value='class="b_yellow"'}
                    {elseif $day_data.type == 2}
                        {assign var="td_class" value='class="b_green"'}
                    {elseif $day_data.type == 3}
                        {assign var="td_class" value='class="b_blue"'}
                    {elseif $day_data.type == 99 or $day_key == 6}
                        {assign var="td_class" value='class="red"'}                    
                    {/if}

                    <td {$td_class}>
                        {if $day_data.day}

                            {if $day_data.items}
                                {assign var="count_docs" value=$day_data.items|@count}
                                {if $count_docs == 1}
                                    {foreach from=$day_data.items item=doc_item key=key_item}
                                        <a href="{$lang_prefix}/meeting/{$method}/show/{$key_item}.html">{$day_data.day}</a>
                                    {/foreach}
                                {else}
                                    <a href="#" class="sel_day">{$day_data.day}</a>
                                    <div style="position: relative; display:none">
                                        <div class="b_hover">
                                            {foreach from=$day_data.items item=doc_item key=key_item}
                                                <a href="{$lang_prefix}/meeting/{$method}/show/{$key_item}.html">{$doc_item}</a><br />
                                            {/foreach}
                                            <em></em>
                                        </div>
                                    </div>                                                        
                                {/if}


                            {else}
                                <span> {$day_data.day}</span>     
                            {/if}

                        {else}
                            &nbsp;    
                        {/if}                
                    </td>    

                {/foreach}
            </tr>        
        {/foreach}

    </table>
</li>