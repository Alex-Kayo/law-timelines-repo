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
     <div class="date">{$item->day} {$item->month} {$item->year}</div>
     
    <h1>{$item->i_name}</h1>
    
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