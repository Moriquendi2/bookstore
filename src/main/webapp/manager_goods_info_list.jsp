<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商城主页</title>
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

            <div>
                <!-- Single button -->
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        商品类型 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a onclick="jump3('0')">全部</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a onclick="jump3('经典')">经典</a></li>
                        <li><a onclick="jump3('科幻')">科幻</a></li>
                        <li><a onclick="jump3('历史')">历史</a></li>
                        <li><a onclick="jump3('外文原著')">外文原著</a></li>
                        <li><a onclick="jump3('纪实')">纪实</a></li>
                        <li><a onclick="jump3('畅销小说')">畅销小说</a></li>
                    </ul>
                </div>

                <div class="col-lg-4" style="float: right">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="输入书名以查询" id="search2">
                        <span class="input-group-btn">
                     <button class="btn btn-default" type="submit" onclick="jump2()">搜索</button>
				  </span>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>

<%--            <table class="table" style="opacity: 1">--%>
<%--                <thead>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                &lt;%&ndash;           <script>&ndash;%&gt;--%>
<%--                &lt;%&ndash;               var index = 0;&ndash;%&gt;--%>
<%--                &lt;%&ndash;           </script>&ndash;%&gt;--%>
<%--                &lt;%&ndash;            <% int index = 0; %>&ndash;%&gt;--%>
<%--                <c:forEach items="${Find1.rows}" var="entity" varStatus="status">--%>
<%--                    &lt;%&ndash;                <script>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    if (index % 3 === 0) {&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                        document.write("<br>");&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    }&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                </script>&ndash;%&gt;--%>

