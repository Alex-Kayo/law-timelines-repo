    <div id="content-all">
      <div class="panel">
        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr">
              <h3>{$i18n.module}</h3>
            </div>
            <div class="white3-panel">
              <div class="white3-panel1 clr">


{if $error}
	{$error}
{else}
	<h3>{$question->i_question_name}</h3>
	<div>{$question->i_question}</div>
	<hr/>
	{if $answ_error}
		{$answ_error}
	{else}
	<h4>{$i18n.answers}</h4>
	{foreach from=$answers item=i}
		<div>{$i->ia_answer}</div>
	{/foreach}
	{/if}
{/if}



              </div>
            </div>
          </div>
        </div>
    </div>