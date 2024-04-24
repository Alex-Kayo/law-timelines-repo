   <div id="content-all">
      <div class="panel">

        <div class="panel1">
          <div class="panel2">
            <div class="panel-head clr">
             <span class="photo-head-link">            
            	Всього&nbsp;{$all_count_posts}&nbsp;фотозвітів            
        		{if $new_count_posts>0}
              		( <span>нових&nbsp;{$new_count_posts}</span> )
              	{/if}
            </span>
              <h3>Фото</h3>
              <a class="rss" href="/rss/gallery/">RSS</a> </div>
            <div class="white3-panel">
              <div class="white3-panel1">
              
                <div class="clr">                
                	{foreach item=media_data from=$list_gallery}
		               <div class="photo-cat">
		               	<div class="photo-cat2"> 
		               
		               <a href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html"><img height="100" width="144" class="borderimg2" alt="{$media_data->i_name}" src="/uploads/gallery_prev/{$media_data->filename}"/></a>
		                  <span class="date">{$media_data->day}&nbsp;{$media_data->month},&nbsp;{$media_data->year}
								{if $media_data->flag_new}
								 	<span class="red">(оновлено)</span>											
								{/if}	                  
		                  </span>
	                      <h3>{$media_data->i_name}</h3>                      
		                  <p>{$media_data->ia_foto_description}</p>
		                  <p><em>{*{$media_data->ia_author}<br/>*}
			                  {$media_data->foto_cnt}&nbsp;фото
			                  </em></p>		                  		                    
		                  </div> 
		                  <a href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html"><i>переглянути альбом</i></a>
		                 <div class="dots">&nbsp;</div>
	                  	</div>                	
                	{/foreach}
                </div>
                
                
                {$pagination}                  
                
              </div>
            </div>
          </div>
        </div>
        
        
        
      </div>
</div>