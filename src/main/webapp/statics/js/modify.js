var user_ID = $("#user_ID");
if (!user_ID) {
    document.getElementById("user").style.display = "none";
    document.getElementById("logout").style.display = "none";
} else {
    document.getElementById("denglu").style.display = "none";
    document.getElementById("zhuce").style.display = "none";
}

$(function () {
    $("#user_account").on("blur", function () {
        var user_account = $("#user_account").val();
        var user_password = $("#user_password").val();
        var user_password2 = $("#user_password2").val();

        if (user_account.replace(/(^\s*)|(\s*$)/g, "") == "" || user_password.replace(/(^\s*)|(\s*$)/g, "") == "" || user_password2.replace(/(^\s*)|(\s*$)/g, "") == "") {
            $("#is_able").attr("disabled", true);
        } else
            $("#is_able").attr("disabled", false);
    });

    $("#user_password").on("blur", function () {
        var user_account = $("#user_account").val();
        var user_password = $("#user_password").val();
        var user_password2 = $("#user_password2").val();

        if (user_account.replace(/(^\s*)|(\s*$)/g, "") == "" || user_password.replace(/(^\s*)|(\s*$)/g, "") == "" || user_password2.replace(/(^\s*)|(\s*$)/g, "") == "") {
            $("#is_able").attr("disabled", true);
        } else
            $("#is_able").attr("disabled", false);
    });

    $("#user_password2").on("blur", function () {
        var user_account = $("#user_account").val();
        var user_password = $("#user_password").val();
        var user_password2 = $("#user_password2").val();

        if (user_account.replace(/(^\s*)|(\s*$)/g, "") == "" || user_password.replace(/(^\s*)|(\s*$)/g, "") == "" || user_password2.replace(/(^\s*)|(\s*$)/g, "") == "") {
            $("#is_able").attr("disabled", true);
        } else
            $("#is_able").attr("disabled", false);
    });
})

$("#modify").on(
    "click",
    function () {
        var obj = $(this);
        var path = $("path");
        window.location.href = path + "/sys/user/modify/"
            + $("#userID").val() + "/" + $("#email").val() + "/"
            + $("#password1").val() + "/" + $("#password2").val();
    });

$("#attention").on(
    "click",
    function () {
        var obj = $(this);
        window.location.href = "/ecommerce/sys/user/attention/"
            + $("#userID").val();
    });

$("#gWC").attr(
    'href',
    "/ecommerce/sys/user/shoppingCart/"
    + $("#userID").val());
$("#order").attr(
    'href',
    "/ecommerce/sys/user/order/"
    + $("#userID").val());
