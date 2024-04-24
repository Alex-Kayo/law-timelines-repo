 {*<script src="/sources{$th_folder}/feedback/js.js"></script>*}
{literal}
    <script>
      function sendMsg() {
    $.ajax({
        url: '/en/feedbackakred/sendMsg',
        type: 'post',
        data: {zminame: $('#zminame').val(), name: $('#name').val(), /*pname: $('#pname').val(),*/ lname: $('#lname').val(), eventdate: $('#eventdate').val(), eventname: $('#eventname').val(), phone: $('#phone').val(), email: $('#email').val(), /*addressee: $('#addressee').val(),*/ text: $('#text').val(), captcha: $('#captcha').val()},
        dataType: "html",
        success: function(msg) {
            $('#feedback').html(msg);

        }

    });

}
    </script>
{/literal}

<div class="container">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Main</a></li>
        <li class="breadcrumb-item active">Media accreditation form</li>
    </ol>

    <div class="page-heading">
        <h3>Registration form for one-time accreditation for an event</h3>
    </div>  
</div>

<hr class="full-width">
    
<div class="container">
    

    <div class="content" id="feedback">
                {*{$anons_dates[0].fulldate}*}
                    {if $anons_dates}
                     {include file="feedbackakred/form.tpl"} 
                     {else}
                         <img width="100%" src="/img/form_akred_disable.png">
                    {/if}
    </div>

    
</div><!--/container-->