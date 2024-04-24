<section class="plenary-week">
        <div class="border-mark">
        <h2 class="block-heading">Пленарний тиждень</h2>  
        <h5 class="block-heading__date"> з {$planar_week_dates->day_s} {$planar_week_dates->mon_s} {$planar_week_dates->year_s} по {$planar_week_dates->day_e} {$planar_week_dates->mon_e} {$planar_week_dates->year_e}</h5>
        </div>


        <div class="row">
            <div class="col-sm-8">
<div class="select-custom">
                <ul class="sections_tabs nav nav-tabs" id="myTab" role="tablist">
                    {foreach item=data key=day_of_week from=$planar_week_byday name=i}
                        
                       
                    <li class="nav-item {$data.status}">
{*                    <li class="nav-item selected">*}
                            <a class="nav-link {$data.status}{*active*}" id="main-tab" data-toggle="tab" href="#pw_day_{$data.day}" role="tab" aria-controls="main" aria-selected="true">
                                {$data.wday}
                                <span class="date">{$data.day} {$data.mon} {$data.year}</span>
                            </a>
                        </li>
                    
                            
                            
                    {/foreach}
                </ul> 
                    
                    {*
                    {foreach item=data key=day_of_week from=$planar_week_info name=i}

                        <li class="nav-item ">
                            <a class="nav-link {if $smarty.foreach.i.last}active show{/if}" id="pw_day_tab{$smarty.foreach.i.iteration}" data-toggle="tab" data-toggle="pill" href="#pw_day_cont{$smarty.foreach.i.iteration}" role="tab" aria-controls="main" aria-selected="{if $smarty.foreach.i.last}TRUE{else}FALSE{/if}">
                                {$day_of_week}
                                <span class="date">{$data[0].day} {$data[0].name_monts} {$data[0].year}</span>
                            </a>
                        </li>
                    {/foreach}*}
</div>


                <div class="tab-content" id="myTabContent">
                    
                    
                    
                    
                    
                    {foreach item=data key=day_of_week from=$planar_week_byday name=t}

                        <!-- tab -->
                        {if $data.md_type == 6}

                         <div class="tab-pane fade {$data.status} show" id="pw_day_{$data.day}" role="tabpanel" aria-labelledby="main-tab">
                         </div>
                        {else}
                        <div class="tab-pane fade {$data.status} show" id="pw_day_{$data.day}" role="tabpanel" aria-labelledby="main-tab">


                            <div class="polling-tabs">
                                <div class="polling-tabs__heading">Голосування</div>

                                <ul class="polling-tabs__items nav" id="myTab2" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="last-tab" data-toggle="tab" href="#last" role="tab" aria-controls="last" aria-selected="true">
                                            Останні
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="statistic-tab" data-toggle="tab" href="#statistic" role="tab" aria-controls="statistic" aria-selected="false">
                                            Статистика
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="liders-tab" data-toggle="tab" href="#liders" role="tab" aria-controls="liders" aria-selected="false">
                                            Лідери
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="antiliders-tab" data-toggle="tab" href="#antiliders" role="tab" aria-controls="antiliders" aria-selected="false">
                                            Антилідери
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent2">
                                    <!-- last-tab -->
                                    <div class="tab-pane fade show active" id="last" role="tabpanel" aria-labelledby="last-tab">
                                        <div class="scrollbar-inner">
                                        <div class="polling-list">
                                            <!-- 1 -->
                                            {if !$data.item}
                                                Даних немає
                                            {else}

                                            {foreach item=dat from=$data.item|@array_reverse:true name=k}
                                                 
