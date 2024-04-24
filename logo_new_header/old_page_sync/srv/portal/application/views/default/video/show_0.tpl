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
</script> 
{/literal}

<div class="heading">
    <h3><span>Відео</span></h3>
</div>  
<div class="gallery_content">
    
    {if $current_node->t_seo_name == 'rada-tv'}
  
	<div class="date">
	    <br>
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
	</div>
     <br>
	       {else}
	       <div class="date">{$item->day} {$item->month} {$item->year}</div>
	       {/if}
     
    <h1>{$item->i_name}</h1>
    <br>
    {if $item->i_full}
        {$item->i_full}
    {else}
        {$item->i_anons}
    {/if}
    <br>  

    <br>
    {foreach item=data from=$attachments}
        {foreach item=video from=$data}  
             
            {if $video->ia_type == 'flv'}
                <div id="player{$video->ia_id}" style="width:400px;height:315px"></div>
                <br /><br />                    
            {/if}
            
        {/foreach }

    {/foreach}      

</div>  