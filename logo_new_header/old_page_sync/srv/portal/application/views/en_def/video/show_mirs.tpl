{*
<video poster="movie.jpg" controls>
        <source src='movie.webm' type='video/webm; codecs="vp8.0, vorbis"'>
        <source src='movie.ogv' type='video/ogg; codecs="theora, vorbis"'>
        <source src='movie.mp4' type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'>
        <p>This is fallback content</p>
</video>  

*}

<script src="/flowplayer/flowplayer-3.1.4.min.js"></script> 
{literal}
<script type="text/javascript">
    var logo = '{/literal}{$item->i_logoname}{literal}';
    var attachments_json = {/literal}{$attachments_json}{literal};


$(document).ready(function(){ 

    for(var index_name in attachments_json){
        for(var index_file=0; index_file < attachments_json[index_name].length; index_file++){
            if(attachments_json[index_name][index_file].ia_type == 'flv'){
                
                var playlist = [];
                if(logo.length > 0){                    
                    playlist.push({
                            url: '/uploads/logos/'+logo+'.jpeg', 
                            scaling: 'orig'                        
                    });
                }
                playlist.push({
                    url: '/uploads/video/'+attachments_json[index_name][index_file].ia_id+'.flv', 
                    autoPlay: false, 
                    autoBuffering: false 
                });
                $f('player'+attachments_json[index_name][index_file].ia_id, {src:"/flowplayer/flowplayer-3.2.2.swf"}, { playlist: playlist});	                
            }                
         }
    }

});    


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
            <li class="breadcrumb-item"><a href="/video/">Медійна бібліотека</a></li>
            <li class="breadcrumb-item"><a href="/video/"> Відеоматеріали</a></li>
            <li class="breadcrumb-item active">
                {$item->i_name}
            </li>
</ol>

{*<div class="heading">
    <h3><span>Відео</span></h3>
</div>*}  
<div class="gallery_content">
    
    
     
               <div class="publications-heading__block no-border-top">
                    <h1>{$item->i_name}</h1>
                    
                    <div class="small-text">
                        Прес-служба Апарату Верховної Ради України, Опубліковано 
                        
                        {if $current_node->t_seo_name == 'rada-tv'}
  
	<span class="date">

               {literal}
          <script type="text/javascript">
<!--      
    var now = new Date();

    var months = new Array(
        "січня",
        "лютого",
        "березня",
        "квітня",
        "травня",
        "червня",
        "липня",
        "серпня",
        "вересня",
        "жовтня",
        "листопада",
        "грудня");
    var days = new Array(
        "неділя",
        "понеділок",
        "вівторок",
        "середа",
        "четвер",
        "п'ятниця",
        "субота");
    var date = ((now.getDate()<10) ? "0" : "")+ now.getDate();
    function fourdigits(number)    {
      return (number < 1000) ? number + 1900 : number;}
    today = "Сьогодні " + date + " " + months[now.getMonth()] + " " +
       " " + (fourdigits(now.getYear())) +
       ", " + days[now.getDay()];
     document.write(today);
-->
</script>
          {/literal}
	</span>

	       {else}
	       <span class="date">
                   {$item->day} {$item->month} {$item->year}
               </span>
	       {/if}
               
                    </div>
                    
                    <a href="#" class="btn-video">Відео</a>
                    <a href="#" class="tags">заходи</a>
               </div>

                    <div class="main-content">
                        <div class="middle-column max730">
                            
                            {foreach item=data from=$attachments}

        {foreach item=video from=$data}  
            {if $video->ia_type == 'flv'}
                <div id="player{$video->ia_id}" style="width:400px;height:315px"></div>
                                   
            {/if}
        {/foreach }

    {/foreach}      
    
    
                {if $item->i_full}
                    {if $current_node->t_seo_name != 'rada-tv'}
                        {$item->i_full}
                    {elseif $is_plenar}
                        {$item->i_full}
                        {else} Сьогодні пленарного засідання немає
                    {/if}
                {else}
                    {$item->i_anons}
                {/if}
                <div class="clr"></div>
                        </div>
                    
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
                      

    </div>
