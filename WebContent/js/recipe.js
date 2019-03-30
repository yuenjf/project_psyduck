/*
 * 首页回到顶部功能的实现
 */
$(function() {
	// 加载页面的时候先隐藏
	$('#returnTop').hide();
	// 首页返回顶部
	$(window).scroll(function() {
		// console.log($("html,body").scrollTop());
		// 获取网页滚动偏移量
		var offset = $("html,body").scrollTop();
		// 判断偏移量
		if (offset > 500) {
			$("#returnTop").fadeIn(100);
		} else {
			$("#returnTop").fadeOut(100);
		}
	});
	// 监听div的点击事件，点击就回到顶部
	$("#returnTop").click(function() {
		$("html,body").animate({
			scrollTop : 0
		}, 200);
	});
});