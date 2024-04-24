<?php /* Smarty version 2.6.22, created on 2024-01-30 10:33:41
         compiled from feedbackakred/index.tpl */ ?>
<?php echo '
    <script>
        var onloadCallback = function() {
            grecaptcha.render(\'recaptcha\', {
                \'sitekey\' : '; ?>
 '<?php echo $this->_tpl_vars['sitekey']; ?>
' <?php echo '//\'6LeR7jkUAAAAAGS9mKZGDGjsnEgUgcOC9PCCVxRT\'
            });
        };

       // grecaptcha.reset();

      function sendMsg() {
    $.ajax({
        url: \'/feedbackakred/sendMsg\',
        type: \'post\',
        data: {zminame: $(\'#zminame\').val(), zmiposada: $(\'#zmiposada\').val(), name: $(\'#name\').val(), /*pname: $(\'#pname\').val(),*/ lname: $(\'#lname\').val(), eventdate: $(\'#eventdate\').val(), eventname: $(\'#eventname\').val(), phone: $(\'#phone\').val(), email: $(\'#email\').val(), /*addressee: $(\'#addressee\').val(),*/ text: $(\'#text\').val(), recaptcha: grecaptcha.getResponse()},
        dataType: "html",
        success: function(msg) {
            $(\'#feedback\').html(msg);
           // grecaptcha.reset();

        }

    });

}

    </script>
'; ?>


<div class="container">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Головна</a></li>
        <li class="breadcrumb-item active">Форма акредитації</li>
    </ol>

    <div class="page-heading">
        <h3>Форма разової реєстрації на подію</h3>
    </div>  
</div>

<hr class="full-width">
    
<div class="container">
    

    <div class="content" id="feedback">
                <?php echo $this->_tpl_vars['anons_dates'][0]['fulldate']; ?>

                    <?php if ($this->_tpl_vars['anons_dates']): ?>
                     <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "feedbackakred/form.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?> 
                     <?php else: ?>
                         <img width="80%" src="/img/form_akred_disable.png">
                    <?php endif; ?>
    </div>

    
</div><!--/container-->
<?php echo '
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer>
</script>
'; ?>
