        {*<ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item"><a href="/news">Текстові публікації</a></li>
            <li class="breadcrumb-item active">Новини Верховної Ради</li>
        </ol>*}
{*  BreadCrumps      *}
        {if $current_node->t_name}
          
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/">Головна</a></li> 
{*                    <a href="{$lang_prefix}/">Головна</a> *}
                    {foreach item=data from=$path_way}
                    <li class="breadcrumb-item"><a href="{$lang_prefix}/{$data->t_parents}/">{$data->t_name}</a></li>  
                    {/foreach}                    
                    <li class="breadcrumb-item">{$current_node->t_name}</li>
                </ol>
                   
 
        {/if}  

        {*<div class="publications-heading"><h3 {if strlen($current_node->t_name) > 55} style="font-size: 13px;" {/if} >{$current_node->t_name}</h3></div> *}
        <div class="publications-heading__block">
            <h2>{$item->mi_name}
            </h2>
            <p>
                
{*            Інформаційне управління Апарату Верховної Ради України, *}
                Опубліковано {$item->day}.&nbsp;{$item->month}.&nbsp;{$item->year}
            </p>

        </div>

        <!-- main-content -->
        <div class="main-content">
            
                {*<div class="text-column col-md-6">*}
                <div class="middle-column">
                    <div class="item_content">
                       
                        {$item->mi_text}
                    
                    </div>
                    
                    <!-- social-aside -->
                    <div class="social-aside">
                        <div>
                            <div class="share-block">
                                
                                <div class="like-item">
                           
                            <div class="fb-share-button" data-href="{$item_url}" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u={*https://www.rada.gov.ua*}{$item_url}&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поділитись</a></div>
                            {*<div class="fb-share-button" data-href="https://www.rada.gov.ua{$item_url}" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https://www.rada.gov.ua{$item_url}&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поділитись</a></div>*}
                            
                        </div>
                        <div class="like-item">
                            <span class="twitter-share-button-ico">
<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</span>
                        </div>
                        <div class="like-item">
                            <a href="https://telegram.me/share/url?url={$item_url}&text={$item->mi_name}  ({$item->day}.{$item->month}.{$item->year})" target="_blank">
<i class="fab fa-telegram-plane"></i>
                            {*<a href="https://telegram.me/share/url?url=https://www.rada.gov.ua{$item_url}&text={$item->mi_name}  ({$item->day}.{$item->month}.{$item->year})" target="_blank">
<i class="fab fa-telegram-plane"></i>*}
</a>
                        </div>
                        <div class="like-item">
                            <a href="http://m.me/www.rada.gov.ua/" target="_blank">
<i class="fab fa-facebook-messenger"></i>
</a>
                        </div>

                            </div>

                                </div>
                                </div>
                    <!-- /social-aside -->

                    <a href="#" class="back-to">
                        <i class="fas fa-long-arrow-alt-left"></i>
                        Повернутись до публікацій
                    </a>

                    <p class="text-center float_right">
                        <a href="{$item_url}" class="btn btn-print"><span>Версія для друку</span></a>
                    </p>
                    
                </div>
                <span class="social-aside-stop"></span>
            
        
                    
            
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




</script>

{/literal}
