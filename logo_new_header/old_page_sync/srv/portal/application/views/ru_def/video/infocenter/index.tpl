<div id="content-all">
    <div class="panel">
        <div class="panel1">
            <div class="panel2">
                <div class="panel-head clr">
                    <h3>{$i18n.module}</h3>
                </div>
                <div class="white3-panel">
                    <div class="white3-panel1 clr">
                        <a href="{$lang_prefix}/infocenter/add">{$i18n.add_question}</a> 
                        {foreach from=$questions item=i key=key}
                            <div>{$key+$offset+1}. <a href="{$lang_prefix}/infocenter/{$i->i_id}">{$i->i_question_name}</a> {$i18n.author}: {$i->i_question_username}</div>
                        {/foreach}

                        {$pagination} 
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
