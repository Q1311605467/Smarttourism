<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>SmartTourism</title>
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
<!-- 首页大图 -->
<div class="banner">
    <div class="slider">
        <h2 class="wow shake animated" data-wow-delay=".5s">WELCOME</h2>
        <div class="border"></div>
        <script src="${pageContext.request.contextPath }/statics/js/responsiveslides.min.js"></script>
        <script>
            // You can also use "$(window).load(function() {"
            $(function () {
                // Slideshow 4
                $("#slider3").responsiveSlides({
                    auto: true,
                    pager: true,
                    nav: true,
                    speed: 500,
                    namespace: "callbacks",
                    before: function () {
                        $('.events').append("<li>before event fired.</li>");
                    },
                    after: function () {
                        $('.events').append("<li>after event fired.</li>");
                    }
                });
            });
        </script>
        <div  id="top" class="callbacks_container-wrap">
            <ul class="rslides" id="slider3">
                <li>
                    <div class="slider-info">
                        <h3 class="wow fadeInRight animated" data-wow-delay=".5s">Personalized travel recommendation</h3>
                        <p class="wow fadeInLeft animated" data-wow-delay=".5s">为您提供个性化旅游推荐</p>
                        <div class="more-button wow fadeInRight animated" data-wow-delay=".5s">
                            <a href="single.html">Click Here	</a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slider-info">
                        <h3>Considerate scenic Service</h3>
                        <p>为您提供贴心景区服务 | 全国景区查询 | 景点门票预定</p>
                        <div class="more-button">
                            <a href="single.html">Click Here	</a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="slider-info">
                        <h3>Personalized hotel service	</h3>
                        <p> 为您提供酒店服务 | 酒店查询 | 酒店预定 | 酒店评价查询	</p>
                        <div class="more-button">
                            <a href="single.html">Click Here	</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!--大图下面的两个框框 -->
<div class="banner-bottom">
    <div class="container">
        <div class="banner-bottom-grids">
            <div class="col-md-6 banner-bottom-left wow fadeInLeft animated" data-wow-delay=".5s">
                <div class="left-border">
                    <div class="left-border-info">
                        <p>Personalized travel recommendation</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 banner-bottom-left banner-bottom-right wow fadeInRight animated" data-wow-delay=".5s">
                <div class="left-border">
                    <div class="left-border-info right-border-info">
                        <p>Top Travel recommendations</p>
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>


<!-- 热门旅游攻略 -->
<div class="information">
    <div class="container">
        <div class="information-heading">
            <h3 class="wow fadeInDown animated" data-wow-delay=".5s">Hot Travel Strategy</h3>
            <p class="wow fadeInUp animated" data-wow-delay=".5s">去哪里旅游,如何旅游,一段旅程,都会带给我们难忘的回忆,—场难忘的风景,精彩必知,短的是旅行,长的是人生</p>
        </div>

        <div class="information-grids">
            <c:forEach var="Strategy" items="${top5Strategy }" varStatus="status">
                <a href="${pageContext.request.contextPath }/StrategyDetail/${Strategy.strategy_id}">
                <div class="col-md-4 information-grid wow fadeInLeft animated" data-wow-delay=".5s"  >

                    <div class="information-info">
                        <div class="information-grid-img">
                            <img src="${pageContext.request.contextPath }/statics/images/${Strategy.strategy_cover}" alt="" />
                        </div>
                        <div class="information-grid-info">
                            <h4>${Strategy.title} </h4>
                            <p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">&emsp;
                                    ${Strategy.content}
                            </p>
                        </div>
                    </div>
                </div>
                </a>
            </c:forEach>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //热门旅游攻略 -->
<!-- 热门景点推荐 -->
<div class="popular">
    <div class="container">
        <div class="popular-heading information-heading">
            <h3 class="wow fadeInDown animated" data-wow-delay=".5s">Popular Places</h3>
            <p class="wow fadeInUp animated" data-wow-delay=".5s">对未知的恐惧，对舒适的留恋将阻止我们成为一个旅行者走上的冒险旅程。可是，当你作出这样的选择，你就永远不会后悔。</p>
        </div>
        <div class="popular-slide">
            <script>
                // You can also use "$(window).load(function() {"
                $(function () {
                    // Slideshow 4
                    $("#slider1").responsiveSlides({
                        auto: true,
                        pager: true,
                        nav: false,
                        speed: 500,
                        namespace: "callbacks",
                        before: function () {
                            $('.events').append("<li>before event fired.</li>");
                        },
                        after: function () {
                            $('.events').append("<li>after event fired.</li>");
                        }
                    });
                });
            </script>
            <div  id="top-1" class="callbacks_container-wrap">
                <ul class="rslides" id="slider1">

                    <c:forEach var="Scenery" items="${top3Scenery }" varStatus="status">
                        <li>
                            <a href="${pageContext.request.contextPath }/Scenery/${Scenery.scenery_id}" style="text-decoration: none">
                            <div class="popular-slide-info wow bounceIn animated" data-wow-delay=".5s" style="background-image: url(${pageContext.request.contextPath}/statics/images/${Scenery.scenery_cover})" >

                                <h4>${Scenery.scenery_name}</h4>
                                <p >${Scenery.scenery_intro}</p>
                            </div>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="popular-grids">
            <c:forEach var="Scenery" items="${top3Scenery }" varStatus="status">
                <div class="col-md-4 popular-grid wow fadeInLeft animated" data-wow-delay=".5s">
                    <h5>${Scenery.scenery_name}</h5>
                    <p>${Scenery.scenery_intro}</p>
                </div>

            </c:forEach>

            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //热门景点推荐 -->

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