<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ru_RU/sdk.js#xfbml=1&version=v3.3"></script>

{*  Хедер та меню новинного сайту      *}
{include file= "news_subsite/newcenter_menu.tpl"}
{*/  Хедер та меню новинного сайту      *}


<div class="news-section">
    <div class="container">
        <div class="row">

            {*         =======================               *}

            {foreach item=data from=$top_news key=key name = i}  

                {if $smarty.foreach.i.index == 0}
                    <div class="col-lg-6 col-md-12">
                        <div class="main-news">
                            <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg">
                            <div class="main-news_heading">
                                <small>Важлива тема:</small>
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                            </div>
                        </div>
                    </div>
                {else}
                    <div class="col-lg-3 col-md-6">
                        <div class="sub-news with-data">
                            <div class="sub-news_img">
                                <img alt="" src="/uploads/logos/{$data->i_logoname}.jpeg">
                            </div>
                            <div class="sub-news_heading">
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                            </div>
                            <span class="sub-news_date">{$data->hour}, {$data->day} {$data->month} {$data->year}</span>
                        </div>
                    </div>
                {/if}
            {/foreach}       
            {*         =======================               *}

        </div>
    </div>
</div>



<!-- ALL THEME SCREEN -->
<section class="news-list-section" id="parl_news">
    <div class="container">
        <div class="select-custom">
            <div class="news-list-theme">
                <ul class="sections_tabs nav nav-pills">
                    <li><a data-toggle="pill" href="#menu1" class="active">Усі теми</a></li>
                    <li><a data-toggle="pill" href="#menu2">Оборона</a></li>
                    <li><a data-toggle="pill" href="#menu3">Парламент</a></li>
                    <li><a data-toggle="pill" href="#menu4">Законотворчість</a></li>
                    <li><a data-toggle="pill" href="#menu5">Економіка</a></li>
                    <li><a data-toggle="pill" href="#menu6">Реформи</a></li>
                    <li><a data-toggle="pill" href="#menu7">Спорт</a></li>
                    <li><a data-toggle="pill" href="#menu8">Екологія</a></li>
                    <li><a data-toggle="pill" href="#menu9">Бюджет</a></li>
                    <li>
                        <div class="dropdown show">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Ще теми
                            </a>

                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu10">Action</a></li>
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu11">Another action</a></li>
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu12">Something else here</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <a href="/rss/news" class="rss-btn">RSS</a>
            </div>
        </div>
        <div class="tab-content">

            <!-- tab 1 -->
            <div id="menu1" class="tab-pane fade show active">
                <div class="row">
                    <div class="col-lg-8">
                        <ul class="main-news-list">
                            <li>
                                <div class="multimedia-item">
                                    <div class="multimedia-item__img">
                                        <img alt="" src="https://rada.gov.ua/uploads/logos/6f474480454a1ac193d7046f9cc0c489.jpeg">
                                        <span class="time"> 26 березня,14:06</span>
                                        <a href="#" class="btn-round">Тема2</a>
                                    </div>
                                    <div class="multimedia-item__heading">
                                        <a href="#" class="btn-video">Відео</a>
                                        <a href="#">
                                            Вітання Голови Верховної Ради України Андрія Парубія з Новим роком і Різдвом Христовим
                                        </a>
                                    </div>
                                    <div class="multimedia-item__anons">
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="multimedia-item">
                                    <div class="multimedia-item__img">
                                        <img alt="" src="https://rada.gov.ua/uploads/logos/6f474480454a1ac193d7046f9cc0c489.jpeg">
                                        <span class="time"> 26 березня,11:16</span>
                                        <a href="#" class="btn-round">Тема2</a>
                                    </div>
                                    <div class="multimedia-item__heading">
                                        <a href="#" class="btn-video">Відео</a>
                                        <a href="#">
                                            Голова Верховної Ради України Андрій Парубій назвав законодавчу роботу у 2018 році надзвичайно складною і водночас дуже продуктивною
                                        </a>
                                    </div>
                                    <div class="multimedia-item__anons">
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="news-list-item">
                                    <div class="news-list-item__title">
                                        <a href="#">
                                            Голова Верховної Ради України Андрій Парубій в інтерв’ю телеканалу Рада підсумував роботу пленарного тижня
                                        </a>
                                    </div>

                                    <span class="time grey">
                                        26 грудня, 9:35
                                    </span>
                                    <a href="#" class="tags">
                                        Економіка
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="news-list-item">
                                    <div class="news-list-item__title">
                                        <a href="#">
                                            Під егідою Комітету з питань ПЕК, ядерної політики та ядерної безпеки, Єврокомісії, Держагентства з енергоефективності і енергозбереження відбувся Інвестиційний форум Україна—ЄС з відновлюваної енергетики
                                        </a>
                                    </div>

                                    <span class="time grey">
                                        26 грудня, 9:35
                                    </span>
                                    <a href="#" class="tags">
                                        Економіка
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="news-list-item">
                                    <div class="news-list-item__title">
                                        <a href="#">
                                            Голова Комітету у закордонних справах Ганна Гопко провела зустріч з Головою Комісії у закордонних справах Сейму Латвійської Республіки Ріхардом Колом
                                        </a>
                                    </div>

                                    <span class="time grey">
                                        26 грудня, 9:35
                                    </span>
                                    <a href="#" class="tags">
                                        Економіка
                                    </a>
                                </div>
                            </li>
                            <li>
                                <div class="news-list-item">
                                    <div class="news-list-item__title">
                                        <a href="#">
                                            Питання соціального захисту та пенсійних виплат внутрішньо переміщеним особам та особам, які проживають на тимчасово окупованій території розглянуто під час робочої наради за участю членів Комітету з питань соціальної політики, зайнятості та пенсійного забезпечення
                                        </a>
                                    </div>

                                    <span class="time grey">
                                        26 грудня, 9:35
                                    </span>
                                    <a href="#" class="tags">
                                        Економіка
                                    </a>
                                </div>
                            </li>
                        </ul>



                    </div>


                    <div class="col-lg-4">

                        <div class="news-item">
                            <span class="date">08:55, 26 березня 2019</span>
                            <p>
                                <a href="#">
                                    «Переконані, що Британія була і буде найбільшим стабілізуючим фактором у Причорноморському регіоні», — Андрій Парубій
                                </a>
                            </p>
                        </div>
                        <div class="news-item">
                            <span class="date">08:55, 26 березня 2019</span>
                            <p>
                                <a href="#">
                                    «Переконані, що Британія була і буде найбільшим стабілізуючим фактором у Причорноморському регіоні», — Андрій Парубій
                                </a>
                            </p>
                        </div>
                        <div class="news-item">
                            <span class="date">08:55, 26 березня 2019</span>
                            <p>
                                <a href="#">
                                    «Переконані, що Британія була і буде найбільшим стабілізуючим фактором у Причорноморському регіоні», — Андрій Парубій
                                </a>
                            </p>
                        </div>
                        <div class="news-item">
                            <span class="date">08:55, 26 березня 2019</span>
                            <p>
                                <a href="#">
                                    «Переконані, що Британія була і буде найбільшим стабілізуючим фактором у Причорноморському регіоні», — Андрій Парубій
                                </a>
                            </p>
                        </div>



                    </div>


                </div><!--/row-->

                <div class="more-link text-right">
                    <a href="#">Архів новин</a>
                </div>
            </div>
            <!-- /tab 1 -->

            <!-- tab 2 -->
            <div id="menu2" class="tab-pane fade">
                2
            </div>
            <!-- /tab 2 -->

            <!-- tab 3 -->
            <div id="menu3" class="tab-pane fade">
                3
            </div>
            <!-- /tab 3 -->
        </div>
    </div>
