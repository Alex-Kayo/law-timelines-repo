
<div class="text-center">
    {if $sel_foto->flag_new}
{*        <font color="Red">(оновлено)</font>	*}
        {/if}              

    {if $sel_foto->i_anons}
        <p>{$sel_foto->i_anons}</p>
    {/if}
    {if $sel_foto->i_full}
        <p>{$sel_foto->i_full}</p>
    {/if}

</div>


{*
{if $sel_foto->ia_name != "NoName" }
<span style="display: block; font-weight: bold; color: #024796;   text-align: center;  padding-top: 10px; padding-bottom: 10px">{$sel_foto->ia_name}</span>
{else}
<span style="display: block; font-weight: bold; color: #024796;   text-align: center;  padding-top: 10px; padding-bottom: 10px">{$header_gallery->i_name}</span>
{/if} *}

{*<div class="day-photo_event">
<i class="icn-calendar"></i>
<b>7 лютого 2019</b>, Четвер
</div>*}

<div class="photo-list">


    {foreach item=imgs from=$images.items name=i}
        {if $smarty.foreach.i.index < 18}
            
                <img alt="" src="/uploads/gallery_prev/{$imgs.filename}" />
            {/if}
        {/foreach}
<a href="javascript://" data-toggle="modal" data-target="#photoModal">Переглянути фото</a>

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
                        {$header_gallery->i_name}
                    </h4>
                </div>
            </div>
            <!-- /Modal Header -->

            <!-- Modal body -->
            <div class="modal-body">
                <div class="container">
                    {*<div class="subheading-wrap">
                        <div class="photo-view__data">
                            <span class="icn-calendar-f"></span>{$sel_foto->day}&nbsp;{$sel_foto->month}&nbsp;{$sel_foto->year}
                        </div>
                        <div class="photo-view__subheading">
                           
                            {$sel_foto->ia_name}
                            
                        </div>
                    </div>*}

                    <div class="photo-view__gallery">
                        <!--Main Slider Container-->
                        <div class="slider-container">
                            <!--Main Slider Start-->
                            <div id="slider" class="slider owl-carousel">
                                {*<div class="item">
                                    <div class="content">
                                        <img src="/uploads/gallery/{$sel_foto->filename}" class="img-responsive">
                                    </div>
                                </div>*}

                                <!--Repeat the below item to add more items in slider-->
                                
                                {foreach item=imgs from=$images.items name=i}
                                    {if $smarty.foreach.i.index <= 18}
                                        <div class="item">
                                            <div class="content">
                                                <img src="/uploads/gallery/{$imgs.filename}" class="img-responsive">  
                                                 
                                                <div class="photo-view__data">
                                                    <span class="icn-calendar-f"></span> {$imgs.ia_date_create}
                                                </div>
                                                <div class="photo-view__subheading">
                                                {$imgs.ia_name}    
                                                </div>
                                                <div class="photo-view__count">
                                                    <span>{$smarty.foreach.i.index+1}</span>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    {/if}    
                                {/foreach}
                                {*<div class="item">
                                <div class="content">
                                <img src="/uploads/gallery/54709.jpeg" class="img-responsive">
                                </div>
                                </div>
                                <div class="item">
                                <div class="content">
                                <img src="/uploads/gallery/54708.jpeg" class="img-responsive">
                                </div>
                                </div>
                                <div class="item">
                                <div class="content">
                                <img src="/uploads/gallery/54709.jpeg" class="img-responsive">
                                </div>
                                </div>
                                <div class="item">
                                <div class="content">
                                <img src="/uploads/gallery/54708.jpeg" class="img-responsive">
                                </div>
                                </div>
                                <div class="item">
                                <div class="content">
                                <img src="/uploads/gallery/54709.jpeg" class="img-responsive">
                                </div>
                                </div>
                                <div class="item">
                                <div class="content">
                                <img src="/uploads/gallery/54708.jpeg" class="img-responsive">
                                </div>
                                </div>
                                <div class="item">
                                <div class="content">
                                <img src="/uploads/gallery/54709.jpeg" class="img-responsive">
                                </div>
                                </div>
                                <div class="item">
                                <div class="content">
                                <img src="/uploads/gallery/54708.jpeg" class="img-responsive">
                                </div>
                                </div>
                                <div class="item">
                                <div class="content">
                                <img src="/uploads/gallery/54709.jpeg" class="img-responsive">
                                </div>
                                </div>*}



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
                                {foreach item=imgs from=$images.items name=i}
                                    {if $smarty.foreach.i.index <= 18}
                                        <div class="item">
                                            <div class="content">
                                                <img alt="" src="/uploads/gallery_prev/{$imgs.filename}" />
                                            </div>
                                        </div>
                                    {/if}
                                {/foreach}
                                {*<div class="item">
                                    <div class="content">
                                        <img src="/uploads/gallery_prev/54709.jpeg" class="img-responsive">
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="content">
                                        <img src="/uploads/gallery_prev/54708.jpeg" class="img-responsive">
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="content">
                                        <img src="/uploads/gallery_prev/54709.jpeg" class="img-responsive">
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="content">
                                        <img src="/uploads/gallery_prev/54708.jpeg" class="img-responsive">
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="content">
                                        <img src="/uploads/gallery_prev/54709.jpeg" class="img-responsive">
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="content">
                                        <img src="/uploads/gallery_prev/54708.jpeg" class="img-responsive">
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="content">
                                        <img src="/uploads/gallery_prev/54709.jpeg" class="img-responsive">
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="content">
                                        <img src="/uploads/gallery_prev/54708.jpeg" class="img-responsive">
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="content">
                                        <img src="/uploads/gallery_prev/54709.jpeg" class="img-responsive">
                                    </div>
                                </div>*}


                            </div>
                            <!--Thumbnail Slider End-->
                        </div>


                    </div>
                </div>

            </div><!--/modal-body-->

        </div><!--/modal-content-->
    </div><!--/modal-dialog-->
