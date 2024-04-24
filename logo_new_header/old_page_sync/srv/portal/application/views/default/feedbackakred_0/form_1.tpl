{$timeoutError}
                    {foreach item=data from=$anons_dates }
                        <li>{$data.day} {$data.month_name|lower} </li> 

                    {/foreach}
{*<b>{$anons_dates[0].fulldate}</b>*}
<form action="" method="post">
    <fieldset>
        {*<div class="field">
            <label><span class="starr">*</span>{$i18n.recipient}:</label>
            <select name="addressee" id="addressee">
                {foreach item=data from=$addressee}
                <option value="{$data.fba_id}" {$data.selected}>{$data.fba_nickname} </option>
                {/foreach}
            </select>                        
        </div>*}
        <div class="field">
            <label>{$i18n.name}:<span class="starr">&nbsp;*</span></label>
            <input type="text" class="txtinp" name="name" id="name" value="{$value.name}"/>
            <span class="warn">{$errors.name}</span>
        </div>
        <div class="field">
            <label>{$i18n.lname}:<span class="starr">&nbsp;*</span></label>
            <input type="text" class="txtinp" name="lname" id="lname" value="{$value.lname}"/>
            <span class="warn">{$errors.lname}</span>
        </div>
        <div class="field">
            <label>{$i18n.zminame}:<span class="starr">&nbsp;*</span></label>
            <input type="text" class="txtinp"  name="zminame" id="zminame" value="{$value.zminame}"/>
            <span class="warn">{$errors.zminame}</span>
        </div>
        <div class="field">
            <label>{$i18n.email}:<span class="starr">&nbsp;*</span></label>
            <input type="text" class="txtinp" name="email" id="email" value="{$value.email}" />
            <span class="warn">{$errors.email}</span>
        </div>
        <div class="field">
            <label>{$i18n.phone}:<span class="starr">&nbsp;*</span></label>
            <input type="text" class="txtinp"  name="phone" id="phone" value="{$value.phone}" />
            <span class="warn">{$errors.phone}</span>
        </div>
        
        {*<div class="field">
            <label>{$i18n.eventname}:<span class="starr">&nbsp;*</span></label>
            <input type="text" class="txtinp" name="eventname" id="eventname" value="{$value.eventname}" />
            <span class="warn">{$errors.eventname}</span>
        </div>*}
    </fieldset>    
    <fieldset>
        <div class="field">
            <label>{$i18n.eventdate}:<span class="starr">&nbsp;*</span></label>
            <input type="text" class="tcal" name="eventdate" id="eventdate" value="{$value.eventdate}" />
            <span class="warn">{$errors.eventdate}</span>
{*            <span class="warn">2342342342342342</span>*}
        </div>
        <div class="field">    
            <label>{$i18n.eventname}:<span class="starr">&nbsp;*</span></label>
            <textarea style = "height: 50px;" id="eventname">{$value.eventname}</textarea>
            <span class="warn">{$errors.eventname}</span>
        </div> 
        
        <div class="field">    
            <label>{$i18n.message}:</label>
            <textarea style = "height: 30px;" id="text">{$value.text}</textarea>
            {*<span class="warn">{$errors.text}</span>*}
        </div>    
        <div class="field capchure">    
            <label>{$i18n.captcha}<span class="starr">&nbsp;*</span></label>
            {$captcha}
            <input type="text" name="captcha" value="" id="captcha"/>
             <span class="warn">{$errors.captcha}</span>
        </div>    
        <input type="submit" class="sendcomm" value="Надіслати" onclick="sendMsg(); return false;"/>
    </fieldset>  
    <div class="clear"></div>  
</form>


