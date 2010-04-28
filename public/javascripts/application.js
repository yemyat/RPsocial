jQuery.ajaxSetup({
    'beforeSend':function(xhr){
        xhr.setRequestHeader("Accept","text/javascript")
    }
})

$(document).ready(function(){
    $("#status_update").submit(function(){
        $.post($(this).attr("action"),$(this).serialize(),
            function (text) {
                $('#my_posts').prepend(text);         
                $('.post:last').remove();
                $('#status_update')[0].reset();
            }
            ,"script");
        return false;
    })
})

