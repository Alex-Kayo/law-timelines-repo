<div class="row">
                        <div class="col-sm-12">
                            
                            
                            {* when block is empty add class empty-block *}
                            <div class="empty-block">
                                <div class="full-mob-width">
                                    
                                    {if $planar_week_byday.md_type == 6}
                                        
                    <div class="rada-tv">
                        <div class="rada-tv__video">
                            <div class="top-button-group">
                                <span class="live-btn">Наживо</span>
                            </div>
                            <a href="#" class="play-btn"></a>
                            <img src="/files/pogRada2019m.jpg" >
                        </div>
                        <span class="rada-tv__label"><b>RADA</b>TV</span>
                        <div class="rada-tv__heading">
                            Трансляція погоджувальної ради Верховної Ради України
                            <br> <span class="reminding__time"> Початок о 11-00</span>
                        </div>
                        <a href="#" class="reminding__link">
                                        Нагадувати про трансляції
                                    </a>
                    </div>
                    {else}
                        <div class="rada-tv">
                        <div class="rada-tv__video">
{*                            <div class="top-button-group">
                                <span class="live-btn">Наживо</span>
                            </div>*}
                            <a href="/video/rada-tv/64430.html" class="play-btn"></a>
                            <img src="/files/pogRada2019m.jpg" >
                        </div>
                        <span class="rada-tv__label"><b>RADA</b>TV</span>
                        <div class="rada-tv__heading">
                            Матеріали Погоджувальної ради Верховної Ради України
{*                            <br> <span class="reminding__time"> Початок о 11-00</span>*}
                        <ul class="ul-list with-ico">
                            <span class="more-link white-link">
                            <a href="/meeting/stenpog"> Стенограми погоджувальних рад</a>
                            </span>
                            <span class="more-link white-link">
                            <a href="http://w1.c1.rada.gov.ua/pls/prada/ns_el_h"> Електронний протокол</a>
                        </span>
                        {*<li><a href="/meeting/stenpog"> Стенограми погоджувальних рад</a></li>
                        <li><a href="http://w1.c1.rada.gov.ua/pls/prada/ns_el_h"> Електронний протокол</a></li>*}
{*                        <li>Електронний протокол</li>*}
                        
                    </ul>
                        </div>
                        {*<a href="#" class="reminding__link">
                                        Нагадувати про трансляції
                                    </a>*}
                    </div>
                        
                        
                        {/if}
                </div>
                        
                        
                        {*<span class="reminding-btn">
                            <a href="#">Сповістити про початок голосувань</a>
                        </span>*}
                        
                        <span class="new-cal-pog"></span>
                        
                        <span class="more-link">
                            <a href="/news/hpz9">Попередні голосування</a>
                        </span>
                            </div>
                            
             
                            
                        </div>
                            {*<div class="col-sm-4">
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
                            

{literal}
<script>
    /*-- Add to Calendar --*/
var myCalendar = createCalendar({
        options: {
          class: 'reminding-link',
          id: 'my-id'                               // You need to pass an ID. If you don't, one will be generated for you.
        },
        data: {
          title: 'Пленарний тиждень',     // Event title
          start: new Date({/literal}'{$planar_week_dates->m_s} {$planar_week_dates->day_s}, {$planar_week_dates->year_s} 10:00'{literal}),   // Event start date
          duration: 480,                            // Event duration (IN MINUTES)
          end: new Date({/literal}'{$planar_week_dates->m_e} {$planar_week_dates->day_e}, {$planar_week_dates->year_e} 18:00'{literal}),     // You can also choose to set an end time.
                                                    // If an end time is set, this will take precedence over duration
          address: 'Верховна Рада України, вулиця Михайла Грушевського, 5, Київ, Україна, 01008',
          description: 'Пленарні засідання Верховної Ради України'
        }
      })

      document.querySelector('.new-cal-pog').appendChild(myCalendar);


    jQuery(function($){
          $(document).mouseup(function (e){
              var div = $(".new-cal-pog");
              if (!div.is(e.target)
                  && div.has(e.target).length === 0) {
                  $('.add-to-calendar-checkbox').prop('checked', false);
              }
          });
      });
</script>
{/literal}