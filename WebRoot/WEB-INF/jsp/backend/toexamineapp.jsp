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
                                    <input readonly id="softwareName" class="form-control col-md-7 col-xs-12"
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
                                    <input  readonly type="text" id="APKName" name="APKName"
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
                                    <input readonly type="text" id="supportROM" name="supportROM"
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
                                    <input readonly type="text" id="interfaceLanguage" name="interfaceLanguage"
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
                                    <input  readonly type="text" id="softwareSize" name="softwareSize"
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
                                    <input readonly id="downloads" type="text" name="downloads"
                                          value="${appInfo.downloads}"
                                           class="optional form-control col-md-7 col-xs-12">

                                </div>
                                <span id="yzloads"></span>
                            </div>
                            <div class="item form-group">
                                <label
                                       class="control-label col-md-3">所属分类</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control col-md-7 col-xs-12"
                                               value="${appInfo.categoryLevel1} --> ${appInfo.categoryLevel2} --> ${appInfo.categoryLevel3}" readonly="readonly">
                                    </div>


                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="status">APP状态 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="status" name="status"
                                           readonly value="${appInfo.status}"
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="appInfo">应用简介 <span class="required">*</span>
                                </label>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                    <textarea readonly id="appInfo"  name="appInfo"
                              class="form-control col-md-7 col-xs-12"
                              >${appInfo.appInfo}</textarea>

                                </div>
                                <span id="yztext"></span>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       >LOGO图片 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <c:choose>
                                        <c:when test="${appInfo.logoPicPath == null || appInfo.logoPicPath == ''}">
                                            暂无
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${appInfo.logoPicPath }?m=1" width="100px;"/>
                                        </c:otherwise>
                                    </c:choose>

                                </div>

                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <a appId="${appInfo.id }"  tojudge="yes" class="btn btn-success tojudge">审核通过</a>
                                    <a appId="${appInfo.id }"  tojudge="no"  class="btn btn-success tojudge">审核不通过</a>
                                    <a type="button" class="btn btn-primary" id="back">返回</a>
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
                        <h2>APP ${appInfo.softwareName}  的最新版本信息

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
                                    <input readonly id="softwareName1" class="form-control col-md-7 col-xs-12"
                                           name="softwareName" value="${latestAppVersion.versionNo}"
                                            type="text"/>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="APKName">版本大小<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input readonly type="text" id="APKName1" name="APKName" required="required"
                                         value="${latestAppVersion.versionSize}"
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="supportROM">发布状态<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <c:if test="${latestAppVersion.publishStatus==1}">
                                        不发布
                                    </c:if>
                                    <c:if test="${latestAppVersion.publishStatus==2}">
                                        已发布
                                    </c:if>
                                    <c:if test="${latestAppVersion.publishStatus==3}">
                                        预发布
                                    </c:if>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="appInfo">版本简介 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                <input type=" textarea" id="appInfo1" required="required"
                                          class="form-control col-md-7 col-xs-12"
                                           value="${latestAppVersion.versionInfo}"/>

                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       >APK文件 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <a href="${pageContext.request.contextPath }/statics/uploadfiles/${latestAppVersion.apkFileName}"> ${latestAppVersion.apkFileName}  </a>
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
<script src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>
<script type="text/javascript">
$("#back").on("click",function(){
window.location.href = "list";
});
</script>








</body>
</html>