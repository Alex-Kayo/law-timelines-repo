<div class="row">
                        <div class="col-sm-12">
                            <!-- when empty block -->
                            
                            
                                <div class="time-table">
                                    <div class="block-heading">
                                        <i class="fa-calendar-alt"></i>
                                       <a target ="_blank" href="http://static.rada.gov.ua/zakon/new/WR/index.htm"> Timetable for plenary sittings</a>
                                    </div>
                                    <div class="block-heading__date">
                                         {assign var=first_day value = $planar_week_dates->day_s|intval}
                                            {$first_day} {$planar_week_dates->mon_s}  - {$planar_week_dates->day_e} {$planar_week_dates->mon_e} 
{*                                            {$planar_week_dates->day_s|intval.2} {$planar_week_dates->mon_s}  - {$planar_week_dates->day_e} {$planar_week_dates->mon_e} *}
{*                                        18 листопада – 21 листопада*}
                                    </div>

                                    {*<span class="more-link white-link">
                                        <a target ="_blank" href="https://iportal.rada.gov.ua/meeting/awt">Agenda items to be treated at plenary sittings</a>
                                    </span>*}
                                    <span class="more-link white-link">
                                        <a target ="_blank" href="/news/Plenarni_zasidannya">Summaries of preceding plenary sittings</a>
                                    </span>

                                </div>
                            


                                
                                {*<span class="reminding-btn">
                                    <a href="#">Opening-time notifier</a>
                                </span>*}
                                <span class="new-cal-nogolos"></span>
                                
                                <span class="more-link">
                                    <a href="/news/hpz9">Preceding votings</a>
                                </span>


                            <!-- /when empty block -->
                        </div>
                        {*<div class="col-sm-4">



                            <div class="electronic-registration">
                                <ul class="ul-list with-ico">
                                <li><a href="#">Хронологія розгляду</a></li>
                                <li><a href="#">Результати розгляду</a></li>
                                <li><a href="#">Електронний протокол</a></li>
                                <li><a href="#">Стенограми пленарних засідань</a></li>
                                <li><a href="#">Статистика голосувань
                                за обраний період</a></li>
                            </ul>
                            </div>
                        </div>*}
                    </div><!--/row-->

{literal}
<script>
    /*-- Add to Calendar --*/
var myCalendar = createCalendar({
        options: {
          class: 'reminding-link',
          id: 'my-id2'                               // You need to pass an ID. If you don't, one will be generated for you.
        },
        data: {
          title: 'Plenary week',     // Event title
          start: new Date({/literal}'{$planar_week_dates->m_s} {$planar_week_dates->day_s}, {$planar_week_dates->year_s} 10:00'{literal}),   // Event start date
          duration: 480,                            // Event duration (IN MINUTES)
          end: new Date({/literal}'{$planar_week_dates->m_e} {$planar_week_dates->day_e}, {$planar_week_dates->year_e} 18:00'{literal}),     // You can also choose to set an end time.
                                                    // If an end time is set, this will take precedence over duration
          address: 'Verkhovna Rada of Ukraine, Mykhaila Hryshevskoho Street, 5, Kyiv, Ukraine,ZIP code 01008',
          description: 'Plenary sittings of the Verkhovna Rada of Ukraine'
        }
      })

      document.querySelector('.new-cal-nogolos').appendChild(myCalendar);


    jQuery(function($){
          $(document).mouseup(function (e){
              var div = $(".new-cal-nogolos");
              if (!div.is(e.target)
                  && div.has(e.target).length === 0) {
                  $('.add-to-calendar-checkbox').prop('checked', false);
              }
          });
      });
</script>
{/literal}
