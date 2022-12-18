<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html >
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>欢迎注册</title>
    <link href="<%=path%>/css/register.css" rel="stylesheet">
</head>

<body background="<%=path %>/static/images/library.png"
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

<div class="form-div" style="align-content: center; position: absolute; top: 7%; left: 35%">
    <div class="reg-content">
        <h1>欢迎注册</h1>
        <span>已有帐号？</span> <a href="<%=path%>/login.jsp">登录</a>
    </div>
<%--    <form id="reg-form" action="<%=path %>/userSignUp" method="post" style="align-content: center">--%>

<%--        <table>--%>
<%--            <tr>--%>
<%--                <td>用户名</td>--%>
<%--                <td class="inputs">--%>
<%--                    <input name="username" type="text" id="username">--%>
<%--                    <br>--%>
<%--                    <span id="username_err" class="err_msg" style="display: none">用户名不太受欢迎</span>--%>
<%--                </td>--%>

<%--            </tr>--%>

<%--            <tr>--%>
<%--                <td>密码</td>--%>
<%--                <td class="inputs">--%>
<%--                    <input name="password" type="password" id="password">--%>
<%--                    <br>--%>
<%--                    <span id="password_err" class="err_msg" style="display: none">密码格式有误</span>--%>
<%--                </td>--%>
<%--            </tr>--%>

<%--            <tr>--%>
<%--                <td>邮箱</td>--%>
<%--                <td class="inputs">--%>
<%--                    <input name="email" type="email" id="email">--%>
<%--                    <br>--%>
<%--                    <span id="email_err" class="err_msg" style="display: none">邮箱格式有误</span>--%>
<%--                </td>--%>
<%--            </tr>--%>

<%--            <tr>--%>
<%--                <td>电话</td>--%>
<%--                <td class="inputs">--%>
<%--                    <input name="telephone" type="tel" id="telephone">--%>
<%--                    <br>--%>
<%--                    <span id="tel_err" class="err_msg" style="display: none">电话格式有误</span>--%>
<%--                </td>--%>
<%--            </tr>--%>

<%--            <tr>--%>
<%--                <td>地址</td>--%>
<%--                <td class="inputs">--%>
<%--                    <input name="address" type="text" id="address">--%>
<%--                    <br>--%>
<%--                    <span id="address_err" class="err_msg" style="display: none">地址格式有误</span>--%>
<%--                </td>--%>
<%--            </tr>--%>


<%--        </table>--%>




<%--    <div class="form-group">--%>
<%--        <label>姓名</label>--%>
<%--        <input type="text" name="name" class="form-control" placeholder="请输入姓名">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label>密码</label>--%>
<%--        <input type="password" name="password" class="form-control" placeholder="请输入密码">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label>邮箱</label>--%>
<%--        <input type="text" name="email" class="form-control" placeholder="请输入邮箱">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label>电话</label>--%>
<%--        <input type="text" name="telephone" class="form-control" placeholder="请输入电话号码">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label>地址</label>--%>
<%--        <input type="text" name="address" class="form-control" placeholder="请输入地址">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <label>账户类型</label>--%>
<%--        <input type="radio" name="type" value="用户" id="user"> <label for="user">用户</label>--%>
<%--        <input type="radio" name="type" value="商家" id="store"> <label for="store">商家</label>--%>
<%--    </div>--%>



<%--        <div class="buttons">--%>
<%--            <input value="注册" type="submit" id="reg_btn">--%>
<%--&lt;%&ndash;            <input type="submit" class="button" value="注册">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <input type="reset" class="button" value="重置">&ndash;%&gt;--%>
<%--        </div>--%>
<%--        <br class="clear">--%>


<%--    <form action="<%=path %>/userSignUp" id="form" method="post" style="align-content: center">--%>

<%--    <p>姓 名:<input id="username" name="username" type="text"></p>--%>
<%--    <p>密 码:<input id="password" name="password" type="password"></p>--%>
<%--    <p>邮 箱:<input id="email" name="email" type="text"></p>--%>
<%--    <p>电 话:<input id="telephone" name="telephone" type="text"></p>--%>
<%--    <p>地 址:<input id="address" name="address" type="text"></p>--%>
<%--    <p>--%>
<%--        <label>账户类型</label>--%>
<%--        <input type="radio" name="type" value="用户" id="user"> <label for="user">用户</label>--%>
<%--        <input type="radio" name="type" value="商家" id="store"> <label for="store">商家</label>--%>
<%--    </p>--%>

<%--    <div>--%>
<%--        <input type="submit" class="btn btn-primary" value="注册">--%>
<%--        <input type="reset" class="btn btn-default" value="重置">--%>
<%--    </div>--%>

<%--    </form>--%>

    <form action="<%=path%>/userSignUp" method="post" style="align-content: center">

            <label>姓名</label>
            <input type="text" name="name" class="form-control" placeholder="请输入姓名">

            <label>密码</label>
            <input type="password" name="password" class="form-control" placeholder="请输入密码">

            <label>邮箱</label>
            <input type="text" name="email" class="form-control" placeholder="请输入邮箱">

            <label>电话号码</label>
            <input type="text" name="telephone" class="form-control" placeholder="请输入电话号码">

            <label>地址</label>
            <input type="text" name="address" class="form-control" placeholder="请输入地址">

            <label>账户类型</label>
            <input type="radio" name="type" value="用户" id="user"> <label for="user">用户</label>
            <input type="radio" name="type" value="商家" id="store"> <label for="store">商家</label>
        <br>
        <button type="submit" class="btn btn-primary">注册</button>
        <button type="reset" class="btn btn-default">重置</button>
    </form>

</div>



<script src="<%=path %>/static/lib/jquery/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="<%=path %>/static/lib/bootstrap-3.4.1-dist/css/bootstrap.min.css">
<script src="<%=path %>/static/lib/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">

    $("#user").prop('checked', true); //radio默认选中


</script>
</body>
</html>