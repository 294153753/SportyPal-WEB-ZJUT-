<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h3 class="panel-title text-center">最近7天运动量</h3>
					</div>
					<div class="panel-body">
						<canvas id="myChart1" width="100" height="100"></canvas>
					</div>
				</div>
				<div class="panel panel-success row">
					<div class="panel-heading">
						<h3 class="panel-title">我的运动日志</h3>
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
									<div class="text-right">
										<img src="./img/ico/sina.jpg"
											onclick="shareTSina(<s:property value='routeHref' />, <s:property value="content" />)">
										<img src="./img/ico/qzone.jpg"
											onclick="shareQzone(<s:property value='routeHref' />)">
										<img src="./img/ico/tencent.jpg"
											onclick="shareToWb(<s:property value='routeHref' />)">
									</div>
								</div>
							</div>
						</s:iterator>
					</div>
				</div>
				<div class="col-md-2 column"></div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/Chart.js"></script>
	<script type="text/javascript" src="js/chart.js" charset="UTF-8"></script>
</body>
</html>