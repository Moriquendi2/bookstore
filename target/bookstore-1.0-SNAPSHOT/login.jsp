<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>登录</title>
    <link href="<%=path%>/css/login.css" rel="stylesheet">
</head>



<body background="<%=path %>/static/images/table.png"
	  style="background-repeat:no-repeat;
               background-attachment:fixed;
               background-size:100% 100%;
               -moz-background-size: 100% 100%;
               height: 100%;
               width: 100%;
               overflow: hidden;
               margin: 0;
               padding: 0;
">


<div id="loginDiv" style="align-content: center; position: absolute; top: 25%">
    <form action="<%=path %>/userLogin" id="form" method="post">
        <h1 id="loginMsg">登录</h1>
        <p>名 称:<input id="username" name="username" type="text"></p>
        <p>密 码:<input id="password" name="password" type="password"></p>
        <div id="subDiv">
            <input type="submit" class="button" value="登录">
            <input type="reset" class="button" value="重置">
            <a href="<%=path%>/register.jsp">没有账号？点击注册</a>
        </div>
    </form>
</div>


<script src="<%=path %>/static/lib/jquery/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="<%=path %>/static/lib/bootstrap-3.4.1-dist/css/bootstrap.min.css">
<script src="<%=path %>/static/lib/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">

    $(function() {
    });
</script>
</body>
</html>