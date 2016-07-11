window.onload = function() {
	var barChartData = {
			labels: ["--", "--", "--", "--", "--", "--", "--"],
			datasets: [{
				label: '日运动量',
				backgroundColor: "rgba(220,220,220,0.5)",
				data: [0,0,0,0,0,0,0]
			}]
	};
	var ctx = document.getElementById("myChart1").getContext("2d");
	window.myBar = new Chart(ctx, {
		type: 'bar',
		data: barChartData,
		options: {
			// Elements options apply to all of the options unless overridden in a dataset
			// In this case, we are setting the border of each bar to be 2px wide and green
			elements: {
				rectangle: {
					borderWidth: 2,
					borderColor: 'rgb(0, 255, 0)',
					borderSkipped: 'bottom'
				}
			},
			responsive: true,
			legend: {
				position: 'top',
			}
		}
	});
	$.ajax({ //采用Ajax方法
		type:"post", //post方式
		dataType:"json", //返回数据类型是JSON数据格式
		url:"statistic", //处理的Action名称
		success:function(data){ //成功的处理函数
			var lab = new Array(7);
			var da = new Array(7);
			$.each(data,function(commentIndex, comment){
				lab[commentIndex] = comment.date;
				da[commentIndex] = comment.distance;			
			});
			var barChartData = {
					labels: lab,
					datasets: [{
						label: '日运动量',
						backgroundColor: "rgba(220,220,220,0.5)",
						data: da
					}]
			};
			var ctx = document.getElementById("myChart1").getContext("2d");
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					// Elements options apply to all of the options unless overridden in a dataset
					// In this case, we are setting the border of each bar to be 2px wide and green
					elements: {
						rectangle: {
							borderWidth: 2,
							borderColor: 'rgb(0, 255, 0)',
							borderSkipped: 'bottom'
						}
					},
					responsive: true,
					legend: {
						position: 'top',
					}
				}
			});
		}
	});
};

var top = window.screen.height / 2 - 250;  
var left = window.screen.width / 2 - 300; 
//function shareTSina(title,rLink,site,pic)
function shareTSina(rLink, summary) {  
	title = "我的运动日志:" + summary;
	window.open("http://service.weibo.com/share/share.php?&title=" +
			encodeURIComponent(title.replace(/&nbsp;/g, " ").replace(/<br \/>/g, " "))
			+ "&url=" + encodeURIComponent(rLink),  
			"分享至新浪微博",  
			"height=500,width=600,top=" + top + ",left=" + left + 
	",toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no");  
};

function shareQzone(rLink) {  
	title = "我的运动日志";
	window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?title='+ 
			encodeURI(title)+'&url='+encodeURIComponent(rLink),'_blank',
			'scrollbars=no,width=600,height=450,left=' + left + ',top=' + top + ',status=no,resizable=yes');  
};

function shareToWb(rLink){     
	title = "我的运动日志";  
	window.open('http://v.t.qq.com/share/share.php?url='+encodeURIComponent(rLink)+  
			'&title='+encodeURI(title),'_blank',  
			'scrollbars=no,width=600,height=450,left=' + left + ',top=' + top + ',status=no,resizable=yes');       
};
