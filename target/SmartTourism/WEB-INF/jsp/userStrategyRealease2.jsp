<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>userStrategy</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
            rel="stylesheet">
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
<input type="hidden" id="user_ID" value="${userSession.user_id }">
<input type="hidden" id="path" value="${pageContext.request.contextPath }">


<div class="book-main">

    <!-- 左边导航-->
    <div class="left-module" style="
    background: #fff;
    border-radius: 12px;
    padding: 30px 30px 30px 30px;
    overflow: inherit;
    margin-top: 10px;
    width: 27%;
">
        <div class="hotel-HR-left">
            <h3 style="color: #ff9d00">我的攻略</h3>
            <ul class="nav nav-pills nav-stacked" style="width: 100%; float: left">
                <li role="presentation">
                    <a href="${pageContext.request.contextPath }/sys/user/writeStrategy.html">书写攻略</a>
                </li>
                <li role="presentation" class="active">
                    <a href="${pageContext.request.contextPath }/sys/user/userStrategy/${userSession.user_id }">已审核</a>
                </li>
                <li role="presentation">
                    <a href="${pageContext.request.contextPath }/sys/user/userStrategyRealease0/${userSession.user_id }">未审核</a>
                </li>
                <li role="presentation">
                    <a href="${pageContext.request.contextPath }/sys/user/userStrategyRealease2/${userSession.user_id }">审核未通过</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="right-module" style="background: #fff;border-radius: 12px;padding: 3px 30px 30px 30px;overflow: inherit;margin-top: 1%;width: 70%">
        <div class="AR-My-List" style="padding: 20px 10px 3px 3px;">
            <div class="HR-My-List-item1">
                <c:if test="${empty Strategys}">
                    <font color="red"><p>还未成功发布攻略哦~</p></font>
                </c:if>
                <c:forEach items="${Strategys}" var="Strategy">
                    <div class="media">
                        <div class="media-left media-middle">
                            <a href="${pageContext.request.contextPath }/StrategyDetail/${Strategy.strategy_id}">
                                <img class="media-object" height="150px" width="250px"
                                     src="${pageContext.request.contextPath }/statics/images/${Strategy.strategy_cover}"
                                     alt="...">
                            </a>
                        </div>
                        <div class="media-body">
                            <div style="margin-right: 25%">
                                <a href="${pageContext.request.contextPath }/StrategyDetail/${Strategy.strategy_id}"
                                   style="text-decoration: none">
                                    <br>
                                    <h4 class="media-heading" style="float: left;size: 100px" >${Strategy.title}</h4>
                                </a>

                            </div>
                            <br>

                            <br>
                            <div>
                                <p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                    &emsp;&emsp;${Strategy.content}</p>
                            </div>
                            <div style="">
                                    ${Strategy.post_time}&emsp;&emsp;&emsp;&emsp;&emsp;${Strategy.recommend}</div>
                                <%--            下拉菜单   编辑、删除--%>
                            <div class="btn-group" style="margin-left: 400px">
                                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false">
                                    操作 <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="${pageContext.request.contextPath }/sys/user/updateStrategy?strategy_id=${Strategy.strategy_id}">编辑</a>
                                    </li>
                                    <li role="separator" class="divider"></li>
                                    <li><a onclick="shanchu()"
                                           href="${pageContext.request.contextPath }/sys/user/deleteStrategy.json?strategy_id=${Strategy.strategy_id}">删除</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<div style="height: 20px"></div>


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

<script type="text/javascript"
        src="${pageContext.request.contextPath }/statics/js/userStrategy.js"></script>

<script type="text/javascript">
    function shanchu() {
        var obj = $(this);
        $.ajax({
            method: "GET",
            url: obj.attr("href"),
            success: function (data) {
                // console.log(data);
                if (data.status == "success") {
                    alert("删除成功！")
                }
                window.location.href = $("#path").val() + "/sys/user/userStrategy/" + $("#user_ID").val();
            }
        });
    }
</script>
</body>
</html>