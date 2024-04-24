{*<script src="/sources{$th_folder}/feedback/js.js"></script>*}
{literal}
    <script>
        var onloadCallback = function() {
            grecaptcha.render('recaptcha', {
                'sitekey' : {/literal} '{$sitekey}' {literal}//'6LeR7jkUAAAAAGS9mKZGDGjsnEgUgcOC9PCCVxRT'
            });
        };

       // grecaptcha.reset();

      function sendMsg() {
    $.ajax({
        url: '/feedbackakred/sendMsg',
        type: 'post',
        data: {zminame: $('#zminame').val(), zmiposada: $('#zmiposada').val(), name: $('#name').val(), /*pname: $('#pname').val(),*/ lname: $('#lname').val(), eventdate: $('#eventdate').val(), eventname: $('#eventname').val(), phone: $('#phone').val(), email: $('#email').val(), /*addressee: $('#addressee').val(),*/ text: $('#text').val(), recaptcha: grecaptcha.getResponse()},
        dataType: "html",
        success: function(msg) {
            $('#feedback').html(msg);

        }
    });

}

    </script>
{/literal}


<div class="container">
    

    <div class="content" id="feedback">
                    {if $anons_dates}
                     {include file="feedbackakred/form.tpl"} 
                     {else}
                         <img width="80%" src="/img/form_akred_disable.png">
                    {/if}
    </div>

    
</div><!--/container-->
{literal}
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer>
</script>
{/literal}
