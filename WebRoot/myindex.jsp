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

textarea {
	resize: none;
}

.myfont {
	font-family: "FZShuTi";
	text-align: left;
	font-size: 40px;
	position: relative;
	margin: 0;
}

.spanfont {
	font-size: 10px;
	color: #758A99;
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
						<h3 class="panel-title myfont">有什么新鲜事想告诉大家?</h3>
					</div>
					<form class="form-horizontal" role="form" action="release"
						method="post">
						<div class="panel-body">
							<textarea rows="5" class="form-control" name="content.content"></textarea>
						</div>
						<div class="panel-footer text-right">
							<button type="submit" class="btn btn-primary btn-sm">&#12288;&#12288;发布&#12288;&#12288;</button>
						</div>
					</form>
				</div>
				<div class="panel panel-info row">
					<div class="panel-heading">
						<h3 class="panel-title">推荐好友</h3>
					</div>
					<s:if test="rst.isEmpty()">
						<div class="panel-body">Sorry，根据您的个人信息系统找不到可推荐的好友！</div>
					</s:if>
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
									<button id="addfri" class="btn btn-primary btn-xs"
										type="button" style="display:;"
										onclick="addFriend('<s:property value="username" />')">
										<span class="glyphicon glyphicon-plus"></span> 添加好友
									</button>
								</div>
							</div>
						</div>
					</s:iterator>
				</div>
				<div class="panel panel-success row">
					<div class="panel-heading">
						<h3 class="panel-title">好友动态</h3>
					</div>
					<div class="col-md-12">
						<s:if test="contentList.isEmpty()">
							<div class="panel-body">
								暂无动态 <span class="glyphicon glyphicon-option-horizontal"></span>
							</div>
						</s:if>
						<div class="panel-body">
							<s:iterator value="contentList">
								<div class="thumbnail">
									<div class="caption">
										<h1>
											<img
												src="./img/picture/45x45/<s:property value="account_detail.picture" />.jpg"
												class="img-circle" /> <a target="view_window"
												href="accountInfo?username=<s:property value="account_detail.username"/>"><s:property
													value="account_detail.username" /> </a> <span class="spanfont"><s:property
													value="time" /> </span>
										</h1>
										<p>
											<s:property value="content" />
										</p>
										<s:if test='routeHref!=NULL'>
											<p>
												<a href="<s:property value='routeHref' />">我的运动路线</a>
											</p>
										</s:if>
										<p>
										<div class="text-right">
											<a href="#forward-<s:property value="id"/>"
												class="btn btn-default btn-sm" data-toggle="modal"><span
												class="glyphicon glyphicon-share-alt"></span>转发 <s:if
													test="content_statistics.forward!=0">
														(<s:property value="content_statistics.forward" />)
													</s:if> </a> <a href="#comment-<s:property value="id"/>"
												class="btn btn-default btn-sm" data-toggle="modal"><span
												class="glyphicon glyphicon-edit"></span>评论<s:if
													test="content_statistics.comment!=0">
														(<s:property value="content_statistics.comment" />)
													</s:if> </a>
											<s:if test="symbol=='true'">
												<button class="btn btn-default btn-sm"
													onclick="likes(<s:property value="id" />)">
													<span id="<s:property value="id" />"
														class="glyphicon glyphicon-heart-empty"></span>赞
													<s:if test="content_statistics.likes!=0">
														(<s:property value="content_statistics.likes" />)
													</s:if>
												</button>
											</s:if>
											<s:else>
												<button class="btn btn-default btn-sm"
													onclick="likes(<s:property value="id" />)">
													<span id="<s:property value="id" />"
														class="glyphicon glyphicon-heart"></span>赞
													<s:if test="content_statistics.likes!=0">
														(<s:property value="content_statistics.likes" />)
													</s:if>
												</button>
											</s:else>
										</div>
									</div>
								</div>
							</s:iterator>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 column"></div>
		</div>
	</div>
	<%@include file="modal.jsp"%>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/myindex.js" charset="UTF-8"></script>
</body>
</html>