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
	<%@ include file="navigation.jsp"%>
	<div class="container">
		<div class="row clearfix myRow">
			<div class="col-md-2 column"></div>
			<div class="col-md-8 column">
				<div class="panel panel-warning row">
					<div class="panel-heading">
						<h3 class="panel-title">查找新的好友</h3>
					</div>
					<form class="form-horizontal" role="form" action="searchFriend"
						method="post" onSubmit="return checkNotNull()"
						target="searchRST.jsp">
						<div class="panel-body">
							<div class="form-group">
								<div class="col-sm-4">
									<input type="text" class="form-control" id="username"
										name="account_detail.username" placeholder="请输入帐号/关键词" />
								</div>
								<div class="col-sm-4">
									<select name="account_detail.province" id="province"
										class="form-control">
										<option value="请选择">请选择所在省</option>
									</select>
								</div>
								<div class="col-sm-4">
									<select name="account_detail.city" id="city"
										class="form-control">
										<option value="请选择">请选择所在城市</option>
									</select>
								</div>
							</div>
							<h6>提示：只需输入需要项目，不输入条件默认为无！</h6>
						</div>
						<div class="panel-footer text-right">
							<input type="submit" class="btn btn-primary btn-sm"
								value="&#12288;&#12288;查找&#12288;&#12288;">
						</div>
					</form>
				</div>
				<div class="panel panel-info row">
					<div class="panel-heading">
						<h3 class="panel-title">
							我的好友 | <span class="glyphicon glyphicon-repeat"></span><a
								href="showFriends">刷新</a>
						</h3>
					</div>
					<s:if test="friends.isEmpty()">
						<div class="panel-body">您还没有好友，快去添加好友吧！</div>
					</s:if>
					<s:iterator value="friends">
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
									<a class="btn btn-primary btn-xs"
										href="deleteFriend?username=<s:property value="username" />"
										onclick="javascript:return confirmDel()"><span
										class="glyphicon glyphicon-trash"></span> 删除好友</a>
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