<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>登录</title>
<link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="lib/bootstrapValidator/css/bootstrapValidator.min.css">
<link rel="stylesheet" href="css/login.css">
<script src="lib/jquery/1.12.4/jquery.min.js"></script>
<script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="lib/bootstrapValidator/js/bootstrapValidator.min.js"></script>
<script src="js/login.js"></script>
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
});
</script>
</head>

<body>
	<div class="top">
		<div class="navbar navbar-default">
			<div class="container clearfix">
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
	<div class="main">
		<div class="container container-small">
			<h2>唯有美食与爱不可辜负，请登录！</h2>
			<form action="user" method="post">
				<input type="hidden" name="oper" value="login">
				<div class="form-group">
					<label>用户名</label> <input type="text" class="form-control"
						name="username">
				</div>
				<div class="form-group">
					<label>密码</label> <input type="password" class="form-control"
						name="password">
				</div>
				<button type="submit" class="btn btn-warning btn-block">登录</button>
			</form>
			<div class="register">
				<span>震惊！你居然没有账号?</span> <a href="register.jsp">点这里</a>
			</div>
		</div>
	</div>
</body>

</html>