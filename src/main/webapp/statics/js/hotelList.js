
function hotelDetail(hotel_id) {

    var path = $("#path").val();
    window.location.href=path+"/sys/hotelDetail/"+hotel_id;
}
function hotelRoom(hotel_id) {
    var path = $("#path").val();
    window.location.href=path+"/sys/hotelRoom/"+hotel_id;
}

function roomDel(room_id,hotel_id) {
    var path = $("#path").val();
    $.ajax({
        type:"GET",//请求类型
        url:path+"/sys/roomDel",//请求的url
        data:{"room_id":room_id},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        traditional:true,
        success:function(data){//data：返回数据（json对象）
            console.log(data);
            if(data){
                alert("删除成功");
                window.location.href = path+"/sys/hotelRoom/"+hotel_id;
            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("删除失败");
        }
    });
}
function hotelDel(hotel_id) {

    var path = $("#path").val();
    $.ajax({
        type:"GET",//请求类型
        url:path+"/sys/hotelDel",//请求的url
        data:{"hotel_id":hotel_id},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        traditional:true,
        success:function(data){//data：返回数据（json对象）
            console.log(data);
            if(data){
                alert("删除成功");
                window.location.href = path+"/sys/hotelList";
            }
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("删除失败");
        }
    });
}

function roomUpdate(room_id) {
    var path = $("#path").val();
    window.location.href=path+"/sys/roomDetail/"+room_id;
}

function CheckInputIntFloat(oInput) {
    if('' != oInput.value.replace(/\d{1,}\.{0,1}\d{0,}/,'')) {
        oInput.value = oInput.value.match(/\d{1,}\.{0,1}\d{0,}/) == null ? '' :oInput.value.match(/\d{1,}\.{0,1}\d{0,}/);
    }
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