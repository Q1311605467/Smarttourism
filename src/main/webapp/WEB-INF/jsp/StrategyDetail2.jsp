<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1 , user-scalable=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>推文查看</title>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/avatar/static/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/avatar/plugins/Cropper/cropper.min.css">
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/userList.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/strategyList.js"></script>

</head>
<style>
    .pass {
        margin-left: 15px;
        margin-right: 15px;
    }
    .btn1:hover{
        background-color: greenyellow;
    }
    .btn2:hover{
        background-color: red;
    }
</style>

<body style="">
<input type="hidden" class="path" id="path" value="${pageContext.request.contextPath}">
<nav class="navbar navbar-default">
    <div class="container">
        <!--小屏幕导航按钮和logo-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="adminhome.jsp" class="navbar-brand"> Admin</a>
        </div>
        <!--小屏幕导航按钮和logo-->
        <!--导航-->

        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li ><a href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;后台首页</a></li>
                <li ><a href="../userList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a></li>
                <li><a href="../guideList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;导游管理</a></li>
                <li><a href="../restList.html"><span class="glyphicon  glyphicon-glass"></span>&nbsp;&nbsp;餐厅管理</a></li>
                <li><a href="../sceneryList.html"><span class="glyphicon glyphicon-camera"></span>&nbsp;&nbsp;景区管理</a></li>
                <li><a href="../htAreaList.html"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;地区管理</a></li>
                <li><a href="../hotelList.html"><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;酒店管理</a></li>
                <li class="active"><a href="../strategyReviewedList.html"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;旅游推文管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        admin
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dLabel">
                        <li><a href="../index.html"><span class="glyphicon glyphicon-screenshot"></span>&nbsp;&nbsp;前台首页</a></li>
                        <%--                        <li><a href="Admin_person.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;个人主页</a></li>--%>
                        <%--                        <li><a href="Person_admin.jsp"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;个人设置</a></li>--%>
                    </ul>
                </li>
                <li><a href="logout.html"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a></li>
            </ul>
        </div>
        <!--导航-->
    </div>
</nav>
<input type="hidden" id="user_ID" value="${userSession.user_id }">

<div style="margin-left: 10%; margin-right: 10%; margin-top: 0%" id="myModal">
    <div class="modal-content">
        <div align="center" style="margin-top: 2%">
            <h3 class="modal-title" id="myModalLabel" style="color: #007bff">${Strategy.title}</h3>

            <p>提到了：<font color="#ff8c00">${Strategy.recommend}</font>&emsp;发布时间：${Strategy.post_time}&emsp;点击量：<font
                    color="red">${Strategy.clickNum}</font></p>

            <img width="50%" height="50%"
                 src="${pageContext.request.contextPath }/statics/images/${Strategy.strategy_cover}" alt="">
        </div>
        <div class="modal-body" style="margin-left: 20%; margin-right: 20%">
            <div class="form-group">
                <p id="content">&emsp;&emsp;${Strategy.content}</p>
                <%--                <textarea name="content" cols="100" rows="8" id="content"--%>
                <%--                          style="width: 100%; height: 100%;"></textarea>--%>
            </div>

            <div align="center">
                <a  class="pass" id="passStrategy" onclick="passStrategy(${Strategy.strategy_id})">
                    <button type="button" class="btn1 btn btn-default">
                        审核通过
                    </button>
                </a>
                <a class="pass" id="unPassStrategy" onclick="unPassStrategy(${Strategy.strategy_id})">
                    <button type="button" class="btn2 btn btn-default">
                        审核不通过
                    </button>
                </a>
            </div>

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
        src="${pageContext.request.contextPath }/statics/js/StrategyDetail.js"></script>

<script type="text/javascript">
    var user_id = "${userSession.user_id }";

    if (!user_id) {
        $("#fanhui").attr("href", "${pageContext.request.contextPath }/index.html");
        document.getElementById("user").style.display = "none";
    } else {
        document.getElementById("denglu").style.display = "none";
        document.getElementById("zhuce").style.display = "none";
    }
</script>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <center>
                    <p >
                        Copyright&nbsp;©&nbspFuJian University of Technology&nbsp;&nbsp;www.fjut.edu.cn&nbsp;&nbsp;闽ICP备10022194号-1
                    </p>
                </center>

            </div>
        </div>
    </div>
</footer>
</body>
</html>