</section>
<!-- /ALL THEME SCREEN -->

<hr class="full-width" />

<div   class="summary-week-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-5">
                <div class="multimedia-item__wrap">
                    <div class="multimedia-item__img">
                        <a href="#" class="play-btn"></a>
                        <img src="https://rada.gov.ua/uploads/logos/6f474480454a1ac193d7046f9cc0c489.jpeg">
                    </div>
                    <h3 class="multimedia-item__heading">
                        <a href="#">
                            Година запитань до Уряду
                        </a>
                    </h3>
                    <span class="time grey">26 грудня, 9:35</span>
                </div>

            </div>

            <div class="col-lg-8 col-md-7">
                <div class="time-table bg2">
                    <div class="block-heading">
                        Підсумки тижня
                    </div>
                    <div class="block-heading__date">
                        26 лютого – 1 березня
                    </div>

                    <span  class="more-link white-link">
                        <a href="#">Переглянути</a>
                    </span>

                </div>
            </div>
        </div><!--/row-->
    </div>
</div><!--/summary-week-section-->

<!-- ALL THEME SCREEN 2 -->
<section  class="news-committee" id="com_news">
    <div class="container">
        <h2  class="block-heading">
            Новини парламентських комітетів
        </h2>

        <div class="select-custom">
            <div class="news-list-theme">
                <ul class="sections_tabs nav nav-pills">
                    <li><a data-toggle="pill" href="#menu1-2" class="active">Усі теми</a></li>
                    <li><a data-toggle="pill" href="#menu2-2">Оборона</a></li>
                    <li><a data-toggle="pill" href="#menu3-2">Парламент</a></li>
                    <li><a data-toggle="pill" href="#menu4-2">Законотворчість</a></li>
                    <li><a data-toggle="pill" href="#menu5-2">Економіка</a></li>
                    <li><a data-toggle="pill" href="#menu6-2">Реформи</a></li>
                    <li><a data-toggle="pill" href="#menu7-2">Спорт</a></li>
                    <li><a data-toggle="pill" href="#menu8-2">Екологія</a></li>
                    <li><a data-toggle="pill" href="#menu9-2">Бюджет</a></li>
                    <li>
                        <div class="dropdown show">
                            <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Ще теми
                            </a>

                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu10-2">Action</a></li>
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu11-2">Another action</a></li>
                                <li><a class="dropdown-item" data-toggle="pill" href="#menu12-2">Something else here</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
                <a href="/rss/news" class="rss-btn">RSS</a>
            </div>
        </div>

        <div class="tab-content">

            <!-- tab 1 -->
            <div id="menu1-2" class="tab-pane fade show active">
                <div class="column-3-list">
                    <div class="news-item">
                        <span class="date">08:55, 26 березня 2019</span>
                        <p>
                            <a href="#">
                                Комітет з питань екологічної політики, природокористування та ліквідації наслідків Чорнобильської катастрофи надав рекомендації за результатами аудиту Рахункової палати щодо ефективності використання коштів на виплати постраждалим внаслідок аварії на ЧАЕС
                            </a>
                        </p>
                    </div>
                    <div class="news-item">
                        <span class="date">08:55, 26 березня 2019</span>
                        <p>
                            <a href="#">
                                Комітет з питань законодавчого забезпечення правоохоронної діяльності рекомендує Верховній Раді прийняти за основу законопроект щодо забезпечення гармонізації кримінального законодавства з положеннями міжнародного права
                            </a>
                        </p>
                    </div>
                    <div class="news-item">
                        <span class="date">08:55, 26 березня 2019</span>
                        <p>
                            <a href="#">
                                У Комітеті з питань запобігання і протидії корупції розглянули питання забезпечення належного збереження і охорони будинків–пам’яток у Києві
                            </a>
                        </p>
                    </div>
                    <div class="news-item">
                        <span class="date">08:55, 26 березня 2019</span>
                        <p>
                            <a href="#">
                                Голова Комітету з прав людини Григорій Немиря провів зустріч з Послом Швейцарії в Україні Гійомом Шойрером
                            </a>
                        </p>
                    </div>
                    <div class="news-item">
                        <span class="date">08:55, 26 березня 2019</span>
                        <p>
                            <a href="#">
                                У Комітеті з питань сім’ї, молодіжної політики, спорту та туризму відбулася зустріч народних депутатів з Надзвичайним та Повноважним послом Чорногорії в Україні Любомиром Мішуровічем
                            </a>
                        </p>
                    </div>
                    <div class="news-item">
                        <span class="date">08:55, 26 березня 2019</span>
                        <p>
                            <a href="#">
                                У Комітеті у закордонних справах відбулася зустріч з заступником директора з питань європейської енергетичної дипломатії Бюро енергетичних ресурсів Державного департаменту США Ніколь Гібсон
                            </a>
                        </p>
                    </div>
                </div>
            </div>
            <!-- /tab 1 -->

            <!-- tab 2 -->
            <div id="menu2-2" class="tab-pane fade">
                2
            </div>
            <!-- /tab 2 -->


        </div>

        <div class="more-link text-right">
            <a href="#">Архів новин комітетів</a>
        </div>
    </div>
