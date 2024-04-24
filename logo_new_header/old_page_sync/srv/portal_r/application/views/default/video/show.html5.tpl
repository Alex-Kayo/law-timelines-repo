<script src="/flowplayer/flowplayer-3.1.4.min.js"></script> 
<div id="content-all">
      <div class="panel">

        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr">
              <h3>Відео</h3>
              <a class="rss" href="/rss/video">RSS</a> </div>
            <div class="white3-panel">
              <div class="white3-panel1">
              
              <h1>{$item->i_name}</h1>
                
				{if $item->i_full}
				    {$item->i_full}
				{else}
				    {$item->i_anons}
				{/if}
				<br>
				{foreach item=data from=$attachments}
	                 <div id="player{$data->ia_id}" style="width:400px;height:315px"></div>
	                 <br /><br />
	                    
	                 <video>
                             {*
        <source src='/uploads/video/6769.flv' type='video/flv; '>
        <p>This is fallback content</p>                                                         
                             </video>
                         *}
                         
<video poster="movie.jpg" controls>
        <source src='movie.webm' type='video/webm; codecs="vp8.0, vorbis"'>
        <source src='movie.ogv' type='video/ogg; codecs="theora, vorbis"'>
        <source src='movie.mp4' type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'>
        <p>This is fallback content</p>
</video>                       
					{literal}
					<script type="text/javascript">
                                            /*
						$(document).ready(function(){ 
							$f('player{/literal}{$data->ia_id}{literal}', {src:"/flowplayer/flowplayer-3.2.2.swf"}, { 
							    
								playlist: [
									
									{/literal}{if $item->i_logoname}{literal}									
									// this first PNG clip works as a splash image
									{
										url: '/uploads/logos/{/literal}{$item->i_logoname}{literal}.jpeg', 
										scaling: 'orig'
									},									
									{/literal}{/if}{literal}
									
									// second clip is a video. when autoPlay is set to false the splash screen will be shown
									{
										url: '/uploads/video/{/literal}{$data->ia_id}{literal}.flv', 
										autoPlay: false, 
										
										// video will be buffered when splash screen is visible
										autoBuffering: false 
									}
								]							    
							    
							    
							});		
					
						});
                                                    */
					
					</script>
					{/literal}	                    

				{/foreach}              
              
                
              </div>
            </div>
          </div>
        </div>
        
      </div>
</div>

