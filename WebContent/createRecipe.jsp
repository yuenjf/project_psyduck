<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>创建菜谱_可达鸭美食指南</title>
<link rel="stylesheet" href="lib/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="lib/bootstrap-select/css/bootstrap-select.min.css">
<link rel="stylesheet" href="css/createRecipe.css">
<script src="lib/jquery/1.12.4/jquery.min.js"></script>
<script src="lib/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="lib/bootstrap-select/js/bootstrap-select.min.js"></script>
<script src="js/createRecipe.js"></script>
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
	Textarea输入内容时，自动换行和加空格
	 */
	 $(".rec-info>textarea").change(function () {
	 	var text = $(this).val();
	    var des = text.replace(/\r\n/g, '<br/>').replace(/\n/g, '<br/>').replace(/\s/g, ' ');
	    // 将修改后的值传入hidden的input中，再从input把值传到servlet
	    $(".rec-info>input").val(des);
	    
	 });
	 $(".rec-material>textarea").change(function () {
		 var text = $(this).val();
		 var des = text.replace(/\r\n/g, '<br/>').replace(/\n/g, '<br/>').replace(/\s/g, ' ');
		 $(".rec-material>input").val(des);
	});
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
			<div class="col-md-7">
				<form action="createRecipe" method="post"
					enctype="multipart/form-data">
					<!-- 菜谱名称 -->
					<div class="rec-title input-group input-group-lg"
						style="margin-top: 10px;">
						<span class="input-group-addon">菜谱名字</span> <input
							class="form-control" type="text" placeholder="" name="recTitle"
							required>
					</div>
					<!-- 菜谱封面 -->
					<div class="rec-cover">
						<span class="img-upload-info glyphicon glyphicon-plus">
							菜谱封面</span> <input type="file" class="img-upload" name="recCover"
							required /> <img class="img-view" src="" title="" /> <span
							class="img-upload-stop glyphicon glyphicon-remove" title="重新上传"></span>
					</div>
					<!-- 菜谱介绍 -->
					<div class="rec-info">
						<textarea class="form-control" rows="4" placeholder="请输入菜谱介绍"
							required></textarea>
						<input type="hidden" name="recInfo">
					</div>
					<!-- 食材 -->
					<div class="rec-material">
						<h3>食材</h3>
						<textarea class="form-control" rows="4" placeholder="请输入所需食材"
							required></textarea>
						<input type="hidden" name="recMaterial">
					</div>
					<!--  -->
					<div class="rec-steps">
						<h3>步骤</h3>
						<ol>
							<li class="clearfix"><span>
									<div class="col-md-5">
										<textarea class="form-control" rows="12" placeholder="请输入步骤"
											name="stepInfo"></textarea>
									</div>
									<div class="col-md-7 rec-step">
										<span class="img-upload-info glyphicon glyphicon-plus">
											步骤</span> <input type="file" class="img-upload" name="stepFile" />
										<img class="img-view" src="" title="" /> <span
											class="img-upload-stop glyphicon glyphicon-remove"
											title="重新上传"></span>
									</div>
									<div class="step-col">
										<div class="add-step glyphicon glyphicon-plus" title="添加步骤"></div>
										<div class="remove-step glyphicon glyphicon-minus"
											title="删除步骤"></div>
									</div>
							</span></li>
							<li class="clearfix"><span>
									<div class="col-md-5">
										<textarea class="form-control" rows="12" placeholder="请输入步骤"
											name="stepInfo"></textarea>
									</div>
									<div class="col-md-7 rec-step">
										<span class="img-upload-info glyphicon glyphicon-plus">
											步骤</span> <input type="file" class="img-upload" name="stepFile" />
										<img class="img-view" src="" title="" /> <span
											class="img-upload-stop glyphicon glyphicon-remove"
											title="重新上传"></span>
									</div>
									<div class="step-col">
										<div class="add-step glyphicon glyphicon-plus" title="添加步骤"></div>
										<div class="remove-step glyphicon glyphicon-minus"
											title="删除步骤"></div>
									</div>
							</span></li>
							<li class="clearfix"><span>
									<div class="col-md-5">
										<textarea class="form-control" rows="12" placeholder="请输入步骤"
											name="stepInfo"></textarea>
									</div>
									<div class="col-md-7 rec-step">
										<span class="img-upload-info glyphicon glyphicon-plus">
											步骤</span> <input type="file" class="img-upload" name="stepFile" />
										<img class="img-view" src="" title="" /> <span
											class="img-upload-stop glyphicon glyphicon-remove"
											title="重新上传"></span>
									</div>
									<div class="step-col">
										<div class="add-step glyphicon glyphicon-plus" title="添加步骤"></div>
										<div class="remove-step glyphicon glyphicon-minus"
											title="删除步骤"></div>
									</div>
							</span></li>
						</ol>
					</div>
					<div class="rec-btn">
						<select class="rec-category selectpicker" data-style="" multiple
							title="请选择分类" data-max-options="3" name="recCategory" required>
							<option value="1">家常菜</option>
							<option value="2">快手菜</option>
							<option value="3">下饭菜</option>
							<option value="4">早餐</option>
							<option value="5">午餐</option>
							<option value="6">肉</option>
							<option value="7">鱼</option>
							<option value="8">蔬菜</option>
							<option value="9">汤羹</option>
							<option value="10">烘焙</option>
							<option value="12">凉菜</option>
							<option value="13">主食</option>
							<option value="14">面食</option>
							<option value="15">素食</option>
						</select> <input class="rec-create btn btn-warning" type="submit"
							value="创建">
					</div>

				</form>
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
							<button type="submit" class="btn btn-warning">创建菜谱</button>
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