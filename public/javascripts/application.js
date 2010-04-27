jQuery.ajaxSetup({
    'beforeSend':function(xhr){
        xhr.setRequestHeader("Accept","text/javascript")
    }
})

$(document).ready(function(){

    $("#status_update").submit(function(){
        $.post($(this).attr("action"),$(this).serialize(),function(){
            $('#notification').slideUp();
        },"script");
        $('#notification').slideDown(400, function() {
            $('#notification').html('Processing');
        });


        return false;
    })
})

