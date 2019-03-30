<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>注册</title>
<link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="lib/bootstrapValidator/css/bootstrapValidator.min.css">
<link rel="stylesheet" href="css/register.css">
<script src="lib/jquery/1.12.4/jquery.min.js"></script>
<script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="lib/bootstrapValidator/js/bootstrapValidator.min.js"></script>
<script src="js/register.js"></script>
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
	$(function() {
		$('form').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				username : {
					message : '用户名验证失败',
					// 每个validators对应一个json对象
					validators : {
						// 非空验证
						notEmpty : {
							message : '用户名不能为空'
						},
						// 字符串长度验证
						stringLength : {
							min : 6,
							max : 18,
							message : '用户名长度必须在6到18位之间'
						},
						// 正则表达式验证
						regexp : {
							regexp : /^[a-zA-Z0-9_]+$/,
							message : '用户名只能包含大写、小写、数字和下划线'
						},
						threshold: 6, //有2字符以上才发送ajax请求
	                    remote: { //ajax验证。server result:{"valid",true or false} 
	                        url: "http://localhost:8080/psyduck/user",
	                        message: '用户名已存在,请重新输入',
	                        delay: 1000, //ajax刷新的时间是1秒一次
	                        type: 'POST',
	                        //自定义提交数据，默认值提交当前input value
	                        data: function (validator) {
	                            return {
	                                username: $("input[name=username]").val(),
	                                oper: "checkUserName" //UserServlet判断调用方法关键字。
	                            };
	                        }
	                    }
					}
				},
				password : {
					validators : {
						notEmpty : {
							message : '密码不能为空'
						},
						stringLength : {
							min : 6,
							max : 18,
							message : '用户名长度必须在6到18之间'
						},
						// 密码与用户名相同验证
						different : {
							field : 'username',
							message : '密码不能与用户名相同'
						}
					}
				},
			}
		});
	});
	
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
			<h2>唯有美食与爱不可辜负，请注册！</h2>
			<form action="user" method="POST">
				<input type="hidden" name="oper" value="register" />

				<div class="form-group">
					<label class="hahaha">用户名</label> <input type="text"
						class=" input form-control" name="username"
						placeholder="用户名只能包含大写、小写、数字和下划线，长度为6-18位">
				</div>
				<div class="form-group">
					<label>密码</label> <input type="password" class="form-control"
						name="password" placeholder="请输入长度为6-18位的密码">
				</div>
				<button type="submit" class="btn btn-warning btn-block">注册</button>
				<div class="login">
					<span>已有账号？</span> <a href="login.jsp">登录</a>
				</div>
			</form>
		</div>
	</div>
</body>

</html>