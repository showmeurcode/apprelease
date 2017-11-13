

// 软件名称验证
$("#softwareName").blur(function () {

    var name = this.val();

    if (name == null || name == "") {
        $("#yzname").html("软件名称不能为空！").attr("style","color: red");
    } else {
        $("#yzname").html("√").attr("style","color: green");
    }


});

//验证APK名称
$("#APKName").blur(function () {

    var apkName = this.val();

    if (apkName == null || apkName == ""){
        $("#yzAPK").html("APK名称不能为空！").attr("style","color: red");
    } else {
        $.post("");
    }

});

//验证ROM
$("#supportROM").blur(function () {

    var supportROM = this.val();

    if (supportROM == null || supportROM == "") {
        $("#yzROM").html("ROM不能为空！").attr("style","color: red");
    } else {
        $("#yzROM").html("√").attr("style","color: green");
    }


});

//验证界面语言
$("#interfaceLanguage").blur(function () {

    var interfaceLanguage = this.val();

    if (interfaceLanguage == null || interfaceLanguage == "") {
        $("#yzlanguage").html("界面语言不能为空！").attr("style","color: red");
    } else {
        $("#yzlanguage").html("√").attr("style","color: green");
    }


});

//验证软件大小
$("#softwareSize").blur(function () {

    var softwareSize = this.val();
    var yz = "/^[1-9]/d*/./d*|0/./d*[1-9]/d*$/";

    if (softwareSize == null || softwareSize == "") {
        $("#yzSize").html("软件大小不能为空！").attr("style","color: red");
    } else if (yz.test(softwareSize)) {
        $("#yzSize").html("软件大小只能为数字！").attr("style","color: red");
    } else {
        $("#yzSize").html("√").attr("style","color: green");
    }


});

//验证下载次数
$("#downloads").blur(function () {

    var downloads = this.val();
    var yz = "/^[1-9]/d*$/";

    if (downloads == null || downloads == "") {
        $("#yzSize").html("软件大小不能为空！").attr("style","color: red");
    } else if (yz.test(downloads)) {
        $("#yzSize").html("软件大小只能为数字！").attr("style","color: red");
    } else {
        $("#yzSize").html("√").attr("style","color: green");
    }


});

//验证下载次数
$("#downloads").blur(function () {

    var downloads = this.val();
    var yz = "/^[1-9]/d*$/";

    if (downloads == null || downloads == "") {
        $("#yzSize").html("下载次数不能为空！").attr("style","color: red");
    } else if (yz.test(downloads)) {
        $("#yzloads").html("下载次数只能为数字！").attr("style","color: red");
    } else {
        $("#yzloads").html("√").attr("style","color: green");
    }


});

//验证应用简介
$("#appInfo").blur(function () {

    var appInfo = this.html();

    if (appInfo == null || appInfo == "") {
        $("#yztext").html("应用简介不能为空！").attr("style","color: red");
    } else {
        $("#yztext").html("√").attr("style","color: green");
    }


});

//验证文件上传

