$(function () {


})
function Logout(user_id) {
    var path = $("#path").val();
    $.ajax({
        type:"GET",//请求类型
        url:path+"/sys/LogoutUser",//请求的url
        data:{"user_id":user_id},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        traditional:true,
        success:function(data){//data：返回数据（json对象）
            if(data){
                alert("suceess!");
                window.location.href = path + "/sys/userList.html";
            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("修改失败");
        }
    });
}
function Activating(user_id) {
    var path = $("#path").val();
    $.ajax({
        type:"GET",//请求类型
        url:path+"/sys/Activating",//请求的url
        data:{"user_id":user_id},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        traditional:true,
        success:function(data){//data：返回数据（json对象）
            if(data){
                alert("suceess!");
                window.location.href = path + "/sys/userList.html";

            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("修改失败");
        }
    });
}

function page_nav(frm,num){
    frm.pageIndex.value = num;
    frm.submit();
}
function jump_to(frm,num){
    //验证用户的输入
    var regexp=/^[1-9]\d*$/;
    var totalPageCount = document.getElementById("totalPageCount").value;
   // alert("name"+totalPageCount);
    //alert(totalPageCount);
    if(!regexp.test(num)){
        alert("请输入大于0的正整数！");
        return false;
    }else if((num-totalPageCount) > 0){
        alert("请输入小于总页数的页码");
        return false;
    }else{
        page_nav(frm,num);
    }
}
