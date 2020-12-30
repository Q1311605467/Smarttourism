<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>User_Modify</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
            rel="stylesheet">

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
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath }/index.html"
                                                          style="color: white; background-color: #ff9d00;">首页</a></li>
                <li role="presentation"><a
                        href="${pageContext.request.contextPath }/query.html?sort=2&s="
                        style="color: black">景点</a></li>
                <li role="presentation"><a
                        href="${pageContext.request.contextPath }/Hotel.html?s="
                        style="color: black;">酒店</a></li>

                <li role="presentation"><a
                        href="${pageContext.request.contextPath }/Strategy.html?s="
                        style="color: black;">攻略</a></li>
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
                        <li><a href="${pageContext.request.contextPath }/sys/user/userStrategy/${userSession.user_id }">我的攻略</a></li>
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


<div style="margin-left: 35%; margin-right: 35%; margin-top: 5%"
     id="myModal">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
        </div>

        <div class="modal-body">
            <form action="${pageContext.request.contextPath }/sys/user/userModify.html" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="user_id" value="${userSession.user_id}"/>
                <div class="form-group">
                    <label for="head">上传用户头像</label>
                    <img width="100%" height="100%"
                         src="${pageContext.request.contextPath }/statics/images/${userSession.head }" alt="">
                    <input type="file" id="head"
                           name="head" class="form-control"
                           placeholder="上传头像">
                </div>

                <div class="form-group">
                    <label for="user_account">用户账号</label> <input type="text" id="user_account" required="required"
                                                                  name="user_account" class="form-control"
                                                                  placeholder="请输入用户账号"
                                                                  value="${userSession.user_account }">
                </div>

                <div class="form-group">
                    <label for="user_password">用户密码</label>
                    <p style="color: red">${error}</p>
                    <input type="password" name="user_password" id="user_password" required="required"
                           class="form-control" placeholder="请输入密码"
                           value="${userSession.user_password }">
                </div>

                <div class="form-group">
                    <label for="user_password2">确认用户密码</label> <input required type="password" required="required"
                                                                      name="user_password2" id="user_password2"
                                                                      class="form-control"
                                                                      placeholder="请确认密码"
                                                                      value="${userSession.user_password }">
                </div>

                <div class="form-group">
                    <label for="intro">个人简介</label> <input type="text" id="intro"
                                                           name="intro" class="form-control"
                                                           placeholder="请输入用户简介"
                                                           value="${userSession.intro }">
                </div>

                <div class="modal-footer">
                    <a href="${pageContext.request.contextPath }/sys/user/destory/${userSession.user_id}">
                        <button
                                type="button" class="btn btn-danger">注销账号
                        </button>
                    </a>

                    <a href="${pageContext.request.contextPath }/index.html">
                        <button
                                type="button" class="btn btn-default">返回
                        </button>
                    </a>
                    <a id="modify" href="javascript:;">
                        <button type="submit" id="is_able"
                                class="btn btn-primary">确认修改
                        </button>
                    </a>

                </div>
            </form>
        </div>
    </div>
</div>


<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
        src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<script type="text/javascript"
        src="${pageContext.request.contextPath }/statics/js/modify.js"></script>

</body>
</html>