<section class="plenary-week">
    <div class="container">
        <div class="border-mark">
        <h2 class="block-heading">Plenary week</h2>  
        <h5 class="block-heading__date"> from {$planar_week_dates->day_s} {$planar_week_dates->mon_s} {$planar_week_dates->year_s} to  {$planar_week_dates->day_e} {$planar_week_dates->mon_e} {$planar_week_dates->year_e}</h5>
        <span class="more-link black-link">
                                        <a href="/meeting/awt">Agenda items scheduled for consideration in plenary sitting&nbsp;&nbsp;</a>
                                    </span>
        </div>

        <div class="row">
            <div class="col-lg-8 col-sm-12">
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
                    
                    
</div>


                <div class="tab-content" id="myTabContent">
                    
                    
                    
                    
                    
                    {foreach item=data key=day_of_week from=$planar_week_byday name=t}

                        <!-- tab -->
                        {if $data.md_type == 6}

{*                         <div class="tab-pane fade active show" id="pw_day_{$data.day}" role="tabpanel" aria-labelledby="main-tab">*}
                         <div class="tab-pane fade {$data.status} show" id="pw_day_{$data.day}" role="tabpanel" aria-labelledby="main-tab">
                        {include file='main_page/pog_rada.tpl'}
                         
                         </div>
                        {else}
                        <div class="tab-pane fade {$data.status} show" id="pw_day_{$data.day}" role="tabpanel" aria-labelledby="main-tab">


                            <div class="polling-tabs">
                                <div class="polling-tabs__heading">Votings</div>

                                <ul class="polling-tabs__items nav" id="myTab2" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="last-tab" data-toggle="tab" href="#last" role="tab" aria-controls="last" aria-selected="true">
                                            Latest
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="statistic-tab" data-toggle="tab" href="#statistic" role="tab" aria-controls="statistic" aria-selected="false">
                                            Statistics
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="liders-tab" data-toggle="tab" href="#liders" role="tab" aria-controls="liders" aria-selected="false">
                                            Leaders
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="antiliders-tab" data-toggle="tab" href="#antiliders" role="tab" aria-controls="antiliders" aria-selected="false">
                                          Anti-leaders
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
                                                <div class="empty-vote">
                                No voting as yet ...
                            </div>
                                                {include file='main_page/no_golos_yet.tpl'}
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
                                                            <li class="point-green">Votes "In favour" <b>{$dat.g_pos}</b></li>
                                                            <li class="point-red">Votes "Against" <b>{$dat.g_neg}</b></li>
                                                            <li class="point-yellow">Votes "Abstained" <b>{$dat.refrain}</b></li>
                                                            <li class="point-grey"> "Not voted" <b>{$dat.not_voting}</b></li>
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
                                      
                                            {if $data.item}<div class="more-link text-right"><a href="/news/hpz9">Preceding voiting</a></div>{/if}

                                    </div>
                                    <!-- /last-tab -->

                                    <!-- statistic-tab -->
                                    <div class="tab-pane fade" id="statistic" role="tabpanel" aria-labelledby="statistic-tab">
                                       Expected soon
                                    </div>
                                    <!-- /statistic-tab -->

                                    <!-- liders-tab -->
                                    <div class="tab-pane fade" id="liders" role="tabpanel" aria-labelledby="liders-tab">
                                        Expected soon
                                    </div>
                                    <!-- /liders-tab -->

                                    <!-- antiliders-tab -->
                                    <div class="tab-pane fade" id="antiliders" role="tabpanel" aria-labelledby="antiliders-tab">
                                       Expected soon
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

            <div class="col-lg-4 col-sm-12">

                <div class="row">
{*                    {if 1} {*The Conciliation Board*}
                    {if $is_plenar != 6} {*The Conciliation Board*}
                    <div class="col-sm-8">
                        <div class="full-mob-width">
                    <div class="rada-tv">
                        <div class="rada-tv__video">
                            <div class="top-button-group">
                                <span class="live-btn">Live stream</span>
                            </div>
                            <a href="http://mportal.rada.gov.ua/video/rada-tv/64430.html" class="play-btn"></a>
                            <img src="/files/img4.jpg" >
                        </div>
                        <span class="rada-tv__label"><b>RADA</b>TV</span>
                        <div class="rada-tv__heading">
                            Live coverage of VRU plenary sitting
                            
                        </div>
                        <a href="http://mportal.rada.gov.ua/video/rada-tv/64430.html" class="watch-online__link">Online viewing</a>
                    </div>
                </div>
                    </div>
                        
                    <div class="col-sm-4" >
                        <div class="electronic-registration">
                    <a class="electronic-registration_heading" href="{$planar_registratios->link}"> Pre-sitting e-registraition of MPs</a>


                    <div id="test-circle" class="circle-pie"></div>

                    {if $planar_registratios}
                    <div class="electronic-registration__content">
                        <div class="time">Today, {$planar_registratios->time}</div>
{*                        <div class="time">Сьогодні, 10:03</div>*}
                        <div class="present-deputy">{$planar_registratios->present} Attendees</div>
                        <div class="absent-deputy">{$planar_registratios->ebsent} Absentees</div>
                        
                    </div>
                        {else}
                            No MRs e-registraition data available as yet
                        {/if}
                        <div class="more-link text-right"><a href="/news/Rstr_nd_9">Other planary days' registraition </a></div>
{*                        <div class="more-link text-right"><a href="{$planar_registratios->ebsent}">Реєстрація в інші пленарні дні</a></div>*}
                        
                    
{*                    <hr>*}

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
                    
                    
                    {else}
                        
                        
                        <div class="col-sm-4" >
{*                    <h4>Матеріали погоджувальної ради</h4>*}
                        <div>



                    
{*                    <hr>*}

                    <ul class="ul-list with-ico">
                        <li class="icn-transcript"><a href="/meeting/stenpog"> Transcripts of conciliation commissions</a></li>
                        <li class="icn-table"><a href="http://w1.c1.rada.gov.ua/pls/prada/ns_el_h"> Electronic protocol</a></li>       
                    </ul>
                </div>
                    </div>
                       {/if} 
                       
                </div>
                

                
            </div>
        </div>
                    
                    
    </div>                
</section>
                       
                       {literal}
                            <script>
                       $( document ).ready(function() {
                        $("#test-circle").circliful({
            animationStep: 5,
            foregroundBorderWidth: 15,
            backgroundBorderWidth: 15,
            percent: {/literal} {$planar_registratios->persent} {literal},
            foregroundColor: '#61cd9c',
            //textColor: "#000",
            textColor: '#333'
        });
                       });
                            </script>
                        {/literal}
