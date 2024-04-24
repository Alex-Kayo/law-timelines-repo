<div id="content-all">
    <div class="panel">

        <div class="panel1">
            <div class="panel2">
                <div class="panel-head clr">


                    <h3> Види інформації</h3>
                    <a class="rss" href="/rss/video">RSS</a> </div>
                <div class="white3-panel">
                    <div class="white3-panel1">

                        <div class="clr">                
                            {foreach item=data from=$posts}
                                <div class="photo-cat">
                                    <div class="photo-cat2"> 

                                        <img height="100" width="144" class="borderimg2" alt="{$data->i_name}" src="/uploads/logos/{$data->i_logoname}.jpeg"/>
                                        <span class="date">{$data->day}&nbsp;{$data->month}&nbsp;{$data->year},&nbsp;{$data->hour}:{$data->minute}</span>
                                        {if $data->flag_new}
                                            <span class="red">(оновлено)</span>											
                                        {/if}	                  
                                        </span>
                                        <h3>{$data->i_name}</h3>                      
                                        <p>{$data->i_anons}</p>
                                        <a href="{$lang_prefix}/{$data->i_categories}/{$data->i_id}.html"><i>переглянути альбом</i></a>
                                    </div> 
                                    <div class="dots"> </div>
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

