<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="pojo.Hotel_reservation" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Hotel_Reservation</title>
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

    <script type="text/javascript">
        function confirmDel(reserv_id)
        {
            if(window.confirm("确定要取消预约吗？Really？")){
                document.location="${pageContext.request.contextPath}/sys/user/usercancelHR.html?user_id=${userSession.user_id}&reserv_id="+reserv_id
            }
        }
    </script>
</head>

<body style="">
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
<input type="hidden" id="user_ID" value="${userSession.user_id }">
<input type="hidden" id="path" value="${pageContext.request.contextPath }">


<!-- 主体 -->
<div class="book-main">

    <div class="right-module">
        <c:if test="${empty HRMyList}">
            <font color="red"><p>暂无订单哦~</p></font>
        </c:if>
        <c:forEach items="${HRMyList}" var="HRList">
            <div class="HR-My-List">
                <div class="HR-My-List-item1">
<%--                    <div class="frame-img-1">--%>
<%--                        <img alt='' src='${pageContext.request.contextPath }/statics/images/hotel1.jpg' class="img-rounded" height='140' width='200' />--%>
<%--                    </div>--%>
                    <div>
                        <h3>${HRList.hotel_name}</h3>
                        <p class="detail" >
                        <span style="margin-right: 20px">
                                ${HRList.room_type}
                        </span>
                            <span style="margin-right: 20px">
                                    ${HRList.reserv_num}
                        </span>
                        </p>
                        <p class="detail" >
                            <c:set var="ccid" value="${HRList}" scope="session" /><!-- 把该条评论上传到session中 -->
                            <%
                                Hotel_reservation uom=(Hotel_reservation)request.getSession().getAttribute("ccid");
                                SimpleDateFormat sdfas = new SimpleDateFormat("yyyy-MM-dd");//设定时间的范围到 分钟
                                String intime = sdfas.format(uom.getIn_time());//将获取到的时间转变为设定好的类型
                                String outtime = sdfas.format(uom.getOut_time());
                            %>
                            <span style="margin-right: 20px">入住时间：<%=intime%></span>
                            <span style="margin-right: 20px">退房时间：<%=outtime%></span>
                        </p>
                        <p class="detail">合计：${HRList.total_cost}</p>
                        <c:if test="${HRList.is_cancel==0}">
                            <button class="btn btn-default" type="submit" style="margin-left: 70%;"
                                    onclick="confirmDel(${HRList.reserv_id})">取消预约</button>
                        </c:if>
                        <c:if test="${HRList.is_cancel==1}">
                            <p class="detail" style="color: #ac2925">已取消</p>
                        </c:if>
                    </div>


                </div>
            </div>
        </c:forEach>
        </div>

    <div class="left-module">
        <div class="hotel-HR-left">
            <div class="HR-img" style="height: 300px">
                <img src="${pageContext.request.contextPath }/statics/images/${userSession.head}" style="width: 250px;height: 250px;border-radius: 50%; ">
            </div>
            <ul class="list-group">
                <li class="list-group-item-user1" ><a href="${pageContext.request.contextPath }/sys/user/SRMylist/${userSession.user_id }">门票预订</a> </li>
                <li class="list-group-item-user1" style="padding-bottom: 20px;background-color: #6f88cc"><a href="${pageContext.request.contextPath }/sys/user/HRMylist/${userSession.user_id }">酒店预订</a></li>
            </ul>

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
