function passStrategy(strategy_id) {
    var path = $("#path").val();
    $.ajax({
        type:"GET",//请求类型
        url:path+"/sys/passStrategy",//请求的url
        data:{"strategy_id":strategy_id},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        traditional:true,
        success:function(data){//data：返回数据（json对象）
            if(data){
                alert("suceess!");
                window.location.href = path + "/sys/strategyReviewedList.html";

            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("修改失败");
        }
    });
}
function unPassStrategy(strategy_id) {
    var path = $("#path").val();
    $.ajax({
        type:"GET",//请求类型
        url:path+"/sys/unPassStrategy",//请求的url
        data:{"strategy_id":strategy_id},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        traditional:true,
        success:function(data){//data：返回数据（json对象）
            if(data){
                alert("suceess!");
                window.location.href = path + "/sys/strategyUnPassedList.html";

            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("修改失败");
        }
    });
}