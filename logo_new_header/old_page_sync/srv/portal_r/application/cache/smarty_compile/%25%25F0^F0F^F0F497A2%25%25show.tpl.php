<?php /* Smarty version 2.6.22, created on 2024-01-29 13:49:54
         compiled from gallery/show.tpl */ ?>


<ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item"><a href="/newscenter#mediaLibrary">Медійна бібліотека</a></li>
            <li class="breadcrumb-item"><a href="/gallery/"> Фотоальбоми</a></li>
            <li class="breadcrumb-item active">
               <?php echo $this->_tpl_vars['header_gallery']->i_name; ?>

            </li>
</ol>

  

    <div class="publications-heading__block no-border-top">
         <h3><?php echo $this->_tpl_vars['header_gallery']->i_name; ?>
</h3>
    <input type="hidden" id="gallery_id" value="<?php echo $this->_tpl_vars['header_gallery']->i_id; ?>
"/>
    
    <p class="small-text">
    
<?php if ($this->_tpl_vars['sel_foto']->ia_author): ?>
<span><?php echo $this->_tpl_vars['sel_foto']->ia_author; ?>
.</span>
<?php endif; ?>
<span>Опубліковано <?php echo $this->_tpl_vars['images']['items'][0]['ia_date_create']; ?>
</span>
</p>

        </div>
    
    <div class="main-content">
        <!-- middle-column -->
        <div class="middle-column max730">
    <!-- gallery -->
    <div id="show_foto">
        <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "gallery/sel_foto.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>              	
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
                           
                            <div class="fb-share-button" data-href="http://mportal.rada.gov.ua<?php echo $this->_tpl_vars['base_url']; ?>
<?php echo $this->_tpl_vars['i_id']; ?>
.html" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http://mportal.rada.gov.ua<?php echo $this->_tpl_vars['base_url']; ?>
<?php echo $this->_tpl_vars['i_id']; ?>
.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поділитись</a></div>
                           
                        </div>
                        <div class="like-item">
                            <span class="twitter-share-button-ico">
<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</span>
                        </div>
                        <div class="like-item">
                            <a href="https://telegram.me/share/url?url=http://mportal.rada.gov.ua<?php echo $this->_tpl_vars['base_url']; ?>
<?php echo $this->_tpl_vars['i_id']; ?>
.html&text=<?php echo $this->_tpl_vars['item']->i_name; ?>
" target="_blank">
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
    