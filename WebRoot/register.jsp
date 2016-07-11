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
	margin-top: 60px;
	margin-bottom: 10px;
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
			<div class="col-md-4 column">
				<div class="pull-right login">
					<img id="imgpicture" src="./img/picture/148x148/1.jpg" />
				</div>
			</div>
			<div class="col-md-4 column login">
				<br>
				<form class="form-horizontal" role="form" action="register"
					method="post">
					<div class="form-group">
						<label for="username" class="col-sm-3 control-label">帐号* </label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="username"
								name="account.username" placeholder="请输入6-20位帐号" /><a
								tabindex="0" role="button" data-toggle="popover"
								data-trigger="toggle" id="usernamePopover" title="提示"
								data-placement="bottom" data-content="帐号已被占用，请更换帐号！"></a>
						</div>
						<div class="col-sm-1">
							<img class="img-circle" id="usernameTip"
								src="./img/tip/unknow.jpg" />
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-3 control-label">密码*</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" id="password"
								name="account.password" placeholder="请输入6-20位密码" />
						</div>
						<div class="col-sm-1">
							<img class="img-circle" id="passwordTip"
								src="./img/tip/unknow.jpg" />
						</div>
					</div>
					<div class="form-group">
						<label for="repassword" class="col-sm-3 control-label">重复密码*</label>
						<div class="col-sm-8">
							<input type="password" class="form-control" id="repassword"
								name="account.repassword" placeholder="请再次输入密码，保持密码一致" />
						</div>
						<div class="col-sm-1">
							<img class="img-circle" id="repasswordTip"
								src="./img/tip/unknow.jpg" />
						</div>
					</div>
					<div class="form-group">
						<label for="address" class="col-sm-3 control-label">所在城市*</label>
						<div class="col-sm-4">
							<select name="account_detail.province" id="province"
								class="form-control">
								<option value="请选择">请选择</option>
							</select>
						</div>
						<div class="col-sm-4">
							<select name="account_detail.city" id="city" class="form-control">
								<option value="请选择">请选择</option>
							</select>
						</div>
						<div class="col-sm-1">
							<img class="img-circle" id="addressTip"
								src="./img/tip/unknow.jpg" />
						</div>
					</div>
					<div class="form-group">
						<label for="picture" class="col-sm-3 control-label">头像</label>
						<div class="col-sm-4">
							<select name="account_detail.picture" class="form-control"
								id="picture" onchange="GetPicture();">
								<option value="1">头像一</option>
								<option value="2">头像二</option>
								<option value="3">头像三</option>
								<option value="4">头像四</option>
								<option value="5">头像五</option>
								<option value="6">头像六</option>
								<option value="7">头像七</option>
								<option value="8">头像八</option>
								<option value="9">头像九</option>
								<option value="10">头像十</option>
								<option value="11">头像十一</option>
								<option value="12">头像十二</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">姓名</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name"
								name="account_detail.name" placeholder="请输入真实姓名" />
						</div>
					</div>
					<div class="form-group">
						<label for="IDCard" class="col-sm-3 control-label">身份信息</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="IDCard"
								name="account_detail.IDCard" placeholder="请输入身份证号" />
						</div>
					</div>
					<div class="form-group">
						<label for="sex" class="col-sm-3 control-label">性别</label>
						<div class="col-sm-4">
							<select name="account_detail.sex" class="form-control" id="sex">
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-3 control-label">联系方式</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phone"
								name="account_detail.phone" placeholder="请输入联系方式" />
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-3 control-label">邮箱地址</label>
						<div class="col-sm-9">
							<input type="email" class="form-control" id="email"
								name="account_detail.email" placeholder="请输入邮箱地址" />
						</div>
					</div>
					<div class="checkbox">
						<div class="col-sm-offset-3 col-sm-9">
							<label><input type="checkbox" id="checkbox">我已阅读并同意<a
								href="agreement.jsp" target="_blank" class="color">《用户协议》</a> </label>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-4">
							<button type="submit" class="btn btn-success btn-block"
								id="submit" disabled="disabled">注册</button>
						</div>
						<div class="col-sm-4">
							<button type="reset" class="btn btn-default btn-block">重置</button>
						</div>
					</div>
				</form>
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
	<script type="text/javascript" src="js/register.js" charset="UTF-8"></script>
</body>
</html>