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

    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- bootstrap-css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/bootstrap.css" type="text/css" media="all" />
    <!--// bootstrap-css -->
    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/style.css" type="text/css" media="all" />
    <!--// css -->
    <!-- font-awesome icons -->
    <link href="${pageContext.request.contextPath }/statics/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- font -->
    <link href='#css?family=Francois+One' rel='stylesheet' type='text/css'>
    <!-- //font -->
    <script src="${pageContext.request.contextPath }/statics/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/statics/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/move-top.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!--animate-->
    <link href="${pageContext.request.contextPath }/statics/css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="${pageContext.request.contextPath }/statics/js/wow.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!--//end-animate-->
</head>

<body style="">
<!-- 导航栏 -->
<div class="header">
    <div class="top-header">
        <div class="container">
            <div class="top-header-info">
                <div class="top-header-left wow fadeInLeft animated" data-wow-delay=".5s">
                    <p>Your thoughtful little travel helper</p>
                </div>
                <div class="top-header-right wow fadeInRight animated" data-wow-delay=".5s">
                    <div class="top-header-right-info">
                        <ul class="nav navbar-nav">
                            <li id="denglu"><a href="${pageContext.request.contextPath }/QDlogin.html">登录</a></li>
                            <li id="zhuce"><a href="${pageContext.request.contextPath }/reg.html">注册</a></li>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <div class="bottom-header">
        <div class="container">
            <div class="logo wow fadeInDown animated" data-wow-delay=".5s">
                <h1><a href="${pageContext.request.contextPath }/index.html"><img src="${pageContext.request.contextPath }/statics/images/newimge/logo.jpg" alt="" /></a></h1>
            </div>
            <div class="top-nav wow fadeInRight animated" data-wow-delay=".5s">
                <nav class="navbar navbar-default">
                    <div class="container">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="${pageContext.request.contextPath }/index.html" class="active">首页</a></li>
                            <li><a href="#" class="dropdown-toggle hvr-bounce-to-bottom" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">景区<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a class="hvr-bounce-to-bottom" href="${pageContext.request.contextPath }/query.html?sort=2&s=">景区介绍</a></li>
                                    <li><a class="hvr-bounce-to-bottom" href="${pageContext.request.contextPath }/reserves.html?sort=2&s=">门票预订</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath }/Hotel.html?s=">酒店</a></li>
                            <li><a href="${pageContext.request.contextPath }/Strategy.html?s=">推文</a></li>
                            <li><a href="${pageContext.request.contextPath }/query.html?sort=1">地区</a></li>
                        </ul>
                        <div class="clearfix"> </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="user_ID" value="${userSession.user_id }">
<input type="hidden" id="path" value="${pageContext.request.contextPath }">
<script>
    var user_account = "${userSession.user_account}";
    var user_password = "${userSession.user_password}";
    // 		var path = "${pageContext.request.contextPath}";
    if (!user_account) {
        document.getElementById("user").style.display = "none";
        document.getElementById("logout").style.display = "none";
    } else {
        document.getElementById("denglu").style.display = "none";
        document.getElementById("zhuce").style.display = "none";
    }
</script>

<div class="blog">
    <!-- container -->
    <div class="container">
        <div class="col-md-8 blog-top-left-grid">
            <div class="left-blog left-single">
                <div class="blog-left">
                    <div class="single-left-left wow fadeInUp animated" data-wow-delay=".5s">
                        <h3 class="modal-title" id="myModalLabel" style="color: #007bff">${Strategy.title}</h3>
                        <p>提到了： <font color="#ff8c00">${Strategy.recommend}</font>&emsp;发布时间：${Strategy.post_time}&emsp;点击量：<font
                                color="red">${Strategy.clickNum}</font></p>
                        <img src="${pageContext.request.contextPath }/statics/images/${Strategy.strategy_cover}" alt="" />
                    </div>
                    <div class="blog-left-bottom wow fadeInUp animated" data-wow-delay=".5s">
                        <div class="modal-body">
                            <div class="form-group">
                                <p id="content">${Strategy.content}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 blog-top-right-grid">
            <div class="opinion">
                <c:if test="${userSession.user_account == null || userSession.user_account == ''}">
                    <nav class="navbar navbar-defaults navbar-static-top" role="navigation">
                        <div class="container">
                            <h3>请登入才能发表评论！</h3>
                        </div>
                    </nav>
                </c:if>
                <c:if test="${userSession.user_account != null && userSession.user_account != ''}">
                    <h2 class="wow fadeInUp animated" data-wow-delay=".5s" style="color: #777">发表你的评论</h2>
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
                            <textarea rows="5" name="text" cols="20"placeholder="请自觉遵守互联网相关法律法规" class="wow fadeInLeft animated" data-wow-delay=".5s"></textarea>
    <%--                        <button type="submit" class="wow fadeInRight animated" data-wow-delay=".5s" name="fabumsg">发表评论</button>--%>
                            <button type="submit" class="wow fadeInRight animated animated" data-wow-delay=".5s" name="fabumsg" style="visibility: visible;animation-delay: 0.5s;animation-name: fadeInRight;border: #dff0d8;outline-color: #777;color: #353535b8;background: #ddddddab;font-size: 1em;padding: revert;margin-top: 15px">SEND</button>
                        </div>
                    </form>
                </c:if>
                <%--  --------------------------------------------------------------这是分隔符----------------------------------------------------------------------%>

                <div class="list-group" data-wow-delay=".5s">
                    <c:forEach items="${msge}" var="masege">
                        <c:set var="cid" value="${masege}" scope="session" /><!-- 把该条评论上传到session中 -->

                        <%
                            Strategy_comment uncom=(Strategy_comment)request.getSession().getAttribute("cid");//获取该条评论的全部属性

                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");//设定时间的范围到 分钟
                            String dateStr = sdf.format(uncom.getComment_time());//将获取到的时间转变为设定好的类型
                        %>

                        <div class="user-face" data-wow-delay=".5s">
                            <img alt="${masege.user_name}" class="user-head" src="${pageContext.request.contextPath }/statics/images/${masege.user_head}">
                        </div>
                        <div class="con well" data-wow-delay=".5s">
                            <div class="user ">
                                <span>用户名：</span><a href="#" target="_blank" class="user-name"> ${masege.user_name} </a>
                            </div>
                            <p class="text well">${masege.text}</p>
                            <div class="info">
                                <span class="time" style="color: #999"><%=dateStr%></span>
                                <span class="huifu" style="color: #999">回复</span>

                            </div>
                            <%
                                int unnumc=uncom.getUn_number();
                                if(unnumc>0){
                            %>
                            <div class="reply-box" style="margin-top: 15px">
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

                                    <div class="reply-item well" data-wow-delay=".5s">
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
                                            <span class="time" style="color: #999"><%=dateStras%></span>
                                            <span class="huifu" style="color: #999">回复</span>

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
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>



<div style="height: 20px"></div>


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