<?php /* Smarty version 2.6.22, created on 2024-03-18 17:00:10
         compiled from feedbackakred/form.tpl */ ?>
<?php echo '



<script>

    
    

    $(document).ready(function(){SelAnons('; ?>
<?php echo $this->_tpl_vars['anons_dates'][0]['fulldate']; ?>
<?php echo ');
       // $(\'#carousel_anons\').jcarousel({
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
                     /*$(\'.announce_overflow\').jScrollPane({showArrows: true});*/
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
'; ?>

<?php echo $this->_tpl_vars['timeoutError']; ?>

<form action="" method="post">
    <div class="accreditation-form">
        
        <div id="anons_select" class="block_akred_submenu">

            <div class="hide-select">
                <ul class="sections_tabs nav nav-tabs" id="myTab" role="tablist">
                    <?php $_from = $this->_tpl_vars['anons_dates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>
                    <li class="nav-item" >
                        <a id="<?php echo $this->_tpl_vars['data']['fulldate']; ?>
" onclick="SelAnons(<?php echo $this->_tpl_vars['data']['fulldate']; ?>
)" title="<?php echo $this->_tpl_vars['data']['weekday_name']; ?>
" class="nav-link <?php if (($this->_foreach['i']['iteration']-1) == 0): ?>show active <?php endif; ?>" data-toggle="tab" href="#pw_day_<?php echo $this->_tpl_vars['data']['fulldate']; ?>
" role="tab" aria-controls="main" aria-selected="true">
                            <?php echo $this->_tpl_vars['data']['wday']; ?>

                            <span class="date">
                                <?php echo $this->_tpl_vars['data']['day']; ?>
 <?php echo $this->_tpl_vars['data']['month_name']; ?>

                            </span>
                        </a> 
                    </li>

                    <?php endforeach; endif; unset($_from); ?>
                </ul>
            </div><!--/hide-select-->
            

            <div class="show-select">
                <div class="nice-select tinynav tinynav1" tabindex="0">
                    <span class="current">
                        <?php $_from = $this->_tpl_vars['anons_dates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>
                         <?php if (($this->_foreach['i']['iteration']-1) == 0): ?>
                         <?php echo $this->_tpl_vars['data']['wday']; ?>
 <?php echo $this->_tpl_vars['data']['day']; ?>
 <?php echo $this->_tpl_vars['data']['month_name']; ?>

                         <?php endif; ?>  
                         <?php endforeach; endif; unset($_from); ?>
                    </span>
                    <ul class="list nav nav-tabs">

                        <?php $_from = $this->_tpl_vars['anons_dates']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['data']):
        $this->_foreach['i']['iteration']++;
?>
                        <li data-value="#pw_day_<?php echo $this->_tpl_vars['data']['fulldate']; ?>
" class="option">
                            <a onclick="SelAnons(<?php echo $this->_tpl_vars['data']['fulldate']; ?>
)" href="javascript://" id="pw_day_<?php echo $this->_tpl_vars['data']['fulldate']; ?>
" aria-controls="pw_day_<?php echo $this->_tpl_vars['data']['fulldate']; ?>
">
                                <?php echo $this->_tpl_vars['data']['wday']; ?>
 <?php echo $this->_tpl_vars['data']['day']; ?>
 <?php echo $this->_tpl_vars['data']['month_name']; ?>

                            </a>
                        </li>
                        <?php endforeach; endif; unset($_from); ?>

                    </ul>
                </div>
            </div><!--/show-select-->
        </div>
    
        <div class="accreditation-form__heading">
            <label><?php echo $this->_tpl_vars['i18n']['eventname']; ?>
: <?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 </label>
        </div>
        
        <div class="information_block">
                <div class="announce_block">
                    <div class="announce_akred_list">
                    	<div class="announce_overflow">

                            <div id="anons_text">
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
                <label><?php echo $this->_tpl_vars['i18n']['lname']; ?>
:</label>
                <input type="text" class="form-control" name="lname" id="lname" value="<?php echo $this->_tpl_vars['value']['lname']; ?>
"/>
                <span class="warn"><?php echo $this->_tpl_vars['errors']['lname']; ?>
</span>
            </div>
            <div class="form-group col-md-6">
                <label><?php echo $this->_tpl_vars['i18n']['name']; ?>
:</label>
                <input type="text" class="form-control" name="name" id="name" value="<?php echo $this->_tpl_vars['value']['name']; ?>
"/>
                <span class="warn"><?php echo $this->_tpl_vars['errors']['name']; ?>
</span>
            </div>
        </div>
        <div class="row">
                        <div class="form-group col-md-6">
                <label><?php echo $this->_tpl_vars['i18n']['zminame']; ?>
:</label>
                <input type="text" class="form-control"  name="zminame" id="zminame" value="<?php echo $this->_tpl_vars['value']['zminame']; ?>
"/>
                <span class="warn"><?php echo $this->_tpl_vars['errors']['zminame']; ?>
</span>
        </div><div class="form-group col-md-6">
                <label><?php echo $this->_tpl_vars['i18n']['zmiposada']; ?>
:</label>
                <input type="text" class="form-control"  name="zmiposada" id="zmiposada" value="<?php echo $this->_tpl_vars['value']['zmiposada']; ?>
"/>
                <span class="warn"><?php echo $this->_tpl_vars['errors']['zmiposada']; ?>
</span>
        </div>
        <div class="form-group col-md-6">
                <label><?php echo $this->_tpl_vars['i18n']['phone']; ?>
:</label>
                <input type="text" class="form-control"  name="phone" id="phone" value="<?php echo $this->_tpl_vars['value']['phone']; ?>
" />
                <span class="warn"><?php echo $this->_tpl_vars['errors']['phone']; ?>
</span>
            </div>

            <div class="form-group col-md-6">
                <label><?php echo $this->_tpl_vars['i18n']['email']; ?>
:</label>
                <input type="text" class="form-control" name="email" id="email" value="<?php echo $this->_tpl_vars['value']['email']; ?>
" />
                <span class="warn"><?php echo $this->_tpl_vars['errors']['email']; ?>
</span>
            </div>
            
        </div>
        

        
        <div class="form-group">
            <input type="hidden" name="eventdate" id="eventdate" value="<?php echo $this->_tpl_vars['value']['eventdate']; ?>
" />
            <span class="warn"><?php echo $this->_tpl_vars['errors']['eventdate']; ?>
</span>
        </div>
        <div class="form-group">
            <input type="hidden" id="eventname" value="<?php echo $this->_tpl_vars['value']['eventname']; ?>
"/>
            <span class="warn" id="ev"><?php echo $this->_tpl_vars['errors']['eventname']; ?>
</span>
        </div>
        <div class="form-group">
            <label class="add-information__link">
                <a data-toggle="collapse" href="#collapseInfo" role="button" aria-expanded="false" aria-controls="collapseExample">
                <?php echo $this->_tpl_vars['i18n']['message']; ?>

                </a>
            </label>
                <div class="collapse" id="collapseInfo">
                    <textarea class="form-control" id="text"><?php echo $this->_tpl_vars['value']['text']; ?>
</textarea>
                            </div>
            
        </div>
                
        <div id="sel_info" class="text-agree">

        </div>

        <div class="form-group capchure">
<br>
            <div>

                <div id="recaptcha"></div>


             <span class="warn"><?php echo $this->_tpl_vars['errors']['captcha']; ?>
</span>
        </div>
            <br>
        <div class="form-group">
             <input type="submit" class="sendcomm btn btn-primary" value="Надіслати" onclick="sendMsg(); return false;"/>
        </div>
             
             
    </div><!--/accreditation-form-->
                            
                            
    
    
 
            

</form>


