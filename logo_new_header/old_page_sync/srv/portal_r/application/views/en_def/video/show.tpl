<script type="text/javascript" src="/sources/js/clappr.min.js"></script>

{if $is_news_subsite}
   {include file='news_subsite/newcenter_menu.tpl'}
{/if}

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
                    
                    {*<a href="#" class="btn-video">Відео</a>
                    <a href="#" class="tags">заходи</a>*}
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
                    {else !$is_plenar}
{*                    {elseif !$is_plenar}*}
                        {$item->i_full}
{*                        {else} Сьогодні пленарного засідання немає*}
                    {/if}
                {else}
                    {$item->i_anons}
                {/if} 
                <div class="clr"></div>
                        </div>
                    
                    <!-- social-aside -->
        {*<div class="social-aside">
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
        </div>*}
        <!-- /social-aside -->
                    </div>
                      

    </div>
