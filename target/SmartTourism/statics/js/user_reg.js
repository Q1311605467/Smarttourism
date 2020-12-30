$(function () {
    $("#user_password2").on("blur", function () {
        var path = $("#path").val();
        var user_account = $("#user_account").val();
        var user_password1 = $("#user_password1").val();
        var user_password2 = $("#user_password2").val();


        if (user_account.replace(/(^\s*)|(\s*$)/g, "") == "" || user_password1.replace(/(^\s*)|(\s*$)/g, "") == "" || user_password2.replace(/(^\s*)|(\s*$)/g, "") == "") {
            $("#is_able").attr("disabled", true);
        } else
            $("#is_able").attr("disabled", false);
    });
    $("#add").on("click", function () {
        window.location.href = $("#path").val() + "/reg/" + $("#user_account").val() + "/" + $("#user_password1").val() + "/" + $("#user_password2").val() + "/" + $('input:radio:checked').val();
    })
});


$(function () {
    var user_account = $("#user_account");
    var p1 = $("#p1");
    var p2 = $("#p2");
    var path = $("#path").val();

    user_account.bind("blur", function () {
        //ajax后台验证--email是否已存在
        $.ajax({
            type: "GET",//请求类型
            url: path + "/user_account_exist.json",//请求的url
            data: {user_account: user_account.val()},//请求参数
            dataType: "json",//ajax接口（请求url）返回的数据类型
            success: function (data) {//data：返回数据（json对象）
                if (data.user_account == "exist") {//账号已存在，错误提示
                    p1.html("<p style='color: red'>*该用户账号已存在</p>");

                } else {//账号可用，正确提示
                    p1.html("<p style='color: green'>*该账号可以使用</p>");
                }
            },
            error: function () {//当访问时候，404，500 等非200的错误状态码
                p1.html("<p style='color: red'>您访问的页面不存在</p>");
            }
        });
    })
});