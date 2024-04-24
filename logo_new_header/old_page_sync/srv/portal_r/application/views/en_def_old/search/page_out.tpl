<div id="content-all">
  <div class="panel">
    <div class="panel1">
      <div class="panel2">
        <div class="panel-head clr">
          <h3>Search</h3>
        </div>
        <div class="white3-panel">
          <div class="white3-panel1 clr">
          

{$i18n.results}: {$page_result.total_count}



<hr />

{foreach item=data from=$page_result.items}      


    <div class="news_item">
	
        {if strlen($data.image) > 0}
            <img align="left" alt="" src="{$data.image}" width="96" height="76"/>
        {/if}
	 
	{*
        <p>{$data.title}</p>
	*}
	
	{if $data.content}
	    <br>
	 <p>{$data.content}</p>
	 {/if}
        
	 <span class="details"><a href="{$data.url}">link</a></span>
    </div>      

    
  {/foreach}


{$pagination}




</div>
      </div>
    </div>
  </div>
</div>