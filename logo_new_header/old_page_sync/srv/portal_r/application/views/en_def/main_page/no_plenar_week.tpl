{*    <!-- /no_plenar_weeek -->*}

<section class="plenary-week">  
    <div class="container">
        <div class="border-mark border-green">
                <h2 class="block-heading">
                                            MPs work with voters
{*                    {$next_planar_week_dates.forward->current_day_descriptor}*}
                    {*<span class="block-heading__date"> <br>
                    до {$next_planar_week_dates.forward->day_s} {$next_planar_week_dates.forward->mon_s}
                    </span>*}
                </h2>
            </div>
        {if $next_planar_week_dates.forward->current_day_descriptor}
            <div class="border-mark border-green">
                <h2 class="block-heading">
                    {*                        MPs' work on committees, commissions, factions and groups*}
                    {$next_planar_week_dates.forward->current_day_descriptor}
                    {*<span class="block-heading__date"> <br>
                    до {$next_planar_week_dates.forward->day_s} {$next_planar_week_dates.forward->mon_s}
                    </span>*}
                </h2>
            </div>
        {/if}
        <div class="row">
            <div class="col-lg-8 col-md-7">

                <div class="time-table bg2">
                    <div class="block-heading">
                        Summaries of preceding plenary sittings

                    </div>

                    <div class="block-heading__date">
                        {$next_planar_week_dates.backward->day_s}  {$next_planar_week_dates.backward->mon_s}
                        – {$next_planar_week_dates.backward->day_e} {$next_planar_week_dates.backward->mon_e}
                    </div>
                    <span class="more-link white-link">
                        <a href="/news/hpz9/"> To review</a>
                    </span>

                </div>


                <div class="resume-text table-block">
                    <div class="tr-block">
                        <div class="td-block f24">
                            {*<div class="max335">
                            Uhcoming plenary sittings <br>
                            з 18  по 20 вересня 
                            </div>*}
                            {*<div class="max335">
                            Uhcoming plenary sittings <br>
                            from  2 
                            {if $next_planar_week_dates.forward->mon_s !== $next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->mon_s}{/if}
                            
                            to 4 {$next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->year_e} року
                            </div>*}

                            {* Автоматичне вираховування дат по регламенту*}


                            <div class="max335">
                               {* Next planary week <br>*}
                            {*<div class="max335">
                                Upcoming plenary sittings <br>*}
                            </div>
                                 {*{$next_planar_week_dates.forward->day_s} 
                                {if $next_planar_week_dates.forward->mon_s !== $next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->mon_s}{/if}*}

                               {* {$next_planar_week_dates.forward->day_e}*} {*{$next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->year_e} року*}
                               {* from  {$next_planar_week_dates.forward->day_s} 
                                {if $next_planar_week_dates.forward->mon_s !== $next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->mon_s}{/if}*}

                               {* to {$next_planar_week_dates.forward->day_e} {$next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->year_e} year *} {*//old version*}
                                
                        </div>
                      {*  </div>*}
                        {*          {$next_planar_week_dates.forward|@print_r}                   *}

                      {*  <div class="td-block text-right">

                            <span class="new-cal add-btn"></span>*|

                            {*Button code*}

                     {*   </div> *}
                    </div>
                    <div class="tr-block">
                        <div class="td-block">
                            <span class="schedule-link">
                                <a href="http://static.rada.gov.ua/zakon/new/WR/index.htm">
                                    <i class="fa-list-ul"></i>
                                     To view timetable
                                </a>
                            </span>
                            <span class="calendar-link">
                                <a href="/meeting/awt/">
                                    <i class="fa-calendar-alt"></i>
                                    Calendar plan of a session
                                </a>
                            </span>
                        </div>
                        <div class="td-block">
                            <span class="more-link float-right">
                                <a href="/news/hpz9/">Previous voting</a>
                            </span>
                        </div>
                    </div>
                </div>



            </div>
            <div class="col-lg-4 col-sm-12">

                <ul class="ul-list with-ico">
                    <li class="icn-chronology"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_h1">Consideration chronology </a></li>
                    <li class="icn-results"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_pd1">Consideration results</a></li>
                    <li class="icn-table"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h">Electronic protocol</a></li>
                    <li class="icn-transcript"><a href="/meeting/stenogr">Transcripts of plenary sittings</a></li>
                    <li class="icn-flash"><a href="/meeting/faxiv">Consideration of agenda items</a></li>
                    <li class="icn-stats"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_stat">Voting statistics for a given period</a></li>
                </ul>

                {*<div class="electronic-registration">
                <ul class="ul-list with-ico">
                <li><a href="#">Хронологія розгляду</a></li>
                <li><a href="#">Результати розгляду</a></li>
                <li><a href="#">Електронний протокол</a></li>
                <li><a href="#">Стенограми пленарних засідань</a></li>
                <li><a href="#">Статистика голосувань
                за обраний період</a></li>
                </ul>
                </div>*}
            </div>
        </div>
    </div>
</section>

{literal}
    <script>
        /*-- Add to Calendar --*/
        var myCalendar = createCalendar({
            options: {
                class: 'reminding-link',
                id: 'my-id'                               // You need to pass an ID. If you don't, one will be generated for you.
            },
            data: {
                title: 'Plenary week', // Event title
                start: new Date({/literal}'{$planar_week_dates->m_s} {$planar_week_dates->day_s}, {$planar_week_dates->year_e} 10:00'{literal}), // Event start date
                duration: 480, // Event duration (IN MINUTES)
                end: new Date({/literal}'{$planar_week_dates->m_e} {$planar_week_dates->day_e}, {$planar_week_dates->year_e} 18:00'{literal}), // You can also choose to set an end time.
                // If an end time is set, this will take precedence over duration
                address: 'Verkhovna Rada of Ukraine, Mykhaila Hryshevskoho Street, 5, Kyiv, Ukraine,ZIP code 01008',
                description: 'Plenary sittings of the Verkhovna Rada of Ukraine'
            }
        })

        document.querySelector('.new-cal').appendChild(myCalendar);


        jQuery(function ($) {
            $(document).mouseup(function (e) {
                var div = $(".new-cal");
                if (!div.is(e.target)
                        && div.has(e.target).length === 0) {
                    $('.add-to-calendar-checkbox').prop('checked', false);
                }
            });
        });
    </script>
{/literal}
