{literal}
<style type="text/css">
.jcarousel-skin-tango .jcarousel-container-horizontal {
    width: 85%;
}

.jcarousel-skin-tango .jcarousel-clip-horizontal {
    width: 100%;
}
</style>

<script type="text/javascript">


	function showFoto(fotoID){		
		$('#show_foto').load('/gallery/' + fotoID + '.html?{/literal}{$show_request}{literal}');
	}


	function clickPagination(){
	   $('.pages a').click(function(){    	   	
			$.ajax({
				type: "POST",
				data: "gallery_id=" + $('#gallery_id').attr('value'),
			    url: $(this).attr('href'),
			    success: function (data, textStatus){
			    	$('#other_gallery').html(data);
			    	clickPagination();
		    	    return false;
			    }
			});    
			return false;
	 	
			
		});
		return false;	
	}


    $(document).ready(function(){       
        clickPagination();
        jQuery('#fotocarousel').jcarousel({
            visible:6,
            scroll:5,
            itemLoadCallback: mycarousel_itemLoadCallback
        });
    }); 

	function mycarousel_itemLoadCallback(carousel, state)
	{
	    // Check if the requested items already exist
	    if (carousel.has(carousel.first, carousel.last)) {
	        return;
	    }
	
	    jQuery.post(
	        '/gallery/{/literal}{$header_gallery->i_id}{literal}.html?{/literal}{$show_request}{literal}',
	        {
	            first_image: carousel.first,
	            last_image: carousel.last
	        },
	        function(json) {
			    carousel.size(json.total);			    
			    if(json.total > 0){
				    for(var lp1=0; lp1<json.items.length; lp1++){			    	
						carousel.add(carousel.first + lp1, '<a href="javascript:showFoto(\'' + json.items[lp1].foto_id + '\')" title="' + json.items[lp1].ia_description + '"><img src="/uploads/gallery_prev/' + json.items[lp1].filename + '" height="54" width="79" class="borderimg" alt="" /></a>');		
				    }	            
			    }
	        },
	        "json"
	    );
	};    
	///****
  
  if (($(window).width() > 768)){
        $(function(){
            var a = document.querySelector('.social-aside'), b = null, P = 100;

            if(a !== null) {
                window.addEventListener( 'scroll', Ascroll, false );
                document.body.addEventListener( 'scroll', Ascroll, false );
            }
            function Ascroll() {
                if (b == null) {
                    var Sa = getComputedStyle(a, ''), s = '';
                    for (var i = 0; i < Sa.length; i++) {
                        if (Sa[i].indexOf('overflow') == 0 || Sa[i].indexOf('padding') == 0 || Sa[i].indexOf('border') == 0 || Sa[i].indexOf('outline') == 0 || Sa[i].indexOf('box-shadow') == 0 || Sa[i].indexOf('background') == 0) {
                            s += Sa[i] + ': ' +Sa.getPropertyValue(Sa[i]) + '; '
                        }
                    }
                    b = document.createElement('div');
                    b.style.cssText = s + ' box-sizing: border-box; width: ' + a.offsetWidth + 'px;';
                    a.insertBefore(b, a.firstChild);
                    var l = a.childNodes.length;
                    for (var i = 1; i < l; i++) {
                        b.appendChild(a.childNodes[1]);
                    }
                    a.style.height = b.getBoundingClientRect().height + 'px';
                    a.style.padding = '0';
                    a.style.border = '0';
                }
                var Ra = a.getBoundingClientRect(),
                    R = Math.round(Ra.top + b.getBoundingClientRect().height - document.querySelector('.back-to, .clr').getBoundingClientRect().bottom);
                if ((Ra.top - P) <= 0) {
                    if ((Ra.top - P) <= R) {
                        b.className = 'stop';
                        b.style.top = - R +'px';
                    } else {
                        b.className = 'sticky';
                        b.style.top = P + 'px';
                    }
                } else {
                    b.className = '';
                    b.style.top = '';
                }
                window.addEventListener('resize', function() {
                    a.children[0].style.width = getComputedStyle(a, '').width
                }, false);
            }
        });
    }
</script>
{/literal}

<ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/">Головна</a></li>
            <li class="breadcrumb-item"><a href="/gallery/">Медійна бібліотека</a></li>
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
<span>Опубліковано {$sel_foto->day}&nbsp;{$sel_foto->month}&nbsp;{$sel_foto->year},&nbsp;</span>
</p>

    <a href="#" class="btn-fill">
                <i class="camera-icn"></i>
                Фотоальбом
            </a>
            <a href="#" class="tags">робоча нарада</a>
            <a href="#" class="tags">соціальне страхуваня</a>
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
                            <a href="#">
                                <i class="fas fa-share-alt"></i>
                                <span class="like-item__count">1</span>
                                <span class="like-item__text"><b>поширень</b></span>
                            </a>
                        </div>
                        <div class="like-item">
                            <div class="fb-share-button" data-href="https://rada.gov.ua/news/Top-novyna/179446.html" data-layout="button" data-size="small"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Frada.gov.ua%2Fnews%2FTop-novyna%2F179446.html&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Поделиться</a></div>
                        </div>
                        <div class="like-item">
                            <span class="twitter-share-button-ico">
<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
</span>
                        </div>
                        <div class="like-item">
                            <a href="https://telegram.me/share/url?url=<URL>&text=<TEXT>" target="_blank">
<i class="fab fa-telegram-plane"></i>
</a>
                        </div>
                        <div class="like-item">
                            <a href="http://m.me/" target="_blank">
<i class="fab fa-facebook-messenger"></i>
</a>
                        </div>

                    </div>

                </div>
        </div>
        <!-- /social-aside -->
    </div>
    
