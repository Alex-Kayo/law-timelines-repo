{if $sel_foto->flag_new}
 	<font color="Red">(оновлено)</font>											
{/if}              
<br/> 

{if $sel_foto->i_anons}
	<p>{$sel_foto->i_anons}</p>
	<br/>
{/if}
{if $sel_foto->i_full}
    <p>{$sel_foto->i_full}</p>
    <br/>
{/if}

<em>{$sel_foto->ia_author}</em>

<div class="bigphoto clr">
	{if $move_id->next_id}	
		<a class="photo-right" href="javascript:showFoto('{$move_id->i_id}_{$move_id->next_id}')">next</a>
	{/if}
	{if $move_id->prev_id}	
		<a class="photo-left" href="javascript:showFoto('{$move_id->i_id}_{$move_id->prev_id}')">prev</a>
	{/if}
	<img alt="" src="/uploads/gallery/{$sel_foto->filename}" width="640" />
	<p>{$sel_foto->ia_description}</p>
</div>


