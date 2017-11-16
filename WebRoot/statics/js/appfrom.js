var logoPicPath = null;
var errorinfo = null;
$(function () {
    

// 软件名称验证

$("body").on("blur",".form-label-left #softwareName",function () {

    var name = $(this).val();
    //alert(">>>>>>>>>>>>>>>>>>>>>>>");
    if (name == null || name == "") {
        $("#yzname").html("软件名称不能为空！").attr("style","color: red");
    } else {
        $("#yzname").html("√").attr("style","color: green");
    }


});

//验证APK名称
$("body").on("blur",".form-label-left #APKName",function () {
    var apkName = $(this).val();

    if (apkName == null || apkName == ""){
        $("#yzAPK").html("APK名称不能为空！").attr("style","color: red");
    } else {
        $.post("/apprelease/appInfo/apk","APKName="+apkName,apkback);
        function apkback(data) {
            //alert("ss")
            if(data.status=="success"){
                $("#yzAPK").html("√").attr("style","color: green");
            }else{
                $("#yzAPK").html("APK名称已存在！").attr("style","color: red");
            }
        }
    }
});

//验证ROM
$("body").on("blur",".form-label-left #supportROM",function () {
    var supportROM = $(this).val();

    if (supportROM == null || supportROM == "") {
        $("#yzROM").html("ROM不能为空！").attr("style","color: red");
    } else {
        $("#yzROM").html("√").attr("style","color: green");
    }
});

//验证界面语言
$("body").on("blur",".form-label-left #interfaceLanguage",function () {
    var interfaceLanguage = $(this).val();

    if (interfaceLanguage == null || interfaceLanguage == "") {
        $("#yzlanguage").html("界面语言不能为空！").attr("style","color: red");
    } else {
        $("#yzlanguage").html("√").attr("style","color: green");
    }
});

//验证软件大小
$("body").on("blur",".form-label-left #softwareSize",function () {
    var softwareSize = $(this).val();
    var yz=/^[0-9]+([.]{1}[0-9]+){0,1}$/;

    if (softwareSize == null || softwareSize == "") {
        $("#yzSize").html("软件大小不能为空！").attr("style","color: red");
    } else if (!yz.test(softwareSize)) {
        $("#yzSize").html("软件大小只能为整数或小数！").attr("style","color: red");
    } else {
        $("#yzSize").html("√").attr("style","color: green");
    }
});

//验证下载次数
$("body").on("blur",".form-label-left #downloads",function () {
    var downloads = $(this).val();
    var yz = /^[0-9]+([.]{1}[0-9]+){0,1}$/;

    if (downloads == null || downloads == "") {
        $("#yzloads").html("下载次数不能为空！").attr("style","color: red");
    } else if (!yz.test(downloads)) {
        $("#yzloads").html("下载次数只能为整数或小数！").attr("style","color: red");
    } else {
        $("#yzloads").html("√").attr("style","color: green");
    }
});



//验证应用简介
$("body").on("blur",".form-label-left #appInfo",function () {
    var appInfo = $(this).val();

    if (appInfo == null || appInfo == "") {
        $("#yztext").html("应用简介不能为空！").attr("style","color: red");
    } else {
        $("#yztext").html("√").attr("style","color: green");
    }
});

//验证文件上传
    logoPicPath = $("#logoPicPath");
    errorinfo = $("#errorinfo");

    if (errorinfo.val()==null||errorinfo.val()==""){
        logoPicPath.next().html("上传大小不能超过50KB，上传类型必须为：jpg、jpeg、png").attr("style","color: red");
    }else {
        logoPicPath.next().html(errorinfo.val());
    }


});