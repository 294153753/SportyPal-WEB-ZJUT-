function hideOrNot(id,content_id,symbol){
	$.ajax({
		type: "post",
		url: "showrecomment",
		data: {content_id:content_id, symbol:symbol},
		dataType: "json",
		success: function(data){
			document.getElementById(id).innerHTML='';
			$.each(data,function(index, obj){
				var username = obj.account_detail.username;
				var comment = obj.comment;
				document.getElementById(id).innerHTML+='<div class="row"><div class="col-md-offset-1 col-md-11 column">'
					+ ' <a target="view_window" href="accountInfo?username=' + username + '">' +
				username +'</a>' +
				' <span class="spanfont">' + obj.time + '</span><p>' +
			    comment + '</p></div></div>';
			});
			document.getElementById(id).innerHTML+='<div class="row">' +
			'<div class="col-md-offset-1 col-md-9 column">' +
			'<textarea rows="1" class="form-control" id="recomment'+ symbol +'"></textarea>' +
			'</div>' +
			'<div class="col-md-1 column">' +
			'<button type="button" class="btn btn-default" onclick="recomment(' + content_id + ',' + symbol + ')">评论</button>' +
			'</div>' +
			'</div>';
		}
	});
	if(document.getElementById(id).style.display == "none"){
		document.getElementById(id).style.display = "";
	}
	else if(document.getElementById(id).style.display == ""){
		document.getElementById(id).style.display = "none";
	}
};
function addFriend(username) { 
	$.post("addfriend.action",{username:username},function(resdata){
		if(resdata == "success"){
			alert("发送好友请求成功！");
		}
		else if(resdata == "fail"){
			alert("添加好友失败，请重试！");
		}
	});
};
function likes(id){
	$.post("checkLikes.action",{id:id},function(resdata){
		if(resdata == "success"){
			$.post("insertLikes.action",{id:id},function(data){
				if(data == "success"){
					$.post("showTrend.action",function(){
						location.reload();
					});
				}
				else if(data == "fail"){
					alert("error");
				}
			});
		}
		else if(resdata == "fail"){
			$.post("deleteLikes.action",{id:id},function(data){
				if(data == "success"){
					$.post("showTrend.action",function(){
						location.reload();
					});
				}
				else if(data == "fail"){
					alert("error");
				}
			});
		}
	});
};
function comment(id){
	var s = document.getElementById("commentString"+id).value;
	if(s != "" ){
		$.post("comment.action",{commentid:id,commentString:s},function(resdata){
			if(resdata == "success"){
				alert("评论已发表！");
				location.reload();
			}
			else alert("error");
		});
	}
};
function recomment(content_id, id){
	var s = document.getElementById("recomment"+id).value;
	if(s != "" ){
		$.post("recomment.action",{content_id:content_id,symbol:id,commentString:s},function(resdata){
			if(resdata == "success"){
				alert("回复评论已发表！");
				location.reload();
			}
			else alert("error");
		});
	}
};