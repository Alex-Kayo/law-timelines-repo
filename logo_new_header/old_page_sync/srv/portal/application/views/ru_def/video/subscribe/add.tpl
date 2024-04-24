<form method="post" action="{$lang_prefix}/subscribe/add" id="form_subs">
    <input type="hidden" name="subscribe" value="1">
    {$error}	

    <div id="subscribe_topics">
        {$i18n.topics_sel}*:<span class="warn">{$errors.topics_sel}</span>
        <table width="100%">
            {foreach item=data from=$topics_sel}
                <tr>
                    <td class="check_topic"><input type="checkbox" name="topics_sel[{$data.t_id}]" {if $data.checked}checked="true"{/if}></td>
                    <td>{$data.t_name}</td>
                </tr>
            {/foreach}
        </table>
    </div>  

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
            <td><p>
                    <input type="text" name="captcha" value="" id="captcha" />
                </p>
                <p> {$captcha} <br />
                    <small>{$i18n.captcha}</small><br />
                    <span class="warn">{$errors.captcha}</span></p></td>
        </tr>
    </table>    

    <a href="#" class="bbutton2" onclick="$('#form_subs').submit();
            return false;"><span>{$i18n.send}</span></a>
</form>




