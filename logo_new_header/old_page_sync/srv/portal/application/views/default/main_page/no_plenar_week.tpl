{*    <!-- /no_plenar_weeek -->*}

<section class="plenary-week">  
    <div class="container">
        {if $next_planar_week_dates.forward->current_day_descriptor}
            <div class="border-mark border-green">
                <h2 class="block-heading">
                    {*                        Депутати працюють в комітетах, комісіях, фракціях і групах*}
                    {$next_planar_week_dates.forward->current_day_descriptor}
                    {*<span class="block-heading__date"> <br>
                    до {$next_planar_week_dates.forward->day_s} {$next_planar_week_dates.forward->mon_s}
                    </span>*}
                </h2>
            </div>
        {/if}
        <div class="row">
{*            <div class="col-lg-8 col-md-7">*}
            <div class="col-lg-8 col-md-12">

                <div class="time-table bg2">
                    <div class="block-heading">
                        Підсумки попередніх пленарних засідань

                    </div>

                    {*<div class="block-heading__date">
                        {$next_planar_week_dates.backward->day_s}  {$next_planar_week_dates.backward->mon_s}
                        – {$next_planar_week_dates.backward->day_e} {$next_planar_week_dates.backward->mon_e}
                    </div>*}
                    <span class="more-link white-link">
                        <a href="/news/hpz9/">Переглянути</a>
                    </span>

                </div>


                <div class="resume-text table-block">
                    
                    <div class="tr-block">
                        <div class="td-block">
                            <span class="schedule-link">
                                <a href="http://static.rada.gov.ua/zakon/new/WR/index.htm">
                                    <i class="fa-list-ul"></i>
                                    Переглянути розклад
                                </a>
                            </span>
                            <span class="calendar-link">
                                <a href="/meeting/awt/">
                                    <i class="fa-calendar-alt"></i>
                                    Календарний план сесії
                                </a>
                            </span>
                        </div>
                        <div class="td-block">
                            <span class="more-link float-right">
                                <a href="/news/hpz9/">Попередні голосування</a>
                            </span>
                        </div>
                    </div>
                     {assign var="meet_type" value=""}
{*                     {assign var="meet_type" value="Пленарне засідання"}*}
                     
                    <div class="tr-block">
                        
                         {if $meet_type} 
                        
                        <div class="td-block f24">
                            {*<div class="max335">
                            Наступні пленарні засідання <br>
                            з 18  по 20 вересня 
                            </div>*}
                            {*<div class="max335">
                            Наступні пленарні засідання <br>
                            з 2 
                            {if $next_planar_week_dates.forward->mon_s !== $next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->mon_s}{/if}
                            
                            по 4 {$next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->year_e} року
                            </div>*}

                            {* Автоматичне вираховування дат по регламенту*}


                            <div class="max335">
{*                                Наступне пленарне засідання <br>*}

                                    
                                {$meet_type} <br>
                                
{*                                Наступний пленарний тиждень <br>*}
                            {*<div class="max335">
                                Наступні пленарні засідання <br>*}
{*                                з {$next_planar_week_dates.forward->day_s} *}
                                {$next_planar_week_dates.forward->day_s} {$next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->year_e} року
                                {*{if $next_planar_week_dates.forward->mon_s !== $next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->mon_s}{/if}*}

                              
                                
                                {*по {$next_planar_week_dates.forward->day_e} {$next_planar_week_dates.forward->mon_e} {$next_planar_week_dates.forward->year_e} року*}
                            </div>
                        </div>
                        {*          {$next_planar_week_dates.forward|@print_r}                   *}

                       
                        <div class="td-block text-right">

                            <span class="new-cal add-btn"></span>

                            {*Button code*}

                        </div>
                       {/if}     
                    </div>
                    
                    
                </div>



            </div>
            <div class="col-lg-4 col-sm-12">

                <ul class="ul-list with-ico">
                    <li class="icn-chronology"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_h1">Хронологія розгляду</a></li>
                    <li class="icn-results"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_pd1">Результати розгляду</a></li>
                    <li class="icn-table"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h">Електронний протокол</a></li>
                    <li class="icn-transcript"><a href="/meeting/stenogr">Стенограми пленарних засідань</a></li>
                    <li class="icn-flash"><a href="/meeting/faxiv">Розгляд питань порядку денного</a></li>
                    <li class="icn-stats"><a href="http://w1.c1.rada.gov.ua/pls/radan_gs09/ns_el_h_stat">Статистика голосувань
                            за обраний період</a></li>
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
                title: 'Пленарні засідання Верховної Ради України', // Event title
                start: new Date({/literal}'{$planar_week_dates->m_s} {$planar_week_dates->day_s}, 2019 10:00'{literal}), // Event start date
                duration: 480, // Event duration (IN MINUTES)
                end: new Date({/literal}'{$planar_week_dates->m_e} {$planar_week_dates->day_e}, 2019 18:00'{literal}), // You can also choose to set an end time.
                // If an end time is set, this will take precedence over duration
                address: 'Верховна Рада України, вулиця Михайла Грушевського, 5, Київ, Україна, 01008',
                description: 'Пленарні засідання Верховної Ради України'
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
