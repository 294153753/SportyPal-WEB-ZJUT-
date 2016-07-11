$(document).ready(function() {
	$.ajax({
		url : "./area.xml",
		dataType : "xml",
		success : function(xml) {
			$(xml).find("province").each(function() { 
				$("<option>请选择所在省</option>").html(
						$(this).attr("name")).appendTo("#province"); 
			});
		}
	});
	$("#province").change(function() {
		var value = $("#province").val();
		if (value != "请选择") {
			$("#city").css("display","block").find("option").remove();
			$("#city").html("<option>请选择所在城市</option>");
			$.ajax({
				url : "./area.xml",
				dataType : "xml",
				success : function(xml) {
					$(xml).find("[name='" + value + "']").find("city").each(
							function() { 
								$("<option>请选择所在城市</option>").html(
										$(this).attr("name")).appendTo("#city");
							});
				}
			});
		}
		else {
			$("#city").css("display","block").find("option").remove();
			$("#city").html("<option>请选择所在城市</option>");
		}
	});
});
function checkNotNull(){
	var username = $("#username").val();
	var province = $("#province").val();
	var city = $("#city").val();
	if(username == "" && (province == "请选择" || province == "请选择所在省") && 
			(city == "请选择" || city == "请选择所在省")){
		return false;
	}
	else return true;
}
function confirmDel() { 
	var msg = "您真的确定要删除吗？请确认！"; 
	if (confirm(msg)==true){ 
		return true; 
	}else{ 
		return false; 
	} 
}
function addFriend(username) { 
	$.post("addfriend.action",{username:username},function(resdata){
		if(resdata == "success"){
			alert("发送好友请求成功！");
		}
		else if(resdata == "fail"){
			alert("添加好友失败，请重试！");
		}
	});
}