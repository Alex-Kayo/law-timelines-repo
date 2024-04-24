
{*<div class="news-subsite__wrap" id="newscenter">
        <div class="news-subsite">
            <div class="publications-heading">
                Новинний центр
            </div>
            <a href="#" class="add-to-favorite">
                <span class="mob-hide">Додайте нас у вибране</span>
                <i class="bookmark-ico"></i>
            </a>

            <nav class="navbar navbar-expand-lg">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent2" aria-controls="navbarSupportedContent2" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent2">
                    <ul class="navbar-nav ">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Новини парламенту</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Новини комітетів</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Огляд преси
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Оголошення</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Медіатека</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link youtube-ico" href="#" target="_blank">
                        <i class="fab fa-youtube"></i>
                        RadaTVchannel
                    </a>
                </li>
            </ul>
                </div>
            </nav>
        </div>
</div>*}
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

        <div class="publications-heading"><h3 {if strlen($current_node->t_name) > 55} style="font-size: 13px;" {/if} >{$current_node->t_name}</h3></div> 
        <div class="publications-heading__block">
            <h2>{$item->i_name}
            </h2>
            <p>
                {if $item->i_author}
               {$item->i_author}

            {/if} 
{*            Інформаційне управління Апарату Верховної Ради України, *}
                Опубліковано 111 {$item->day}&nbsp;{$item->month}&nbsp;{$item->year}, о {$item->hour}:{$item->minute}
            </p>

            <a href="#" class="tags">Тема 1</a>
            <a href="#" class="tags">Тема 2</a>
        </div>

        <!-- main-content -->
        <div class="main-content">
            <div class="row">
                <div class="text-column col-md-6">
                    <div class="item_content">
                        {if $item->i_full}
                        {$item->i_full}
                    {else}
                        {$item->i_anons}
                    {/if}  
                    
                    
                    {*<div class="slider-main">
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                    </div>

                    <div class="slider-nav">
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                        <div><img src="/images/gerashenko/061118-3.jpg"></div>
                    </div>

                    <figure>
                        <figcaption>Автор фото – прес-служба Верховної Ради України</figcaption>
                    </figure>*}
                    
                    </div>
                    
                    <!-- social-aside -->
                    <div class="social-aside">
                        <div>
                            <div class="share-block">
                                <div class="like-item">
                                    <a href="#">
                                        <i class="fas fa-share-alt"></i>
                                        <span class="like-item__count">1</span>
                                        <span class="like-item__text"><b>поширень</b></span>
                                    </a>
                                </div>
                                <div class="like-item">
                            <div class="fb-share-button" data-href="https://rada.gov.ua/news/Top-novyna/179446.html" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Frada.gov.ua%2Fnews%2FTop-novyna%2F179446.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поделиться</a></div>
                        </div>
                        <div class="like-item">
                            <span class="twitter-share-button-ico">
<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</span>
                        </div>
                        <div class="like-item">
                            <a href="https://telegram.me/share/url?url=<URL>&text=<TEXT>" target="_blank">
<i class="fab fa-telegram-plane"></i>
</a>
                        </div>
                        <div class="like-item">
                            <a href="http://m.me/" target="_blank">
<i class="fab fa-facebook-messenger"></i>
</a>
                        </div>

                            </div>

                            <div class="share-block-2">
                                <div class="view-count">
                                    <a href="#">
                                        <span class="like-item__text">Переглядів</span>
                                        <i class="fas fa-eye"></i>
                                        <span class="like-item__count">18</span>

                                    </a>
                                </div>
                                <div class="comments-count">
                                    <a href="#">
                                        <span class="like-item__text">Коментарів</span>
                                        <i class="fas fa-comment-alt"></i>
                                        <span class="like-item__count">2</span>

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
                        <a href="/print/{$i_id}.html" class="btn btn-print"><span>Версія для друку</span></a>
                    </p>

                </div>
                    <span class="social-aside-stop"></span>
                <div class="aside-column col-md-3">
                    <div class="section-heading">
                        {*<span class="light">Ще за темою</span>*}
                        <span>11111Ще за темою</span>   
                        <h3 {if strlen($current_node->t_name) > 55} style="font-size: 13px;" {/if} >{$current_node->t_name}</h3>   </div>

<div>
{foreach item=data from=$other_items} 
    <div class="public-date">
                        {$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}
                    </div>  
                    
                    <div> 
                    
                    {if !$data->i_link}
                        <h6>  <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a> </h6>
                    {else} 
                        <h6>    <a href="{$data->i_link}">{$data->i_name} </a> </h6>
                    {/if}
                    
                                
                    </div>
                               
               {/foreach} 

               
              <div class="more-link text-right"> 
                  <a href="/{$class_name}/{$current_node->t_seo_name}">Переглянути ще</a>
              </div>
               
</div> 
               

                </div>
            </div>
        
                    <hr>
{*             ============ Обговорення ==========       *}

            {*<div class="row">
                <div class="text-column col-md-6">

                    <div class="section-heading">Додати коментар</div>

                    <form>
                        <div class="form-group">
                            <label for="exampleInput">Введіть прізвище, ім’я, по-батькові</label>
                            <input type="text" class="form-control" id="exampleInput">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputComment">Ваш коментар</label>
                            <textarea rows="4" class="form-control" id="exampleInputComment"></textarea>
                        </div>
                        <div class="form-group">
                            <div class="g-recaptcha" data-sitekey="6LcnppcUAAAAAONszLW1GDXHYPsz7M7fNOZQjbgX"></div>
                        </div>
                        <button type="submit" class="btn btn-yellow">Надіслати</button>
                    </form>


                    <div class="comments-block">
                        <div class="section-heading">Коментарі</div>

                        <p>Ще немає жодного коментаря...</p>
                        <br>

                        <div class="comment-item">
                            <div>
                                <b>Шевченко Андрій Миколайович</b>
                                <span class="comment-date">13 лютого 2019, 14:02</span>
                            </div>
                            <p>
                                Сергій Каплін, підсумовуючи обговорення, запропонував учасникам наради надати свої пропозиції щодо вирішення порушених питань для продовження обговорення шляхів їх врегулювання.
                            </p>
                        </div>

                        <div class="comment-item">
                            <div>
                                <b>Франко Іван Якович</b>
                                <span class="comment-date">14 лютого 2019, 13:22</span>
                            </div>
                            <p>
                                Сергій Каплін, підсумовуючи обговорення, запропонував учасникам наради надати свої пропозиції щодо вирішення порушених питань для продовження обговорення шляхів їх врегулювання.
                            </p>
                        </div>
                    </div>

                </div>
            </div>*}
           {*             ============ /Обговорення ==========       *} 
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
