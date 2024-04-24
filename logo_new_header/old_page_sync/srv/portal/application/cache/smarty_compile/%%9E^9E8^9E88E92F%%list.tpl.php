<?php /* Smarty version 2.6.22, created on 2024-03-18 17:00:16
         compiled from feedbackakred/list.tpl */ ?>

<?php $_from = $this->_tpl_vars['events']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
    <div class="ev_unsel panel">
        <div class="panel-body">
            <span id="evtime" class="event_date time"><?php echo $this->_tpl_vars['data']->hour; ?>
</span><span id="evdata" style="display: none;"><?php echo $this->_tpl_vars['data']->day; ?>
 <?php echo $this->_tpl_vars['data']->month; ?>
 о </span>
            <span id="evtext" class="event_txt"><?php echo $this->_tpl_vars['data']->i_name; ?>
</span>
        </div>
    </div>
<?php endforeach; endif; unset($_from); ?>  

<?php echo '

    <script>
        $(document).ready(function () {

            if ($("#eventname").val()) {
                $("#sel_info").html(sel_text_info($("#eventdate").val(), $("#eventname").val()));
            } else {
                $("#sel_info").html(\'<font color="red">Подію для разової акредитації не обрано!</font>\');
            }
        })

        function sel_text_info(date, name) {

            return "Для завершення процесу акредитації просимо Вас надіслати скани двох документів: першої та другої сторінки паспорту і прес-карти/редакційного посвідчення на електронну пошту <a href=\'mailto:advise@v.rada.gov.ua\'>advise@v.rada.gov.ua</a> до 16-00 дня, що передує обраній події." //+ "<b>" + date + "</b>"
                   // + "<div class=\'form-check\'><input class=\'form-check-input\' type=\'checkbox\' name=\'check1\' id=\'check1\' value=\'option1\'><label class=\'form-check-label\' for=\'check1\'>З інформацією ознайомленний</label></div>";
        }
        ;

        $(".ev_unsel").click(function () {
            $(".ev_sel").removeClass("ev_sel").addClass("ev_unsel");
            $(this).removeClass("ev_unsel").addClass("ev_sel");
            $("#eventname").val($(this).find("#evtext").text());
            $("#eventdate").val($(this).find("#evdata").text() + $(this).find("#evtime").text());
            $("#sel_info").html(sel_text_info($("#eventdate").val(), $("#eventname").val()));
            $("#ev").hide();
        })
    </script>

'; ?>

