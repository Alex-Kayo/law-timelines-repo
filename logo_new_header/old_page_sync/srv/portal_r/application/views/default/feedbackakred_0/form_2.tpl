{literal}
<script>
    $(document).ready(function(){SelEvents({/literal}{$anons_dates[0].fulldate}{literal});
            //    $('#carousel_anons').jcarousel({
            // Configuration goes here
            
                 });

function SelEvents( id )
{
        $.ajax({
         type: "POST",
 //        url: "/selpreview/"+id,
        url: "/selevent/"+id,
         data: {"reque":id},
        success: function(msg){
                //   $("#anons_select a").css({"color":"#000"})
                //   $("#"+id).css({"color":"#2474b2"})
                   $("#eventname").html(msg);
                //     $('.announce_overflow').jScrollPane({showArrows: true});
                //     $(".jspDrag").css("top","0");
                //     $(".jspPane").css("top","0");
                  }
                 
    });
}
</script>
{/literal}
{$timeoutError}
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
            {if !$value.eventdate}
            <label>{$i18n.eventdate}<span class="starr"></span></label>
            <select class="tcal" name="eventdate" id="eventdate" value="{$value.eventdate}" onchange="SelEvents(this.value)">
                {foreach item=data from=$anons_dates }
                    <option value="{$data.fulldate}"> {$data.day}  {$data.month_name|lower} {$data.year} </option>

                  {/foreach}
        </select>
            {else}
            {$value.eventdate}
            {$value.eventname}
            {/if}
            
            {*<input type="text" class="tcal" name="eventdate" id="eventdate" value="{$value.eventdate}" />
            <span class="warn">{$errors.eventdate}</span>*}
        </div>
                     {*       <div id="div2">
{*                                    Text anons
                            </div>*}
        
        {*<div class="field">
            <label>{$i18n.eventdate}:<span class="starr">&nbsp;*</span></label>
            <input type="text" class="tcal" name="eventdate" id="eventdate" value="{$value.eventdate}" />
            <span class="warn">{$errors.eventdate}</span>
        </div>*}
        <div class="field">    
            <label>{$i18n.eventname}:<span class="starr">&nbsp;*</span></label>
            <select size="3" style="width: 450px;" id="eventname">{$value.eventname}
{*            <select class="tcal" id="eventname">{$value.eventname}*}
            </select>
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


