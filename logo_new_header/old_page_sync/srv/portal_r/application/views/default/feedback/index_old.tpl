{*<script src="/sources{$th_folder}/feedback/js.js"></script>*}
{literal}
    <script>
      function sendMsg() {
    $.ajax({
        url: '/feedback/sendMsg',
        type: 'post',
        data: {theme: $('#theme').val(), name: $('#name').val(), post: $('#post').val(), phone: $('#phone').val(), email: $('#email').val(), addressee: $('#addressee').val(), text: $('#text').val(), captcha: $('#captcha').val()},
        dataType: "html",
        success: function(msg) {
            $('#feedback').html(msg);

        }

    });

}  
    </script>
{/literal}

<div class="heading">
    <h3><span>Зворотний зв'язок</span></h3>
</div>  
<div class="content" id="feedback">
{include file="feedback/form.tpl"} 
</div>