<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>运动伴侣</title>

<style>
.myRow {
	margin-top: 220px;
}

.bg {
	background-image: url(img/login_bg.jpg);
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
	-moz-background-size: cover;
	-webkit-background-size: cover;
}

.login {
	background-color: rgba(192, 192, 192, 0.6);
}

.color {
	color: #1D2F3B;
}
</style>

<!-- Bootstrap -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">



<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bg">
	<%@ include file="navigation.jsp"%>
	<div class="container">
		<div class="row clearfix myRow">
			<div class="col-md-4 column"></div>
			<div class="col-md-4 column login">
				<br>
				<form class="form-horizontal" role="form" action="login"
					method="post">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">帐号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="username"
								name="account.username" placeholder="请输入帐号" />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="password"
								name="account.password" placeholder="请输入密码" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default btn-block">登录</button>
						</div>
					</div>
				</form>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div>
							<h6>
								还没有帐号？<a class="color" href="register.jsp">立即注册 </a>
							</h6>
						</div>
					</div>
					<br>
				</div>
				<s:if test="hasActionMessages()">
					<s:iterator value="actionMessages">
						<script language="JavaScript">
							alert("<s:property escape="false"/>");
						</script>
					</s:iterator>
				</s:if>
			</div>
			<div class="col-md-4 column"></div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>