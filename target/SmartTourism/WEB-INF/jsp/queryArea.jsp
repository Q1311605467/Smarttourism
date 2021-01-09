<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SmartTourism</title>

    <!-- Bootstrap -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>

    <![endif]-->


    <%--    <style type="text/css">
            body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
        </style>--%>
    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=S1WTke5UywSOGbY53rsiuA7DQVkOfNMF"></script>
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
<div style="margin-left: 35%; margin-top: 80px;margin-bottom: 25px;">
    <form class="navbar-form"
          action="${pageContext.request.contextPath }/query.html">
                    <div class="form-group" style="width: 50%">
                        <input type="hidden" name="sort" value="1">
                        <input name="s" id="s" type="text" class="form-control" style="width: 100%" value="${s}"
                               placeholder="搜地区/景点/攻略">
                    </div>
                    <button type="submit" class="btn btn-default"
                            style="color: white; background-color: #337ab7d1;">搜索
                    </button>

    </form>
</div>
<div class="book-main">

    <!-- 显示天气-->
    <div class="left-module" style="
    background: #fff;
    border-radius: 12px;
    padding: 30px 30px 30px 30px;
    overflow: inherit;
    margin-top: 10px;
">
        <div class="hotel-HR-left">

            <div id="weather" style="margin-bottom: 1%; font-size: 16px; float: right">
                <div style="width: 100%; height: 100%" id="weather-html">

                </div>
            </div>
        </div>
    </div>
    <!-- 显示简介和推荐路线-->
    <div class="right-module" style="
    background: #fff;
    border-radius: 12px;
    padding: 3px 30px 30px 30px;
    overflow: inherit;
">
        <div class="AR-My-List">
            <div class="HR-My-List-item1">
                <h2 style="margin-left:40%">${s}</h2>
                <div style="width: 100%; float: left">
                    <%--        <c:if test="${empty Area}">--%>
                    地区介绍：${Area.area_intro}
                    <br><br>
                    推荐路线：<font color="orange">${Area.tourist_route}</font>
                    <%--        </c:if>--%>
                </div>
            </div>
        </div>
    </div>

