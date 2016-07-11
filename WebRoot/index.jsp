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
.bg {
	background-image: url(img/index.jpg);
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
	-moz-background-size: cover;
	-webkit-background-size: cover;
}

.myRow {
	margin-top: 300px;
}

.myRow2 {
	margin-top: 10px;
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
		<div class="row clearfix">
			<div class="col-sm-offset-5 col-md-2 column myRow">
				<button type="button" class="btn btn-success btn-lg btn-block"
					onmouseover="mouseOver()" onmouseout="mouseOut()">下载APP</button>
			</div>
		</div>
		<div class="row" id="QRcode" style="display:none;">
			<div class="col-sm-offset-5 col-md-2 column myRow2">
				<img src="./img/RQ.jpg" />
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function mouseOver() {
			document.getElementById('QRcode').style.display = "";
		};
		function mouseOut() {
			document.getElementById('QRcode').style.display = "none";
		};
	</script>
</body>
</html>