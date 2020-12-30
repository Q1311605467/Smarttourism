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
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/userList.js"></script>
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
                <li ><a href="#"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;后台首页</a></li>
                <li class="active"><a href="userList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a></li>
                <li><a href="guideList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;导游管理</a></li>
                <li><a href="restList.html"><span class="glyphicon  glyphicon-glass"></span>&nbsp;&nbsp;餐厅管理</a></li>
                <li><a href="sceneryList.html"><span class="glyphicon glyphicon-camera"></span>&nbsp;&nbsp;景区管理</a></li>
                <li><a href="htAreaList.html"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;地区管理</a></li>
                <li><a href="hotelList.html"><span class="glyphicon glyphicon-calendar"></span>&nbsp;&nbsp;酒店管理</a></li>
                <li><a href="strategyReviewedList.html"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;旅游推文管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        admin
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dLabel">
                        <li><a href="adminhome.jsp"><span class="glyphicon glyphicon-screenshot"></span>&nbsp;&nbsp;前台首页</a></li>
                        <li><a href="Admin_person.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;个人主页</a></li>
                        <li><a href="Person_admin.jsp"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;个人设置</a></li>
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
                <a href="userList.html" class="list-group-item">用户管理</a>
                <a href="userSearch.html" class="list-group-item active">用户搜索</a>
<%--                <a href="" role="button"  class="list-group-item" data-toggle="modal" data-target="#myModal">添加用户</a>--%>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>用户管理</h1>
            </div>
            <ul class="nav nav-tabs">
                <li>
                    <a href="userList.html">用户列表</a>
                </li>
                <li  class="active">
                    <a href="userSearch.html">用户搜索</a>
                </li>
<%--                <li>--%>
<%--                    <a href="" role="button" data-toggle="modal" data-target="#myModal">添加用户</a>--%>
<%--                </li>--%>
            </ul>
            <form action="${pageContext.request.contextPath}/sys/userSearchByName" class="user_search" method="get">
                <div class="alert alert-info" role="alert">
                    <strong>技巧提示：</strong>
                    支持模糊搜索和匹配搜索
                </div>
                <div class="form-group">
                    <label for="user_account">用户名</label>
                    <input type="texte" id="user_account" name = "user_account" class="form-control" placeholder="请输入用户名">
                </div>
                <!--                 函数处理 -->
                <button type="submit" class="btn btn-default">提交</button>
            </form>
            <!-- 查询的用户信息 -->
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>性别</th>
                    <th>是否激活</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="user">
                    <tr id="${user.user_id}">
                        <th scope="row">${user.user_id}</th>
                        <td>${user.user_account}</td>
                        <td><input style="width: 50%" class=" form-control" type = "password" value = "${user.user_password}"></td>
                        <td>${user.gender}</td>
                        <td>
                            <c:if test="${user.isActive==1}">
                                是
                            </c:if>
                            <c:if test="${user.isActive==0}">
                                否
                            </c:if>
                        </td>
                        <td>
                            <div role="presentation" class="dropdown">
                                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    操作<span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <c:if test="${user.isActive==1}">
                                        <li><a onclick="Logout(${user.user_id})">注销</a></li>
                                    </c:if>
                                    <c:if test="${user.isActive==0}">
                                        <li><a onclick="Activating(${user.user_id})">激活</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body">
                <form action="#" class ="form1">
                    <div class="form-group">
                        <label for="addname">用户名</label>
                        <input type="text" id="addname" name ="name" class="form-control" placeholder="用户名">
                    </div>
                    <div class="form-group">
                        <label for="addpassword">用户密码</label>
                        <input type="text" id="addpassword" name = "password" class="form-control" placeholder="请输入用户密码">
                    </div>
                    <div class="form-group">
                        <label for="addpassword1">确认用户密码</label>
                        <input type="text" id="addpassword1" name = "repassword"class="form-control" placeholder="请确认输入用户密码">
                    </div>
                    <div class="form-group">
                        <label for="addpassword1">性别</label>
                        <input type="text" id="addpassword1" name = "repassword"class="form-control" placeholder="请确认输入用户性别">
                    </div>
                    <div class="form-group">
                        <label for="addemail">请输入用户邮箱</label>
                        <input type="email" id="addemail" name = "email"class="form-control" placeholder="请输入用户邮箱">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="sumbit" class="btn btn-primary" onclick="getRelate($('.form1'))">提交</button>
            </div>
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