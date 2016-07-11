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
<title>运动伴侣-好友查询结果</title>

<style>
.top {
	margin-top: 20px;
}

.myRow {
	margin-top: 60px;
}

.bg {
	background-color: #F0F0F0;
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
	<div class="container">
		<div class="row clearfix myRow">
			<div class="col-md-2 column"></div>
			<div class="col-md-8 column">
				<div class="panel panel-info row">
					<div class="panel-heading">
						<h3 class="panel-title">查询结果</h3>
					</div>
					<s:actionmessage />
					<s:iterator value="rst">
						<div class="col-md-4 top">
							<div class="thumbnail">
								<div>
									<img
										src="./img/picture/45x45/<s:property value="picture" />.jpg"
										class="pull-left" />
									<h3 class="text-center">
										<a target="view_window"
											href="accountInfo?username=<s:property value="username"/>"><s:property
												value="username" /> </a>
									</h3>
									<h5 class="text-center">
										<s:property value="province" />
										<s:property value="city" />
									</h5>
								</div>
								<div class="text-center">
									<s:if test="symbol=='true'">
										<button id="addfri" class="btn btn-primary btn-xs"
											type="button" style="display:;"
											onclick="addFriend('<s:property value="username" />')">
											<span class="glyphicon glyphicon-plus"></span> 添加好友
										</button>
									</s:if>
									<s:else>
										<button class="btn btn-danger btn-xs" type="button"
											disabled="disabled">
											<span class="glyphicon glyphicon-remove"></span> 已添加
										</button>
									</s:else>
								</div>
							</div>
						</div>
					</s:iterator>
				</div>
			</div>
			<div class="col-md-2 column"></div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/friends.js" charset="UTF-8"></script>
</body>
</html>