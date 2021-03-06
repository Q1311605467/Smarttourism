<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>用户管理</title>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/avatar/static/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/avatar/plugins/Cropper/cropper.min.css">

    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/userList.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/restList.js"></script>

</head>
<body>
<!--导航-->
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
                <li ><a href="statistic.html"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;后台首页</a></li>
                <li ><a href="userList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a></li>
                <li><a href="guideList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;导游管理</a></li>
                <li><a href="restList.html"><span class="glyphicon  glyphicon-glass"></span>&nbsp;&nbsp;餐厅管理</a></li>
                <li><a href="sceneryList.html"><span class="glyphicon glyphicon-camera"></span>&nbsp;&nbsp;景区管理</a></li>
                <li><a href="htAreaList.html"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;地区管理</a></li>
                <li><a href="hotelList.html"><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;酒店管理</a></li>
                <li class="active"><a href="strategyReviewedList.html"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;旅游推文管理</a></li>
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
<!--导航-->
<div class="container">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="strategyUnreviewedList.html" class="list-group-item ">推文管理</a>
                <a href="strategyReviewedList.html" class="list-group-item active">通过的推文</a>

                <a href="strategyUnPassedList.html" class="list-group-item ">未通过的推文</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>推文管理</h1>
            </div>
            <ul class="nav nav-tabs">
                <li class="">
                    <a href="strategyUnreviewedList.html">推文审核未通过列表</a>
                </li>
                <li class="active">
                    <a href="strategyReviewedList.html">推文审核通过列表</a>
                </li>
                <li class="">
                    <a href="strategyUnPassedList.html">推文审核未通过列表</a>
                </li>
            </ul>
            <table class="table">
                <thead>
                <tr>
                    <th width="5%">ID</th>
                    <th width="20%">标题</th>
                    <th width="10%">推荐景点</th>
                    <th width="40%">内容</th>
                    <th width="10%">发布时间</th>
                    <th width="10%">点击量</th>
                    <th width="10%">审核</th>
<%--                    <th>操作</th>--%>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${strategyList}" var="strategy">
                    <tr id="${strategy.strategy_id}">
                        <th scope="row">${strategy.strategy_id}</th>
                        <td>${strategy.title}</td>
                            <%--                        <td><input style="width: 50%" class=" form-control" type = "password" value = "${guide.guide_password}"></td>--%>
                        <td>${strategy.recommend}</td>
                        <td>
                            <c:if test="${strategy.content.length()>50}">
                                ${strategy.content.substring(0,50)}...
                            </c:if>
                            <c:if test="${strategy.content.length()<=50}">
                                ${strategy.content}
                            </c:if>
                        </td>
                        <td>${strategy.post_time}</td>
                        <td>${strategy.clickNum}</td>
                        <td>已通过</td>
                        <td>
<%--                            <div role="presentation" class="dropdown">--%>
<%--                                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">--%>
<%--                                    操作<span class="caret"></span>--%>
<%--                                </button>--%>
<%--                                <ul class="dropdown-menu">--%>
<%--                                    <li><a id="editRest" onclick="restDetail(${rest.rest_id})">编辑</a></li>--%>
<%--                                    <li><a id=“restDel” onclick="restDel(${rest.rest_id})">删除</a></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav class="pull-right">

                共${totalCount }条记录&nbsp;&nbsp; ${currentPageNo }/${totalPageCount }页
                <nav aria-label="...">
                    <ul class="pager">
                        <c:if test="${currentPageNo > 1}">
                            <li><a href="javascript:page_nav(document.forms[0],1);">首页</a></li>
                            <li><a href="javascript:page_nav(document.forms[0],${currentPageNo-1});">上一页</a></li>
                        </c:if>
                        <c:if test="${currentPageNo < totalPageCount }">
                            <li><a href="javascript:page_nav(document.forms[0],${currentPageNo+1 });">下一页</a></li>
                            <li><a href="javascript:page_nav(document.forms[0],${totalPageCount});">最后一页</a></li>
                        </c:if>
                    </ul>
                </nav>


                <form method="get" action="#">
                    <input type="hidden" name="pageIndex" value="1"/>
                    <div class="page-go-form" style="float: left;line-height: 35px;" inline-block">跳转至</div>
        <input type="text" class="form-control" style="width: 20%;float: left" name="inputPage" id="inputPage"/>
        <div style="float: left;line-height: 35px;">页</div>
        <button type="submit" style="float: left" class="btn btn-default" onClick='jump_to(document.forms[0],document.getElementById("inputPage").value)'>GO</button>
        </form>
        <input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
        </nav>
    </div>
</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <p>Hello world</p>

        </div>
    </div>
</div>
<!--footer-->
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
<!--footer-->
</body>
</html>