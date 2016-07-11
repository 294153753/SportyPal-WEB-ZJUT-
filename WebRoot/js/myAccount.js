function GetPicture() {
	var pictureid = $("#picture").val();
	$("#imgpicture").attr("src",
			"./img/picture/45x45/" + pictureid + ".jpg");
};
function checkPassword() {
	var password = $("#password").val();
	var repassword = $("#repassword").val();
	if(password == "" || repassword == ""){
		alert("输入不能为空!");
		return false;
	}
	if(password.length < 6 || password.length > 20){
		alert("新密码长度错误，密码长度应为6-20位！");
		return false;
	}
	if(password != repassword){
		alert("两次输入新密码不一致，请重试！");
		return false;
	}
};
$(document).ready(function() {
	$.ajax({
		url : "./area.xml",
		dataType : "xml",
		success : function(xml) {
			$(xml).find("province").each(function() { 
				$("<option>请选择</option>").html(
						$(this).attr("name")).appendTo("#province"); 
			});
		}
	});
	$("#province").change(function() {
		var value = $("#province").val();
		if (value != "请选择") {
			$("#city").css("display","block").find("option").remove();
			$("#city").html("<option>请选择</option>");
			$.ajax({
				url : "./area.xml",
				dataType : "xml",
				success : function(xml) {
					$(xml).find("[name='" + value + "']").find("city").each(
							function() { 
								$("<option>请选择</option>").html(
										$(this).attr("name")).appendTo("#city");
							});
				}
			});
		}
		else {
			$("#city").css("display","block").find("option").remove();
			$("#city").html("<option>请选择</option>");
		}
	});
});
function agreeAddFriend(username) { 
	$.post("agreeAddFriend.action",{username:username},function(resdata){
		if(resdata == "success"){
			alert("添加成功！");
			window.location.reload();
		}
		else if(resdata == "fail"){
			alert("添加好友失败，请重试！");
		}
	});
};
function refuseAddFriend(username) { 
	$.post("refuseAddFriend.action",{username:username},function(resdata){
		if(resdata == "success"){
			alert("已拒绝！");
			window.location.reload();
		}
		else if(resdata == "fail"){
			alert("拒绝添加失败，请重试！");
		}
	});
};
function deleteRst(username, rst) { 
	var msg = "确认删除消息？"; 
	if (confirm(msg)==true){ 
		$.post("deleteRst.action",{username:username,password:rst},function(resdata){
			if(resdata == "success"){
				alert("删除消息成功！");
				window.location.reload();
			}
			else if(resdata == "fail"){
				alert("删除消息失败，请重试！");
			}
		});
	}
	else{ 
		return false; 
	} 
};