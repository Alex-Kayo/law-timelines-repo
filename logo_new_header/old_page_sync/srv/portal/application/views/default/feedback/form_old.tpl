{$timeoutError}
<form action="" method="post">
    <fieldset>
        <div class="field">
            <label><span class="starr">*</span>{$i18n.recipient}:</label>
            <select name="addressee" id="addressee">
                {foreach item=data from=$addressee}
                <option value="{$data.fba_id}" {$data.selected}>{$data.fba_nickname} </option>
                {/foreach}
            </select>                        
        </div>
        <div class="field">
            <label><span class="starr">*</span>{$i18n.theme}:</label>
            <input type="text" class="txtinp" value="{$value.theme}" name="theme" id="theme"/>
            <span class="warn">{$errors.theme}</span>
        </div>
        <div class="field">
            <label><span class="starr">*</span>{$i18n.name}:</label>
            <input type="text" class="txtinp" name="name" id="name" value="{$value.name}"/>
            <span class="warn">{$errors.name}</span>
        </div>
        <div class="field">
            <label><span class="starr">*</span>{$i18n.email}:</label>
            <input type="text" class="txtinp" name="email" id="email" value="{$value.email}" />
            <span class="warn">{$errors.email}</span>
        </div>
        <div class="field">
            <label><span class="starr"></span>{$i18n.post}:</label>
            <input type="text" class="txtinp" name="post" id="post" value="{$value.post}" />
            <span class="warn">{$errors.post}</span>
        </div>
        <div class="field">
            <label><span class="starr"></span>{$i18n.phone}:</label>
            <input type="text" class="txtinp"  name="phone" id="phone" value="{$value.phone}" />
            <span class="warn">{$errors.phone}</span
        </div>
    </fieldset>    
    <fieldset>
        <div class="field">    
            <label><span class="starr">*</span>{$i18n.message}:</label>
            <textarea  id="text">{$value.text}</textarea>
            <span class="warn">{$errors.text}</span>
        </div>    
        <div class="field capchure">    
            <label><span class="starr">*</span>{$i18n.captcha}</label>
            {$captcha}
            <input type="text" name="captcha" value="" id="captcha"/>
             <span class="warn">{$errors.captcha}</span>
        </div>    
        <input type="submit" class="sendcomm" value="Надіслати" onclick="sendMsg(); return false;"/>
    </fieldset>  
    <div class="clear"></div>  
</form>


