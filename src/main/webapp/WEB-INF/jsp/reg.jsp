<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>User_Reg</title>

    <!-- Bootstrap -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
            rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
</head>

<body style="">
<input type="hidden" id="path" value="${pageContext.request.contextPath }">

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
                <li id="denglu"><a style="color: cornflowerblue"
                                   href="${pageContext.request.contextPath }/QDlogin.html">登录</a></li>
                <li id="zhuce"><a style="color: cornflowerblue"
                                  href="${pageContext.request.contextPath }/reg.html">注册</a></li>
            </ul>
        </div>
    </div>
</nav>


<div style="margin-left: 40%; margin-right: 40%; margin-top: 10%" id="myModal">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">注册用户</h4>
        </div>

        <div class="modal-body">
            <form>
                <div class="form-group">
                    <label for="user_account">用户账号</label>
                    <p id="p1"></p>
                    <input type="text" id="user_account" required="required"
                           name="user_account" class="form-control" placeholder="请输入用户账号">
                </div>
                <div class="form-group">
                    <label for="user_password1">用户密码</label>
                    <p style="color: red">${error}</p>
                    <p id="p2"></p>
                    <input type="password" name="user_password1" id="user_password1" required="required"
                           class="form-control" placeholder="请输入密码">
                </div>
                <div class="form-group">
                    <label for="user_password2">确认用户密码</label>
                    <input type="password" name="user_password2" id="user_password2" class="form-control" required="required"
                           placeholder="请确认密码">
                </div>
                <label>性别</label>
                <div class="form-group" align="center">

                    <label> <input type="radio" name="gender" class="form-control" checked="checked"
                                   value="1">男</label>
                    &emsp;&emsp;&emsp;&emsp;
                    <label> <input type="radio" name="gender" class="form-control"
                                   value="0">女</label>

                </div>

                <div class="modal-footer">
                    <a id="add" href="javascript:;" style="text-decoration: none">
                        <button id="is_able" disabled="disabled" type="button" class="btn btn-primary">添加
                        </button>
                    </a>
                    <a href="${pageContext.request.contextPath }/index.html">
                        <button type="button" class="btn btn-default">返回
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
        src="${pageContext.request.contextPath }/statics/js/user_reg.js"></script>

</body>
</html>