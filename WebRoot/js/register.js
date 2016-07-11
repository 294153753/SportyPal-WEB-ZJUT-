$('#checkbox').click(function() {
	var usernameTip = document.getElementById("usernameTip").src;
	var passwordTip = document.getElementById("passwordTip").src;
	var repasswordTip = document.getElementById("repasswordTip").src;
	var addressTip = document.getElementById("addressTip").src;
	var str = "http://localhost:8080/sportsMovement/img/tip/right.jpg";
	var res;
	if(usernameTip == str && passwordTip == str &&
			repasswordTip == str && addressTip == str){
		res = "yes";
	}
	else{
		res = "no";
	}
	if (this.checked) {
		if(res == "yes"){
			document.getElementById("submit").disabled = "";
		}
		else{
			document.getElementById("submit").disabled = "disabled";
		}
	} else {
		document.getElementById("submit").disabled = "disabled";
	}
});
function GetPicture() {
	var pictureid = $("#picture").val();
	$("#imgpicture").attr("src",
			"./img/picture/148x148/" + pictureid + ".jpg");
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
$(function(){
	var res1, res2, res3, res4;
	$('#username').focus(function(){
		$("#usernamePopover").popover('hide');
	});
	$('#username').blur(function(){
		if( this.value=="" || this.value.length < 6 || this.value.length > 20){
			$("#usernameTip").attr("src","./img/tip/error.jpg");
			document.getElementById("submit").disabled = "disabled";
			res1 = false;
		}else{
			var username = $('#username').val();
			$.post("checkExist.action","username=" + username,function(resdata){
				if(resdata == "success"){
					$("#usernameTip").attr("src","./img/tip/right.jpg");
					res1 = true;
					if(res1 && res2 && res3 && res4 && document.getElementById("checkbox").checked){
						document.getElementById("submit").disabled = "";
					}
				}
				else if(resdata == "fail"){
					$("#usernamePopover").popover('show');
					$("#usernameTip").attr("src","./img/tip/error.jpg");
					document.getElementById("submit").disabled = "disabled";
					res1 = false;
			}
		});
	}
});
	$('#password').blur(function(){
		if( this.value=="" || this.value.length < 6 || this.value.length > 20){
			$("#passwordTip").attr("src","./img/tip/error.jpg");
			document.getElementById("submit").disabled = "disabled";
			res2 = false;
		}else{
			$("#passwordTip").attr("src","./img/tip/right.jpg");
			res2 = true;
			if(res1 && res2 && res3 && res4 && document.getElementById("checkbox").checked){
				document.getElementById("submit").disabled = "";
			}
		}
	});
	$('#repassword').blur(function(){
		if(this.value=="" || document.getElementById("password").value != document.getElementById("repassword").value){
			$("#repasswordTip").attr("src","./img/tip/error.jpg");
			document.getElementById("submit").disabled = "disabled";
			res3 = false;
		}else{
			$("#repasswordTip").attr("src","./img/tip/right.jpg");
			res3 = true;
			if(res1 && res2 && res3 && res4 && document.getElementById("checkbox").checked){
				document.getElementById("submit").disabled = "";
			}
		}
	});
	$('#city').blur(function(){
		if($("#city").val() == "请选择"){
			$("#addressTip").attr("src","./img/tip/error.jpg");
			document.getElementById("submit").disabled = "disabled";
			res4 = false;
		}else{
			$("#addressTip").attr("src","./img/tip/right.jpg");
			res4 = true;
			if(res1 && res2 && res3 && res4 && document.getElementById("checkbox").checked){
				document.getElementById("submit").disabled = "";
			}
		}
	});
});