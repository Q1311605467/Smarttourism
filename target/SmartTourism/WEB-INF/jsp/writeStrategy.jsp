<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
                        <li><a href="${pageContext.request.contextPath }/sys/user/userStrategy/${userSession.user_id }">我的攻略</a>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath }/logout.html">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<input type="hidden" id="user_ID" value="${userSession.user_id }">
<input type="hidden" id="path" value="${pageContext.request.contextPath }">


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

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
        src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>


</body>
</html>