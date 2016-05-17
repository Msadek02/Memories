jQuery(document).ready(function($) {

    $(".style-container li").click(function(){
        var selected = $(this).attr('class'),
            style='css/styles/'+selected+'.css';
        $('#theme-style').attr('href',style);
        return false;
    });

    
    $("#demo-custom").click(function(){
        if($(".style-container").css('right') == '0px'){
            $(".style-container").stop().animate({right:'-205px'},300);
        }
        if($(".style-container").css('right') == '-205px'){
            $(".style-container").stop().animate({right:'0px'},300);
        }
    });

});

