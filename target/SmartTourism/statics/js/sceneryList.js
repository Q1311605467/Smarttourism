function sceneryDetail(scenery_id) {
    var path = $("#path").val();
    window.location.href=path+"/sys/sceneryDetail/"+scenery_id;
    // $.ajax({
    //     type:"GET",//请求类型
    //     url:path+"/sys/guideDetail",//请求的url
    //     data:{"guide_id":guide_id},//请求参数
    //     dataType:"json",//ajax接口（请求url）返回的数据类型
    //     traditional:true,
    //     success:function(data){//data：返回数据（json对象）
    //      console.log(data);
    //     },
    //     error:function(data){//当访问时候，404，500 等非200的错误状态码
    //         alert("修改失败");
    //     }
    // });
}

function sceneryDel(scenery_id) {
    var path = $("#path").val();
    $.ajax({
        type:"GET",//请求类型
        url:path+"/sys/sceneryDel",//请求的url
        data:{"scenery_id":scenery_id},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        traditional:true,
        success:function(data){//data：返回数据（json对象）
            console.log(data);
            if(data){
                alert("删除成功");
                window.location.href = path+"/sys/sceneryList";
            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("删除失败");
        }
    });

}


// $(function () {
//     $('#editGuide').on('click', function(){
//         $('#myModal2').modal('show');
//     });
//     $('#qrcode').on('show.bs.modal', function (event) {
//         var modal = $(this);  //get modal itself
//         modal.find('.modal-body #message').text('your message');
//         modal.find('.modal-body #scan').attr("src", 'image src');
//     });
// });