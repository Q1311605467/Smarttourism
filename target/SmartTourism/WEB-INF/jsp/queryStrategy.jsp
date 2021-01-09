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
    <title>Strategy</title>
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
    <!--//end-animate-->
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
                            <li><a href="${pageContext.request.contextPath }/index.html" >首页</a></li>
                            <li><a href="#" class="dropdown-toggle hvr-bounce-to-bottom" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">景区<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a class="hvr-bounce-to-bottom" href="${pageContext.request.contextPath }/query.html?sort=2&s=">景区介绍</a></li>
                                    <li><a class="hvr-bounce-to-bottom" href="${pageContext.request.contextPath }/reserves.html?sort=2&s=">门票预订</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/Hotel.html?s=">酒店</a></li>
                            <li><a href="${pageContext.request.contextPath }/Strategy.html?s=" class="active">推文</a></li>
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

<div style="margin-left: 35%; margin-top: 5%">
    <form class="navbar-form"
          action="${pageContext.request.contextPath }/Strategy.html">

        <div class="form-group" style="width: 50%">
            <input name="s" id="s" type="text" class="form-control" style="width: 100%"
                   placeholder="搜攻略">
        </div>
        <button type="submit" class="btn btn-default"
                style="color: white; background-color: #337ab7d1;">搜索
        </button>
    </form>
</div>

<div class="information" style="padding: 2em 0 4em 0">
    <div class="container">
        <c:if test="${empty Strategys}">
            <p>抱歉！暂无数据！</p>
        </c:if>
<%--<div style="margin-left: 20%;  /*margin-top: 5%;*/ margin-right: 15%">--%>
        <div class="popular-heading information-heading" style="margin-bottom: 35px">
            <h3 class="wow fadeInDown animated" data-wow-delay=".5s" style="color:#777;">热门攻略</h3>
        </div>
        <c:forEach items="${Strategys}" var="Strategy">
            <div class="information-grid wow fadeInLeft animated" data-wow-delay=".5s">
                <div class="information-info">
                    <div class="media">
                        <div class="media-left media-middle">
                            <a href="${pageContext.request.contextPath }/StrategyDetail/${Strategy.strategy_id}">
                                <img class="media-object" height="150px" width="250px"
                                     src="${pageContext.request.contextPath }/statics/images/${Strategy.strategy_cover}"
                                     alt="...">
                            </a>
                        </div>
                        <div class="media-body">
                            <a href="${pageContext.request.contextPath }/StrategyDetail/${Strategy.strategy_id}"
                               style="text-decoration: none">
                                <br>
                                <h4 class="media-heading">${Strategy.title}</h4>
                            </a>
                            <br>
                            <p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                &emsp;&emsp;${Strategy.content}</p>
                            <div style="/*margin-top: 5%*/">
                                    ${Strategy.post_time}&emsp;&emsp;&emsp;&emsp;&emsp;${Strategy.recommend}</div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
        </c:forEach>
    </div>

</div>

<div style="height: 20px"></div>

<script type="text/javascript"
        src="${pageContext.request.contextPath }/statics/js/userStrategy.js"></script>

<script type="text/javascript">
    var user_id = "${userSession.user_id }";
    if (!user_id) {
        document.getElementById("user").style.display = "none";
    } else {
        document.getElementById("denglu").style.display = "none";
        document.getElementById("zhuce").style.display = "none";
    }
</script>

</body>
</html>