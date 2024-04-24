<form action="">
    <fieldset>
        <legend>{$i18n.comments_add_title}</legend>
        
        <div class="field">
            <label><span class="starr">*</span>{$i18n.comments_name}:</label>
            <input type="text" class="commentname" name="name" id="name" value="{$fields.name}" />
            <span class="warn">{$error_name}</span> </td>
        </div>
        <div class="field">    
            <label><span class="starr">*</span>{$i18n.comments_message}:</label>
            <textarea id="text">{$fields.text}</textarea>
            <span class="warn">{$error_text}</span>
        </div>    
        <div class="field capchure">    
            <label><span class="starr">*</span>{$i18n.comments_captcha}</label>
           {$captcha}
            <input type="text" name="captcha" value="" id="captcha" />
            <span class="warn">{$error_captcha}</span>
        </div>    
        <input type="submit" class="sendcomm" value="Надіслати" onclick="addComment(); return false;"/>
        <span class="warn">{$error_other}</span>
        <b>{$added_msg}</b>
    </fieldset>    
</form>
