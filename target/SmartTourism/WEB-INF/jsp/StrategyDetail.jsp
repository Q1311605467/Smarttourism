<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="pojo.Strategy" %>
<%@ page import="pojo.Strategy_comment" %>
<%@ page import="controller.SCommentController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>writeStrategy</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
            rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/bootstrap-index2.css">

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

                <li role="presentation"><a
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


<div style="margin-left: 10%; margin-right: 10%; margin-top: 5%" id="myModal">
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

            <%--     -------------------------------       以下是评论模块的代码------------------------------------------------------------------------------------%>

            <div class="user-in-boxs">
                <c:if test="${userSession.user_account != null && userSession.user_account != ''}">
                    <nav class="navbar navbar-defaults navbar-static-top" role="navigation">
                        <div class="container">
                            <div class="navbar-header navbar-left">
                                <a  class="navbar-brand" href="#">评论</a>
                            </div>
                            <form method="post" class="comment-send" style="left:0px" action="${pageContext.request.contextPath }/sys/addSComment">
                                <div class="textarea-container">
                                    <div class=" ping ">
                                        <input type="text" name="strategy_id" value="${Strategy.strategy_id}"/>
                                        <input type="text" name="user_id" value="${userSession.user_id}"/>
                                        <input type="text" name="user_name" value="${userSession.user_account}"/>
                                        <input type="text" name="user_head" value="${userSession.head}"/>
                                        <input type="text" name="uncomments_id" value="0"/>
                                        <input type="text" name="uncomment_id" value="0"/>
                                        <input type="text" name="unUser_id" value="0"/>
                                    </div>
                                    <textarea rows="5" name="text" cols="20"placeholder="请自觉遵守互联网相关法律法规" calss="ipt-txt"></textarea>

                                    <button type="submit" class="coment-submit" name="fabumsg">发表评论</button>

                                </div>
                            </form>
                        </div>
                    </nav>
                </c:if>
                <c:if test="${userSession.user_account == null || userSession.user_account == ''}">
                    <nav class="navbar navbar-defaults navbar-static-top" role="navigation">
                        <div class="container">
                            <h3>请登入才能发表评论！</h3>
                        </div>
                    </nav>
                </c:if>

                <%--  --------------------------------------------------------------这是分隔符----------------------------------------------------------------------%>

                <div class="list-group">
                    <c:forEach items="${msge}" var="masege">
                        <c:set var="cid" value="${masege}" scope="session" /><!-- 把该条评论上传到session中 -->

                        <%
                            Strategy_comment uncom=(Strategy_comment)request.getSession().getAttribute("cid");//获取该条评论的全部属性

                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设定时间的范围到 分钟
                            String dateStr = sdf.format(uncom.getComment_time());//将获取到的时间转变为设定好的类型
                        %>

                        <div class="user-face">
                            <img alt="${masege.user_name}" class="user-head" src="${pageContext.request.contextPath }/statics/images/${masege.user_head}">
                        </div>
                        <div class="con well">
                            <div class="user ">
                                <span>用户名：</span><a href="#" target="_blank" class="user-name"> ${masege.user_name} </a>
                            </div>
                            <p class="text well">${masege.text}</p>
                            <div class="info">
                                <span class="time"><%=dateStr%></span>
                                <span class="huifu">回复</span>

                            </div>
                            <%
                                int unnumc=uncom.getUn_number();
                                if(unnumc>0){
                            %>
                            <div class="reply-box">
                                <%
                                    List<Strategy_comment> msgs= SCommentController.getS_CTwo(uncom);//查询该评论的回复评论
                                    request.setAttribute("msgss", msgs);
                                %>
                                <c:forEach items="${msgss}" var="mas">
                                    <c:set var="ccid" value="${mas}" scope="session" /><!-- 把该条评论上传到session中 -->
                                    <%
                                        Strategy_comment uom=(Strategy_comment)request.getSession().getAttribute("ccid");//获取该条评论的全部属性

                                        SimpleDateFormat sdfas = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设定时间的范围到 分钟
                                        String dateStras = sdfas.format(uom.getComment_time());//将获取到的时间转变为设定好的类型
                                    %>

                                    <div class="reply-item well">
                                        <a href="#" class="reply-face" style="top:0px;"><img src="${pageContext.request.contextPath }/statics/images/${mas.user_head}"></a>
                                        <div class="reply-con">
                                            <div class="user">
                                                <a href="#" class="name">${mas.user_name}</a>
                                                <span class="text-con">
		            							<%
                                                    if(uom.getUncomment_id()!=uom.getUncomments_id()){
                                                %>
		            							回复@${mas.unUser_name}：
		            							<%}%>
		            							${mas.text}
		            							</span>
                                            </div>
                                        </div>
                                        <div class="info">
                                            <span class="time"><%=dateStras%>></span>
                                            <span class="huifu">回复</span>

                                        </div>
                                        <div class=" ping "><!-- 该div页面上不显示，只用于获取该评论的属性信息 -->
                                            <p class="text-no">${mas.comment_id}</p> <!--在模态框中不显示，用于获取该评论id，并通过form一起上传 -->
                                            <p class="text-non">${masege.comment_id}</p> <!--在模态框中不显示，用于获取该评论最外层的id，并通过form一起上传 -->
                                            <p class="text-name">${mas.user_name}</p> <!--在模态框中不显示，用于获取该评论username，并通过form一起上传 -->
                                            <p class="text-id">${mas.user_id}</p><!--在模态框中不显示，用于获取该评论user_id，并通过form一起上传 -->
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <%}%>

                            <div class=" ping "><!-- 该div页面上不显示，只用于获取该评论的id -->
                                <p class="text-no">${ masege.comment_id }</p>
                                <p class="text-non">${ masege.comment_id }</p>
                                <p class="text-name">${masege.user_name}</p>
                                <p class="text-id">${masege.user_id}</p>
                            </div>

                        </div>

                    </c:forEach>
                </div>

            </div>

            <%--            以上是评论的代码--%>

            <div align="center">
                <a id="fanhui" href="${pageContext.request.contextPath }/sys/user/userStrategy/${userSession.user_id }">
                    <button
                            type="button" class="btn btn-default">返回
                    </button>
                </a>
            </div>

        </div>
    </div>
