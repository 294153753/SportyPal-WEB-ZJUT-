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
}

.bg {
	background-color: #F0F0F0;
}

.myfont {
	font-family: "FZShuTi";
	text-align: left;
	font-size: 40px;
	position: relative;
	margin: 0;
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
				<div class="row">
					<div class="col-md-3 column">
						<div class="panel">
							<div class="panel-body">
								<img class="img-thumbnail"
									src="./img/picture/148x148/<s:property value="account_detail.picture" />.jpg" />
							</div>
						</div>
					</div>
					<div class="col-md-9 column">
						<div class="panel">
							<div class="panel-body">
								<p>
									用户名：
									<s:property value="account_detail.username" />
								</p>
								<p>
									姓名：
									<s:property value="account_detail.name" />
								</p>
								<p>
									性别：
									<s:property value="account_detail.sex" />
								</p>
								<p>
									联系方式：
									<s:property value="account_detail.phone" />
								</p>
								<p>
									省份：
									<s:property value="account_detail.province" />
								</p>
								<p>
									城市：
									<s:property value="account_detail.city" />
								</p>
								<p>
									电子邮箱：
									<s:property value="account_detail.email" />
								</p>
								<p>
									身份证号：
									<s:property value="account_detail.IDCard" />
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h3 class="panel-title">他的运动日志</h3>
						</div>
						<s:if test="contentList.isEmpty()">
							<div class="panel-body">
								暂无运动日志 <span class="glyphicon glyphicon-option-horizontal"></span>
							</div>
						</s:if>
						<div class="panel-body">
							<s:iterator value="contentList">
								<div class="thumbnail">
									<div class="caption">
										<h4>
											<s:property value="time" />
										</h4>
										<p>
											<s:property value="content" />
										</p>
										<p>
											<a href="<s:property value='routeHref' />">我的运动路线</a>
										</p>
									</div>
								</div>
							</s:iterator>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>