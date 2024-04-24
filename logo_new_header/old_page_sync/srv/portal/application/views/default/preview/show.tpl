{*        <script src="/sources/js/ouical.js"></script>*}
  
        <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/">Головна</a></li> 
{*                    <a href="{$lang_prefix}/">Головна</a> *}
                    {foreach item=data from=$path_way}
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/{$data->t_parents}/">{$data->t_name}</a></li>  
                    {/foreach}                    
                    <li class="breadcrumb-item">{$current_node->t_name}</li>
                </ol>

        <div class="publications-heading">Анонси подій</div>
{*        <div class="publications-heading">{$current_node->t_name}</div>*}

        <div class="publications-heading__block">
            <h2>
                {$item->i_name}
            </h2>
            <p class="small-text">
                {if $item->i_author}
               {$item->i_author}

            {/if} 
{*                Опубліковано {$item->day}&nbsp;{$item->month}&nbsp;{$item->year}, о {$item->hour}:{$item->minute}*}
            </p>
{*======================================== ТЕМИ ===========================================*}
            {*<a href="#" class="tags">трансляція</a>
            <a href="#" class="tags">Пленарне засідання</a>*}
{*======================================== /ТЕМИ ===========================================*}
        </div>


        <div class="main-content">
            <div class="row">
                <div class="text-column height-auto col-md-6">
                    <!-- -->
                    <div class="announcement-section">
                        <div class="announcement-block">
                            <div class="duration">
{*                                П’ятниця*}
                            </div>
                            <div class="announcement-data">
                                <span class="a-data">{$item->day}</span>
                                <span class="a-month">{$item->month}</span>
                                <span class="a-year">{$item->year}</span>
                            </div>
                        </div>

                        <div class="announcement-block">
                            <div class="duration">
{*                                Тривалість 3 год. 30 хв.*}
                            </div>
                            <div class="announcement-data">
                                <span class="time"></span>
                                {$item->hour}<sup>{$item->minute}</sup>
                                {*<span class="lite-grey">-</span>
                                14<sup>00</sup>*}
                            </div>
                        </div>

                        <div class="add-to-calendar">
                            <span class="new-cal-anons"></span>
                        </div>

                    </div>

                    <!-- -->
                </div>

              {if $current_node->t_seo_name == 'anons_acred'}               
                <div class="aside-column col-md-3">
                    <div class="to-accredit">
                        <p>Представникам засобів массової інформації необхідно акредитуватися на подію</p>

                        <a href="/fba" class="btn-more normal">
                            Акредитуватися
                        </a>
                    </div>
               



                </div>
              {/if}
            </div>
            <div class="row">
                <div class="text-column col-md-6">

                    <div class="item_content">
{*                    <div class="f16">*}
                        <p>  {if $item->i_full}
                        {$item->i_full}
                    {else}
                        {$item->i_anons}
                    {/if} </p>
                    </div>

                    <br>

                    {*<div class="full-mob-width">
                        <div class="rada-tv">
                            <span class="rada-tv__label"><b>RADA</b>TV</span>
                            <div class="rada-tv__heading">
                                Трансляція пленарного засідання Верховної Ради України
                            </div>
                            <a href="#" class="watch-online__link">Переглянути трансляцію</a>
                            <a href="#" class="reminding__link small-ico float-right ">
                                Нагадувати про трансляції
                            </a>
                        </div>
                    </div>*}

                    <!-- social-aside -->
                    <div class="social-aside">
                        <div>
                            <div class="share-block">
                                {*<div class="like-item">
                                    <a href="#">
                                        <i class="fas fa-share-alt"></i>
                                        <span class="like-item__count">1</span>
                                        <span class="like-item__text"><b>поширень</b></span>
                                    </a>
                                </div>*}
                                <div class="like-item">
                            {*<div class="fb-share-button" data-href="https://rada.gov.ua/news/Top-novyna/179446.html" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Frada.gov.ua%2Fnews%2FTop-novyna%2F179446.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поделиться</a>
                            </div>*}
                            <div class="fb-share-button" data-href="https://www.rada.gov.ua{$base_url}{$i_id}.html" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://www.rada.gov.ua{$base_url}{$i_id}.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поділитись</a></div>
                            {*<div class="fb-share-button" data-href=" {$i_name}.html  <img  src='/uploads/logos/{$data->i_logoname}.jpeg'> </>" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u={$site_domain}{$base_url}{$i_id}.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поділитись</a></div>*}
                            
                            {*<div class="fb-share-button" data-href=" {$i_name}.html  <img  src='/uploads/logos/{$data->i_logoname}.jpeg'> </>" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u={$site_domain}{$base_url}{$i_id}.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поділитись</a></div>*}
                          {*  <div class="fb-share-button" data-href="" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Frada.gov.ua%2Fnews%2FTop-novyna%2F179446.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поделиться</a></div>*}
                            {*<div class="fb-share-button" data-href="https://rada.gov.ua/news/Top-novyna/179446.html" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Frada.gov.ua%2Fnews%2FTop-novyna%2F179446.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поделиться</a></div>*}
                        </div>
                        <div class="like-item">
                            <span class="twitter-share-button-ico">
