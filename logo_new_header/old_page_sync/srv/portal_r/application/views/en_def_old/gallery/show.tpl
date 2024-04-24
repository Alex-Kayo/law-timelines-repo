{literal}
<style type="text/css">
.jcarousel-skin-tango .jcarousel-container-horizontal {
    width: 85%;
}

.jcarousel-skin-tango .jcarousel-clip-horizontal {
    width: 100%;
}
</style>

<script type="text/javascript">


	function showFoto(fotoID){		
		$('#show_foto').load('/gallery/' + fotoID + '.html?{/literal}{$show_request}{literal}');
	}


	function clickPagination(){
	   $('.pages a').click(function(){    	   	
			$.ajax({
				type: "POST",
				data: "gallery_id=" + $('#gallery_id').attr('value'),
			    url: $(this).attr('href'),
			    success: function (data, textStatus){
			    	$('#other_gallery').html(data);
			    	clickPagination();
		    	    return false;
			    }
			});    
			return false;
	 	
			
		});
		return false;	
	}


    $(document).ready(function(){       
        clickPagination();
        jQuery('#fotocarousel').jcarousel({
            visible:6,
            scroll:5,
            itemLoadCallback: mycarousel_itemLoadCallback
        });
    }); 

	function mycarousel_itemLoadCallback(carousel, state)
	{
	    // Check if the requested items already exist
	    if (carousel.has(carousel.first, carousel.last)) {
	        return;
	    }
	
	    jQuery.post(
	        '/gallery/{/literal}{$header_gallery->i_id}{literal}.html?{/literal}{$show_request}{literal}',
	        {
	            first_image: carousel.first,
	            last_image: carousel.last
	        },
	        function(json) {
			    carousel.size(json.total);			    
			    if(json.total > 0){
				    for(var lp1=0; lp1<json.items.length; lp1++){			    	
						carousel.add(carousel.first + lp1, '<a href="javascript:showFoto(\'' + json.items[lp1].foto_id + '\')" title="' + json.items[lp1].ia_description + '"><img src="/uploads/gallery_prev/' + json.items[lp1].filename + '" height="54" width="79" class="borderimg" alt="" /></a>');		
				    }	            
			    }
	        },
	        "json"
	    );
	};    
	///****
  
</script>
{/literal}



<div class="heading">
    <h3><span>Фото матеріали</span></h3>
</div>  
<div class="content">
     <div class="date">{$header_gallery->day}&nbsp;{$header_gallery->month},&nbsp;{$header_gallery->year}</div>
    <h3>{$header_gallery->i_name}</h3>
    <input type="hidden" id="gallery_id" value="{$header_gallery->i_id}"/>
    <!-- gallery -->
    <div id="show_foto">
        {include file=gallery/sel_foto.tpl}              	
    </div>
    <div class="clr" align="center">
        <div class="jcarousel-skin-tango gallerycarousel">
                <div style="display: block;" id="fotocarousel">
                <ul>
                    <!-- The content will be dynamically loaded in here -->
                </ul>
            </div>    
        </div>                    
    </div>
    <!-- end gallery -->
</div>    
