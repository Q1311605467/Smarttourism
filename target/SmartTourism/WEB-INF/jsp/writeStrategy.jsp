<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1 , user-scalable=no">

    <title>writeStrategy</title>

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

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
            rel="stylesheet">


    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/kindeditor/themes/default/default.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/kindeditor/plugins/code/prettify.css"/>
    <script charset="utf-8" src="${pageContext.request.contextPath }/statics/kindeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="${pageContext.request.contextPath }/statics/kindeditor/lang/zh-CN.js"></script>
    <script charset="utf-8"
            src="${pageContext.request.contextPath }/statics/kindeditor/plugins/code/prettify.js"></script>

</head>

<script>
    KindEditor.ready(function (K) {
        var editor1 = K.create('textarea[name="content"]', {
            cssPath: '${pageContext.request.contextPath }/statics/kindeditor/plugins/code/prettify.css',
            uploadJson: '${pageContext.request.contextPath }/upload/fileUpload',
            afterCreate: function () {
                var self = this;
                K.ctrl(document, 13, function () {
                    self.sync();
                });
                K.ctrl(self.edit.doc, 13, function () {
                    self.sync();
                });
            }
        });
        prettyPrint();
    });
</script>


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


<div style="margin-left: 20%; margin-right: 20%; margin-top: 5%" id="myModal">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">书写我的新攻略</h4>
        </div>

        <div class="modal-body">
            <form action="${pageContext.request.contextPath}/sys/user/addStrategy.html" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="user_id" value="${userSession.user_id}"/>

                <div class="form-group">
                    <label for="title">攻略标题</label> <input type="text" id="title" required="required"
                                                           name="title" class="form-control"
                                                           placeholder="请输入攻略标题"
                <%--value="${userSession.user_account }"--%>>
                </div>

                <div class="form-group">
                    <label for="strategy_cover">上传攻略封面</label><br>
                    <%--                    <img width="50%" height="50%"--%>
                    <%--                         src="${pageContext.request.contextPath }/statics/images/#" alt="">--%>
                    <input type="file" id="strategy_cover" value="" require="required"
                           name="strategy_cover" class="form-control">
                </div>

                <div class="form-group">
                    <label for="recommend">描述的景点</label>
                    <p style="color: red">${error}</p>
                    <input type="text" name="recommend" id="recommend" required="required"
                           class="form-control" placeholder="请输入景点"
                    <%--value="${userSession.user_password }"--%>>
                </div>

                <div class="form-group">
                    <label for="content">内容</label>
                    <p style="color: red">${error}</p>
                    <textarea name="content" cols="100" rows="8" id="content" required="required"
                              style="width: 100%; height: 100%;"></textarea>
                </div>


                <div class="modal-footer">
                    <a href="${pageContext.request.contextPath }/index.html">
                        <button
                                type="button" class="btn btn-default">返回
                        </button>
                    </a>
                    <a id="postStrategy" href="javascript:;">
                        <button type="submit"
                                class="btn btn-primary">提交审核
                        </button>
                    </a>

                </div>
            </form>
        </div>
    </div>
</div>

<div style="height: 20px"></div>


</body>
</html>