<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</span>
                        </div>
                        <div class="like-item">
                            <a href="https://telegram.me/share/url?url=https://www.rada.gov.ua{$base_url}{$i_id}.html&text={$item->i_name}" target="_blank">
<i class="fab fa-telegram-plane"></i>
</a>
                        </div>
                        <div class="like-item">
                            <a href="http://m.me/verkhovna.rada.ukraine/" target="_blank">
<i class="fab fa-facebook-messenger"></i>
</a>
                        </div>

                            </div>

                        </div>
                    </div>
                    <!-- /social-aside -->


                    <a href="{$base_url}" class="back-to">
                        <i class="fas fa-long-arrow-alt-left"></i>
                        Повернутись до календаря подій
                    </a>



                </div>
                    <span class="social-aside-stop"></span>
                <div class="aside-column col-md-3">

                    <div class="section-heading">
                        Ще анонсовані події
                    </div>

                    <div>
{foreach item=data from=$other_items}
    <div class="public-date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year}, {$data->hour}:{$data->minute}</div>
{*                    <p></p>  *}
                    
                    <div >
                                          
                    {if !$data->i_link}
                        <p>  <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </p>
                    {else} 
                        <p>    <a href="{$data->i_link}">{$data->i_name} </a> </p>
                    {/if}
                    
                                
                    </div>
                               
               {/foreach} 

               
              <div class="section-heading"> <a href="/{$class_name}/{$current_node->t_seo_name}">Переглянути ще</a></div>
               
</div> 
                    
                    
                    
                    
                    
                    
{*                    <div class="public-date">16 червня 2015, 14:01</div>*}
                   {* <p>
                        <a href="#">
                            Засідання Погоджувальної ради депутатських фракцій (депутатських груп)
                        </a>
                    </p>

                    <div class="public-date">21 травня 2015, 14:50</div>
                    <p>
                        <a href="#">
                            Урочисте відкриття десятої сесії Верховної Ради України восьмого скликання
                        </a>
                    </p>

                    <div class="public-date">03 листопада 2015, 13:35</div>
                    <p>
                        <a href="#">
                            Урочисте відкриття десятої сесії Верховної Ради України восьмого скликання
                        </a>
                    </p>*}

                    <div class="request-online__block">
                        <div class="request-online__heading">Відвідай пленарне засідання!</div>
                        <div class="request-online__text mob-hide">Станьте свідком роботи парламенту крaїни — подайте заяву на відвідання пленарного засідання онлайн!</div>

                        <a href="https://itd.rada.gov.ua/idsrv" class="btn-white">Подати заявку</a>
                        <a href="https://itd.rada.gov.ua/SessionRequest" class="request-online__link"><b>Правила <span class="mob-hide">перебування</span></b></a>

                    </div>

                </div>
            </div>


        </div>
        <!-- /main-content -->
  