<%--                    &lt;%&ndash;                <% if (index % 3 == 0) {&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    out.println("<br><br><br>");&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    //System.out.println(index);&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                }&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                %>&ndash;%&gt;--%>
<%--                    <div class="col-md-4" style="height: auto">--%>
<%--                        <div class="thumbnail product">--%>
<%--                            <a><img src="<%=path %>/static/images/${entity.image_path}" alt="商品图片" style="width:101.99px;height:135.57px"></a>--%>
<%--                            <div class="caption">--%>
<%--                                    &lt;%&ndash;                            <td>${status.index + 1 + (Queryinfo.currentPage - 1) * Queryinfo.pageSize}</td>&ndash;%&gt;--%>
<%--                                <h3>${entity.name}</h3>--%>
<%--                                <p>作者：${entity.author}</p>--%>
<%--                                <p>${entity.description}</p>--%>
<%--                                    &lt;%&ndash;                            <p><del>原价：￥299.00</del>&nbsp;&nbsp;现价：<strong>￥199.00</strong></p>&ndash;%&gt;--%>
<%--                                    &lt;%&ndash;                            <p>月销量：500&nbsp;&nbsp;评价数：5000</p>&ndash;%&gt;--%>
<%--                                <p>得分：${entity.score}   类型：${entity.type}</p>--%>
<%--                                <p><strong>价格：${entity.price}</strong></p>--%>

<%--                                <p>--%>
<%--                                    <a class="btn btn-primary" type="submit" onclick="manager_goods_update(${entity.id})" >修改</a>--%>
<%--                                    <a class="btn btn-danger" type="submit" onclick="manager_goods_remove('${entity.id}', '${entity.image_path}')" >删除</a>--%>
<%--                                </p>--%>

<%--                            </div>--%>
<%--                            <span class="label label-success new">新品</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    &lt;%&ndash;                <script>index++;</script>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                <%index = index + 1;%>&ndash;%&gt;--%>
<%--                </c:forEach>--%>
<%--                </tbody>--%>
<%--            </table>--%>

            <c:forEach items="${Find1.rows}" var="entity" varStatus="status">
                <table class="table" style="width: 100%">
                    <tbody>
                    <tr class="item">
                        <td width="100" valign="top">
                            <a><img src="<%=path %>/static/images/${entity.image_path}" alt="商品图片" style="width:120px;height:160px"></a>
                        </td>
                        <td valign="top">
                            <h3>${entity.name}</h3>
                            <p>作者：${entity.author}</p>
                            <p>   ${entity.description}</p>
                            <p>得分：${entity.score}   类型：${entity.type}</p>
                            <p>商家：${entity.shop_name}</p>
                            <p><strong>价格：${entity.price}</strong></p>

                            <p>
                                <a class="btn btn-primary" type="submit" onclick="manager_goods_update(${entity.id})" >修改</a>
                                <a class="btn btn-danger" type="submit" onclick="manager_goods_remove('${entity.id}', '${entity.image_path}')" >删除</a>
                            </p>

                            <span class="label label-success new">新品</span>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </c:forEach>



            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->

                    <div class="navbar-header" style="vertical-align: center">
                        <a class="navbar-brand">共${Find1.totalCount }条信息</a>
                    </div>

                    <ul class="nav navbar-nav navbar-left" style="vertical-align: center">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">每页显示信息条数 <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a onclick="change_pageSize(6)">6条/页</a></li>
                                <li><a onclick="change_pageSize(9)">9条/页</a></li>
                                <li><a onclick="change_pageSize(12)">12条/页</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a onclick="change_pageSize(6)">默认</a></li>
                            </ul>
                        </li>
                    </ul>


                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <a onclick="before()" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li><a onclick="change_currentPage(1)">1</a></li>
                            <li><a onclick="change_currentPage(2)">2</a></li>
                            <li><a onclick="change_currentPage(3)">3</a></li>
                            <li><a onclick="change_currentPage(4)">4</a></li>
                            <li><a onclick="change_currentPage(5)">5</a></li>
                            <li><a onclick="change_currentPage(6)">6</a></li>
                            <li><a onclick="change_currentPage(7)">7</a></li>
                            <li><a onclick="change_currentPage(8)">8</a></li>
                            <li><a onclick="change_currentPage(9)">9</a></li>
                            <li><a onclick="change_currentPage(10)">10</a></li>
                            <li>
                                <a onclick="next(${Find1.totalCount })" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>

                    <div class="col-lg-2" style="float: right">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="输入页数以跳转" id="search1">
                            <span class="input-group-btn">
                     <button class="btn btn-default" type="submit" onclick="jump1()">跳转</button>
                          </span>
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 -->


                </div><!-- /.navbar-collapse -->
            </nav>




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
    var currentPage = 1;
    var pageSize = 6;
    // 用于条件查询，默认全部，这里不能用空字符串""，否则会读取后面的;，造成冲突
    var goodsname = "0";
    var type = "0";
    var shop_id = ${current_user.id};
    $(function() {
        //alert("${Queryinfo1.currentPage} ${Queryinfo1.pageSize} ${Queryinfo1.username} ${Queryinfo1.type}");
        currentPage = ${Queryinfo1.currentPage};
        pageSize = ${Queryinfo1.pageSize};
        goodsname =  "${Queryinfo1.username}";
        type = "${Queryinfo1.type}";
        shop_id = ${Shop_id};
    });

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
        window.location.href = "<%=path %>/goods/selectByPage_shop?currentPage=" + currentPage + "&pageSize=" + pageSize +
            "&goodsname=" + goodsname + "&type=" + type + "&shop_id=" + shop_id;
    }
    function change_pageSize(ps) {
        pageSize = ps;
        window.location.href = "<%=path %>/goods/selectByPage_shop?currentPage=" + currentPage + "&pageSize=" + pageSize +
            "&goodsname=" + goodsname + "&type=" + type + "&shop_id=" + shop_id;
    }
    function change_currentPage(cp) {
        currentPage = cp;
        window.location.href = "<%=path %>/goods/selectByPage_shop?currentPage=" + currentPage + "&pageSize=" + pageSize +
            "&goodsname=" + goodsname + "&type=" + type + "&shop_id=" + shop_id;
    }
    function before() {
        if (currentPage > 1) {
            currentPage -= 1;
        }
        window.location.href = "<%=path %>/goods/selectByPage_shop?currentPage=" + currentPage + "&pageSize=" + pageSize +
            "&goodsname=" + goodsname + "&type=" + type + "&shop_id=" + shop_id;
    }
    function next(total) {
        var max = ( total / pageSize ) ;
        if (currentPage < max) {
            currentPage += 1;
        }
        window.location.href = "<%=path %>/goods/selectByPage_shop?currentPage=" + currentPage + "&pageSize=" + pageSize +
            "&goodsname=" + goodsname + "&type=" + type + "&shop_id=" + shop_id;
    }
    // 分页条的跳转
    function jump1() {
        if ($('#search1').val() !== "")
        {
            currentPage = $('#search1').val();
            window.location.href = "<%=path %>/goods/selectByPage_shop?currentPage=" + currentPage + "&pageSize=" + pageSize +
                "&goodsname=" + goodsname + "&type=" + type + "&shop_id=" + shop_id;
        }
        else
        {
            alert("输入内容为空！");
        }
    }
    // 用户名搜索框的跳转
    function jump2() {
        if ($('#search2').val() !== "")
        {
            goodsname = $('#search2').val();
            type = "0";
            window.location.href = "<%=path %>/goods/selectByPage_shop?currentPage=" + currentPage + "&pageSize=" + pageSize +
                "&goodsname=" + goodsname + "&type=" + type + "&shop_id=" + shop_id;
        }
        else
        {
            alert("输入内容为空！");
        }
    }
    // 用户类型的跳转
    function jump3(usertype) {
        type = usertype;
        goodsname = "0";
        window.location.href = "<%=path %>/goods/selectByPage_shop?currentPage=" + currentPage + "&pageSize=" + pageSize +
            "&goodsname=" + goodsname + "&type=" + type + "&shop_id=" + shop_id;
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
            window.location.href = "<%=path %>/goods/selectByPage_shop?currentPage=" + currentPage + "&pageSize=" + pageSize +
                "&goodsname=" + goodsname + "&type=" + type + "&shop_id=" + shop_id;
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
    // 删除商品
    function manager_goods_remove(goods_id, image_path) {
        if (confirm("您确定要删除该商品信息吗？") && "${current_user.type}" === "商家") {
            window.location.href = "<%=path %>/goods/goodsInfoDelete?shop_id=" + "${current_user.id}" +
            "&goods_id=" + goods_id + "&image_path=" + image_path;
        }
        else {
            alert("商家才能删除商品！");
        }
    }
    function manager_goods_update(goods_id) {
        if ("${current_user.type}" === "商家") {
            window.location.href = "<%=path %>/goods/goodsInfoUpdate_jump?goods_id=" + goods_id;
        }
        else {
            alert("商家才能更新商品！");
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