</div>


<div class="modal fade" id="addHcomment" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-show="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true"><span >&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">回复</h4>
            </div>
            <div class="modal-body">
                <c:if test="${userSession.user_account != null && userSession.user_account != ''}">
                    <form class="comment-send" style="left:0px" action="${pageContext.request.contextPath }/sys/addSComment" method="post">
                        <div class=" ping "><!-- 该div页面上不显示，只用于获取该评论的属性信息 -->
                            <input type="text" id="bgs" name="uncomment_id"><!--在模态框中不显示，用于获取该评论id，并通过form一起上传 -->
                            <input type="text" id="bgss" name="uncomments_id"><!--在模态框中不显示，用于获取最外层的评论的id，并通过form一起上传 -->
                            <input type="text" id="cmnss" name="unUser_name"><!--在模态框中不显示，用于获取该评论username，并通过form一起上传 -->
                            <input type="text" id="cmnssid" name="unUser_id"><!--在模态框中不显示，用于获取该评论user_id，并通过form一起上传 -->
                            <input type="text" name="strategy_id" value="${Strategy.strategy_id}"/>
                            <input type="text" name="user_id" value="${userSession.user_id}"/>
                            <input type="text" name="user_name" value="${userSession.user_account}"/>
                            <input type="text" name="user_head" value="${userSession.head}"/>
                        </div>
                        <div class="user-face">
                            <img class="user-head" src="${pageContext.request.contextPath }/statics/images/${userSession.head}">
                        </div>

                        <div class="textarea-container">
                            <textarea id="huifuc" rows="4" name="text" cols="60" calss="ipt-txt"></textarea>
                            <button type="submit" class="coment-submit" name="fabumsg">回复评论</button>

                        </div>
                    </form>
                </c:if>
                <c:if test="${userSession.user_account == null || userSession.user_account == ''}">
                    <nav class="navbar navbar-defaults navbar-static-top" role="navigation">
                        <div class="container">
                            <h3>请登入才能发表评论！</h3>
                        </div>
                    </nav>
                </c:if>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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

<script type="text/javascript">
    window.onload =function(){
        $("body").delegate(".huifu", "click", function(){//点击回复发生的事件
            console.log($(this));//在控制台监控这个操作
            let anr=$(this).parent().parent().children(".ping").children(".text-name");//被评论的用户名
            let no = $(this).parent().parent().children(".ping").children(".text-no");//被评论的id
            let non = $(this).parent().parent().children(".ping").children(".text-non");//被评论的外层id
            let unUser_id = $(this).parent().parent().children(".ping").children(".text-id");//被评论的用户id
            console.log(no.html());//在控制太输出获取到的commentsID的值
            var anrswer=anr.text();
            console.log(anrswer);
            $('#addHcomment').modal();

            $("#bgs").val(no.html());//被评论的id
            $("#bgss").val(non.html());//被评论的外层id
            $("#cmnss").val(anr.text());//被评论的用户名
            $("#cmnssid").val(unUser_id.html());//被评论的用户名
            //$("#huifuc").placeholder("「回复@"+anrswer+"」");
            document.getElementById("huifuc").setAttribute("placeholder","「回复@"+anrswer+"」");
        });
    }

</script>

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

</body>
</html>