</div>
<!-- /The Modal -->

{*
<div class="slider-main">
<div>
<img alt="" src="/uploads/gallery/{$sel_foto->filename}" />
<figure>
<br>
<figcaption>
{$sel_foto->ia_description}
</figcaption>
</figure>
</div>
<div>
<img alt="" src="/uploads/gallery/54707.jpeg" />
</div>
<div>
<img alt="" src="/uploads/gallery/54709.jpeg" />
</div>
<div>
<img alt="" src="/uploads/gallery/54707.jpeg" />
</div>
<div>
<img alt="" src="/uploads/gallery/54709.jpeg" />
</div>
</div>
<div class="slider-nav">
<div>
<img alt="" src="/uploads/gallery/{$sel_foto->filename}" />
</div>
<div>
<img alt="" src="/uploads/gallery/54707.jpeg" />
</div>
<div>
<img alt="" src="/uploads/gallery/54709.jpeg" />
</div>
<div>
<img alt="" src="/uploads/gallery/54707.jpeg" />
</div>
<div>
<img alt="" src="/uploads/gallery/54709.jpeg" />
</div>
</div>
*}    

{*<div class="bigphoto clr">
{if $move_id->next_id}	
<a class="photo-right" href="javascript:showFoto('{$move_id->i_id}_{$move_id->next_id}')">next</a>
{/if}
{if $move_id->prev_id}	
<a class="photo-left" href="javascript:showFoto('{$move_id->i_id}_{$move_id->prev_id}')">prev</a>
{/if}
<img alt="" src="/uploads/gallery/{$sel_foto->filename}" width="640" />
<figure>
<figcaption>{$sel_foto->ia_description}</figcaption>
</figure>
</div>*}

{literal}
    <script>
        $(document).ready(function () {

            $('#photoModal').on('shown.bs.modal', function (e) {
                // reference for main items
                var slider = $('#slider');
                // reference for thumbnail items
                var thumbnailSlider = $('#thumbnailSlider');
                //transition time in ms
                var duration = 500;

                // carousel function for main slider
                slider.owlCarousel({
                    loop: false,
                    nav: false,
                    items: 1
                }).on('changed.owl.carousel', function (e) {
                    //On change of main item to trigger thumbnail item
                    thumbnailSlider.trigger('to.owl.carousel', [e.item.index, duration, true]);
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
                }).on('click', '.owl-item', function () {
                    // On click of thumbnail items to trigger same main item
                    slider.trigger('to.owl.carousel', [$(this).index(), duration, true]);

                }).on('changed.owl.carousel', function (e) {
                    // On change of thumbnail item to trigger main item
                    slider.trigger('to.owl.carousel', [e.item.index, duration, true]);
                });


                //These two are navigation for main items
                $('.slider-right').click(function () {
                    slider.trigger('next.owl.carousel');
                });
                $('.slider-left').click(function () {
                    slider.trigger('prev.owl.carousel');
                });
            });


        });

    </script>

{/literal}
