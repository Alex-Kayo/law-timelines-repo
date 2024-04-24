<?php /* Smarty version 2.6.22, created on 2024-01-29 13:49:54
         compiled from gallery/sel_foto.tpl */ ?>

<div class="text-center">
    <?php if ($this->_tpl_vars['sel_foto']->flag_new): ?>
        <?php endif; ?>              

    <?php if ($this->_tpl_vars['sel_foto']->i_anons): ?>
        <p><?php echo $this->_tpl_vars['sel_foto']->i_anons; ?>
</p>
    <?php endif; ?>
    <?php if ($this->_tpl_vars['sel_foto']->i_full): ?>
        <p><?php echo $this->_tpl_vars['sel_foto']->i_full; ?>
</p>
    <?php endif; ?>

</div>


<a href="javascript://" data-toggle="modal" data-target="#photoModal" class="btn-more normal">Переглянути обрану фотогалерею</a>

            <div style="margin-top: 1em;"><a href="javascript://" data-toggle="modal" data-target="#photoModal">
    
                    <div class="photo-list">


    <?php $_from = $this->_tpl_vars['images']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['imgs']):
        $this->_foreach['i']['iteration']++;
?>
        <?php if (($this->_foreach['i']['iteration']-1) < 6): ?>
            
                <img alt="" src="/uploads/gallery_prev/<?php echo $this->_tpl_vars['imgs']['filename']; ?>
" />
            <?php endif; ?>
        <?php endforeach; endif; unset($_from); ?>

</div>
                    
        </a> 
            
        <div > 
            <a href="/gallery" class="btn-more normal">Переглянути інші фотогалереї</a></div>
            </div>



<!-- The Modal -->
<div class="modal photo-view" id="photoModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <i class="fas fa-chevron-left"></i>
                    Повернутися
                </button>

                <div class="modal-title">
                    <span>Фотоальбом</span>
                    <h4>
                        <?php echo $this->_tpl_vars['header_gallery']->i_name; ?>

                    </h4>
                </div>
            </div>
            <!-- /Modal Header -->

            <!-- Modal body -->
            <div class="modal-body">
                <div class="container">
                    

                    <div class="photo-view__gallery">
                        <!--Main Slider Container-->
                        <div class="slider-container">
                            <!--Main Slider Start-->
                            <div id="slider" class="slider owl-carousel">
                                

                                <!--Repeat the below item to add more items in slider-->
                                
                                <?php $_from = $this->_tpl_vars['images']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['imgs']):
        $this->_foreach['i']['iteration']++;
?>
                                    <?php if (($this->_foreach['i']['iteration']-1) <= 42): ?>
                                        <div class="item">
                                            <div class="content">
                                                <img src="/uploads/gallery/<?php echo $this->_tpl_vars['imgs']['filename']; ?>
" class="img-responsive">  
                                                 
                                                <div class="photo-view__data">
                                                    <span class="icn-calendar-f"></span> <?php echo $this->_tpl_vars['imgs']['ia_date_create']; ?>

                                                </div>
                                                <div class="photo-view__subheading">
                                                <?php echo $this->_tpl_vars['imgs']['ia_name']; ?>
    
                                                </div>
                                                <div class="photo-view__count">
                                                    <span><?php echo ($this->_foreach['i']['iteration']-1)+1; ?>
</span>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    <?php endif; ?>    
                                <?php endforeach; endif; unset($_from); ?>
                               



                            </div>
                            <!--Main Slider End-->

                            <!--Navigation Links For the Main Items-->
                            <div class="slider-controls">
                                <a class="slider-left" href="javascript:;"><span></span></a>
                                <a class="slider-right" href="javascript:;"><span></span></a>
                            </div>
                        </div><!--/slider-container-->




                        <!--Thumbnail slider container-->
                        <div class="thumbnail-slider-container">
                            <!--Thumbnail Slider Start-->
                            <div id="thumbnailSlider" class="thumbnail-slider owl-carousel">
                                
                                <!--Repeat the below item to add more items in slider(Here add the items same as in main slider items)-->
                                <?php $_from = $this->_tpl_vars['images']['items']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['i'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['i']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['imgs']):
        $this->_foreach['i']['iteration']++;
?>
                                    <?php if (($this->_foreach['i']['iteration']-1) <= 42): ?>
                                        <div class="item">
                                            <div class="content">
                                                <img alt="" src="/uploads/gallery_prev/<?php echo $this->_tpl_vars['imgs']['filename']; ?>
" />
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                <?php endforeach; endif; unset($_from); ?>
                                


                            </div>
                            <!--Thumbnail Slider End-->
                        </div>


                    </div>
                </div>

            </div><!--/modal-body-->

        </div><!--/modal-content-->
    </div><!--/modal-dialog-->
</div>


<?php echo '
    <script>
        $(document).ready(function () {

            $(\'#photoModal\').on(\'shown.bs.modal\', function (e) {
                // reference for main items
                var slider = $(\'#slider\');
                // reference for thumbnail items
                var thumbnailSlider = $(\'#thumbnailSlider\');
                //transition time in ms
                var duration = 500;

                // carousel function for main slider
                slider.owlCarousel({
                    loop: false,
                    nav: false,
                    items: 1
                }).on(\'changed.owl.carousel\', function (e) {
                    //On change of main item to trigger thumbnail item
                   // thumbnailSlider.trigger(\'to.owl.carousel\', [0, duration, true]);
                     thumbnailSlider.trigger(\'to.owl.carousel\', [e.item.index, duration, true]);
                });

                // carousel function for thumbnail slider
                thumbnailSlider.owlCarousel({
                    loop: false,
                    center: true, //to display the thumbnail item in center
                    nav: false,
                    responsive: {
                        0: {
                            items: 4
                        },
                        600: {
                            items: 10
                        },
                        1000: {
                            items: 12
                        }
                    }
                }).on(\'click\', \'.owl-item\', function () {
                    // On click of thumbnail items to trigger same main item
                  //  slider.trigger(\'to.owl.carousel\', [2, duration, true]);
                                slider.trigger(\'to.owl.carousel\', [$(this).index(), duration, true]);

                }).on(\'changed.owl.carousel\', function (e) {
                    // On change of thumbnail item to trigger main item
                    slider.trigger(\'to.owl.carousel\', [e.item.index, duration, true]);
                });


                //These two are navigation for main items
                $(\'.slider-right\').click(function () {
                    slider.trigger(\'next.owl.carousel\');
                });
                $(\'.slider-left\').click(function () {
                    slider.trigger(\'prev.owl.carousel\');
                });
            });


        });

    </script>

'; ?>
