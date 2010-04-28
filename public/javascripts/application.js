jQuery.ajaxSetup({
    'beforeSend':function(xhr){
        xhr.setRequestHeader("Accept","text/javascript")
    }
})

$(document).ready(function(){
    $("#status_update_form").submit(function(){

        $("#notification").fadeIn('fast');

        $.post($(this).attr("action"),$(this).serialize(),
            function (text) {
                $(text).hide().prependTo('#my_posts').fadeIn("slow");
                $('.post:last').remove().fadeOut('slow');
                $('#status_update_form')[0].reset();
                $("#notification").fadeOut('fast');
      
            }
            ,"script");
        return false;
    })
})

