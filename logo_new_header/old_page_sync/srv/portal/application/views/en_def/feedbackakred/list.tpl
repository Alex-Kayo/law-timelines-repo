

{foreach item=data from=$events}
    <div class="ev_unsel panel">
        <div class="panel-body">
            <span id="evtime" class="event_date time">{$data->hour}</span><span id="evdata" style="display: none;">{$data->day} {$data->month} о </span>
            <span id="evtext" class="event_txt">{$data->i_name}</span>
        </div>
    </div>
{/foreach}  

{literal}

    <script>
        $(document).ready(function () {

            if ($("#eventname").val()) {
                $("#sel_info").html(sel_text_info($("#eventdate").val(), $("#eventname").val()));
            } else {
                $("#sel_info").html('<font color="red">One-time accreditation event not selected!</font>');
            }
        })

        function sel_text_info(date, name) {

            return "To complete the accreditation process, we ask you to send scans of two documents: the first and second pages of your passport and a press card / editorial certificate by email <a href='mailto:advise@v.rada.gov.ua'>advise@v.rada.gov.ua</a> up to 16-00 days before the selected event." //+ "<b>" + date + "</b>"
                   // + "<div class='form-check'><input class='form-check-input' type='checkbox' name='check1' id='check1' value='option1'><label class='form-check-label' for='check1'>The information is familiar</label></div>";
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

{/literal}

