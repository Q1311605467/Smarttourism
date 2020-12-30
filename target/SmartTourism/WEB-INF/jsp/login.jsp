<%--
  Created by IntelliJ IDEA.
  User: 13116
  Date: 2020/3/19
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>系统登录 - 智慧旅游查询系统</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/BackstageManagement/style.css" />
    <script type="text/javascript">

    </script>
</head>
<body class="login_bg">
<section class="loginBox">
    <header class="loginHeader">
        <h1>智慧旅游查询系统</h1>
    </header>
    <section class="loginCont">
        <form class="loginForm" action="${pageContext.request.contextPath }/dologin.html"  name="actionForm" id="actionForm"  method="post" >

            <div class="info">${error}</div>
            <div class="inputbox">
                <label for="user">用户名：</label>
                <input type="text" class="input-text" id="admin_account" name="admin_account" placeholder="请输入用户名" required/>
            </div>
            <div class="inputbox">
                <label for="mima">密码：</label>
                <input type="password" id="admin_password" name="admin_password" placeholder="请输入密码" required/>
            </div>
            <div class="subBtn">
                <input type="submit" value="登录"/>
                <input type="reset" value="重置"/>
            </div>
        </form>
    </section>
</section>
</body>
</html>
