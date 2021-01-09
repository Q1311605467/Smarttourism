<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <li ><a href="../statistic.html"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;后台首页</a></li>
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
                    <a  class="pass" id="">
                        <button type="button" class="btn1 btn btn-default" data-toggle="modal" data-target="#myModal1">
                            审核分析
                        </button>
                    </a>
            </div>

        </div>
    </div>
</div>
<%--Model--%>
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <sbutton type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></sbutton>
                <h4 class="modal-title" id="#">
                    <fieldset>
                        <c:if test="${checkTextResult.conclusionType==1}">
                            <h4 style="color: #4cae4c;font-weight: bold" >
                                <img  src="${pageContext.request.contextPath }/statics/images/ok.jpg" alt=""> 审核通过
                            </h4>
                        </c:if>
                        <c:if test="${checkTextResult.conclusionType==2}">
                            <h4 style="color: #e90205;font-weight: bold">
                                <img  src="${pageContext.request.contextPath }/statics/images/no.jpg" alt=""> 审核不通过
                            </h4>
                        </c:if>
                    </fieldset>

                </h4>
            </div>
            <div class="modal-bofont-weight: bolddy">
                <table class="table">
                    <thead>
                    <tr>
                        <th width="30%">审核维度</th>
                        <th width="20%">状态</th>
                        <th width="20%">置信度</th>
                        <th width="30%">违禁词</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${checkTextResult.conclusionType==1}">
                        <tr>
                            <td>官方默认违禁词</td>
                            <td style="color: green">通过</td>
                            <td>0.0</td>
                            <td>无</td>
                        </tr>
                        <tr>
                            <td>暴恐违禁</td>
                            <td style="color: green">通过</td>
                            <td>0.0</td>
                            <td>无</td>
                        </tr>
                        <tr>
                            <td>文本色情</td>
                            <td style="color: green">通过</td>
                            <td>0.0</td>
                            <td>无</td>
                        </tr>
                        <tr>
                            <td>政治敏感</td>
                            <td style="color: green">通过</td>
                            <td>0.0</td>
                            <td>无</td>
                        </tr>
                        <tr>
                            <td>恶意推广</td>
                            <td style="color: green">通过</td>
                            <td>0.0</td>
                            <td>无</td>
                        </tr>
                        <tr>
                            <td>低俗辱骂</td>
                            <td style="color: green">通过</td>
                            <td>0.0</td>
                            <td>无</td>
                        </tr>
                        <tr>
                            <td>恶意推广-联系方式</td>
                            <td style="color: green">通过</td>
                            <td>0.0</td>
                            <td>无</td>
                        </tr>
                        <tr>
                            <td>恶意推广-软文推广</td>
                            <td style="color: green">通过</td>
                            <td>0.0</td>
                            <td>无</td>
                        </tr>
                        <tr>
                            <td>广告法审核</td>
                            <td style="color: green">通过</td>
                            <td>0.0</td>
                            <td>无</td>
                        </tr>
                    </c:if>

                    <c:if test="${checkTextResult.conclusionType!=1}">
                        <c:forEach items="${checkTextResult.data}" var="data">
                            <tr>
                                <c:if test="${data.type==11&&data.subType==0}">
                                    <td>官方默认违禁词</td>
                                    <td style="color: red">不通过</td>
                                    <td>1.0</td>
                                    <td>
                                        <c:forEach items="${data.hits}" var="hits">
                                            <c:forEach items="${hits.words}" var="words">
                                                ${words.toString()}
                                            </c:forEach>
                                        </c:forEach>
                                    </td>
                                </c:if>
                            </tr>


                            <tr>
                                <c:if test="${data.type==12&&data.subType==0}">
                                    <td>低质灌水</td>
                                    <td style="color: red">不通过</td>
                                    <td>${data.hits.get(0).probability}</td>
                                    <td>
                                        <c:forEach items="${data.hits.get(0).words}" var="words">
                                            ${words.toString()}
                                        </c:forEach>
                                    </td>
                                </c:if>
                            </tr>
                            <tr>
                                <c:if test="${data.type==12&&data.subType==1}">
                                    <td>暴恐违禁</td>
                                    <td style="color: red">不通过</td>
                                    <td>${data.hits.get(0).probability}</td>
                                    <td>
                                        <c:forEach items="${data.hits.get(0).words}" var="words">
                                            ${words.toString()}
                                        </c:forEach>
                                    </td>
                                </c:if>
                            </tr>
                            <tr>
                                <c:if test="${data.type==12&&data.subType==2}">
                                    <td>文本色情</td>
                                    <td style="color: red">不通过</td>
                                    <td>${data.hits.get(0).probability}</td>
                                    <td>
                                        <c:forEach items="${data.hits}" var="hits">
                                            <c:forEach items="${hits.words}" var="words">
                                                ${words.toString()}
                                            </c:forEach>
                                        </c:forEach>
                                    </td>
                                </c:if>
                            </tr>
                            <tr>
                                <c:if test="${data.type==12&&data.subType==3}">
                                    <td>政治敏感</td>
                                    <td style="color: red">不通过</td>
                                    <td>${data.hits.get(0).probability}</td>
                                    <td>
                                        <c:forEach items="${data.hits}" var="hits">
                                            <c:forEach items="${hits.words}" var="words">
                                                ${words.toString()}
                                            </c:forEach>
                                        </c:forEach>
                                    </td>
                                </c:if>
                            </tr>
                            <tr>
                                <c:if test="${data.type==12&&data.subType==5}">
                                    <td>低俗辱骂</td>
                                    <td style="color: red">不通过</td>
                                    <td>${data.hits.get(0).probability}</td>
                                    <td>
                                        <c:forEach items="${data.hits}" var="hits">
                                            <c:forEach items="${hits.words}" var="words">
                                                ${words.toString()}
                                            </c:forEach>
                                        </c:forEach>
                                    </td>
                                </c:if>
                            </tr>
                            <tr>
                                <c:if test="${data.type==12&&data.subType==6}">
                                    <td>恶意推广-联系方式</td>
                                    <td style="color: red">不通过</td>
                                    <td>${data.hits.get(0).probability}</td>
                                    <td>
                                        <c:forEach items="${data.hits}" var="hits">
                                            <c:forEach items="${hits.words}" var="words">
                                                ${words.toString()}
                                            </c:forEach>
                                        </c:forEach>
                                    </td>
                                </c:if>
                            </tr>
                            <tr>
                                <c:if test="${data.type==12&&data.subType==7}">
                                    <td>恶意推广-软文推广</td>
                                    <td style="color: red">不通过</td>
                                    <td>${data.hits.get(0).probability}</td>
                                    <td>
                                        <c:forEach items="${data.hits}" var="hits">
                                            <c:forEach items="${hits.words}" var="words">
                                                ${words.toString()}
                                            </c:forEach>
                                        </c:forEach>
                                    </td>
                                </c:if>
                            </tr>
                            <tr>
                                <c:if test="${data.type==12&&data.subType==8}">
                                    <td>广告法审核</td>
                                    <td style="color: red">不通过</td>
                                    <td>${data.hits.get(0).probability}</td>
                                    <td>
                                        <c:forEach items="${data.hits}" var="hits">
                                            <c:forEach items="${hits.words}" var="words">
                                                ${words.toString()}
                                            </c:forEach>
                                        </c:forEach>
                                    </td>
                                </c:if>
                            </tr>

                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
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
</div>
<%--ModelEnd--%>


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