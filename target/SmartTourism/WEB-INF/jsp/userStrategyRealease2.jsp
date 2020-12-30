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
                <li role="presentation"><a
                        href="${pageContext.request.contextPath }/query.html?sort=2&s="
                        style="color: black">景点</a></li>
                <li role="presentation"><a
                        href="${pageContext.request.contextPath }/Hotel.html?s="
                        style="color: black;">酒店</a></li>

                <li role="presentation" class="active"><a
                        href="${pageContext.request.contextPath }/Strategy.html?s="
                        style="color: white; background-color: #ff9d00;">攻略</a></li>
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
            </ul>
        </div>
    </div>
</nav>

<input type="hidden" id="user_ID" value="${userSession.user_id }">
<input type="hidden" id="path" value="${pageContext.request.contextPath }">


<div style="margin-left: 20%;  margin-top: 5%; margin-right: 15%">
    <h3 style="color: #ff9d00">我的攻略</h3>
    <ul class="nav nav-pills nav-stacked" style="width: 12%; float: left">
        <li role="presentation">
            <a href="${pageContext.request.contextPath }/sys/user/userStrategy/${userSession.user_id }">已审核</a>
        </li>
        <li role="presentation">
            <a href="${pageContext.request.contextPath }/sys/user/userStrategyRealease0/${userSession.user_id }">未审核</a>
        </li>
        <li role="presentation" class="active">
            <a href="${pageContext.request.contextPath }/sys/user/userStrategyRealease2/${userSession.user_id }">审核未通过</a>
        </li>
    </ul>

    <div style="margin-left: 15%">
        <c:if test="${empty Strategys}">
            <font color="red"><p>暂无未审核不通过的攻略哦~</p></font>
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
                            <h4 class="media-heading" style="float: left">${Strategy.title}</h4>
                        </a>
                            <%--            下拉菜单   编辑、删除--%>
                        <div class="btn-group" style="margin-left: 150px">
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
                    <br>
                    <div>
                        <p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                            &emsp;&emsp;${Strategy.content}</p>
                    </div>
                    <div style="">
                            ${Strategy.post_time}&emsp;&emsp;&emsp;&emsp;&emsp;${Strategy.recommend}</div>
                </div>
            </div>
            <hr>
        </c:forEach>
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