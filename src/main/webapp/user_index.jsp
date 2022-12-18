<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
</head>



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
                <a href="<%=path %>/user/userInfoUpdate_jump?id=${current_user.id }" class="list-group-item">修改用户信息</a>
                <a onclick="javascript:goods_infolist()" class="list-group-item">查看商城</a>
                <a onclick="javascript:order_infolist()" class="list-group-item">订单列表</a>
                <a onclick="javascript:manager_goods_infolist()" class="list-group-item">管理商品</a>
                <a onclick="javascript:manager_goods_add()" class="list-group-item">添加商品</a>
                <a onclick="javascript:manager_goods_loglist()" class="list-group-item">用户购买日志记录</a>
<%--                <a href="<%=path %>/user/userInfoSave_jump" class="list-group-item">添加用户</a>--%>
                <a onclick="javascript:user_save()" class="list-group-item">添加用户</a>
<%--                <a href="<%=path %>/user/userInfoList" class="list-group-item">用户列表</a>--%>
                <a onclick="javascript:user_infolist()" class="list-group-item">用户列表</a>

            </div>
        </div>
        <div class="col-md-10">
            <div class="jumbotron">
                <h1>欢迎光临网上书城！</h1>
                <p>在这里您可以尽情浏览、订购与评价丰富的图书</p>
<%--                <p><a class="btn btn-primary btn-lg"--%>
<%--                      href="<%=path %>/userLogin"--%>
<%--                      role="button">进入用户管理系统</a></p>--%>
            </div>

            <div id="hot-products" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#hot-products" data-slide-to="0" class="active"></li>
                    <li data-target="#hot-products" data-slide-to="1"></li>
                    <li data-target="#hot-products" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="<%=path %>/static/images/ad1.png" class="img-responsive"/>
                        <div class="carousel-caption">
                            图片一
                        </div>
                    </div>
                    <div class="item">
                        <img src="<%=path %>/static/images/ad2.png" class="img-responsive"/>
                        <div class="carousel-caption">
                            图片二
                        </div>
                    </div>
                    <div class="item">
                        <img src="<%=path %>/static/images/ad3.png" class="img-responsive"/>
                        <div class="carousel-caption">
                            图片三
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#hot-products" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#hot-products" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>



        </div>
    </div>
</div>

<%--<div class="col-md-8">--%>
<%--    <form action="<%=path%>/userInfoUpdate" method="post">--%>
<%--        <div class="form-group">--%>
<%--            <label>姓名</label>--%>
<%--            <input type="text" name="name" value="${current_user.name }" class="form-control" placeholder="请输入姓名">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label>姓名</label>--%>
<%--            <input type="text" name="df" value="${current_user.type }" class="form-control" placeholder="请输入姓名">--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>


<script src="<%=path %>/static/lib/jquery/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="<%=path %>/static/lib/bootstrap-3.4.1-dist/css/bootstrap.min.css">
<script src="<%=path %>/static/lib/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    // 用于分页查询
    // var currentPage = 1;
    // var pageSize = 10;
    // // 用于条件查询，默认全部，这里不能用空字符串""，否则会读取后面的;，造成冲突
    // var username = "0";
    // var type = "0";

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