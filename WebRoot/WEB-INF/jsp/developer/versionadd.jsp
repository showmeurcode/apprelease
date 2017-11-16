<%--
  Created by IntelliJ IDEA.
  User: x
  Date: 2017/11/9
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--<%@include file="common/header.jsp"%>--%>
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

</head>
<body>


<!--新增app内容区 -->
<div id="Content" class="right_col" role="main">
    <%--历史版本列表显示区--%>
    <div class="page-title"></div>
    <div class="clearfix"></div>

    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">

                <div class="x_title">
                    <br>
                    <h2>历史版本列表

                    </h2>
                </div>
                <div class="x_content">

                    <table id="listTable" class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 8%">软件名称</th>
                            <th style="width: 5%">版本号</th>
                            <th style="width: 5%">版本大小(单位：M)</th>
                            <th style="width: 5%">发布状态</th>
                            <th style="width: 5%">APK文件下载</th>
                            <th style="width: 5%">最新更新时间</th>
                        </tr>
                        </thead>



                        <tbody id="apptobody">
                        <c:forEach items="${appVersionList}" var="appVersion">
                        <tr role="row" class="odd">
                            <td class="sorting_1">${appInfo.softwareName}</td>
                           <td>  ${appVersion.versionNo}</td>
                            <td> ${appVersion.versionSize}</td>
                            <td>
                                <button type="\&quot;button\&quot;" class="btn btn-success btn-xs">
                                    <c:if test="${appVersion.publishStatus==1}">
                                            不发布
                                    </c:if>
                                    <c:if test="${appVersion.publishStatus==2}">
                                        已发布
                                    </c:if>
                                    <c:if test="${appVersion.publishStatus==3}">
                                        未发布
                                    </c:if>
                                </button>
                            </td>
                            <td class="\&quot;project_progress\&quot;">
                                <a href="${pageContext.request.contextPath }/statics/uploadfiles/${appVersion.apkFileName}"> ${appVersion.apkFileName} </a>

                            </td>
                            <td>  <fmt:formatDate value="${appVersion.modifyDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>


    <%--版本信息表单提交区--%>

    <div class="">
        <div class="page-title"></div>
        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>为APP ${appInfo.softwareName} 新增版本信息
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

                        <form  method="post" id="versionaddform" onkeydown="if(event.keyCode==13)return false;" class="form-horizontal form-label-left"  enctype="multipart/form-data">

                            <p>请填写信息
                            </p>
                            <span class="section"> </span>
                            <input type="hidden" name="appId" value="${appInfo.id}">
                            <input type="hidden" name="createBy" value="${sessionScope.devUserSession.id}">
                            <%--版本号--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="versionNo">版本号*
                                    <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="versionNo" class="form-control col-md-7 col-xs-12"
                                           name="versionNo" placeholder="请输入版本号"
                                           required="required" type="text">
                                </div>
                            </div>
                            <%--版本大小--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="versionSize">版本大小<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="versionSize" name="versionSize" required="required"
                                           placeholder="请输入版本大小 ，单位为Mb"
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <%--发布状态--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="publishStatus">发布状态<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input  type="text" id="publishStatus" name="publishStatus"
                                            value="3" hidden>预发布
                                </div>
                            </div>
                            <%--版本简介--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="versionInfo">版本简介 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                <textarea id="versionInfo" required="required" name="versionInfo"
                                          class="form-control col-md-7 col-xs-12"
                                          placeholder="请输入本版本的相关信息，本信息作为版本的详细信息进行软件介绍。">
                                                        </textarea>
                                </div>
                            </div>
                            <%--apk文件上传--%>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="apkup">APK文件 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="apkup" type="file" name="attach" required="required"
                                           class="optional form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <a  id="addversionbutton" class="btn btn-success">保存</a>
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