</section>
<!-- /ALL THEME SCREEN 2 -->

<hr class="full-width" />

<div class="review-section" id="advertisement">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="review-section__heading">
                    Огляд газети «Голос України»
                </div>
                <div class="review-section__img">
                    <img src="/files/review1.jpg" alt="" />
                </div>

                <div class="news-item">
                    <span class="date">14:02, 20 грудня 2018</span>
                    <p>
                        <a href="#">
                            <b>
                                Якщо буде підтримано новий мовний закон, шпарин для російської пропаганди стане менше. Маємо не витрачати кошти на освіту, а інвестувати в неї. США та ЄС визнають потребу подальших антиросійських санкцій
                            </b>
                        </a>
                    </p>
                </div>
                <div class="news-item">
                    <span class="date">14:02, 20 грудня 2018</span>
                    <p>
                        <a href="#">
                            Питання миру залишається топ-пріоритетом. На Генасамблеї говорили про ситуацію на тимчасово окупованих територіях. Дослідник Голодомору звинувачує Російську імперію
                        </a>
                    </p>
                </div>

                <div class="more-link text-right">
                    <a href="#">Більше оглядів газети</a>
                </div>

            </div><!--/col-lg-4-->

            <div class="col-lg-4 col-md-6">
                <div class="review-section__heading">
                    Огляд вісника «Відомості Верховної Ради України»
                </div>
                <div class="review-section__img">
                    <img src="/files/review2.jpg" alt="" />
                </div>

                <div class="news-item">
                    <span class="date">14:02, 20 грудня 2018</span>
                    <p>
                        <a href="#">
                            <b>
                                У «Відомостях Верховної Ради України» опубліковано Закон про внесення змін до Земельного кодексу України щодо продовження заборони відчуження сільськогосподарських земель
                            </b>
                        </a>
                    </p>
                </div>
                <div class="news-item">
                    <span class="date">14:02, 20 грудня 2018</span>
                    <p>
                        <a href="#">
                            У «Відомостях Верховної Ради України» опубліковано Закон про протимінну діяльність в Україні
                        </a>
                    </p>
                </div>

                <div class="more-link text-right">
                    <a href="#">Більше оглядів вісника</a>
                </div>
            </div><!--/col-lg-4-->

            <div class="col-lg-4 col-md-12 announcement-column">
                <div class="review-section__heading">
                    Оголошення
                </div>

                <div class="news-item main-news-item">
                    <span class="date">14:02, 20 грудня 2018</span>
                    <p>
                        <a href="#">
                            Про конкурс на посаду Керівника Освітнього центру при Верховній Раді України
                        </a>
                    </p>
                </div>

                <div class="news-item">
                    <span class="date">14:02, 20 грудня 2018</span>
                    <p>
                        <a href="#">
                            Проект ЄС-ПРООН з реформування Парламенту оголошує конкурсний відбір на зайняття вакантних посад
                        </a>
                    </p>
                </div>

                <div class="news-item">
                    <span class="date">14:02, 20 грудня 2018</span>
                    <p>
                        <a href="#">
                            Відбудеться відкриття десятої сесії Верховної Ради України восьмого скликання
                        </a>
                    </p>
                </div>

                <div class="more-link text-right">
                    <a href="#">Більше оголошень</a>
                </div>
            </div><!--/col-lg-4-->

        </div><!--/row-->
    </div>