{*                                    {$smarty.foreach.k.index}*}
                                                <div class="polling-list__item">
                                                    <span class="time">{$dat.time}</span>
                                                    <div><a href="{$dat.i_link}">{$dat.i_name}</a></div>

                                                    <div class="{if $dat.rishen == 'Прийнято' }accepted-item{else}declined-item{/if}">
                                                        {if $dat.rishen == 'Прийнято' }<i class="fas fa-check"></i>{else}<i class="fas fa-times"></i>{/if}
                                                            {$dat.rishen}
                                                    </div>

                                                    <div class="polling-points">
                                                        <ul>
                                                            <li class="point-green">за <b>{$dat.g_pos}</b></li>
                                                            <li class="point-red">Проти <b>{$dat.g_neg}</b></li>
                                                            <li class="point-yellow">Утрималось <b>{$dat.refrain}</b></li>
                                                            <li class="point-grey">Не голосувало <b>{$dat.not_voting}</b></li>
                                                        </ul>
                                                        <div class="percent-line">
                                                            <span class="yes-percent" style="width: {$dat.g_pos_persent}%;"></span>
                                                            <span class="no-percent" style="width: {$dat.g_neg_persent}%;"></span>
                                                            <span class="neutral-percent" style="width:{$dat.refrain_persent}%;"></span>
                                                            <span class="not-percent" style="width: {$dat.not_voting_persent}%;"></span>
                                                        </div>
                                                    </div>

                                                </div>

                                            {/foreach}
                                            {/if}
                                            <!-- /3 -->
                                        </div>
                                        </div>
                                        <div class="more-link text-right"><a href="#">Попередні голосування</a></div>

                                    </div>
                                    <!-- /last-tab -->

                                    <!-- statistic-tab -->
                                    <div class="tab-pane fade" id="statistic" role="tabpanel" aria-labelledby="statistic-tab">
                                        Статистика Content
                                    </div>
                                    <!-- /statistic-tab -->

                                    <!-- liders-tab -->
                                    <div class="tab-pane fade" id="liders" role="tabpanel" aria-labelledby="liders-tab">
                                        Лідери Content
                                    </div>
                                    <!-- /liders-tab -->

                                    <!-- antiliders-tab -->
                                    <div class="tab-pane fade" id="antiliders" role="tabpanel" aria-labelledby="antiliders-tab">
                                        Антилідери Content
                                    </div>
                                    <!-- /antiliders-tab -->
                                </div>
                            </div>



                        </div>
                        {/if}                    
                    {/foreach}
                    <!-- /tab 1 -->
                    <!-- tab 2 -->
                    
                    
                    
                    <!-- /tab 2 -->
                    
                </div>



            </div>

            <div class="col-sm-4">

                <div class="row">
                    <div class="col-sm-8">
                        <div class="full-mob-width">
                    <div class="rada-tv">
                        <div class="rada-tv__video">
                            <span class="live-btn">Наживо</span>
                            <span class="play-btn"></span>
                            <img src="/files/img4.jpg" >
                        </div>
                        <span class="rada-tv__label"><b>RADA</b>TV</span>
                        <div class="rada-tv__heading">
                            Трансляція пленарного засідання Верховної Ради
                        </div>
                        <a href="#" class="watch-online__link">Дивитись онлайн</a>
                    </div>
                </div>
                        
            
                    </div>
                    <div class="col-sm-4" >
                        <div class="electronic-registration">
                    <a class="electronic-registration_heading" href="#">Електронна реєстрація народних депутатів</a>


                    <div id="test-circle" class="circle-pie"></div>

                    <div class="electronic-registration__content">
                        <div class="time">Сьогодні, 10:03</div>
                        <div class="present-deputy">307 присутніх</div>
                        <div class="absent-deputy">116 відсутніх</div>
                    </div>
                    
                    <hr>

                    <ul class="ul-list with-ico">
                        <li>Хронологія розгляду</li>
                        <li>Результати розгляду</li>
                        <li>Електронний протокол</li>
                        <li>Стенограми пленарних засідань</li>
                        <li>Статистика голосувань
                            за обраний період</li>
                    </ul>
                </div>
                    </div>
                </div>
                

                
            </div>
        </div>
                    
                    
                    
    </section>