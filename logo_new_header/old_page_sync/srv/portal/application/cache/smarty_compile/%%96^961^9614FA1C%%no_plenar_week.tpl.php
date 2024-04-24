<?php /* Smarty version 2.6.22, created on 2024-04-11 10:41:29
         compiled from main_page/no_plenar_week.tpl */ ?>

<section class="plenary-week">  
    <div class="container">
        <div class="border-mark border-green">
                <h2 class="block-heading">
                                            MPs work with voters
                                    </h2>
            </div>
        <?php if ($this->_tpl_vars['next_planar_week_dates']['forward']->current_day_descriptor): ?>
            <div class="border-mark border-green">
                <h2 class="block-heading">
                                        <?php echo $this->_tpl_vars['next_planar_week_dates']['forward']->current_day_descriptor; ?>

                                    </h2>
            </div>
        <?php endif; ?>
        <div class="row">
            <div class="col-lg-8 col-md-7">

                <div class="time-table bg2">
                    <div class="block-heading">
                        Summaries of preceding plenary sittings

                    </div>

                    <div class="block-heading__date">
                        <?php echo $this->_tpl_vars['next_planar_week_dates']['backward']->day_s; ?>
  <?php echo $this->_tpl_vars['next_planar_week_dates']['backward']->mon_s; ?>

                        – <?php echo $this->_tpl_vars['next_planar_week_dates']['backward']->day_e; ?>
 <?php echo $this->_tpl_vars['next_planar_week_dates']['backward']->mon_e; ?>

                    </div>
                    <span class="more-link white-link">
                        <a href="/news/hpz9/"> To review</a>
                    </span>

                </div>


                <div class="resume-text table-block">
                    <div class="tr-block">
                        <div class="td-block f24">
                                                        
                            

                            <div class="max335">
                                                                                       </div>
                                 
                                                               
                                                                
                        </div>
                                              
                      
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

                            </div>
        </div>
    </div>
</section>

<?php echo '
    <script>
        /*-- Add to Calendar --*/
        var myCalendar = createCalendar({
            options: {
                class: \'reminding-link\',
                id: \'my-id\'                               // You need to pass an ID. If you don\'t, one will be generated for you.
            },
            data: {
                title: \'Plenary week\', // Event title
                start: new Date('; ?>
'<?php echo $this->_tpl_vars['planar_week_dates']->m_s; ?>
 <?php echo $this->_tpl_vars['planar_week_dates']->day_s; ?>
, <?php echo $this->_tpl_vars['planar_week_dates']->year_s; ?>
 10:00'<?php echo '), // Event start date
                duration: 480, // Event duration (IN MINUTES)
                end: new Date('; ?>
'<?php echo $this->_tpl_vars['planar_week_dates']->m_e; ?>
 <?php echo $this->_tpl_vars['planar_week_dates']->day_e; ?>
, <?php echo $this->_tpl_vars['planar_week_dates']->year_e; ?>
 18:00'<?php echo '), // You can also choose to set an end time.
                // If an end time is set, this will take precedence over duration
                address: \'Verkhovna Rada of Ukraine, Mykhaila Hryshevskoho Street, 5, Kyiv, Ukraine,ZIP code 01008\',
                description: \'Plenary sittings of the Verkhovna Rada of Ukraine\'
            }
        })

        document.querySelector(\'.new-cal\').appendChild(myCalendar);


        jQuery(function ($) {
            $(document).mouseup(function (e) {
                var div = $(".new-cal");
                if (!div.is(e.target)
                        && div.has(e.target).length === 0) {
                    $(\'.add-to-calendar-checkbox\').prop(\'checked\', false);
                }
            });
        });
    </script>
'; ?>
