<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>错误</title>
</head>
<style>
    h2{
      color: #4e555b;
    }
    a{
        text-decoration: none;
    }
    center{
        border-style: outset;
    }

</style>
<body>
<center>
<img style="padding: 1px " src="${pageContext.request.contextPath }/statics/images/timg.jpg" >
	<h2>对不起，你没有权限访问！请返回到<a href = "login.html">首页</a></h2>
</center>
</body>
</html>