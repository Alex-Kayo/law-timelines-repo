function sendMsg(){
	$.ajax({
  			url: '/en/feedback/sendMsg',
  			type: 'post',
  			data: {theme: $('#theme').val(), name: $('#name').val(), post: $('#post').val(), phone: $('#phone').val(), email: $('#email').val(), addressee: $('#addressee').val(), text: $('#text').val(), captcha: $('#captcha').val()},
  			dataType : "html",
  			success: function(msg){	
        		$('#feedback').html(msg);
        		
    		}
    		
  		});
	
}
