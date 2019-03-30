<%@page import="yjf.psyd.bean.HomePage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${homep.username}的主页_可达鸭美食指南</title>
<link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/homepage.css">
<script src="lib/jquery/1.12.4/jquery.min.js"></script>
<script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/homepage.js"></script>
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
	 *删除菜谱
	 */
	$(".rec-remove").click(function() {
		var flag = window.confirm("你真的要是删除吗？");
		if (flag) {
			// 选择确定直接把a链接的请求发个servlet
		}else{
			// 选择取消返回false
			return false;
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
	 * 作品动态分页功能
	 	第一：判断拿到的List是否为空，如果为空，显示noResult内容,隐藏分页按钮
	 	第二：判断当前页，如果为第一页，则不能按上一页，若果为最后一页，则不能按下一页
	 */	
	if(${homep.createDetail==null}) {
		$("#recipe>.noResult").removeClass("hidden");
		$("#recipe>.page").addClass("hidden");
	}
	
	if(${homep.createCurrentPage==1}){
		$("#recipe>.page>ul>li:eq(0)").addClass("disabled");
		$("#recipe>.page>ul>li:eq(0)>a").attr("href","javascript:;");
	}
	if(${homep.createCurrentPage}==${homep.createTotlePage}){
		$("#recipe>.page>ul>li:eq(1)").addClass("disabled");
		$("#recipe>.page>ul>li:eq(1)>a").attr("href","javascript:;");
	}
	/*
	 * 菜谱收藏分页功能
	 	第一：判断拿到的List是否为空，如果为空，显示noResult内容,隐藏分页按钮
	 	第二：判断当前页，如果为第一页，则不能按上一页，若果为最后一页，则不能按下一页
	 */	
	if(${homep.collectionDetail==null}) {
		$("#collection>.noResult").removeClass("hidden");
		$("#collection>.page").addClass("hidden");
	}
	
	if(${homep.collectionCurrentPage==1}){
		$("#collection>.page>ul>li:eq(0)").addClass("disabled");
		$("#collection>.page>ul>li:eq(0)>a").attr("href","javascript:;");
	}
	if(${homep.collectionCurrentPage}==${homep.collectionTotlePage}){
		$("#collection>.page>ul>li:eq(1)").addClass("disabled");
		$("#collection>.page>ul>li:eq(1)>a").attr("href","javascript:;");
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
	<div class="mian container">
		<div class="homepage-top">
			<div class="col-md-3">
				<div class="top-protrait">
					<img class="img-circle" src="img/protrait.svg" alt="">
				</div>
			</div>
			<div class="col-md-9">
				<div class="top-title">
					<h1>${homep.username}的个人主页</h1>
				</div>
				<div class="top-info">${homep.createDate}加入</div>
			</div>
		</div>
		<div class="homepage-main">
			<div class="main-tabs">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="#profile" data-toggle="tab">个人简介</a></li>
					<li><a href="#recipe" data-toggle="tab">作品动态</a></li>
					<li><a href="#collection" data-toggle="tab">菜谱收藏</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane fade" id="profile">
						<h3 class="noResult">这个人很懒，什么都没留下！</h3>
					</div>
					<div class="tab-pane fade" id="recipe">
						<c:forEach items="${homep.createDetail}" var="i">
							<div class="cate-list-item img-rounded col-md-4">
								<a href="recipeDetail?recipeId=${i.recipeId}"><img
									class="img-rounded" src="${i.coverPath}" alt="${i.title}">
								</a>
								<div class="name">
									<a href="recipeDetail?recipeId=${i.recipeId}">${i.title}</a>
								</div>
								<c:set var="reqUserId" value="${homep.userId}" />
								<c:set var="sessionUserId" value="${sessionScope.user.userId}" />
								<c:if test="${reqUserId==sessionUserId}">
									<a class="rec-remove"
										href="recipeDelete?recipeId=${i.recipeId}&userId=${homep.userId}">
										<span class="glyphicon glyphicon-remove" title="删除菜谱"></span>
									</a>
								</c:if>
							</div>
						</c:forEach>
						<h3 class="noResult hidden">还没有创建菜谱，赶紧去创建一个吧！</h3>
						<!-- 分页按钮 -->
						<div class="page container">
							<ul class="pager">
								<li><a
									href="homePage?userId=${homep.userId}&li=1&createCurrentPage=${homep.createCurrentPage-1}">上一页</a></li>
								<li><a
									href="homePage?userId=${homep.userId}&li=1&createCurrentPage=${homep.createCurrentPage+1}">下一页</a></li>
								<li class="page-info">第${homep.createCurrentPage}/${homep.createTotlePage}页</li>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade" id="collection">
						<c:forEach items="${homep.collectionDetail}" var="j">
							<div class="cate-list-item img-rounded col-md-4">
								<a href="recipeDetail?recipeId=${j.recipeId}"><img
									class="img-rounded" src="${j.coverPath}" alt="${j.title}">
								</a>
								<div class="name">
									<a href="recipeDetail?recipeId=${j.recipeId}">${j.title}</a>
								</div>
							</div>
						</c:forEach>
						<h3 class="noResult hidden">还没有创建菜谱，赶紧去创建一个吧！</h3>
						<!-- 分页按钮 -->
						<div class="page container">
							<ul class="pager">
								<li><a
									href="homePage?userId=${homep.userId}&li=2&collectionCurrentPage=${homep.collectionCurrentPage-1}">上一页</a></li>
								<li><a
									href="homePage?userId=${homep.userId}&li=2&collectionCurrentPage=${homep.collectionCurrentPage+1}">下一页</a></li>
								<li class="page-info">第${homep.collectionCurrentPage}/${homep.collectionTotlePage}页</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="homepage-bottom"></div>
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