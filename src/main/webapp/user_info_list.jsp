<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String path = request.getContextPath();%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>

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
		  <!-- Single button -->
		  <div class="btn-group">
			  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				  用户类型 <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu">
				  <li><a onclick="jump3('0')">全部</a></li>
				  <li role="separator" class="divider"></li>
				  <li><a onclick="jump3('管理员')">管理员</a></li>
				  <li><a onclick="jump3('用户')">用户</a></li>
				  <li><a onclick="jump3('商家')">商家</a></li>
			  </ul>
		  </div>

		  <div class="col-lg-4" style="float: right">
			  <div class="input-group">
				  <input type="text" class="form-control" placeholder="输入用户名以查询" id="search2">
				  <span class="input-group-btn">
                     <button class="btn btn-default" type="submit" onclick="jump2()">搜索</button>
				  </span>
			  </div><!-- /input-group -->
		  </div><!-- /.col-lg-6 -->


	  	<table class="table" style="opacity: 1">
		  <thead>
		    <tr>
		     <th>序号</th>
			 <th>账户类型</th>
		     <th>姓名</th>
<%--		     <th>密码</th>--%>
		     <th>邮箱</th>
			 <th>电话</th>
		     <th>地址</th>
		     <th>操作</th>
		    </tr>
		  </thead>
		  <tbody>
<%--		  	<c:forEach items="${userInfoList}" var="entity" varStatus="status">--%>
			<c:forEach items="${Find.rows}" var="entity" varStatus="status">
			  	<tr>
	              <td>${status.index + 1 + (Queryinfo.currentPage - 1) * Queryinfo.pageSize}</td>
				  <td>${entity.type}</td>
	              <td>${entity.name }</td>
<%--	              <td>${entity.password }</td>--%>
	              <td>${entity.email }</td>
				  <td>${entity.telephone}</td>
	              <td>${entity.address }</td>
	              <td>
					  <button onclick="window.location.href='<%=path %>/user/userInfoUpdate_jump?id=${entity.id }'" type="button"
							  class="btn btn-primary" id="update">更新</button>
					  <button onclick="javascript:todel(${entity.id })" type="button"
							  class="btn btn-danger" id="delete">删除</button>
<%--					  <button onclick="window.location.href='<%=path %>/user/userInfoDelete?id=${entity.id }'" type="button"--%>
<%--							  class="btn btn-danger" id="delete">删除</button>--%>
	              </td>
	            </tr>
            </c:forEach>
		  </tbody>
		</table>


		  <nav class="navbar navbar-default">
			  <div class="container-fluid">
				  <!-- Brand and toggle get grouped for better mobile display -->

				  <div class="navbar-header" style="vertical-align: center">
					  <a class="navbar-brand">共${Find.totalCount }条信息</a>
				  </div>

				  <ul class="nav navbar-nav navbar-left" style="vertical-align: center">
					  <li class="dropdown">
						  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">每页显示信息条数 <span class="caret"></span></a>
						  <ul class="dropdown-menu">
							  <li><a onclick="change_pageSize(10)">10条/页</a></li>
							  <li><a onclick="change_pageSize(15)">15条/页</a></li>
							  <li><a onclick="change_pageSize(20)">20条/页</a></li>
							  <li role="separator" class="divider"></li>
							  <li><a onclick="change_pageSize(10)">默认</a></li>
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
							  <a onclick="next(${Find.totalCount })" aria-label="Next">
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

<script src="<%=path %>/static/lib/jquery/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="<%=path %>/static/lib/bootstrap-3.4.1-dist/css/bootstrap.min.css">
<script src="<%=path %>/static/lib/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	// 用于分页查询
	var currentPage = 1;
	var pageSize = 10;
	// 用于条件查询，默认全部，这里不能用空字符串""，否则会读取后面的;，造成冲突
	var username = "0";
	var type = "0";
	$(function() {
		//alert("${Queryinfo.currentPage} ${Queryinfo.pageSize} ${Queryinfo.username} ${Queryinfo.type}");
		currentPage = ${Queryinfo.currentPage};
		pageSize = ${Queryinfo.pageSize};
		username =  "${Queryinfo.username}";
		type = "${Queryinfo.type}";
	});

	function user_save() {
		if ("${current_user.type}" === "管理员"){
			window.location.href = "<%=path %>/user/userInfoSave_jump";
		}
		else {
			alert("您没有管理员权限，无法进行操作！");
		}
	}
	function todel(id) {
		if (confirm("您确定要删除该用户信息吗？若为商户，会一并删除商品和订单信息") && "${current_user.type}" === "管理员") {
			window.location.href = '<%=path %>/user/userInfoDelete?id=' + id;
		}
	}
	function user_infolist() {
		window.location.href = "<%=path %>/user/selectByPage?currentPage=" + currentPage + "&pageSize=" + pageSize +
				"&username=" + username + "&type=" + type ;
	}
	function change_pageSize(ps) {
		pageSize = ps;
		window.location.href = "<%=path %>/user/selectByPage?currentPage=" + currentPage + "&pageSize=" + pageSize +
				"&username=" + username + "&type=" + type ;
	}
	function change_currentPage(cp) {
		currentPage = cp;
		window.location.href = "<%=path %>/user/selectByPage?currentPage=" + currentPage + "&pageSize=" + pageSize +
				"&username=" + username + "&type=" + type ;
	}
	function before() {
		if (currentPage > 1) {
			currentPage -= 1;
		}
		window.location.href = "<%=path %>/user/selectByPage?currentPage=" + currentPage + "&pageSize=" + pageSize +
				"&username=" + username + "&type=" + type ;
	}
	function next(total) {
		var max = ( total / pageSize ) ;
		if (currentPage < max) {
			currentPage += 1;
		}
		window.location.href = "<%=path %>/user/selectByPage?currentPage=" + currentPage + "&pageSize=" + pageSize +
				"&username=" + username + "&type=" + type ;
	}
	// 分页条的跳转
	function jump1() {
		if ($('#search1').val() !== "")
		{
			currentPage = $('#search1').val();
			window.location.href = "<%=path %>/user/selectByPage?currentPage=" + currentPage + "&pageSize=" + pageSize +
					"&username=" + username + "&type=" + type ;
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
			username = $('#search2').val();
			type = "0";
			window.location.href = "<%=path %>/user/selectByPage?currentPage=" + currentPage + "&pageSize=" + pageSize +
					"&username=" + username + "&type=" + type ;
		}
		else
		{
			alert("输入内容为空！");
		}
	}
	// 用户类型的跳转
	function jump3(usertype) {
		type = usertype;
		username = "0";
		window.location.href = "<%=path %>/user/selectByPage?currentPage=" + currentPage + "&pageSize=" + pageSize +
				"&username=" + username + "&type=" + type ;
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