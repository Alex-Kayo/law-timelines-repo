{*----<div id="content-all">
  <div class="panel">
    <div class="panel1">
      <div class="panel2">---*}


    <section class="digest-section">
        <div class="content">
            <div class="digest-section__heading">
                {$i18n.title}
            </div>
        
        {*--<div class="white3-panel">--*}
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
        {*--</div>--*}
        </div>
    </section>
      
     {*---</div>
    </div>
  </div>
</div>---*}