</div>

<hr class="full-width" />

<section class="request-online">
    <div class="container">
    <div class="row">
        <div class="col-lg-6 col-sm-12">
            <div class="request-online__block">
                <div class="request-online__heading">Відвідай пленарне засідання!</div>
                <div class="request-online__text mob-hide">Станьте свідком роботи парламенту крaїни — подайте заяву на відвідання пленарного засідання онлайн!</div>

                <a href="#" class="btn-white">Подати заявку</a>
                <a href="#" class="request-online__link"><b>Правила <span class="mob-hide">перебування</span></b></a>

            </div>
        </div>
        <div class="col-lg-6 col-sm-12">
            <div class="faq-online">
            </div>

            <div class="faq-online"></div>

            <div class="faq-online"></div>

            <div class="faq-online"></div>
        </div>
    </div>
</div>
</section>



<section class="media-library" id="mediaLibrary">
    <div class="container">
        <h2 class="block-heading">
            Медійна бібліотека
        </h2>
        <div class="select-custom">
            <ul class="sections_tabs nav nav-tabs float-left" id="myTab3" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="video-tab" data-toggle="tab" href="#video" role="tab" aria-controls="video" aria-selected="true">
                        Відеоматеріали
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="photo-tab" data-toggle="tab" href="#photo" role="tab" aria-controls="photo" aria-selected="false">
                        Фотоальбоми
                    </a>
                </li>
            </ul>
            <a href="#" class="youtube-btn next-tab-link"></a>

            <hr class="light">

        </div>

        <div class="tab-content" id="myTabContent">
            <div id="video" class="tab-pane fade show active" role="tabpanel" aria-labelledby="video-tab">
                <div class="gallery_list">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="multimedia-item__img">
                                <a href="#" class="play-btn"></a>
                                <img src="https://rada.gov.ua/uploads/logos/6f474480454a1ac193d7046f9cc0c489.jpeg">

                                <span class="time">14 березня 2019</span>
                            </div>

                            <h3 class="multimedia-item__heading">
                                <a href="#">
                                    А.Парубій Вітання з нагоди Дня українського добровольця
                                </a>
                            </h3>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="multimedia-item__img">
                                <a href="#" class="play-btn"></a>
                                <img src="https://rada.gov.ua/uploads/logos/6f474480454a1ac193d7046f9cc0c489.jpeg">

                                <span class="time">14 березня 2019</span>
                            </div>

                            <h3 class="multimedia-item__heading">
                                <a href="#">
                                    А.Парубій Вітання з нагоди Дня українського добровольця
                                </a>
                            </h3>
                        </div>




                    </div><!--/row-->


                </div>

                <div class="more-link text-right">
                    <a href="#">Усі відеоматеріали</a>
                </div> 
            </div><!--/video tab -->

            <div id="photo" class="tab-pane fade" role="tabpanel" aria-labelledby="photo-tab">
                <div class="gallery_list">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="gallery_item example--item">

                                <a href="/gallery/robota_VRUk/45607.html?">
                                    <img alt="Робота Верховної Ради України" src="/uploads/gallery_prev/55414.jpeg">
                                </a>

                                <a class="item-caption" href="/gallery/robota_VRUk/45607.html?">
                                    <h3>

                                        Робота Верховної Ради України


                                    </h3>
                                    <div class="foto_num">
                                        <i class="camera-icn"></i>
                                        10215 фото
                                    </div>
                                </a>

                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="gallery_item example--item">

                                <a href="/gallery/robota_VRUk/45607.html?">
                                    <img alt="Робота Верховної Ради України" src="/uploads/gallery_prev/55414.jpeg">
                                </a>

                                <a class="item-caption" href="/gallery/robota_VRUk/45607.html?">
                                    <h3>

                                        Робота Верховної Ради України


                                    </h3>
                                    <div class="foto_num">
                                        <i class="camera-icn"></i>
                                        10215 фото
                                    </div>
                                </a>

                            </div>
                        </div>




                    </div><!--/row-->


                </div>

                <div class="more-link text-right">
                    <a href="#">Усі фотоматеріали</a>
                </div>
            </div><!--/photo tab -->
        </div><!--/tab-content-->


    </div>
