<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentellela Alela! | </title>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">

    <!-- Datatables -->
    <link href="${pageContext.request.contextPath }/statics/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/statics/css/jquery.dataTables.min.css" rel="stylesheet">

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>


<body>

<!--app内容区 -->
<div id="Content" class="right_col" role="main" hidden>

    <div class="">
        <div class="page-title">



        </div>
        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>APP基础信息

                        </h2>

                    </div>
                    <div class="x_content">

                        <form id="ceshi1" class="form-horizontal form-label-left">


                            <span class="section"> </span>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="softwareName">软件名称
                                    <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="softwareName" class="form-control col-md-7 col-xs-12"
                                           name="softwareName" value="${appInfo.softwareName}"
                                            type="text">

                                </div>
                                <span id="yzname"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="APKName">APK名称<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="APKName" name="APKName"
                                          value="${appInfo.APKName}"
                                           class="form-control col-md-7 col-xs-12">

                                </div>
                                <span id="yzAPK"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="supportROM">支持ROM<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="supportROM" name="supportROM"
                                            value="${appInfo.supportROM}"
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                                <span id="yzROM"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="interfaceLanguage">界面语言<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="interfaceLanguage" name="interfaceLanguage"
                                            value="${appInfo.interfaceLanguage}"
                                           class="form-control col-md-7 col-xs-12">

                                </div>
                                <span id="yzlanguage"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="softwareSize">软件大小 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="softwareSize" name="softwareSize"
                                            value="${appInfo.softwareSize}"
                                           class="form-control col-md-7 col-xs-12">

                                </div>
                                <span id="yzSize"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="downloads">下载次数 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="downloads" type="text" name="downloads"
                                          value="${appInfo.downloads}"
                                           class="optional form-control col-md-7 col-xs-12">

                                </div>
                                <span id="yzloads"></span>
                            </div>
                            <div class="item form-group">
                                <label for="flatformId"
                                       class="control-label col-md-3">所属分类</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="flatformId" id="flatformId"
                                            class="form-control col-md-7 col-xs-12" >

                                        <option value="0" selected>请选择</option> 
                                        <option value="1">手机</option> 
                                        <option value="2">平板</option> 
                                        <option value="3">通用</option> 
                                    </select>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="status">APP状态 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="status" name="status"
                                           readonly value="待审核"
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="appInfo">应用简介 <span class="required">*</span>
                                </label>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                    <textarea id="appInfo"  name="appInfo"
                              class="form-control col-md-7 col-xs-12"
                              value="${appinfo.appinfo}"></textarea>

                                </div>
                                <span id="yztext"></span>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="logoPicPath">LOGO图片 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <img src="${appinfo.logoPicPath}">
                                    <input id="logoPicPath" type="file" name="logoPicPath"
                                           class="optional form-control col-md-7 col-xs-12">
                                </div>

                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <button id="send" type="submit" class="btn btn-success">审核通过
                                </button>
                                    <button id="Nosend" type="submit" class="btn btn-success2">审核不通过
                                    </button>

                                    <button type="button" class="btn btn-primary">返回</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="">
        <div class="page-title"></div>
        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>为APP ${appInfo.softwareName} 最新版本信息

                        </h2>

                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <form class="form-horizontal form-label-left" id="latestvers">


                            <span class="section"> </span>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="softwareName">版本号*
                                    <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="softwareName1" class="form-control col-md-7 col-xs-12"
                                           name="softwareName" value=""
                                            type="text">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="APKName">版本大小<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="APKName1" name="APKName" required="required"
                                           placeholder="请输入版本大小 ，单位为Mb"
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="supportROM">发布状态<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input  readonly type="text" id="supportROM1" name="supportROM"
                                            required="required" placeholder=""
                                            class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="appInfo">版本简介 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                <textarea id="appInfo1" required="required" name="appInfo"
                                          class="form-control col-md-7 col-xs-12"
                                          placeholder="请输入本软件的相关信息，本信息作为软件的详细信息进行软件介绍。">
                                                        </textarea>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="logoPicPath">APK文件 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="logoPicPath1" type="file" name="logoPicPath" required="required"
                                           class="optional form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="ln_solid"></div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->











</body>
</html>