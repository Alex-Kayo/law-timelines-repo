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
    var attachments_json = {/literal}{$attachments_json}{literal};
        
$(document).ready(function(){ 
        
    for(var index_name in attachments_json){
        for(var index_file=0; index_file < attachments_json[index_name].length; index_file++){
            if(attachments_json[index_name][index_file].ia_type == 'mp3'){

                $f('player'+attachments_json[index_name][index_file].ia_id, "/flowplayer/flowplayer-3.2.2.swf", {
                        plugins: {
                                controls: {
                                        fullscreen: false,
                                        height: 30,
                                        autoHide: false
                                }
                        },							
                        clip: {
                                autoPlay: false,
                                url: '/uploads/audio/'+attachments_json[index_name][index_file].ia_id+'.mp3'

                        }

                });                
            }                
         }
    }

});        
</script> 
{/literal}


<div class="heading">
    <h3><span>Аудіо</span></h3>
</div>  
<div class="gallery_content">
     <div class="date">{$header_gallery->day} {$header_gallery->month} {$header_gallery->year}</div>
    <h1>{$item->i_name}</h1>
    
    {if $item->i_full}
        {$item->i_full}
    {else}
        {$item->i_anons}
    {/if}
    <br>  

    {foreach item=data from=$attachments}

        {foreach item=audio from=$data}                                        
            {if $audio->ia_type == 'mp3'}
                <div id="player{$audio->ia_id}" style="display:block;width:540px;height:30px;"></div>
                <p>{$audio->ia_description}</p>
                <br /><br /><br />                            
                {/if}
        {/foreach }

    {/foreach}      

</div>  