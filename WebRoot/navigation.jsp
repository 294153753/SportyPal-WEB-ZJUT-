<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.jsp">运动伴侣</a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<%
						if (session.getAttribute("login") != null) {
					%>
					<ul class="nav navbar-nav">
						<li><a href="recommend"><span
								class="glyphicon glyphicon-home"></span> 主页</a></li>
						<li><a href="showSptArts"><span
								class="glyphicon glyphicon-stats"></span> 运动数据</a></li>
						<li><a href="showFriends"><span
								class="glyphicon glyphicon-user"></span> 好友</a></li>
					</ul>
					<%
						}
					%>
					<ul class="nav navbar-nav navbar-right">
						<%
							if (session.getAttribute("login") == null) {
						%>
						<li><a href="login.jsp">登录&#12288;</a></li>
						<li><a href="register.jsp">注册&#12288;</a></li>
						<%
							} else {
						%>
						<li><a href="showInfo">账户 <s:if test="addRstSize!=0&&addRstSize!=undefined">
									<span class="badge pull-right"><s:property
											value="addRstSize" /> </span>
								</s:if> </a></li>
						<li><a href="logout">注销&#12288;</a></li>
						<%
							}
						%>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('#bs-example-navbar-collapse-1').click(function() {
		$(this).parent().children().removeClass('active');
		$(this).addClass('active');
	});
</script>