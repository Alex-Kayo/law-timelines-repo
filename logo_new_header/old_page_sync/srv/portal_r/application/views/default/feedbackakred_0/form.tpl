{literal}

<style type="text/css">
 #anons_select .jcarousel-skin-tango .jcarousel-container-horizontal   {
    width: 100%;
    padding: 0 40px;
}
#anons_select .jcarousel-skin-tango .jcarousel-clip-horizontal{
    /*position: relative;*/
    overflow: hidden;
    width: 90%;
}
#anons_select .jcarousel-skin-tango .jcarousel-item-horizontal{
    
    margin: 0 -9px 0 -8px;
    /*padding: 0 0px 0 0px;*/
    max-height: 14px;
    width: 79px;
}

#anons_select .jcarousel-skin-tango .jcarousel-next-horizontal {
    right: 75px;
    top: -6px;
}
#anons_select .jcarousel-skin-tango .jcarousel-prev-horizontal {
    left: -1px;
    top: -6px;
}

</style>    
    
<script>
    $(document).ready(function(){SelAnons({/literal}{$anons_dates[0].fulldate}{literal});
                $('#carousel_anons').jcarousel({
            // Configuration goes here
                 });
    });

function SelAnons( id )
{
        $.ajax({
         type: "POST",
         url: "/selevents/"+id,
         data: {"reque":id},
        success: function(msg){
                   $("#anons_select a").css({"color":"#000"})
                   $("#"+id).css({"color":"#2474b2"})
                   $("#div2").html(msg);
                     $('.announce_overflow').jScrollPane({showArrows: true});
                     $(".jspDrag").css("top","0");
                     $(".jspPane").css("top","0");
                  }
                 
    });
}
function SetEventValue( target, inpval )
{
    $(target).val(inpval);
}
</script>
{/literal}
{$timeoutError}

{*<b>{$anons_dates[0].fulldate}</b>*}
<form action="" method="post">
    <div style="float: left; width: 35%;">
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
        
    </div>    
        <div>
        <div style="float: right; width: 65%;">
            <label>{$i18n.eventname}:</label>
        <div>
                
            <div id="anons_select" class="block_submenu">
                <ul id="carousel_anons" class = "jcarousel-skin-tango">
                    {foreach item=data from=$anons_dates }
                        <li> <a id="{$data.fulldate}" style="cursor:pointer" onclick="SelAnons({$data.fulldate})"title="{$data.weekday_name}">{$data.day} {$data.month_name|lower}</a> </li> 

                    {/foreach}
                </ul>    

            </div>    
        </div>    
            <div class="information_block">
                <div class="announce_block">
                	<div class="announce_list">
                    	<div class="announce_overflow">
                            
                            <div id="div2">
{*                                    Text anons*}
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
        
        <div class="field">
{*            <label>{$i18n.eventdate}:<span class="starr">&nbsp;*</span></label>*}
            <input type="hidden" name="eventdate" id="eventdate" value="{$value.eventdate}" />
            <span class="warn">{$errors.eventdate}</span>
{*            <span class="warn">2342342342342342</span>*}
        </div>
        <div class="field">    
{*            <label>{$i18n.eventname}:<span class="starr">&nbsp;*</span></label>*}
            <input type="hidden" id="eventname"{$value.eventname}/>
            <span class="warn">{$errors.eventname}</span>
        </div> 
        <span class="warn">{$errors.eventname}</span>
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
    </div>  
    <div class="clear"></div>  
</form>


