{*<script src="/sources{$th_folder}/feedback/js.js"></script>*}
{literal}
    <script>

        var onloadCallback = function() {
            grecaptcha.render('recaptcha', {
                'sitekey' : {/literal} '{$sitekey}' {literal} //'6LeR7jkUAAAAAGS9mKZGDGjsnEgUgcOC9PCCVxRT'
            });
        };

        function sendMsg() {
            $.ajax({
                url: '/feedback/sendMsg',
                type: 'post',
                data: {theme: $('#theme').val(), name: $('#name').val(), phone: $('#phone').val(), email: $('#email').val(), addressee: $('#addressee').val(), text: $('#text').val(), recaptcha: grecaptcha.getResponse()},
                /* data: {theme: $('#theme').val(), name: $('#name').val(), post: $('#post').val(), phone: $('#phone').val(), email: $('#email').val(), addressee: $('#addressee').val(), text: $('#text').val(), captcha: $('#captcha').val()},*/
                dataType: "html",
                success: function (msg) {
                    $('#feedback').html(msg);

                }

            });

        }
    </script>
    <style>
        .warn {
            color: red;
        }

    </style>
{/literal}

<div class="container">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/">Головна</a></li>
        <li class="breadcrumb-item active">Форма зворотного зв’язку</li>
    </ol>

    <div class="page-heading">
        Зворотний зв’язок
    </div>

    <hr class="full-width">

    <div class="content" id="feedback">
        {include file="feedback/form.tpl"} 
    </div>

</div>

{literal}
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer>
    </script>
{/literal}