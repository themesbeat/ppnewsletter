$(document).ready(function() {

    var delay = 1000; // milliseconds
    var cookie_expire = 0; // days

    var cookie = localStorage.getItem("list-builder");
    if(cookie == undefined || cookie == null) {
        cookie = 0;
        $("#list-builder, #popup-box").hide();
    }

  
    if(((new Date()).getTime() - cookie) / (1000 * 60 * 60 * 24) > cookie_expire) {
        $("#list-builder").delay(delay).fadeIn("fast", () => {
            $("#popup-box").fadeIn("fast", () => {});
        });

        $("button[name=subscribe]").click(() => {
            $.ajax({
                type: "POST",
                url: $("#popup-form").attr("action"),
                data: $("#popup-form").serialize(),
                success: (data) => {
                    error = " Form Submited ";
                    //document.getElementById( "error_para" ).innerHTML = error;
                    $(success_message).show();
                  
                }
            });
        });

        $("#popup-close").click(() => {
            $("#list-builder, #popup-box").hide();
            localStorage.setItem("list-builder", (new Date()).getTime());            
        });
    }

});