{literal}
<script>

    $(function () {


        $('.sections_tabs li a.active').parent().addClass('selected');

        // TinyNav.js 1
        $('.sections_tabs').tinyNav();

    });
    
    if (($(window).width() > 768)){
        $(function(){
            var a = document.querySelector('.social-aside'), b = null, P = 100;

            if(a !== null) {
                window.addEventListener( 'scroll', Ascroll, false );
                document.body.addEventListener( 'scroll', Ascroll, false );
            }
            function Ascroll() {
                if (b == null) {
                    var Sa = getComputedStyle(a, ''), s = '';
                    for (var i = 0; i < Sa.length; i++) {
                        if (Sa[i].indexOf('overflow') == 0 || Sa[i].indexOf('padding') == 0 || Sa[i].indexOf('border') == 0 || Sa[i].indexOf('outline') == 0 || Sa[i].indexOf('box-shadow') == 0 || Sa[i].indexOf('background') == 0) {
                            s += Sa[i] + ': ' +Sa.getPropertyValue(Sa[i]) + '; '
                        }
                    }
                    b = document.createElement('div');
                    b.style.cssText = s + ' box-sizing: border-box; width: ' + a.offsetWidth + 'px;';
                    a.insertBefore(b, a.firstChild);
                    var l = a.childNodes.length;
                    for (var i = 1; i < l; i++) {
                        b.appendChild(a.childNodes[1]);
                    }
                    a.style.height = b.getBoundingClientRect().height + 'px';
                    a.style.padding = '0';
                    a.style.border = '0';
                }
                var Ra = a.getBoundingClientRect(),
                    R = Math.round(Ra.top + b.getBoundingClientRect().height - document.querySelector('.social-aside-stop').getBoundingClientRect().bottom);
                if ((Ra.top - P) <= 0) {
                    if ((Ra.top - P) <= R) {
                        b.className = 'stop';
                        b.style.top = - R +'px';
                    } else {
                        b.className = 'sticky';
                        b.style.top = P + 'px';
                    }
                } else {
                    b.className = '';
                    b.style.top = '';
                }
                window.addEventListener('resize', function() {
                    a.children[0].style.width = getComputedStyle(a, '').width
                }, false);
            }
        });
    }


    $( document ).ready(function() {


        if ($('.sections_tabs li a').hasClass('active')) {
            $(this).parent().addClass('selected');
        }

        $("#test-circle").circliful({
            animationStep: 5,
            foregroundBorderWidth: 15,
            backgroundBorderWidth: 15,
            percent: 72,
            fgcolor: "#556b2f",
            textColor: '#333'
        });

        $('.nice-select').niceSelect();

        $('.slider-main').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: '.slider-nav'
        });
        $('.slider-nav').slick({
            slidesToShow: 3,
            slidesToScroll: 1,
            asNavFor: '.slider-main',
            focusOnSelect: true,
            centerMode: true,
            centerPadding: "40px",
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        dots: true,
                        infinite: true,
                        slidesToShow: 1,


                    }
                }
            ]
        });


    });

//document.getElementsByTagName('.new-cal_anons').appendChild(createCalendar({data:{title:"this is the title of my event", start: new Date(), duration: 90}}));
/*-- Add to Calendar --*/
var myCalendar = createCalendar({
      options: {
        class: 'my-class',
        
        // You can pass an ID. If you don't, one will be generated for you
        id: 'my-id'
      },
      data: {
        // Event title
        title: {/literal}'{$item->i_name}'{literal},

        // Event start date

        start: new Date({/literal}'{$item->mon} {$item->day}, {$item->year} {$item->hour}:{$item->minute}'{literal}),
        
        // Event duration (IN MINUTES)
        duration: 120,

        // You can also choose to set an end time
        // If an end time is set, this will take precedence over duration
       // end: new Date('June 15, 2013 23:00'),     

        // Event Address
        address: 'The internet',

        // Event Description
        description: {/literal}'{$item->i_author} <br> <a href = "https://www.rada.gov.ua{$base_url}{$i_id}.html">перейти за посиланням </a>'{literal}
      }
    });

    document.querySelector('.new-cal-anons').appendChild(myCalendar);
    
    jQuery(function($){
          $(document).mouseup(function (e){
              var div = $(".new-cal-anons");
              if (!div.is(e.target)
                  && div.has(e.target).length === 0) {
                  $('.add-to-calendar-checkbox').prop('checked', false);
              }
          });
      });


    /*-- Add to Calendar --*/




    
</script>
{/literal}