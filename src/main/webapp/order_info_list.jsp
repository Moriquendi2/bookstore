<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String path = request.getContextPath();%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>订单列表</title>

</head>



<%--<body background="<%=path %>/static/images/library.png"--%>
<%--	  style="background-repeat:no-repeat;--%>
<%--               background-attachment:fixed;--%>
<%--               background-size:100% 100%;">--%>

<%--<body style="background-color: #e7c3c3">--%>
<body>

<div class="container">
    <!-- <nav class="navbar navbar-inverse">  -->
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <%--                <a class="navbar-brand" href="<%=path %>/userLogin?username=${entity.name}&password=${entity.password}">用户管理系统</a>--%>
                <a class="navbar-brand">网上书城</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a>欢迎您，${current_user.type } ${current_user.name }!</a>
                </li>
                <li>
                    <a href="<%=path %>/login.jsp" >退出登录</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a target="_target" href="https://github.com/Moriquendi2/bookstore">项目github地址</a></li>
                        <%--                            <li><a target="_target" href="https://blog.csdn.net/qq_38762237/category_10241167.html">Spring</a></li>--%>
                        <%--                            <li><a target="_target" href="https://blog.csdn.net/qq_38762237/category_7812790.html">SpringBoot</a></li>--%>
                        <%--                            <li role="separator" class="divider"></li>--%>
                        <%--                            <li><a href="https://github.com/tellsea">Github</a></li>--%>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>

    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <%--				<a href="javascript:history.back(-1)">首页</a>--%>
                <a href="<%=path %>/user/userInfoUpdate_jump?id=${current_user.id }" class="list-group-item">修改用户信息</a>
                <a onclick="javascript:goods_infolist()" class="list-group-item">查看商城</a>
                <a onclick="javascript:order_infolist()" class="list-group-item">订单列表</a>
                <a onclick="javascript:manager_goods_infolist()" class="list-group-item">管理商品</a>
                <a onclick="javascript:manager_goods_add()" class="list-group-item">添加商品</a>
                    <a onclick="javascript:manager_goods_loglist()" class="list-group-item">用户购买日志记录</a>
                    <a onclick="javascript:user_save()" class="list-group-item">添加用户</a>
                <a onclick="user_infolist()" class="list-group-item">用户列表</a>
            </div>
        </div>


        <div class="col-md-10" style="opacity: 1">

            <table class="table" style="opacity: 1">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>用户名</th>
                    <th>商品名</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>总价</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <%--		  	<c:forEach items="${userInfoList}" var="entity" varStatus="status">--%>
                <c:forEach items="${Order}" var="entity" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${entity.user_name}</td>
                        <td>${entity.goods_name }</td>
                        <td>${entity.price }</td>
                        <td>${entity.num}</td>
                        <td>${entity.total_price }</td>
                        <td>${entity.state }</td>
                        <td>
                            <button onclick="javascript:todel(${entity.user_id }, ${entity.goods_id })" type="button"
                                    class="btn btn-danger" id="delete">删除</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->

                    <div class="navbar-header" style="vertical-align: center">
                        <a class="navbar-brand">未结算金额：${Unpay}</a>
                    </div>

                    <button onclick="javascript:jiesuan(${current_user.id})" type="button"
                            class="btn btn-primary" id="jiesuan">结算</button>

                </div><!-- /.navbar-collapse -->
            </nav>




        </div>
    </div>
</div>

<script src="<%=path %>/static/lib/jquery/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="<%=path %>/static/lib/bootstrap-3.4.1-dist/css/bootstrap.min.css">
<script src="<%=path %>/static/lib/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">

    function user_infolist() {
        <%--window.location.href = "<%=path %>/user/selectByPage?currentPage=" + currentPage + "&pageSize=" + pageSize +--%>
        <%--    "&username=" + username + "&type=" + type ;--%>
        if ("${current_user.type}" === "管理员")
        {
            window.location.href = "<%=path %>/user/selectByPage?currentPage=1&pageSize=10&username=0&type=0";
        }
        else
        {
            alert("您没有管理员权限，无法进行操作！");
        }
    }
    function user_save() {
        if ("${current_user.type}" === "管理员"){
            window.location.href = "<%=path %>/user/userInfoSave_jump";
        }
        else {
            alert("您没有管理员权限，无法进行操作！");
        }
    }
    function todel(user_id, goods_id) {
        if (confirm("您确定要删除该订单吗？") && "${current_user.type}" === "用户") {
            window.location.href = "<%=path %>/goods/orderInfoDelete?user_id=" + user_id
             + "&goods_id=" + goods_id;
        }
    }
    function jiesuan(user_id) {
        if (confirm("您确定要结算未支付的商品吗？") && "${current_user.type}" === "用户") {
            window.location.href = "<%=path %>/goods/orderSettlement?user_id=" + user_id;
        }
    }


    function goods_infolist() {
        if ("${current_user.type}" === "用户"){
            window.location.href = "<%=path %>/goods/selectByPage?currentPage=1&pageSize=6&goodsname=0&type=0";
        }
        else {
            alert("用户才能查看商品界面！");
        }
    }
    function order_infolist() {
        if ("${current_user.type}" === "用户"){
            window.location.href = "<%=path %>/goods/order_list?user_id=" + "${current_user.id}";
        }
        else {
            alert("用户才能查看订单界面！");
        }
    }

    function manager_goods_infolist() {
        if ("${current_user.type}" === "商家"){
            window.location.href = "<%=path %>/goods/selectByPage_shop?currentPage=1&pageSize=6&goodsname=0&type=0&shop_id="
                + "${current_user.id}";
        }
        else {
            alert("商家才能查看和管理商品！");
        }
    }
    function manager_goods_add() {
        if ("${current_user.type}" === "商家"){
            window.location.href = "<%=path %>/goods/goodsInfoSave_jump?shop_id=" + "${current_user.id}";
        }
        else {
            alert("商家才能添加新的商品！");
        }
    }
    function manager_goods_loglist() {
        if ("${current_user.type}" === "商家"){
            window.location.href = "<%=path %>/goods/goodsLogInfo?shop_id=" + "${current_user.id}";
        }
        else {
            alert("商家才能查看用户购买日志记录！");
        }
    }





</script>
</body>
</html>