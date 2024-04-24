{literal}



<script>

    
    

    $(document).ready(function(){SelAnons({/literal}{$anons_dates[0].fulldate}{literal});
       // $('#carousel_anons').jcarousel({
            // Configuration goes here
        //         });
    });
    
    

function SelAnons( id )
{
        $.ajax({
         type: "POST",
         url: "/selevents/"+id,
         data: {"reque":id},
        success: function(msg){

                   //$("#anons_select a").css({"color":"#000"})
                   $("#"+id).css({"color":"#2474b2"})
                   $("#anons_text").html(msg);
                 // $("#anons_select a").attr("onclick", "SelAnons(" + id + ")")
                     /*$('.announce_overflow').jScrollPane({showArrows: true});*/
                  //   $(".jspDrag").css("top","0");
                  //   $(".jspPane").css("top","0");
                  }

    });
};
/*function SetEventValue()
{
 //  $(th).attr("style","");
   $(this).css({"color": "red"});

        // $(target).val(inpval);
};*/
    


</script>
{/literal}
{$timeoutError}
<form action="" method="post">
    <div class="accreditation-form">
        
        <div id="anons_select" class="block_akred_submenu">

            <div class="hide-select">
                <ul class="sections_tabs nav nav-tabs" id="myTab" role="tablist">
                    {foreach item=data from=$anons_dates name=i  }
                    <li class="nav-item" >
                        <a id="{$data.fulldate}" onclick="SelAnons({$data.fulldate})" title="{$data.weekday_name}" class="nav-link {if $smarty.foreach.i.index == 0}show active {/if}" data-toggle="tab" href="#pw_day_{$data.fulldate}" role="tab" aria-controls="main" aria-selected="true">
                            {$data.wday}
                            <span class="date">
                                {$data.day} {$data.month_name}
                            </span>
                        </a> 
                    </li>

                    {/foreach}
                </ul>
            </div><!--/hide-select-->
            

            <div class="show-select">
                <div class="nice-select tinynav tinynav1" tabindex="0">
                    <span class="current">
                        {foreach item=data from=$anons_dates name=i  }
                         {if $smarty.foreach.i.index == 0}
                         {$data.wday} {$data.day} {$data.month_name}
                         {/if}  
                         {/foreach}
                    </span>
                    <ul class="list nav nav-tabs">

                        {foreach item=data from=$anons_dates name=i  }
                        <li data-value="#pw_day_{$data.fulldate}" class="option">
                            <a onclick="SelAnons({$data.fulldate})" href="javascript://" id="pw_day_{$data.fulldate}" aria-controls="pw_day_{$data.fulldate}">
                                {$data.wday} {$data.day} {$data.month_name}
                            </a>
                        </li>
                        {/foreach}

                    </ul>
                </div>
            </div><!--/show-select-->
        </div>
    
        <div class="accreditation-form__heading">
            <label>{$i18n.eventname}: {$data->day} {$data->month} </label>
        </div>
        
        <div class="information_block">
                <div class="announce_block">
                    <div class="announce_akred_list">
                    	<div class="announce_overflow">

                            <div id="anons_text">
                            {*Text anons*}
                            </div>

                        </div>
                    </div>
                </div>
            </div>
                       
        <div class="accreditation-form__heading">
                        Заповніть форму акредитації
        </div>

        <div class="alert alert-warning">
                        Всі поля обов’язкові для заповнення
        </div>
                            
        <div class="row">

            <div class="form-group col-md-6">
                <label>{$i18n.lname}:</label>
                <input type="text" class="form-control" name="lname" id="lname" value="{$value.lname}"/>
                <span class="warn">{$errors.lname}</span>
            </div>
            <div class="form-group col-md-6">
                <label>{$i18n.name}:</label>
                <input type="text" class="form-control" name="name" id="name" value="{$value.name}"/>
                <span class="warn">{$errors.name}</span>
            </div>
        </div>
        <div class="row">
            {*<div class="form-group col-md-6">
                <label>{$i18n.pname}:</label>
                <input type="text" class="form-control" name="pname" id="pname" value="{$value.pname}"/>
                <span class="warn">{$errors.pname}</span>
            </div>*}
            <div class="form-group col-md-6">
                <label>{$i18n.zminame}:</label>
                <input type="text" class="form-control"  name="zminame" id="zminame" value="{$value.zminame}"/>
                <span class="warn">{$errors.zminame}</span>
        </div><div class="form-group col-md-6">
                <label>{$i18n.zmiposada}:</label>
                <input type="text" class="form-control"  name="zmiposada" id="zmiposada" value="{$value.zmiposada}"/>
                <span class="warn">{$errors.zmiposada}</span>
        </div>
        <div class="form-group col-md-6">
                <label>{$i18n.phone}:</label>
                <input type="text" class="form-control"  name="phone" id="phone" value="{$value.phone}" />
                <span class="warn">{$errors.phone}</span>
            </div>

            <div class="form-group col-md-6">
                <label>{$i18n.email}:</label>
                <input type="text" class="form-control" name="email" id="email" value="{$value.email}" />
                <span class="warn">{$errors.email}</span>
            </div>
            
        </div>
        
{*        <hr class="light">*}
{*        *}
{*        <div class="row">*}
{*            <div class="form-group col-md-6">*}
{*                <label>{$i18n.email}:</label>*}
{*                <input type="text" class="form-control" name="email" id="email" value="{$value.email}" />*}
{*                <span class="warn">{$errors.email}</span>*}
{*            </div>*}
{*            *}

{*        </div><!--/row-->*}
        
        <div class="form-group">
{*            <label>{$i18n.eventdate}:<span class="starr">&nbsp;*</span></label>*}
            <input type="hidden" name="eventdate" id="eventdate" value="{$value.eventdate}" />
            <span class="warn">{$errors.eventdate}</span>
{*            <span class="warn">2342342342342342</span>*}
        </div>
        <div class="form-group">
{*            <label>{$i18n.eventname}:<span class="starr">&nbsp;*</span></label>*}
            <input type="hidden" id="eventname" value="{$value.eventname}"/>
            <span class="warn" id="ev">{$errors.eventname}</span>
        </div>
{*        <span class="warn">{$errors.eventname}</span>*}
        <div class="form-group">
            <label class="add-information__link">
                <a data-toggle="collapse" href="#collapseInfo" role="button" aria-expanded="false" aria-controls="collapseExample">
                {$i18n.message}
                </a>
            </label>
                <div class="collapse" id="collapseInfo">
                    <textarea class="form-control" id="text">{$value.text}</textarea>
            {*<span class="warn">{$errors.text}</span>*}
                </div>
            
        </div>
                
        <div id="sel_info" class="text-agree">

        </div>

        <div class="form-group capchure">
<br>
            <div>

                <div id="recaptcha"></div>

{*         {$captcha}*}
{*                <div class="g-recaptcha" data-sitekey="6LeR7jkUAAAAAGS9mKZGDGjsnEgUgcOC9PCCVxRT"></div>*}
{*            </div>*}

             <span class="warn">{$errors.captcha}</span>
        </div>
            <br>
        <div class="form-group">
             <input type="submit" class="sendcomm btn btn-primary" value="Надіслати" onclick="sendMsg(); return false;"/>
        </div>
             
             
    </div><!--/accreditation-form-->
                            
                            
    
    
 
            

</form>



