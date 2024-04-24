function sendMsg() {
    $.ajax({
        url: '/feedbackakred/sendMsg',
        type: 'post',
        data: {zminame: $('#zminame').val(), name: $('#name').val(), lname: $('#lname').val(), eventdate: $('#eventdate').val(), eventname: $('#eventname').val(), phone: $('#phone').val(), email: $('#email').val(), addressee: $('#addressee').val(), text: $('#text').val(), captcha: $('#captcha').val()},
        dataType: "html",
        success: function(msg) {
            $('#feedback').html(msg);

        }

    });

}
