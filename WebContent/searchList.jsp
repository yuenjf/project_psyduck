<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${searchp.searchKeyword}_可达鸭美食指南</title>
<link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/searchList.css">
<script src="lib/jquery/1.12.4/jquery.min.js"></script>
<script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/searchList.js"></script>
<script type="text/javascript">
$(function() {
	/*
	 * 登录功能
	 */
	if (${sessionScope.user!=null}) {
		$(".login-before").addClass("hidden");
		$(".login-after").removeClass("hidden");
	}
	/*
	 * 用户退出功能
	 */
	$("#out").click(function() {
		var flag = window.confirm("你真的要退出吗？");
		if (flag) {
			// 修改地址栏信息，并发起一个新的请求
			window.location.href = "user?oper=out";
		}
	});
	/*
	 * 根据LI的值判断进入第几个tab
	 */
	if(${homep.li==1}) {
		$('.nav-tabs li:eq(1) a').tab('show');
	} else {
		$('.nav-tabs li:eq(2) a').tab('show');
	}
	/*
	 * 分类功能
	 	第一：判断拿到的List是否为空，如果为空，显示noResult内容,隐藏分页按钮
	 	第二：判断当前页，如果为第一页，则不能按上一页，若果为最后一页，则不能按下一页
	 */
	if(${searchp.searchPageDetail==null}) {
		$(".noResult").removeClass("hidden");
		$(".page").addClass("hidden");
	}
	
	if(${searchp.currentPage==1}){
		$(".page>ul>li:eq(0)").addClass("disabled");
		$(".page>ul>li:eq(0)>a").attr("href","javascript:;");
	}
	if(${searchp.currentPage}==${searchp.totlePage}){
		$(".page>ul>li:eq(1)").addClass("disabled");
		$(".page>ul>li:eq(1)>a").attr("href","javascript:;");
	}
});
</script>
</head>

