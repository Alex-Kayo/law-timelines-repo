<?php /* Smarty version 2.6.22, created on 2024-01-23 12:59:18
         compiled from main_page/votinlist.tpl */ ?>


<?php if ($this->_tpl_vars['votin_name']): ?>

    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/">Головна</a></li>
                <?php $_from = $this->_tpl_vars['path_way']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
            <li class="breadcrumb-item"><a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->t_parents; ?>
/"><?php echo $this->_tpl_vars['data']->t_name; ?>
</a></li>
        <?php endforeach; endif; unset($_from); ?>
        <li class="breadcrumb-item"><?php echo $this->_tpl_vars['votin_name']; ?>
</li>
    </ol>

<?php endif; ?>


<div class="right_col">
    <!-- information_block -->
    <div class="page-heading">

        <h3>
            <?php echo $this->_tpl_vars['votin_name']; ?>


        </h3>
    </div>


    <hr>

    <div class="row">
        <!-- col-md-9 -->
        <div class="col-md-9">

            <div id="list_archive">

                <div class="information_block archieve_block">



                    <?php $_from = $this->_tpl_vars['posts']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>

                        <?php $this->assign('all_golos', $this->_tpl_vars['data']->g_pos+$this->_tpl_vars['data']->g_neg+$this->_tpl_vars['data']->refrain+$this->_tpl_vars['data']->not_voting); ?>
<?php $this->assign('pos_persent', $this->_tpl_vars['data']->g_pos/$this->_tpl_vars['all_golos']*100); ?>
<?php $this->assign('neg_persent', $this->_tpl_vars['data']->g_neg/$this->_tpl_vars['all_golos']*100); ?>
<?php $this->assign('refrain_persent', $this->_tpl_vars['data']->refrain/$this->_tpl_vars['all_golos']*100); ?>
<?php $this->assign('not_voting_persent', $this->_tpl_vars['data']->not_voting/$this->_tpl_vars['all_golos']*100); ?>

                        
                        <!-- timeline-block -->
                        <div class="timeline-block">

                                <div class="timeline-block__date">

                                   <?php echo $this->_tpl_vars['data']->dat; ?>
&nbsp
                                </div>


                            <div class="timeline__conteiner">
                                    <span class="time"><?php echo $this->_tpl_vars['data']->time; ?>
</span>

                                    <div class="news_item">


                                        <div class="timeline-block_text">

                                            <div class="timeline-block__heading f-bold">
                                                <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
">
                                                    <?php echo $this->_tpl_vars['data']->i_name; ?>

                                                </a>

                                                <div class="<?php if ($this->_tpl_vars['data']->rishen == 'Прийнято'): ?>accepted-item<?php else: ?>declined-item<?php endif; ?>">
                                                    <?php if ($this->_tpl_vars['data']->rishen == 'Прийнято'): ?><i class="fas fa-check"></i><?php else: ?><i class="fas fa-times"></i><?php endif; ?>
                                                    <span><?php echo $this->_tpl_vars['data']->rishen; ?>
</span>
                                                </div>

                                            </div>

                                            <div  style="padding-left: 2rem;">





                                                <div class="polling-points" style="padding-left: 0rem;">
                                                    <ul>
                                                        <li class="point-green">За <b><?php echo $this->_tpl_vars['data']->g_pos; ?>
</b></li>
                                                        <li class="point-red">Проти <b><?php echo $this->_tpl_vars['data']->g_neg; ?>
</b></li>
                                                        <li class="point-yellow">Утрималось <b><?php echo $this->_tpl_vars['data']->refrain; ?>
</b></li>
                                                        <li class="point-grey">Не голосувало <b><?php echo $this->_tpl_vars['data']->not_voting; ?>
</b></li>
                                                    </ul>
                                                    <div class="percent-line">
                                                        <span class="yes-percent" style="width: <?php echo $this->_tpl_vars['pos_persent']; ?>
%;"></span>
                                                        <span class="no-percent" style="width: <?php echo $this->_tpl_vars['neg_persent']; ?>
%;"></span>
                                                        <span class="neutral-percent" style="width:<?php echo $this->_tpl_vars['refrain_persent']; ?>
%;"></span>
                                                        <span class="not-percent" style="width: <?php echo $this->_tpl_vars['not_voting_persent']; ?>
%;"></span>
                                                    </div>
                                                </div>

                                            </div>


                                        </div>

                                    </div>

                            </div>

                        </div>
                        <!-- /timeline-block -->
                    <?php endforeach; endif; unset($_from); ?>


                    <?php echo $this->_tpl_vars['pagination']; ?>


                </div>
                <!-- end information_block -->
            </div>


        </div>
        <!-- /col-md-9 -->

        <!-- col-md-3 -->
        

        <div class="col-md-3 right-column-content">
            <div class="section-heading">Важлива тема</div>
            <?php $_from = $this->_tpl_vars['top_news']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                <div class="sub-news main-theme with-data">

                    <div class="sub-news_img">

                        <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) > 0): ?>
                            <img src="/uploads/logos_middle/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg">
                        <?php endif; ?>
                    </div>
                    <div class="sub-news_heading">
                        <b>
                            <?php if (! $this->_tpl_vars['data']->i_link): ?>
                                <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a>
                            <?php else: ?>
                                <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
"><?php echo $this->_tpl_vars['data']->i_name; ?>
 </a>
                            <?php endif; ?>
                        </b>
                    </div>
                    <span class="sub-news_date"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
 <?php echo $this->_tpl_vars['data']->hour; ?>
</span>


                </div>
            <?php endforeach; endif; unset($_from); ?>
            <?php $_from = $this->_tpl_vars['block_data']['5']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['data']):
?>
                <div class="sub-news main-theme with-data">

                    <div class="sub-news_img">

                        <?php if (strlen ( $this->_tpl_vars['data']->i_logoname ) > 0): ?>
                            <img src="/uploads/logos_small/<?php echo $this->_tpl_vars['data']->i_logoname; ?>
.jpeg">
                                                    <?php endif; ?>
                    </div>
                    <div class="sub-news_heading">
                        <?php if (! $this->_tpl_vars['data']->i_link): ?>
                            <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
/<?php echo $this->_tpl_vars['data']->i_id; ?>
.html"><?php echo $this->_tpl_vars['data']->i_name; ?>
</a>
                        <?php else: ?>
                            <a href="<?php echo $this->_tpl_vars['data']->i_link; ?>
"><?php echo $this->_tpl_vars['data']->i_name; ?>
 </a>
                        <?php endif; ?>
                    </div>
                    <span class="sub-news_date"><?php echo $this->_tpl_vars['data']->day; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->month; ?>
&nbsp;<?php echo $this->_tpl_vars['data']->year; ?>
 <?php echo $this->_tpl_vars['data']->hour; ?>
</span>


                </div>
            <?php endforeach; endif; unset($_from); ?>


            <div class="section-heading"> <a href="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/<?php echo $this->_tpl_vars['data']->i_categories; ?>
">Переглянути ще</a></div>


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
                                                <div class="digest-section__heading">
                                <span class="fa-2x">
                                    <i class="fas fa-grip-lines" data-fa-transform="shrink-6 up-1" data-fa-mask="fas fa-comment-alt fa-stack-2x"></i>
                                </span>
                            <p>Підписка на анонси та новини</p>
                        </div>

                        <p>Отримуйте головне з вебпорталу у свою скриньку</p>

                        <form method="post" action="<?php echo $this->_tpl_vars['lang_prefix']; ?>
/subscribe/index">
                                                        <div class="input-group">
                                
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
















