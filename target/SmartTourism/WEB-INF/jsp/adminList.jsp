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
    <title>管理员管理</title>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css"/>
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/adminList.js"></script>
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
                <li class="active"><a href="statistic.html"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;后台首页</a></li>
<%--                <li ><a href="userList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;管理员管理</a></li>--%>
                <li><a href="userList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a></li>
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
<%--                userList.html--%>
                <a href="userList.html" class="list-group-item">用户管理</a>
<%--    userSearch.html--%>
                <a href="adminList.html" class="list-group-item active">管理员管理</a>
                <%--                <a href="" role="button"  class="list-group-item" data-toggle="modal" data-target="#myModal">添加用户</a>--%>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>管理员管理</h1>
            </div>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="adminList.html">管理员列表</a>
                </li>
                <li>
                    <a href="adminSearch.html">管理员搜索</a>
                </li>

                <li>
                <a href="" role="button" data-toggle="modal" data-target="#myModal">添加管理员</a>
                </li>
            </ul>
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>管理员名</th>
                    <th>密码</th>
                    <th>最高权限管理员</th>
                    <th>是否激活</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${adminList}" var="admin">
                    <tr id="${admin.admin_id}">
                        <th scope="row">${admin.admin_id}</th>
                        <td>${admin.admin_account}</td>
                        <td><input style="width: 50%" class="form-control" type = "password" value = "${admin.admin_password}"></td>
<%--                        <td>${user.gender}</td>--%>
                        <td>
                            <c:if test="${admin.admin_supreme==1}">
                                是
                            </c:if>
                            <c:if test="${admin.admin_supreme==0}">
                                否
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${admin.admin_isActive==1}">
                                是
                            </c:if>
                            <c:if test="${admin.admin_isActive==0}">
                                否
                            </c:if>
                        </td>
                        <td>
                            <div role="presentation" class="dropdown">
                                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    操作<span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <c:if test="${admin.admin_isActive==1}">
                                        <li><a onclick="LogoutAdmin(${admin.admin_id})">注销</a></li>
                                    </c:if>
                                    <c:if test="${admin.admin_isActive==0}">
                                        <li><a onclick="ActivatingAdmin(${admin.admin_id})">激活</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav class="pull-right">
                <%--                <ul class="pagination">--%>
                <%--                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>--%>
                <%--                    <li class="active"><a href="#">1</a></li>--%>
                <%--                    <li><a href="#">2 </a></li>--%>
                <%--                    <li><a href="#">3 </a></li>--%>
                <%--                    <li><a href="#">4 </a></li>--%>
                <%--                    <li><a href="#">5 </a></li>--%>
                <%--                    <li><a href="#">6 </a></li>--%>
                <%--                    <li><a href="#"><span aria-hidden="true">&raquo;</span></a></li>--%>
                <%--                </ul>--%>
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
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加管理员</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/sys/addAdmin" class ="form1" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="admin_account">管理员名</label>
                        <input type="text" id="admin_account" name ="admin_account" class="form-control" placeholder="用户名">
                    </div>
                    <div class="form-group">
                        <label for="admin_password">管理员密码</label>
                        <input type="text" id="admin_password" name = "admin_password" class="form-control" placeholder="请输入用户密码">
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="admin_password1">确认管理员密码</label>--%>
<%--                        <input type="text" id="admin_password1" name = "admin_password1"class="form-control" placeholder="请确认输入用户密码">--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="addpassword1">性别</label>--%>
<%--                        <input type="text" id="addpassword1" name = "repassword"class="form-control" placeholder="请确认输入用户性别">--%>
<%--                    </div>--%>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="sumbit" class="btn btn-primary">提交</button>
                    </div>
                </form>
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
                    <p>
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