</section>

<div class="social-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="social-section__heading">
                    <i class="fa-flicker-circle"></i>
                    Флікер
                </div>
            </div>

            <div class="col-lg-4">
                <div class="social-section__heading">
                    <i class="fab fa-facebook-square"></i>
                    Фейсбук
                </div>

                <div class="fb-page" data-href="https://www.facebook.com/verkhovna.rada.ukraine/" data-tabs="timeline,events" data-width="" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/verkhovna.rada.ukraine/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/verkhovna.rada.ukraine/">Верховна Рада України</a></blockquote></div>

            </div>

            <div class="col-lg-4">
                <div class="social-section__heading">
                    <i class="fab fa-twitter"></i>
                    Твіттер
                </div>

                <a class="twitter-timeline" data-lang="uk" data-height="500" href="https://twitter.com/verkhovna_rada?ref_src=twsrc%5Etfw">Tweets by verkhovna_rada</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
            </div>
        </div><!--/row-->
    </div>
</div><!--/social-section-->


{*==========Begin Digest======================*}

<section class="digest-section">  
    <div class="content">
            {*   <span class="mail-ico"><span class="messages">1</span></span>   *}          
            <div class="digest-section__heading">
                <span class="fa-2x">
                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1" data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                </span>
                <p>Парламентський дайджест</p>                
            </div>
            {* <p>Отримуйте головне з веб-порталу Верховної Ради України у свою скриньку</p> *}
            <p>Отримуйте головне з веб-порталу у свою скриньку</p>
            <form method="post" action="{$lang_prefix}/subscribe/index">
                {* <label for="digest-email">Введіть адресу Вашої електронної пошти</label> *}
                
                
                <div class="input-group">
                    {* <label for="digest-submit" title="Налаштувати підписку на анонси">Анонси новин, повідомлень та інших інформаційних матеріалів</label> *}                    
                   {*   <input type="email" name="email" id="digest-email" class="form-control" required placeholder="mail@example.com">
                       <div class="info-ico">На наступному кроці Ви зможете налаштувати категорії матеріалів для розсилки</div> *}
                    <button class="btn btn-white" type="submit" title="Налаштувати підписку на анонси">Налаштувати підписку на анонси</button>
                </div>
            </form>             
            
            {* <div class="info-ico">
                <i class="fas fa-info"></i>На наступному кроці Ви зможете налаштувати підписку на анонси
            </div>  *}
    </div>
</section>

{*=========End Digest=========================*}