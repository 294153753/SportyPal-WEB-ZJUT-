<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="container" id="div1">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<s:iterator value="contentList" var="contentList">
				<div class="modal fade" id="forward-<s:property value="id"/>"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">转发微博</h4>
							</div>
							<form class="form-horizontal" role="form" action="forward"
								method="post">
								<div class="modal-body">
									<textarea rows="3" class="form-control" name="comment.comment"></textarea>
									<input type="text" style="display:none;" name="content.id"
										value="<s:property value="id"/>" />
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-primary btn-sm">转发</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal fade" id="comment-<s:property value="id"/>"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">评论微博</h4>
							</div>
							<div class="modal-body">
								<textarea rows="3" class="form-control"
									id="commentString<s:property value="id" />"></textarea>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary btn-sm"
									onclick="comment(<s:property value="id" />)">评论</button>
							</div>
							<div>
								<s:if test="commentList.size()!=0">
									<div class="caption modal-footer">
										<s:iterator value="#contentList.commentList" var="comment">
											<div class="container-fluid text-left">
												<div class="col-md-12 column">
													<div class="row">
														<div class="col-md-11 column">
															<h3>
																<img
																	src="./img/picture/45x45/<s:property value="#comment.account_detail.picture" />.jpg"
																	class="img-circle" /> <a target="view_window"
																	href="accountInfo?username=<s:property
																		value="#comment.account_detail.username" />">
																	<s:property value="#comment.account_detail.username" />
																</a> <span class="spanfont"> <s:property
																		value="#comment.time" /> </span>
															</h3>
														</div>
														<div class="col-md-1 column">
															<button type="button" class="btn btn-default btn-sm"
																onclick="hideOrNot('hf<s:property value="#comment.id"/>',<s:property value="#contentList.id"/>,<s:property value="#comment.id"/>)">回复</button>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12 column">
															<p>
																<s:property value="#comment.comment" />
															</p>
														</div>
													</div>
												</div>
												<div class="modal-body"
													id="hf<s:property value="#comment.id"/>"
													style="display:none;">
													<div class="row"></div>
													<div class="row">
														<div class="col-md-9 column">
															<textarea rows="1" class="form-control"></textarea>
														</div>
														<div class="col-md-1 column">
															<button type="button" class="btn btn-default">评论</button>
														</div>
													</div>
												</div>
											</div>
										</s:iterator>
									</div>
								</s:if>
								<s:else>
									<p class="text-center">暂无评论</p>
								</s:else>
							</div>
						</div>
					</div>
				</div>
			</s:iterator>
		</div>
	</div>
</div>