<body>
	<!-- top -->
	<div class="top clearfix">
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<span class="navbar-brand">Psyduck</span>
				</div>
				<!-- navbar-nav 导航 -->
				<ul class="nav navbar-nav">
					<li><a href="index">首页</a></li>
					<li><a class="login-before" href="login.jsp">作品动态</a></li>
					<li><a class="login-before" href="login.jsp">收藏菜谱</a></li>
					<li><a class="login-after hidden"
						href="homePage?userId=${sessionScope.user.userId}&li=1">作品动态</a></li>
					<li><a class="login-after hidden"
						href="homePage?userId=${sessionScope.user.userId}&li=2">收藏菜谱</a></li>
				</ul>
				<!-- 没有浮动，用navbar-left -->
				<form class="navbar-form navbar-left" action="recipeSearch" method="post">
					<div class="form-group">
						<input type="text" class="form-control" name="searchKeyword">
					</div>
					<button type="submit" class="btn btn-warning">提交</button>
				</form>
				<!-- navbar-right 右浮动 -->
				<ul class="nav navbar-nav navbar-right login-before">
					<li><a href="login.jsp">登录</a></li>
					<li><a href="register.jsp">注册</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right login-after hidden">
					<li><a href="homePage?userId=${sessionScope.user.userId}">${sessionScope.user.username}</a></li>
					<li><a href="javascript:void(0)" id="out">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- main -->
	<div class="mian">
		<div class="container clearfix">
			<!-- 侧边栏 side-bar -->
			<div class="side-bar col-md-2">
				<div class="list-group">
					<a href="recipeCategory?item=1&categoryName=家常菜"
						class="list-group-item">家常菜</a> <a
						href="recipeCategory?item=2&categoryName=快手菜"
						class="list-group-item">快手菜</a> <a
						href="recipeCategory?item=3&categoryName=下饭菜"
						class="list-group-item">下饭菜</a> <a
						href="recipeCategory?item=4&categoryName=早餐"
						class="list-group-item">早餐</a> <a
						href="recipeCategory?item=5&categoryName=午餐"
						class="list-group-item">午餐</a> <a
						href="recipeCategory?item=6&categoryName=肉"
						class="list-group-item">肉</a> <a
						href="recipeCategory?item=7&categoryName=鱼"
						class="list-group-item">鱼</a> <a
						href="recipeCategory?item=8&categoryName=蔬菜"
						class="list-group-item">蔬菜</a> <a
						href="recipeCategory?item=9&categoryName=汤羹"
						class="list-group-item">汤羹</a> <a
						href="recipeCategory?item=10&categoryName=烘焙"
						class="list-group-item">烘焙</a> <a
						href="recipeCategory?item=11&categoryName=凉菜"
						class="list-group-item">凉菜</a> <a
						href="recipeCategory?item=12&categoryName=主食"
						class="list-group-item">主食</a> <a
						href="recipeCategory?item=13&categoryName=面食"
						class="list-group-item">面食</a> <a
						href="recipeCategory?item=14&categoryName=素食"
						class="list-group-item">素食</a>
				</div>
			</div>
			<div class="col-md-7">
				<div class="rec-list">
					<h2>关于“${searchp.searchKeyword}”的食谱</h2>
					<ul>
						<c:forEach items="${searchp.searchPageDetail}" var="i">
							<li class="clearfix">
								<div class="list-cover">
									<a href="recipeDetail?recipeId=${i.recipeId}"> <img
										class="col-md-6" src="${i.coverPath}" alt="${i.title}">
									</a>
								</div>
								<div class="col-md-6">
									<a class="list-title"
										href="recipeDetail?recipeId=${i.recipeId}">${i.title}</a> <a
										class="list-author" href="homePage?userId=${i.userId}">${i.username} </a>
								</div>
							</li>
						</c:forEach>
					</ul>
					<h3 class="noResult hidden">此关键词还没有菜谱，赶紧去创建一个吧！</h3>
					<!-- 分页按钮 -->
					<div class="page">
						<ul class="pager">
							<li><a href="recipeSearch?searchKeyword=${searchp.searchKeyword}&searchCurrentPage=${categoryp.currentPage-1}">上一页</a></li>
							<li><a href="recipeSearch?searchKeyword=${searchp.searchKeyword}&searchCurrentPage=${categoryp.currentPage+1}">下一页</a></li>
							<li class="page-info">第${searchp.currentPage}/${searchp.totlePage}页</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="other-side">
					<div class="user-info img-rounded">
						<!-- 头像 -->
						<div class="protrait">
							<img class="img-circle" src="img/protrait.svg" alt="protrait"
								width="80px" height="80px">
						</div>
						<div class="name login-before">
							<a href="login.jsp">登陆</a> <span>/</span> <a href="register.jsp">注册</a>
						</div>
						<div class="name login-after hidden">
							<a href="homePage?userId=${sessionScope.user.userId}">${sessionScope.user.username}</a>
						</div>
						<div class="action">
							<a class="btn btn-warning login-before" type="submit"
								href="login.jsp">创建菜谱</a> <a
								class="btn btn-warning login-after hidden" type="submit"
								href="createRecipe.jsp">创建菜谱</a>
						</div>
						<div class="report-link">
							<span>唯有美食与爱不可辜负</span>
							<!-- <a href="http://report.12377.cn:13225/toreportinputNormal_anis.do?spm=a21bo.2017.0.0.5af911d92IZENm&file=toreportinputNormal_anis.do">网上不良信息举报专区</a> -->
						</div>
					</div>
					<div class="footer img-rounded">
						<div class="row-1">
							<span>可达鸭美食指南</span> <span>·</span> <span>厨房工作</span> <span>·</span>
							<span>社区原则</span>
						</div>
						<div class="row-2">
							<span>侵权举报</span> <span>·</span> <span>网上有害信息举报专区</span>
						</div>
						<div class="row-3">违法和不良信息举报：010-82716601</div>
						<div class="row-4">Copyright © psyduck.com</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bottom -->
	<div class="bottom clearfix">
		<!-- 回到顶部按钮 -->
		<div id="returnTop" class="pull-right" title="回到顶部">
			<img src="img/returnTop.svg" alt="returnTop">
		</div>
	</div>
</body>

</html>