<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
    <title>预定酒店</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">

    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/bootstrap.css" type="text/css" media="all" />
    <!--// bootstrap-css -->
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/style.css" type="text/css" media="all" />
    <!--// css -->
    <!-- font-awesome icons -->
    <link href="${pageContext.request.contextPath }/statics/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- font -->
    <link href='#css?family=Francois+One' rel='stylesheet' type='text/css'>
    <!-- //font -->
    <script src="${pageContext.request.contextPath }/statics/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/move-top.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!--animate-->
    <link href="${pageContext.request.contextPath }/statics/css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="${pageContext.request.contextPath }/statics/js/wow.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <script language=javascript>
        function addnum(){
            var obj=document.all("reserv_num");
            var cost=document.all("total_cost");
            var days=document.getElementById("day").value;
            if(obj.value=="" || isNaN(obj.value))return false;
            obj.value ++;
            cost.value=136* obj.value*days;

        }
        function minus(){
            var obj=document.all("reserv_num");
            var cost=document.all("total_cost");
            var days=document.getElementById("day").value;
            if(obj.value=="" || isNaN(obj.value))return false;
            obj.value -= 1;
            if(obj.value<0){obj.value=0;}
            cost.value=cost.value-136*days;
            if(cost.value<0){cost.value=0;}
        }
    </script>
    <script language=javascript>
        function datedifference() {
            var dateSpan;
            var intime=document.getElementById("in_time").value;
            var outtime=document.getElementById("out_time").value;
            intime = Date.parse(intime);
            outtime = Date.parse(outtime);
            dateSpan = outtime - intime;
            dateSpan = Math.abs(dateSpan);
            var sum= Math.floor(dateSpan / (24 * 3600 * 1000));
            document.getElementById('day').value = sum;

        };
    </script>

    <!--//end-animate-->
</head>
<body>
<!-- 导航栏 -->
<div class="header">
    <div class="top-header">
        <div class="container">
            <div class="top-header-info">
                <div class="top-header-left wow fadeInLeft animated" data-wow-delay=".5s">
                    <p>Your thoughtful little travel helper</p>
                </div>
                <div class="top-header-right wow fadeInRight animated" data-wow-delay=".5s">
                    <div class="top-header-right-info">
                        <ul class="nav navbar-nav">
                            <li class="dropdown" id="user">
                                <a href="${pageContext.request.contextPath }/sys/user/userDetail.html" ><img style="height: 25px; width: 25px; border-radius: 50%;"
                                                                                                             src="${pageContext.request.contextPath }/statics/images/${userSession.head}">
                                    欢迎您，${userSession.user_account}</a>
                            </li>
                            <li id="denglu"><a href="${pageContext.request.contextPath }/QDlogin.html">登录</a></li>
                            <li id="zhuce"><a href="${pageContext.request.contextPath }/reg.html">注册</a></li>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <div class="bottom-header">
        <div class="container">
            <div class="logo wow fadeInDown animated" data-wow-delay=".5s">
                <h1><a href="${pageContext.request.contextPath }/index.html"><img src="${pageContext.request.contextPath }/statics/images/newimge/logo.jpg" alt="" /></a></h1>
            </div>
            <div class="top-nav wow fadeInRight animated" data-wow-delay=".5s">
                <nav class="navbar navbar-default">
                    <div class="container">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="${pageContext.request.contextPath }/index.html" class="active">首页</a></li>
                            <li><a href="#" class="dropdown-toggle hvr-bounce-to-bottom" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">景区<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a class="hvr-bounce-to-bottom" href="${pageContext.request.contextPath }/query.html?sort=2&s=">景区介绍</a></li>
                                    <li><a class="hvr-bounce-to-bottom" href="${pageContext.request.contextPath }/reserves.html?sort=2&s=">门票预订</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/Hotel.html?s=">酒店</a></li>
                            <li><a href="${pageContext.request.contextPath }/Strategy.html?s=">推文</a></li>
                            <li><a href="${pageContext.request.contextPath }/query.html?sort=1">地区</a></li>
                        </ul>
                        <div class="clearfix"> </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="path" value="${pageContext.request.contextPath }">
<!-- 酒店预订 -->
<div class="book-main">
    <c:if test="${empty room}">
        <font color="red"><p>暂无订单哦~</p></font>
    </c:if>

    <div class="right-module">
        <form action="${pageContext.request.contextPath}/sys/user/addHR.html" method="post"
              enctype="multipart/form-data">
            <input type="hidden" name="user_id" id="user_id" value="${userSession.user_id }">
            <input type="hidden" name="hotel_id" id="hotel_id" value="${hotelSession.hotel_id }">
            <input type="hidden" name="area_id" id="area_id" value="${hotelSession.area_id }">
            <input type="hidden" name="hotel_name" id="hotel_name" value="${hotelSession.hotel_name }">

            <div class="addHR">
                <p><span class="HR-title">入住信息</span></p>
                <label class="HR-text" style="margin-right: 630px;">房间类型</label>
                <div class="HR-type" style="padding-left: 15px">
                    <select name="room_type" >
                        <c:forEach items="${room}" var="room">
                            <option value="${room.room_type}">${room.room_type}</option>
                        </c:forEach>
                    </select>
                </div>

                <label class="HR-text">入住时间</label>
                <div class="hotel-time">
                    <input type="Date" name="in_time" id="in_time" placeholder="入住时间" >
                    <input type="Date" name="out_time" id="out_time" placeholder="退房时间">
                    <label > 共：</label><input name="day" id="day" size="2" value="0" onclick="datedifference()"> <label >晚</label>
                </div>
                <div class="roomnum">
                    <label class="HR-text">预定间数</label>
                    <div class="room-action" style="padding-left: 15px">
                        <input type=button value="-" onclick="minus();">
                        <input name="reserv_num" id="reserv_num" size=3 value=0>
                        <input type=button value="+" onclick="addnum();">
                    </div>
                </div>
                <label class="HR-text">价格：</label>
                <div class="room_cost" style="padding-left: 15px">

                    <input name="total_cost" id="total_cost" size="4" value="0"> <label > ¥</label>
                </div>

                <div class="room-tell">
                    <label class="HR-text">联系电话</label>
                    <div  style="padding-left: 15px">
                        <input name="tel" id="tel" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" placeholder="用于接收短信通知">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" style="margin-top: 10px;margin-left: 15px">预定
                </button>
            </div>
        </form>
    </div>
    <div class="left-module">
        <div class="hotel-HR-left">
            <div class="HR-img">
                <img src="${pageContext.request.contextPath }/statics/images/${hotelSession.hotel_cover }" style="width: 100%;height: 250px">
            </div>
            <div class="info-HR">
                <div class="HR-hotel-name">
                    <span class="HR-title">${hotelSession.hotel_name }</span>
                </div>
                <div class="HR-hotel-addr">
                    <p>${hotelSession.hotel_address }</p>
                </div>
            </div>

        </div>
    </div>

</div>

<script>
    var user_account = "${userSession.user_account}";
    var user_password = "${userSession.user_password}";
    // 		var path = "${pageContext.request.contextPath}";
    if (!user_account) {
        document.getElementById("user").style.display = "none";
        document.getElementById("logout").style.display = "none";
    } else {
        document.getElementById("denglu").style.display = "none";
        document.getElementById("zhuce").style.display = "none";
    }
</script>

</body>
</html>
