<div class="clr">                
	{foreach item=media_data from=$list_gallery}
       <div class="photo-cat">
       	<div class="photo-cat2"> 
       
       <img height="100" width="144" class="borderimg2" alt="{$media_data->i_name}" src="/uploads/gallery/{$media_data->filename}"/>
          <span class="date">{$media_data->day}&nbsp;{$media_data->month},&nbsp;{$media_data->year}
				{if $media_data->flag_new}
				 	<span class="red">(оновлено)</span>											
				{/if}	                  
          </span>
          <h3>{$media_data->i_name}</h3>                      
          <p>{$media_data->ia_foto_description}</p>
          <p>{*{$media_data->ia_author}<br/>*}		                  
              <em>{$media_data->foto_cnt}&nbsp;фото
              </em></p>		                  		                    
          </div> 
          <a href="{$lang_prefix}/{$media_data->i_categories}/{$media_data->i_id}.html"><i>переглянути альбом</i></a>
          <div class="dots">&nbsp;</div>
      	</div>                	
	{/foreach}
	
	
	 {$pagination}    
</div>