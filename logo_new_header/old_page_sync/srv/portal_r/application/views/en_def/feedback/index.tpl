{*<script src="/sources{$th_folder}/feedback/js.js"></script>*}
{literal}
    <script>
        function sendMsg() {
            $.ajax({
                url: '/en/feedback/sendMsg',
                type: 'post',
                data: {theme: $('#theme').val(), name: $('#name').val(), phone: $('#phone').val(), email: $('#email').val(), addressee: $('#addressee').val(), text: $('#text').val(), captcha: $('#captcha').val()},
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
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item active">Feedback form</li>
    </ol>

    <div class="page-heading">
        Feedback form
    </div>

    <hr class="full-width">

    <div class="content" id="feedback">
        {include file="feedback/form.tpl"} 
    </div>

</div>