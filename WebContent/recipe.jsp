<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${requestScope.recipe.title}_可达鸭美食指南</title>
<link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/recipe.css">
<script src="lib/jquery/1.12.4/jquery.min.js"></script>
<script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/recipe.js"></script>
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
	 收藏按钮，用ajax实现收藏和已收藏
	 */
	 if(${recipe.isExistCollection}!=0){
		 var onOff = true;
		 $(".rec-collection").val("已收藏").css({
				"background" : '#f0ad4e'
			});
	 }else {
		 var onOff = false;
	 }
	$(".rec-collection").click(function() {
		if (onOff) {
			$.get(
					"http://localhost:8080/psyduck/recipeCollection",
					{
					"status":onOff,
					"RecipeId":${recipe.recipeId}
					},
					function(data) {
						var index = data.index;
						if(index>0){
							$(".rec-collection").val("收藏").css({
								"background" : '#ddd'
							});
							onOff = false;
						}
						return onOff;
					},
					"json"
				);
		} else {
			$.get(
					"http://localhost:8080/psyduck/recipeCollection",
					{
					"status":onOff,
					"RecipeId":${recipe.recipeId}
					},
					function(data) {
						var index = data.index;
						if(index>0){
							$(".rec-collection").val("已收藏").css({
								"background" : '#f0ad4e'
							});
							onOff = true;
						}
						return onOff;
					},
					"json"
				);
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
				<form class="navbar-form navbar-left" action="recipeSearch"
					method="post">
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
	<div class="main">
		<div class="container">
			<div class="col-md-1"></div>
			<div class="rec col-md-7">
				<div class="rec-title">
					<h1>${recipe.title}</h1>
				</div>
				<sapn class="rec-author"> 作者：<a
					href="homePage?userId=${recipe.userId}">${recipe.username}</a> </sapn>
				<sapn class="rec-date">${recipe.createDate}</sapn>
				<div class="rec-cover">
					<img src="${recipe.coverPath}" alt="${recipe.title}">
				</div>
				<div class="rec-info">${recipe.info}</div>
				<div class="rec-material">
					<h3>食材</h3>
					<div class="material-info">${recipe.material}</div>
				</div>
				<div class="rec-steps">
					<h3>步骤</h3>
					<ol>
						<!-- 遍历list输出step -->
						<c:forEach items="${recipeStep.info}" var="i"
							varStatus="infoStatus">
							<li class="clearfix"><span>
									<div class="col-md-5 text">
										<c:out value="${i}" />
									</div> <c:forEach items="${recipeStep.filePath}" var="j"
										varStatus="fileStatus">
										<c:if test="${infoStatus.index == fileStatus.index}">
											<img class="col-md-7" src="<c:out value="${j}" />">
										</c:if>
									</c:forEach>
							</span></li>
						</c:forEach>
					</ol>
					<div>
						<div class="col-md-4"></div>

						<input type="button" class="rec-collection col-md-4 btn btn-lg"
							value="收藏" name="rec-collection">
						<div class="col-md-4"></div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="other-side">
					<div class="user-info img-rounded">
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
			<div class="col-md-1"></div>
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