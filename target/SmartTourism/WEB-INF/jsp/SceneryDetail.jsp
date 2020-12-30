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
    <title>SceneryDetail</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
            rel="stylesheet">

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
                <li role="presentation"><a href="${pageContext.request.contextPath }/index.html"
                                           style="color: black;">首页</a></li>
                <li role="presentation" class="active"><a
                        href="${pageContext.request.contextPath }/query.html?sort=2&s="
                        style="color: white; background-color: #ff9d00;">景点</a></li>
                <li role="presentation"><a
                        href="${pageContext.request.contextPath }/Hotel.html?s="
                        style="color: black;">酒店</a></li>
                <li role="presentation"><a
                        href="${pageContext.request.contextPath }/Strategy.html?s="
                        style="color: black">攻略</a></li>

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

<div style="margin-left: 35%; margin-top: 5%">
    <form class="navbar-form"
          action="${pageContext.request.contextPath }/query.html">
        <input type="hidden" name="sort" value="2">

        <div class="form-group" style="width: 50%">
            <input name="s" id="s" type="text" class="form-control" style="width: 100%"
                   placeholder="搜景点">
        </div>
        <button type="submit" class="btn btn-default"
                style="color: white; background-color: #ff0003;">搜索
        </button>
    </form>
</div>


<div style="margin-left: 20%; margin-right: 15%">
    <h2 style="color: #ff9d00">${Scenery.scenery_name}</h2>
    <div style="margin-left: 15%">
        浏览量：<font color="orange">${Scenery.browse_num}</font><hr>
        <h4>景区介绍：</h4><font color="#1e90ff">${Scenery.scenery_intro}</font><hr>
        <h4>推荐游览路线：</h4><font color="#ff8c00">${Scenery.navigation_route}</font><hr>
        <h4>相关图片：</h4>
        <div class="row">
            <c:forEach items="${pictures}" var="picture">
                <div class="col-xs-6 col-md-4">
                    <a  class="thumbnail">
                        <img style="height: 150px" src="${pageContext.request.contextPath }/statics/images/${picture}" alt="...">
                    </a>
                </div>
            </c:forEach>
        </div>

        <h4>景区评价：</h4>${Scenery.comment}
        <h4>详细地址：</h4>${Scenery.scenery_address}

    </div>

    <div class="row">
        <hr>
        <h4>景区导游</h4>
        <c:if test="${empty Guides}">
            <p>暂无相关导游信息！</p>
        </c:if>
        <c:forEach items="${Guides}" var="Guide">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <img style="height: 150px" src="${pageContext.request.contextPath }/statics/images/${Guide.guide_head}"
                         alt="...">
                    <div class="caption">
                        <h4>${Guide.guide_name}</h4>
                        介绍：<p>${Guide.guide_intro}</p>
                        特点：<p>${Guide.guide_comment}</p>
                        导游服务：<p>${Guide.guide_service}</p>
                        联系电话：<p>${Guide.tel}</p>
                    </div>
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