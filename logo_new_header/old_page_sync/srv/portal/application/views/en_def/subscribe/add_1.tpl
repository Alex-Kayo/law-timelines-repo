<form method="post" action="{$lang_prefix}/subscribe/add" id="form_subs">
<input type="hidden" name="subscribe" value="1">
{$error}	

    <div id="subscribe_topics">
        {$i18n.topics_sel}{*   *     *}:
        <br /><span class="warn alert-danger">{$errors.topics_sel}</span>
    	
        {foreach item=data from=$topics_sel}
            <div class="custom-control custom-switch is-invalid">
                <input type="checkbox" class="custom-control-input" id="{$data.t_id}" name="topics_sel[{$data.t_id}]" {if $data.checked}checked="true"{/if}>
                <label class="custom-control-label" for="{$data.t_id}">{$data.t_name}</label>
            </div>
        {/foreach}
       
     </div>
     
        {*------Заміна таблиці на блоки
        <table width="100%">
            {foreach item=data from=$topics_sel}
        	<tr>
                    <td class="check_topic"><input type="checkbox" name="topics_sel[{$data.t_id}]" {if $data.checked}checked="true"{/if}></td>
                    <td>{$data.t_name}</td>
        	</tr>
            {/foreach}
    	</table>---------*}
   
    
    <div class="form-group row">
        <label for="inputEmail" class="col-sm-5 col-form-label">{$i18n.email}</label>
        <div class="col-sm-7">
          <input type="text" class="form-control" id="inputEmail" name="email" value="{$email}" />
          <span class="warn alert-danger">{$errors.email}</span>
        </div>
    </div>
    <div class="form-group row">
        <label for="captcha" class="col-sm-5 col-form-label">{$i18n.captcha}</label>
        <div class="col-sm-7">
          <input type="text" class="form-control" name="captcha" value="" id="captcha" />
          <p>
               {$captcha}
            {*  <div class="info-ico"><i class="fas fa-info"></i><small>{$i18n.captcha}</small></div>  *}
               <br /><span class="warn alert-danger">{$errors.captcha}</span>
            </p>  
        </div>
    </div>   
        
    {*---Заміна таблиці на блоки
    <table>
        <tr>
            <td>{$i18n.email}*:</td>
            <td>
                <input type="text" name="email" style="width:100%" value="{$email}">
                <span class="warn">{$errors.email}</span>
            </td>
        </tr>
	<tr valign="top">
	    <td>{$i18n.captcha}*</td>
	    <td>
                <input type="text" name="captcha" value="" id="captcha" />
	        <p> {$captcha}
                <br /><small>{$i18n.captcha}</small><br />
	          <span class="warn">{$errors.captcha}</span>
                </p>
            </td>
	</tr>
    </table>------*}
    
    <div class="form-group row">
        <div class="col">
            <button
                class="btn btn-white-sub"
                onclick="$('#form_subs').submit(); return false;"
                title="Підписатись на анонси"
                >
                <span><i class="far fa-window-minimize"></i><i class="fas fa-marker"></i></span>{$i18n.send}
            </button>
        </div>
    </div>
</form>




