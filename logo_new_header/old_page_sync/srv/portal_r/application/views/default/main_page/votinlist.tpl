

{if $votin_name}

    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{$lang_prefix}/">Головна</a></li>
        {*                    <a href="{$lang_prefix}/">Головна</a> *}
        {foreach item=data from=$path_way}
            <li class="breadcrumb-item"><a href="{$lang_prefix}/{$data->t_parents}/">{$data->t_name}</a></li>
        {/foreach}
        <li class="breadcrumb-item">{$votin_name}</li>
    </ol>

{/if}


<div class="right_col">
    <!-- information_block -->
    <div class="page-heading">

        <h3>
            {$votin_name}

        </h3>
    </div>


    <hr>

    <div class="row">
        <!-- col-md-9 -->
        <div class="col-md-9">

            <div id="list_archive">

                <div class="information_block archieve_block">



                    {foreach item=data from=$posts}

                        {*  підрахунок процентів *}
{assign var = all_golos value=$data->g_pos+$data->g_neg+$data->refrain+$data->not_voting}
{assign var = pos_persent value=$data->g_pos/$all_golos*100}
{assign var = neg_persent value=$data->g_neg/$all_golos*100}
{assign var = refrain_persent value=$data->refrain/$all_golos*100}
{assign var = not_voting_persent value=$data->not_voting/$all_golos*100}

                        {* ! підрахунок процентів *}

                        <!-- timeline-block -->
                        <div class="timeline-block">

                                <div class="timeline-block__date">

                                   {$data->dat}&nbsp
                                </div>


                            <div class="timeline__conteiner">
                                    <span class="time">{$data->time}</span>

                                    <div class="news_item">


                                        <div class="timeline-block_text">

                                            <div class="timeline-block__heading f-bold">
                                                <a href="{$data->i_link}">
                                                    {$data->i_name}
                                                </a>

                                                <div class="{if $data->rishen == 'Прийнято' }accepted-item{else}declined-item{/if}">
                                                    {if $data->rishen == 'Прийнято' }<i class="fas fa-check"></i>{else}<i class="fas fa-times"></i>{/if}
                                                    <span>{$data->rishen}</span>
                                                </div>

                                            </div>

                                            <div  style="padding-left: 2rem;">





                                                <div class="polling-points" style="padding-left: 0rem;">
                                                    <ul>
                                                        <li class="point-green">За <b>{$data->g_pos}</b></li>
                                                        <li class="point-red">Проти <b>{$data->g_neg}</b></li>
                                                        <li class="point-yellow">Утрималось <b>{$data->refrain}</b></li>
                                                        <li class="point-grey">Не голосувало <b>{$data->not_voting}</b></li>
                                                    </ul>
                                                    <div class="percent-line">
                                                        <span class="yes-percent" style="width: {$pos_persent}%;"></span>
                                                        <span class="no-percent" style="width: {$neg_persent}%;"></span>
                                                        <span class="neutral-percent" style="width:{$refrain_persent}%;"></span>
                                                        <span class="not-percent" style="width: {$not_voting_persent}%;"></span>
                                                    </div>
                                                </div>

                                            </div>


                                        </div>

                                    </div>

                            </div>

                        </div>
                        <!-- /timeline-block -->
                    {/foreach}


                    {$pagination}

                </div>
                <!-- end information_block -->
            </div>


        </div>
        <!-- /col-md-9 -->

        <!-- col-md-3 -->
        {*  <div class="col-md-3">
              <div class="section-heading">Важлива тема</div>


              <div class="sub-news main-theme">
                  <div class="sub-news_img">
                      <img src="/uploads/logos_small/043e087b66719b89d711437b75c22afd.jpeg">
                  </div>
                  <div class="sub-news_heading">
                      <b>
                          <a href="#">
                              Голова Верховної Ради України Андрій Парубій: «З передачею Томосу фактично офіційно затверджено створення Української помісної автокефальної церкви»
                          </a>
                      </b>
                  </div>
                  <span class="sub-news_date">06 січня 2018 о 13:58</span>
              </div>*}


        <div class="col-md-3 right-column-content">
            <div class="section-heading">Важлива тема</div>
            {foreach item=data from=$top_news}
                <div class="sub-news main-theme with-data">

                    <div class="sub-news_img">

                        {if strlen($data->i_logoname) > 0}
                            <img src="/uploads/logos_middle/{$data->i_logoname}.jpeg">
                        {/if}
                    </div>
                    <div class="sub-news_heading">
                        <b>
                            {if !$data->i_link}
                                <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                            {else}
                                <a href="{$data->i_link}">{$data->i_name} </a>
                            {/if}
                        </b>
                    </div>
                    <span class="sub-news_date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>


                </div>
            {/foreach}
            {foreach item=data from=$block_data.5.items}
                <div class="sub-news main-theme with-data">

                    <div class="sub-news_img">

                        {if strlen($data->i_logoname) > 0}
                            <img src="/uploads/logos_small/{$data->i_logoname}.jpeg">
                            {* {else}
                                <h3 class="primary badge float-left" style="margin-right: 1%; font-weight: bold;">i</h3> *}
                        {/if}
                    </div>
                    <div class="sub-news_heading">
                        {if !$data->i_link}
                            <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html">{$data->i_name}</a>
                        {else}
                            <a href="{$data->i_link}">{$data->i_name} </a>
                        {/if}
                    </div>
                    <span class="sub-news_date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year} {$data->hour}</span>


                </div>
            {/foreach}


            <div class="section-heading"> <a href="{$lang_prefix}/{$data->i_categories}">Переглянути ще</a></div>


            <div class="section-heading">Тематичні розділи</div>

            <a href="#" class="tags">урочисті заходи</a>
            <a href="#" class="tags">семінар-тренінг</a>
            <a href="#" class="tags">РЕФОРМИ</a>
            <a href="#" class="tags">засідання</a>
            <a href="#" class="tags">голос україни</a>
            <a href="#" class="tags">комітет з питань охорони здоров’я</a>
            <a href="#" class="tags">офіційний візит</a>


            <!-- digest -->
            <div class="full-mob-width">
                <div class="digest-section digest-small">
                    <div class="content">
                        {* <span class="mail-ico"><span class="messages"></span></span>  *}
                        <div class="digest-section__heading">
                                <span class="fa-2x">
                                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1" data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                                </span>
                            <p>Підписка на анонси та новини</p>
                        </div>

                        <p>Отримуйте головне з вебпорталу у свою скриньку</p>

                        <form method="post" action="{$lang_prefix}/subscribe/index">
                            {*  <label>Залиште вашу електрону пошту</label>  *}
                            <div class="input-group">
                                {*  <input type="email" class="form-control" placeholder="Your E-mail" aria-label="Your E-mail" aria-describedby="button-addon2">

                                <div class="info-ico">
                                    <i class="fas fa-info"></i>
                                    На наступному кроці ви зможете налаштувати категорії матеріалів у розсилці та її частоту
                                </div>  *}

                                <button class="btn btn-white" type="submit">Налаштувати</button>

                            </div>

                        </form>

                    </div>
                </div>
            </div>
            <!-- /digest -->

        </div>
        <!-- /col-md-3 -->
    </div>
    <!-- /row -->
</div>
<!-- /right_col -->

















