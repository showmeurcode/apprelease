<%--
  Created by IntelliJ IDEA.
  User: x
  Date: 2017/11/9
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

</head>
<body>


<!--修改app内容区 -->
<div id="Content" class="right_col" role="main" >

    <div class="">
        <div class="page-title">



        </div>
        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>修改APP基础信息
                            <small>sub title</small>
                        </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                   role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                        <form class="form-horizontal form-label-left" id="changeApp" novalidate enctype="multipart/form-data">

                            <p>请填写信息

                            </p>
                            <span class="section"> </span>

                            <input id="id" name="id" value="${appInfo.id}" hidden/>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="softwareName">软件名称
                                    <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="softwareName" class="form-control col-md-7 col-xs-12"
                                           name="softwareName" placeholder="请输入文件名称"
                                           value="${appInfo.softwareName}"
                                           required="required" type="text">
                                </div>
                                <span id="yzname"></span>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="APKName1">APK名称<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="APKName1" name="APKName" required="required"
                                           placeholder="请输入APK名称" value="${appInfo.APKName}"
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
                                           required="required" placeholder="请输入支持的ROM"
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
                                           required="required" placeholder="请输入软件支持的界面语言"
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
                                           required="required" placeholder="请输入软件大小，单位是Mb"
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
                                    <input id="downloads" type="text" name="downloads" value="${appInfo.downloads}"
                                           placeholder="请输入下载次数" required="required"
                                           class="optional form-control col-md-7 col-xs-12">
                                </div>
                                <span id="yzloads"></span>
                            </div>
                            <div class="item form-group">
                                <label for="flatformId"
                                       class="control-label col-md-3">所属平台</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="flatformId" id="flatformId"
                                            class="form-control col-md-7 col-xs-12" required="required">
                                        <option value="0">请选择</option> 
                                        <option value="1" <c:if test="${appInfo.flatformId == 1}">selected</c:if>>手机</option> 
                                        <option value="2" <c:if test="${appInfo.flatformId == 2}">selected</c:if>>平板</option> 
                                        <option value="3" <c:if test="${appInfo.flatformId == 3}">selected</c:if>>通用</option> 
                                    </select>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label for="categoryLevel1"
                                       class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="categoryLevel1" id="categoryLevel1"
                                            class="form-control col-md-7 col-xs-12" required="required">
                                        <option value="0">请选择</option> 
                                        <c:forEach items="${appCategory1List}" var="appCategory1">
                                            <option value="${appCategory1.id}" <c:if test="${appCategory1.id == appInfo.categoryLevel1}">selected</c:if>>${appCategory1.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label for="categoryLevel2"
                                       class="control-label col-md-3 col-sm-3 col-xs-12">二级分类</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="categoryLevel2" id="categoryLevel2"
                                            class="form-control col-md-7 col-xs-12" required="required">
                                        <c:forEach items="${appCategory2List}" var="appCategory2">
                                            <option value="${appCategory2.id}" <c:if test="${appCategory2.id == appInfo.categoryLevel2}">selected</c:if>>${appCategory2.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label for="categoryLevel3"
                                       class="control-label col-md-3 col-sm-3 col-xs-12">三级分类</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="categoryLevel3" id="categoryLevel3"
                                            class="form-control col-md-7 col-xs-12" required="required">
                                        <c:forEach items="${appCategory3List}" var="appCategory3">
                                            <option value="${appCategory3.id}" <c:if test="${appCategory3.id == appInfo.categoryLevel3}">selected</c:if>>${appCategory3.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="status">APP状态 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="status" name="status" readonly
                                           <c:if test="${appInfo.status == 1}">value="待审核" </c:if>
                                           <c:if test="${appInfo.status == 2}">value="审核通过" </c:if>
                                           <c:if test="${appInfo.status == 3}">value="审核不通过" </c:if>
                                           <c:if test="${appInfo.status == 4}">value="已上架" </c:if>
                                           <c:if test="${appInfo.status == 5}">value="已下架" </c:if>
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="appInfo">应用简介 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                    <textarea id="appInfo" required="required" name="appInfo"
                                              class="form-control col-md-7 col-xs-12"
                                              placeholder="请输入本软件的相关信息，本信息作为软件的详细信息进行软件介绍。">${appInfo.appInfo}</textarea>
                                </div>
                                <span id="yztext"></span>


                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="s_logoLocPath">LOGO图片 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <img src="${appInfo.logoPicPath}" id="look" style="width: 50px;height: 50px;"/>
                                    <input id="s_logoLocPath" type="file" name="s_logoLocPath" required="required"
                                           class="optional form-control col-md-7 col-xs-12">
                                </div>
                                <div id="errorfile">${uploadFileError}</div>
                            </div>
                            <input id="logoPicPath" name="logoPicPath" value="${appInfo.logoPicPath}" hidden/>
                            <input id="logoLocPath" name="logoLocPath" value="${appInfo.logoLocPath}" hidden/>
                            <input id="updateDate" name="updateDate" value="${appInfo.updateDate}" hidden/>
                            <input id="devId" name="devId" value="${appInfo.devId}" hidden/>
                            <input id="onSaleDate" name="onSaleDate" value="${appInfo.onSaleDate}" hidden/>
                            <input id="offSaleDate" name="offSaleDate" value="${appInfo.offSaleDate}" hidden/>
                            <input id="versionId" name="versionId" value="${appInfo.versionId}" hidden/>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <c:if test="${appInfo.status == 3}">
                                    <a id="CommitAndSave" type="button" class="btn btn-success">保存并再次提交审核</a>
                                </c:if>
                                <div class="col-md-6 col-md-offset-3">
                                    <a id="send" type="button" class="btn btn-success">保存
                                    </a>
                                    <button type="button" class="btn btn-primary">返回</button>
                                </div>
                            </div>
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
