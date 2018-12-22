document.addEventListener("DOMContentLoaded", function (event) {
    var xhttp = new XMLHttpRequest();

    // add movies to your favorites list

    $('.addcart.btn.btn-primary').on('click', function () {
        var item_div = $(this).parents('.addo');
        var item_id = item_div.attr('id');
        var x = "../addtolist?movie=" + item_id;

        $.ajax({
            type: "POST",
            url: x,
            success: function (data) {
                var success = data.success_message;
                $(".successl" + item_id).text(success).show(0).delay(3000).hide(0);
                setTimeout(function() {
                  location.reload();
                }, 0);

            },
            error: function (req, status, err) {
                var error = req['responseJSON']['error_message'];
                $(".errorl" + item_id).text(error).show(0).delay(2000).hide(0);
            }
        });
    });

    // remove item from cart, all item units

    $('.removeitem.btn.btn-primary').on('click', function () {
        var item_div = $(this).parents('.removeitemparent');
        var item_id = item_div.attr('id');
        var x = "../deletefromlist?movie=" + item_id;
        $.ajax({
            type: "POST",
            url: x,
            success: function (data) {
                var success = data.success_message;
                $(".successx" + item_id).text(success).show(0).delay(1000).hide(0);
                setTimeout(function () {
                    location.reload();
                }, 0);
            },
            error: function (req, status, err) {
                var error = req['responseJSON']['error_message'];
                $(".errorx" + item_id).text(error).show(0).delay(2000).hide(0);
                setTimeout(function () {
                    location.reload();
                }, 2000);
            }
        });
    });

});