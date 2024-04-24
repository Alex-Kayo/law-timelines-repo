

<ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item"><a href="/newscenter#mediaLibrary">Медійна бібліотека</a></li>
            <li class="breadcrumb-item"><a href="/gallery/"> Фотоальбоми</a></li>
            <li class="breadcrumb-item active">
               {$header_gallery->i_name}
            </li>
</ol>

{*<div class="page-heading">
    <h3><span>Фото матеріали {$show_request}</span></h3>
</div>*}  

    <div class="publications-heading__block no-border-top">
     {*<div class="date">{$header_gallery->day}&nbsp;{$header_gallery->month},&nbsp;{$header_gallery->year}</div>*}
    <h3>{$header_gallery->i_name}</h3>
    <input type="hidden" id="gallery_id" value="{$header_gallery->i_id}"/>
    
    <p class="small-text">
    
{if $sel_foto->ia_author}
<span>{$sel_foto->ia_author}.</span>
{/if}
<span>Опубліковано {$images.items[0].ia_date_create}</span>
{*<span>Опубліковано {$images|@print_r}</span>*}
{*<span>Опубліковано $sel_foto->day}&nbsp;{$sel_foto->month}&nbsp;{$sel_foto->year},&nbsp;</span>*}
</p>

    {*<a href="#" class="btn-fill">
                <i class="camera-icn"></i>
                Фотоальбом
            </a>
            <a href="#" class="tags">робоча нарада</a>
            <a href="#" class="tags">соціальне страхуваня</a>*}
{*            {$images.items.filename}111*}
    </div>
    
    <div class="main-content">
        <!-- middle-column -->
        <div class="middle-column max730">
    <!-- gallery -->
    <div id="show_foto">
        {include file=gallery/sel_foto.tpl}              	
    </div>
    
            <div class="clr" align="center">
                <div class="jcarousel-skin-tango gallerycarousel">
                <div style="display: block;" id="fotocarousel">
                <ul>
                    <!-- The content will be dynamically loaded in here -->
                </ul>
            </div>    
        </div> 
                
                
            
    </div>
    <!-- end gallery -->
        </div>
    
        <!-- /middle-column -->
        
        <!-- social-aside -->
                    <div class="social-aside">
                        <div>
                            <div class="share-block">
                                
                                <div class="like-item">
                           
                            <div class="fb-share-button" data-href="http://mportal.rada.gov.ua{$base_url}{$i_id}.html" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http://mportal.rada.gov.ua{$base_url}{$i_id}.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поділитись</a></div>
                           
                        </div>
                        <div class="like-item">
                            <span class="twitter-share-button-ico">
<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</span>
                        </div>
                        <div class="like-item">
                            <a href="https://telegram.me/share/url?url=http://mportal.rada.gov.ua{$base_url}{$i_id}.html&text={$item->i_name}" target="_blank">
<i class="fab fa-telegram-plane"></i>
</a>
                        </div>
                        
                        <div class="like-item">
                            <a href="http://m.me/verkhovna.rada.ukraine/" target="_blank">
<i class="fab fa-facebook-messenger"></i>
</a>
                        </div>

                            </div>

                        </div>
                    </div>
                    <!-- /social-aside -->
    </div>
    
