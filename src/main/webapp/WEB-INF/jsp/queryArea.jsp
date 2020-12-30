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


</head>


<body style="">
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header" style="margin-left: 10%">
            <a class="navbar-brand" style="font-family: 楷体; font-size: 40px;"
               href="${pageContext.request.contextPath }/index.html">智旅网</a>
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav"
                style="margin-left: 15%">
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath }/index.html"
                                                          style="color: white; background-color: #ff9d00;">首页</a></li>
                <li role="presentation"><a
                        href="${pageContext.request.contextPath }/query.html?sort=2&s="
                        style="color: black">景点</a></li>

                <li role="presentation"><a
                        href="${pageContext.request.contextPath }/Hotel.html?s="
                        style="color: black;">酒店</a></li>

                <li role="presentation"><a
                        href="${pageContext.request.contextPath }/Strategy.html?s="
                        style="color: black;">攻略</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right" style="margin-right: 10%">
                <li class="dropdown" id="user">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"><img style="height: 25px; width: 25px; border-radius: 50%;"
                                                  src="${pageContext.request.contextPath }/statics/images/${userSession.head}">
                        欢迎您，${userSession.user_account}<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath }/sys/user/modify.html">修改个人信息</a></li>
                        <li><a href="${pageContext.request.contextPath }/sys/user/writeStrategy.html">书写攻略</a></li>
                        <li><a href="${pageContext.request.contextPath }/sys/user/userStrategy/${userSession.user_id }">我的攻略</a>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath }/logout.html">退出登录</a></li>
                    </ul>
                </li>

                <li id="denglu"><a style="color: cornflowerblue"
                                   href="${pageContext.request.contextPath }/QDlogin.html">登录</a></li>
                <li id="zhuce"><a style="color: cornflowerblue"
                                  href="${pageContext.request.contextPath }/reg.html">注册</a></li>
            </ul>
        </div>
    </div>
</nav>

<input type="hidden" id="user_ID" value="${userSession.user_id }">
<input type="hidden" id="path" value="${pageContext.request.contextPath }">

<div class="col-xs-12 col-sm-12 col-md-12">
    <div style="margin-left: 35%; margin-top: 80px">
        <form class="navbar-form"
              action="${pageContext.request.contextPath }/query.html">
            <div class="form-group" style="width: 50%">
                <input type="hidden" name="sort" value="1">
                <input name="s" id="s" type="text" class="form-control" style="width: 100%" value="${s}"
                       placeholder="搜地区/景点/攻略">
            </div>
            <button type="submit" class="btn btn-default"
                    style="color: white; background-color: #ff0003;">搜索
            </button>

        </form>
    </div>

    <h2 style="margin-left:20%">${s}</h2>
    <div>
        <div style="margin-left: 20%; width: 40%; float: left">
            <%--        <c:if test="${empty Area}">--%>
            地区介绍：${Area.area_intro}
            <br><br>
            推荐路线：<font color="orange">${Area.tourist_route}</font>
            <%--        </c:if>--%>
        </div>

        <div id="weather" style="margin-right: 15%; margin-bottom: 1%; font-size: 16px; float: right">
            <div style="width: 100%; height: 100%" id="weather-html">

            </div>
        </div>
    </div>
    <div id="allmap" style="width: 1000px;height: 550px;overflow: hidden;margin-left: 20%;font-family:微软雅黑"></div>


    <div style="margin-left: 25%;  margin-top: 45px; /*margin-right: 10%*/">
        <h3 style="color: #ff9d00">当地热门景点</h3>
        <c:if test="${empty Scenerys}">
            <p>抱歉！暂无内容！</p>
        </c:if>
        <div class="row">
            <c:forEach items="${Scenerys}" var="Scenery">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <a href="${pageContext.request.contextPath }/Scenery/${Scenery.scenery_id}"
                           style="text-decoration:none"><img
                                src="${pageContext.request.contextPath }/statics/images/${Scenery.scenery_cover}"
                                alt="...">
                            <div class="caption">
                                <h4>${Scenery.scenery_name}</h4>
                                <p>${Scenery.scenery_intro}</p>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>


    <div style="margin-left: 25%;  margin-top: 45px; margin-right: 25%">
        <h3 style="color: #ff9d00">推荐攻略</h3>
        <c:if test="${empty Strategys}">
            <p>抱歉！暂无内容！</p>
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
            <hr>
        </c:forEach>
    </div>


    <div style="margin-left: 25%;  margin-top: 45px; /*margin-right: 25%*/">
        <h3 style="color: #ff9d00">当地热门酒店</h3>
        <c:if test="${empty Hotels}">
            <p>抱歉！暂无内容！</p>
        </c:if>
        <div class="row">
            <c:forEach items="${Hotels}" var="Hotel">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <a href="${Hotel.hotel_href}"
                           style="text-decoration:none"><img
                                src="${pageContext.request.contextPath }/statics/images/${Hotel.hotel_cover}"
                                alt="...">
                            <div class="caption">
                                <h4>${Hotel.hotel_name}</h4>
                                <p>${Hotel.accommodation}</p>
                                <p>地址：${Hotel.hotel_address}</p>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div style="margin-left: 25%;  margin-top: 45px; /*margin-right: 25%*/">
        <h3 style="color: #ff9d00">当地热门餐厅</h3>
        <c:if test="${empty Rests}">
            <p>抱歉！暂无内容！</p>
        </c:if>
        <div class="row">
            <c:forEach items="${Rests}" var="Rest">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <a href="${Rest.rest_href}"
                           style="text-decoration:none"><img
                                src="${pageContext.request.contextPath }/statics/images/${Rest.rest_cover}"
                                alt="...">
                            <div class="caption">
                                <h4>${Rest.rest_name}</h4>
                                <p>${Rest.rest_intro}</p>
                                <p>地址：${Rest.rest_address}</p>
                            </div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<div style="height: 20px"></div>


<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
        src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>


<script>
    var user_account = "${userSession.user_account}";
    var user_password = "${userSession.user_password}";
    var path = "${pageContext.request.contextPath}";
    if (!user_account) {
        document.getElementById("user").style.display = "none";
    } else {
        document.getElementById("denglu").style.display = "none";
        document.getElementById("zhuce").style.display = "none";
    }
</script>

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