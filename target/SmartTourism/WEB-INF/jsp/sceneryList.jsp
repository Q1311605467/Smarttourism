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
    <script src="${pageContext.request.contextPath}/statics/js/sceneryList.js"></script>

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
                <li class="active"><a href="sceneryList.html"><span class="glyphicon glyphicon-camera"></span>&nbsp;&nbsp;景区管理</a></li>
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
                <a href="sceneryList.html" class="list-group-item active">景区管理</a>
                <a href="scenerySearch.html" class="list-group-item">景区搜索</a>
                <a href="" role="button"  class="list-group-item" data-toggle="modal" data-target="#myModal">添加景区信息</a>
                <a href="sceneryReservationList.html" class="list-group-item">景区门票预订信息</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>景区管理</h1>
            </div>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="sceneryList.html">景区列表</a>
                </li>
                <li>
                    <a href="scenerySearch.html">景区搜索</a>
                </li>
                <li>
                    <a href="" role="button" data-toggle="modal" data-target="#myModal">添加景区信息</a>
                </li>
            </ul>
            <table class="table">
                <thead>
                <tr>
                    <th width="5%">ID</th>
                    <th width="10%">景区名字</th>
                    <th width="15%">景区地址</th>
                    <th width="20%">导航路线</th>
                    <th width="20%">景区介绍</th>
                    <th width="10%">浏览数</th>
                    <th width="5%">评价</th>
                    <th width="10%">地区号</th>
                    <th width="5%">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sceneryList}" var="scenery">
                    <tr id="${scenery.scenery_id}">
                        <th scope="row">${scenery.scenery_id}</th>
                        <td>
                            <c:if test="${scenery.scenery_name.length()>8}">
                                ${scenery.scenery_name.substring(0,8)}...
                            </c:if>
                            <c:if test="${scenery.scenery_name.length()<=10}">
                                ${scenery.scenery_name}
                            </c:if>
                        </td>
                            <%--                        <td><input style="width: 50%" class=" form-control" type = "password" value = "${guide.guide_password}"></td>--%>
                        <td>
                            <c:if test="${scenery.scenery_address.length()>15}">
                                ${scenery.scenery_address.substring(0,15)}...
                            </c:if>
                            <c:if test="${scenery.scenery_address.length()<=15}">
                                ${scenery.scenery_address}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${scenery.navigation_route.length()>20}">
                                ${scenery.navigation_route.substring(0,20)}...
                            </c:if>
                            <c:if test="${scenery.navigation_route.length()<=20}">
                                ${scenery.navigation_route}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${scenery.scenery_intro.length()>22}">
                                ${scenery.scenery_intro.substring(0,21)}...
                            </c:if>
                            <c:if test="${scenery.scenery_intro.length()<=22}">
                                ${scenery.scenery_intro}
                            </c:if>
                        </td>
                        <td>${scenery.browse_num}</td>
                        <td>
                            <c:if test="${scenery.comment.length()>10}">
                            ${scenery.comment.substring(0,10)}...
                            </c:if>
                            <c:if test="${scenery.comment.length()<=10}">
                                ${scenery.comment}
                            </c:if>
                        </td>
                        <td>${scenery.area_id}</td>
                        <td>
                            <div role="presentation" class="dropdown">
                                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    操作<span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a id="editScenery" onclick="sceneryDetail(${scenery.scenery_id})">编辑</a></li>
                                    <li><a id=“sceneryDel” onclick="sceneryDel(${scenery.scenery_id})">删除</a></li>
                                </ul>
                            </div>
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
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加景区</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/sys/addScenery" class ="form1" method="post" enctype="multipart/form-data">

                    <div class="form-group">
                        <label >景区名字</label>
                        <input type="text" id="scenery_name" name ="scenery_name" class="form-control" placeholder="请输入景区名字"  required="required">
                    </div>
                    <div class="form-group">
                        <label >景区地址</label>
                        <input type="text" id="scenery_address" name ="scenery_address" class="form-control" placeholder="请输入景区地址"  required="required">
                    </div>
                    <div class="form-group">
                        <label >导航路线</label>
                        <input type="text" id="navigation_route" name = "navigation_route" class="form-control"  required="required" placeholder="请输入景区导航路线">
                    </div>
                    <div class="form-group">
                        <label>景区介绍</label>
                        <textarea id="scenery_intro" name = "scenery_intro" class="form-control" placeholder="请输入景区介绍"  required="required" cols="8" rows="6"></textarea>
                    </div>
                    <div class="form-group">
                        <label >浏览量</label>
                        <input type="text" id="browse_num" name = "browse_num" class="form-control"  required="required" placeholder="请输入景区浏览量">
                    </div>
                    <div class="form-group">
                        <label >景区评价</label>
                        <input id="comment" name = "comment" class="form-control"   required="required"placeholder="请输入景区评价" >
                    </div>
                    <div class="form-group">
                        <label >地区id</label>
                        <input type="text" id="area_id" name = "area_id" class="form-control"  required="required" placeholder="请输入该景区地区id">
                    </div>
                    <div class="form-group">
                        <label >景区图片</label>
                        <input type="file" id="scenery_picture" name ="files" class="form-control" placeholder="请插入图片"  required="required">
                    </div>
                    <div class="form-group">
                        <label >景区版块封面图</label>
                        <input type="file" id="scenery_cover" name ="files" class="form-control" placeholder="请插入图片"  required="required">
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