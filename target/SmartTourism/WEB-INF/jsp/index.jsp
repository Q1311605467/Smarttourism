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
    <style type="text/css">
        ol li {
            display: inline-block;
            width: 20px;
            height: 20px;
            line-height: 20px;
            background-color: #fff;
            margin: 5px;
            cursor: pointer;
        }

        ol .current {
            background-color: red;
        }
    </style>
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
                <%--                <li id="user"><a>欢迎您，${userSession.user_account}</a></li>--%>
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
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="height: 600px; width: 100%">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <a href="${pageContext.request.contextPath }/Scenery/${top3Scenery[0].scenery_id}">
                    <img style="height: 600px; width: 100%"
                         src="${pageContext.request.contextPath }/statics/images/${top3Scenery[0].scenery_cover}"
                         alt="...">
                </a>
                <div class="carousel-caption">
                    <font color="orange"><h2>${top3Scenery[0].scenery_name}</h2></font>
                </div>
            </div>

            <div class="item">
                <a href="${pageContext.request.contextPath }/Scenery/${top3Scenery[1].scenery_id}">
                    <img style="height: 600px; width: 100%"
                         src="${pageContext.request.contextPath }/statics/images/${top3Scenery[1].scenery_cover}"
                         alt="...">
                </a>
                <div class="carousel-caption">
                    <font color="orange"><h2>${top3Scenery[1].scenery_name}</h2></font>
                </div>
            </div>

            <div class="item">
                <a href="${pageContext.request.contextPath }/Scenery/${top3Scenery[2].scenery_id}">
                    <img style="height: 600px; width: 100%"
                         src="${pageContext.request.contextPath }/statics/images/${top3Scenery[2].scenery_cover}"
                         alt="...">
                </a>
                <div class="carousel-caption">
                    <font color="orange"><h2>${top3Scenery[2].scenery_name}</h2></font>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div style="margin-left: 35%; margin-top: 20px">
        <form class="navbar-form"
              action="${pageContext.request.contextPath }/query.html">
            <div class="form-group" style="width: 50%; margin-bottom: 1%">
                <input name="sort" type="radio" checked="checked" value="1">地区
                <input name="sort" type="radio" style="margin-left: 10%" value="2">景点
                <input name="sort" type="radio" style="margin-left: 10%" value="3">攻略
            </div>

            <div class="form-group" style="width: 50%">
                <input name="s" id="s" type="text" class="form-control" style="width: 100%"
                       placeholder="搜地区/景点/攻略">
            </div>
            <button type="submit" class="btn btn-default"
                    style="color: white; background-color: #ff0003;">搜索
            </button>
        </form>
    </div>


    <div style="width: 20%; margin-left: 15%; margin-top: 40px; float: left" align="center">
        <div style="height: 50px; background-color: #ff0003">
            <p style="color: #ffdd01; font-size: 30px">热门景点</p>
        </div>

        <div>
            <c:forEach var="Scenery" items="${top3Scenery }" varStatus="status">
                <div class="row">
                    <div class="col-sm-6 col-md-12">
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
                </div>
            </c:forEach>
        </div>

    </div>


    <div style="margin-left: 40%;  margin-top: 45px; margin-right: 15%">
        <h3 style="color: #ff9d00">热门攻略</h3>
        <c:forEach var="Strategy" items="${top5Strategy }" varStatus="status">
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
                    <div style="">
                            ${Strategy.post_time}&emsp;&emsp;&emsp;&emsp;&emsp;${Strategy.recommend}</div>
                </div>
            </div>
        </c:forEach>

    </div>

    <div style="height: 20px"></div>

</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
        src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>


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