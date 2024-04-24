
<div id="content-all">
    <div class="panel">
        <div class="panel1">
            <div class="panel2">
                <div class="panel-head clr">
                    <h3>{$i18n.title}</h3>
                </div>
                <div class="white3-panel">
                    <div class="white3-panel1 clr">

                        {if !isset($email)}

                            {$i18n.apply_confirm.error_msg}	

                        {else}

                            {if isset($subscribe)}
                                {$i18n.apply_confirm.accept_msg_add}

                            {elseif isset($unsubscribe)}
                                {$i18n.apply_confirm.accept_msg_del}

                            {/if}	
                            <br><br>
                            <b>{$email}</b>

                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

