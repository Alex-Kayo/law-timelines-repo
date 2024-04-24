<section class="event-calendar">
    <div class="container">
        <div class="row pos_r">
            <div class="col-lg-4 col-md-6 event-calendar-titlle">
                <h2 class="block-heading">Календар подій</h2>
                <div class="event-time mob-hide">
                    {*                <span>у Києві</span>{$smarty.now|date_format:"%H:%M"}*}
                    {*{php}
    date_default_timezone_set('Europe/Kiev');
    $localtime = localtime();
    $localtime_assoc = localtime(time(), true);
    //print_r($localtime);
    echo $localtime_assoc['tm_hour'].':'.$localtime_assoc['tm_min'];
    {/php}*}
                </div>
            </div>
            <div class="col-lg-8 col-md-6 event-calendar-arrow">
                <a href="#" class="prev-event">
                    <i class="icn-arrow-left"></i>
                    Попередні
                </a>
                <a href="#" class="next-event">
                    Наступні
                    <i class="icn-arrow-right"></i>
                </a>
            </div>
        </div>
        <div class="press-team__slider">

            <!-- col 1 -->
            {foreach item=data from=$press_team name = j}

                    <div>
                        <div class="card mb-2">
                            <img class="card-img-top" src="/images/press_sluzhba/{$data->i_id}.jpg" alt="">
                            <div class="card-body">

                                <h4 class="card-title"><a
                                            href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                                </h4>
                                <p class="card-text">{$data->i_anons}</p>
                            </div>
                        </div>
                    </div>

            {/foreach}
            <!-- /col 1 -->

            <!-- col 2 -->

            <!-- /col 2 -->

            <!-- col 3 -->

            <!-- /col 3 -->

        </div>

    </div>
</section>