</div>

    <!--地图-->
    <div id="allmap" style="width: 1000px;height: 550px;overflow: hidden;margin-left: 10%;font-family:微软雅黑;margin-top: 25px;"></div>

    <!--景点-->
    <div class="information" style="padding: 2em 0 0 0">
        <div class="container">
            <div class="popular-heading information-heading">
                <h3 class="wow fadeInDown animated" data-wow-delay=".5s" style="color:#777;">热门景点</h3>
            </div>
            <c:if test="${empty Scenerys}">
                <p>抱歉！暂无数据！</p>
            </c:if>
            <div class="information-grids" style="margin: 3em 0 0 0">
                <c:forEach var="Scenery" items="${Scenerys}" varStatus="status">
                    <a href="${pageContext.request.contextPath }/Scenery/${Scenery.scenery_id}">
                        <div class="col-md-4 information-grid wow fadeInLeft animated" data-wow-delay=".5s"  style="width: 380px;height: 380px;">
                            <div class="information-info">
                                <div class="information-grid-img">
                                    <img src="${pageContext.request.contextPath }/statics/images/${Scenery.scenery_cover}" alt="" />
                                </div>
                                <div class="information-grid-info">
                                    <h4 style="color: #777;font-size: 25px">${Scenery.scenery_name} </h4>
                                    <p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">&emsp;
                                            ${Scenery.scenery_intro}
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

    <!--攻略-->
    <div class="information" style="padding: 2em 0 0 0">
        <div class="container">
            <c:if test="${empty Strategys}">
                <p>抱歉！暂无数据！</p>
            </c:if>
            <%--<div style="margin-left: 20%;  /*margin-top: 5%;*/ margin-right: 15%">--%>
            <div class="popular-heading information-heading" style="margin-bottom: 35px">
                <h3 class="wow fadeInDown animated" data-wow-delay=".5s" style="color:#777;">推荐攻略</h3>
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

    <!--酒店-->
    <div class="information" style="padding: 2em 0 0 0">
        <div class="container">
            <c:if test="${empty Hotels}">
                <p>抱歉！暂无数据！</p>
            </c:if>
            <%--<div style="margin-left: 20%;  /*margin-top: 5%;*/ margin-right: 15%">--%>
            <div class="popular-heading information-heading" style="margin-bottom: 35px">
                <h3 class="wow fadeInDown animated" data-wow-delay=".5s" style="color:#777;">当地热门酒店</h3>
            </div>
            <c:forEach items="${Hotels}" var="Hotel">
                <div class="information-grid wow fadeInLeft animated" data-wow-delay=".5s">
                    <div class="information-info">
                        <div class="media">
                            <div class="media-left media-middle">
                                <a href="${pageContext.request.contextPath }/sys/user/userAddHR.html?hotel_id=${Hotel.hotel_id}">
                                    <img class="media-object" height="150px" width="250px"
                                         src="${pageContext.request.contextPath }/statics/images/${Hotel.hotel_cover}"
                                         alt="...">
                                </a>
                            </div>
                            <div class="media-body">
                                <a href="${pageContext.request.contextPath }/sys/user/userAddHR.html?hotel_id=${Hotel.hotel_id}"
                                   style="text-decoration: none">
                                        <%--                        <br>--%>
                                    <h4 class="media-heading">${Hotel.hotel_name}</h4>
                                </a>
                                <br>
                                &emsp;&emsp;${Hotel.accommodation}
                                <div style="margin-top: 5%">地址：
                                        ${Hotel.hotel_address}<%--&emsp;&emsp;&emsp;&emsp;&emsp;--%><br>联系电话：${Hotel.hotel_tel}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
            </c:forEach>

        </div>
    </div>

    <!--餐厅-->
    <div class="information" style="padding: 2em 0 0 0">
        <div class="container">
            <c:if test="${empty Rests}">
                <p>抱歉！暂无内容！</p>
            </c:if>
            <%--<div style="margin-left: 20%;  /*margin-top: 5%;*/ margin-right: 15%">--%>
            <div class="popular-heading information-heading" style="margin-bottom: 35px">
                <h3 class="wow fadeInDown animated" data-wow-delay=".5s" style="color:#777;">当地热门餐厅</h3>
            </div>
            <c:forEach items="${Rests}" var="Rest">
                <a href="${Rest.rest_href}" style="text-decoration:none">
                    <div class="col-md-4 information-grid wow fadeInLeft animated" data-wow-delay=".5s"  style="width: 380px;height: 550px;">
                        <div class="information-info" style="height: 550px;background: #fff">
                            <div class="information-grid-img">
                                <img src="${pageContext.request.contextPath }/statics/images/${Rest.rest_cover}" alt="...">
                            </div>
                            <div class="information-grid-info">
                                <h4>${Rest.rest_name}</h4>
                                <p>${Rest.rest_intro}</p>
                                <p>地址：${Rest.rest_address}</p>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>

<div style="height: 20px"></div>


<script type="text/javascript">
    // 天气API
    $().ready(
        function gw() {
            $.ajax({
                method: 'GET',
                data: {
                    city: $("#s").val()
                },
                url: 'http://wthrcdn.etouch.cn/weather_mini',
                success: function (data) {
                    // var weather = {};
                    if (data) {
                        weather = JSON.parse(data).data;
                        console.log(weather);
                        var lbt = "";
                        lbt += "更新时间：<font>" + weather.forecast[0].date + "</font><br>今日天气：<font>" + weather.forecast[0].type + " </font> || 温度：<font>" + weather.forecast[0].high
                            + "</font> / " + weather.forecast[0].low + "<br>明天天气：<font>" + weather.forecast[1].type + " </font> || 温度：<font>" + weather.forecast[1].high
                            + "</font > / " + weather.forecast[1].low + "<br>后天天气：<font >" + weather.forecast[2].type + " </font> || 温度：<font>" + weather.forecast[2].high + "</font > / " + weather.forecast[2].low;
                        $("#weather-html").empty();
                        $("#weather-html").append(lbt);
                    }
                }
            });

        }
    )
</script>

<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");    // 创建Map实例
    var s = $("#s").val();

    // 创建地址解析器实例
    var myGeo = new BMap.Geocoder();
    // 将地址解析结果显示在地图上,并调整地图视野
    myGeo.getPoint(s, function (s) {
        if (s) {
            map.centerAndZoom(s, 12);
            map.addOverlay(new BMap.Marker(s));
        } else {
            alert("您选择地址没有解析到结果!");
        }
    }, s);

    //添加地图类型控件
    map.addControl(new BMap.MapTypeControl({
        mapTypes: [
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]
    }));
    // map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
</script>

</body>
</html>