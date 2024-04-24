
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
                $("#sel_info").html('<font color="red">Подію для разової акредитації не обрано!</font>');
            }
        })

        function sel_text_info(date, name) {
         //   alert(name);
            return '<b>Ви обрали подію: <br>' + name + '<br> Запланована дата і час - '  + date + '</b>';
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

