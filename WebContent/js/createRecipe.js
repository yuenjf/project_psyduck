/* 
封面图片上传预览实现
*/
$(function () {
    // 图片预览功能
    $(".rec-cover>.img-upload").change(function () {
        var $file = $(this);
        var objUrl = $file[0].files[0];
        //获得一个http格式的url路径:mozilla(firefox)||webkit or chrome  
        var windowURL = window.URL || window.webkitURL;
        //createObjectURL创建一个指向该参数对象(图片)的URL  
        var dataURL = windowURL.createObjectURL(objUrl);
        // 预览图片.load等待图片加载完.获取图片高度，并设置div高度为图片高度
        $(".rec-cover>.img-view").attr("src", dataURL).on("load", function () {
            var ih = $(this).height();
            $(".rec-cover").css({
                height: ih
            });
        });
        // 上传图片后隐藏上传信息
        $(".rec-cover>.img-upload-info").addClass("hidden");
        // 上传图片后显示重新上传按钮
        $(".rec-cover>.img-upload-stop").show();
        $(this).css({
            height: 0
        });
    });
    // 重新上传功能
    $(".rec-cover>.img-upload-stop").click(function () {
        $(".rec-cover>.img-view").removeAttr("src");
        $(".rec-cover").css({
            height: "450px"
        });
        // 来回切换type值，实现重置input功能
        $(".rec-cover>.img-upload").attr("type", "text").attr("type", "file").css({
            height: "450px"
        });
        $(".rec-cover>.img-upload-info").removeClass("hidden");
        $(".rec-cover>.img-upload-stop").hide();
    });
});

/* 步骤图片上传预览实现 */
$(function () {
    // 图片预览功能
    var index;
    $(".rec-step>.img-upload").change(function () {
        index = $(this).parent().parent().parent().index();
        console.log(index);
        var $file = $(this);
        var objUrl = $file[0].files[0];
        //获得一个http格式的url路径:mozilla(firefox)||webkit or chrome  
        var windowURL = window.URL || window.webkitURL;
        //createObjectURL创建一个指向该参数对象(图片)的URL  
        var dataURL = windowURL.createObjectURL(objUrl);
        // 预览图片.load等待图片加载完.获取图片高度，并设置div高度为图片高度
        $(".rec-step>.img-view").eq(index).attr("src", dataURL).on("load", function () {
            var ih = $(this).height();
            $(".rec-step").eq(index).css({
                height: ih
            });
        });
        // 上传图片后隐藏上传信息
        $(".rec-step>.img-upload-info").eq(index).addClass("hidden");
        // 上传图片后显示重新上传按钮
        $(".rec-step>.img-upload-stop").eq(index).show();
        $(this).eq(index).css({
            height: 0
        });
    });
    // 重新上传功能
    $(".rec-step>.img-upload-stop").click(function () {
        index = $(this).parent().parent().parent().index();
        $(".rec-step>.img-view").eq(index).removeAttr("src");
        $(".rec-step").eq(index).css({
            height: "254px"
        });
        // 来回切换type值，实现重置input功能
        $(".rec-step>.img-upload").eq(index).attr("type", "text").attr("type", "file").css({
            height: "254px"
        });
        $(".rec-step>.img-upload-info").eq(index).removeClass("hidden");
        $(".rec-step>.img-upload-stop").eq(index).hide();
    });
    // 添加步骤
    $(".add-step").click(function () {
        //  用clone(ture)方法克隆li，如果有内容就全部清空
        var $li = $("ol>li:first").clone(true);
        $li.find("textarea").val("");
        $li.find(".rec-step>.img-view").removeAttr("src");
        $li.find(".rec-step").css({
            height: "254px"
        });
        $li.find(".rec-step>.img-upload").attr("type", "text").attr("type", "file").css({
            height: "254px"
        });
        $li.find(".rec-step>.img-upload-info").removeClass("hidden");
        $li.find(".rec-step>.img-upload-stop").hide();
        // 把clone好的append到ol下
        $("ol").append($li);
    });
    // 删除步骤
    $(".remove-step").click(function () {
        var index = $(this).parent().parent().parent().index();
        $("ol>li").eq(index).remove();
    });
});

/*
首页回到顶部功能的实现 
 */
$(function () {
    // 加载页面的时候先隐藏
    $('#returnTop').hide();
    // 首页返回顶部
    $(window).scroll(function () {
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
    $("#returnTop").click(function () {
        $("html,body").animate({
            scrollTop: 0
        }, 200);
    });
});