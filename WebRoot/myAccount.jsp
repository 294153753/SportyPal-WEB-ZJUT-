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
							<div class="tabbable" id="tabs-527734">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#panel-617545"
										data-toggle="tab">我的账户</a></li>
									<li><a href="#panel-754261" data-toggle="tab">详细资料</a></li>
									<li><a href="#panel-message" data-toggle="tab">消息</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="panel-617545">
										<br>
										<p>
											用户名：
											<s:property value="account_detail.username" />
										</p>
										<p>
											<a id="modal-750431" href="#modal-container-750431"
												role="button" data-toggle="modal">修改密码</a>
										</p>
									</div>
									<div class="tab-pane" id="panel-754261">
										<br>
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
										<p>
											<a id="modal-750431" href="#modal-container-info"
												role="button" data-toggle="modal">修改资料</a>
										</p>
									</div>
									<div class="tab-pane" id="panel-message">
										<br>
										<table class="table table-hover">
											<tbody>
												<s:iterator value="addRst">
													<tr id="<s:property value="username" />" style="display:;">
														<td><s:property value="username" />，请求添加好友。</td>
														<td><button class="btn btn-success" type="button"
																onclick="agreeAddFriend('<s:property value="username" />')">同意
															</button>
															<button class="btn btn-danger" type="button"
																onclick="refuseAddFriend('<s:property value="username" />')">拒绝</button>
															<a class="close"
															onclick="deleteRst('<s:property value="username" />','<s:property value="rst" />')">x</a>
														</td>
													</tr>
												</s:iterator>
												<s:iterator value="agreeRst">
													<tr>
														<td><s:property value="fri_username" />，同意了您的添加好友请求。</td>
														<td><a class="close"
															onclick="deleteRst('<s:property value="fri_username" />','<s:property value="rst" />')">x</a>
														</td>
													</tr>
												</s:iterator>
												<s:iterator value="refuseRst">
													<tr>
														<td><s:property value="fri_username" />，拒绝了您的添加好友请求。</td>
														<td><a class="close"
															onclick="deleteRst('<s:property value="fri_username" />','<s:property value="rst" />')">x</a>
														</td>
													</tr>
												</s:iterator>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-2 column"></div>
			<div class="modal fade" id="modal-container-750431" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">修改密码</h4>
						</div>
						<form class="form-horizontal" role="form" action="changePassword"
							method="post" onSubmit="return checkPassword()">
							<div class="modal-body container-fluid">
								<div class="col-sm-offset-3 col-sm-6">
									<div class="form-group">
										<input type="password" class="form-control" id="password"
											name="account.password" placeholder="请输入新密码" />
									</div>
									<div class="form-group">
										<input type="password" class="form-control" id="repassword"
											name="account.repassword" placeholder="请重复新密码" />
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<input type="submit" class="btn btn-primary" />
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="modal fade" id="modal-container-info" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title" id="myModalLabel">修改详细资料</h4>
							<h6>提示：只需填写需要修改的项目，不填则保持不变。</h6>
						</div>
						<form class="form-horizontal" role="form" action="changeDetail"
							method="post">
							<div class="modal-body container-fluid">
								<div class="col-sm-2">
									<img id="imgpicture"
										src="./img/picture/45x45/<s:property value="account_detail.picture" />.jpg" />
								</div>
								<div class="col-sm-8">
									<div class="form-group">
										<label for="address" class="col-sm-3 control-label">所在城市</label>
										<div class="col-sm-4">
											<select name="account_detail.province" id="province"
												class="form-control">
												<option value="请选择">请选择</option>
											</select>
										</div>
										<div class="col-sm-4">
											<select name="account_detail.city" id="city"
												class="form-control">
												<option value="请选择">请选择</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="picture" class="col-sm-3 control-label">头像</label>
										<div class="col-sm-4">
											<select name="account_detail.picture" class="form-control"
												id="picture" onchange="GetPicture();">
												<option value="">请选择</option>
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
											<select name="account_detail.sex" class="form-control"
												id="sex">
												<option value="">请选择</option>
												<option value="男">男</option>
												<option value="女">女</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label for="phone" class="col-sm-3 control-label">联系方式</label>
										<div class="col-sm-9">
											<input type="tel" class="form-control" id="phone"
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
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
								<button type="submit" class="btn btn-primary">提交</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/myAccount.js" charset="UTF-8"></script>
</body>
</html>