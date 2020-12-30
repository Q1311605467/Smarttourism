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
    <title>地区管理</title>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/avatar/static/css/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/avatar/plugins/Cropper/cropper.min.css">

    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/userList.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/htAreaList.js"></script>

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
                <li ><a href="userList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户管理</a></li>
                <li><a href="guideList.html"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;导游管理</a></li>
                <li><a href="restList.html"><span class="glyphicon  glyphicon-glass"></span>&nbsp;&nbsp;餐厅管理</a></li>
                <li><a href="sceneryList.html"><span class="glyphicon glyphicon-camera"></span>&nbsp;&nbsp;景区管理</a></li>
                <li class="active"><a href="htAreaList.html"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;&nbsp;地区管理</a></li>
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
                <a href="${pageContext.request.contextPath}/sys/htAreaList" class="list-group-item ">地区管理</a>
                <a href="${pageContext.request.contextPath}/sys/htAreaSearch" class="list-group-item active">地区搜索</a>
                <a href="" role="button"  class="list-group-item" data-toggle="modal" data-target="#myModal">添加地区信息</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>地区管理</h1>
            </div>
            <ul class="nav nav-tabs">
                <li>
                    <a href="${pageContext.request.contextPath}/sys/htAreaList.html">地区列表</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/sys/htAreaSearch.html">地区搜索</a>
                </li>
                <li>
                    <a href="" role="button" data-toggle="modal" data-target="#myModal">添加地区信息</a>
                </li>
            </ul>
            <form action="${pageContext.request.contextPath}/sys/htAreaSearch" class="user_search" method="get">
                <div class="alert alert-info" role="alert">
                    <strong>技巧提示：</strong>
                    支持模糊搜索和匹配搜索
                </div>
                <div class="form-group">
                    <label for="">地区名</label>
                    <input type="text" id="area_name1" name = "area_name1" class="form-control" placeholder="请输入地区名">
                </div>
                <!--                 函数处理 -->
                <button type="submit" class="btn btn-default">提交</button>
            </form>
            <table class="table">
                <thead>
                <tr>
                    <th width="5%">ID</th>
                    <th width="8%">地区名字</th>
                    <th width="20%">旅游路线</th>
                    <th width="40%">地区介绍</th>
                    <th width="5%">地区展示</th>
                    <th width="5%">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${areaList}" var="area">
                    <tr id="${area.area_id}">
                        <th scope="row">${area.area_id}</th>
                        <td>${area.area_name}</td>
                            <%--                        <td><input style="width: 50%" class=" form-control" type = "password" value = "${guide.guide_password}"></td>--%>
                        <td>${area.tourist_route}</td>
                        <td>
                            <c:if test="${area.area_intro.length()>100}">
                                ${area.area_intro.substring(0,100)}...
                            </c:if>
                            <c:if test="${area.area_intro.length()<=100}">
                                ${area.area_intro}
                            </c:if>
                        </td>
                        <td><div><img width="100px" height="100px" src="${pageContext.request.contextPath}/statics/images/${area.area_picture}" ></div></td>
                        <td>
                            <div role="presentation" class="dropdown">
                                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    操作<span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a id="editArea" onclick="areaDetail(${area.area_id})">编辑</a></li>
                                    <li><a id=“areaDel” onclick="areaDel(${area.area_id})">删除</a></li>
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
                <h4 class="modal-title" id="myModalLabel">添加地区</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/sys/addArea" class ="form1" method="post" enctype="multipart/form-data">

                    <div class="form-group">
                        <label >地区图片</label>
                        <input type="file" id="area_picture" name ="area_picture" class="form-control" placeholder="请插入图片"  required="required">
                    </div>
                    <div class="form-group">
                        <label >地区名字</label>
                        <input type="text" id="area_name" name ="area_name" class="form-control" placeholder="请输入地区名字"  required="required">
                    </div>
                    <div class="form-group">
                        <label >旅游路线</label>
                        <input type="text" id="tourist_route" name ="tourist_route" class="form-control" placeholder="请输入旅游路线"  required="required">
                    </div>
                    <div class="form-group">
                        <label>地区介绍</label>
                        <textarea id="area_intro" name = "area_intro" class="form-control" placeholder="请输入地区介绍"  required="required" cols="8" rows="6"></textarea>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <%--                        <button id = "userImg_save"  class="btn btn-primary" >提交</button>--%>
                        <button type="submit"  class="btn btn-primary" >提交</button>
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