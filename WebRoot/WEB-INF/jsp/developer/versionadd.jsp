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

                        <tr role="row" class="odd">
                            <td class="sorting_1">Dont Starve饥荒</td>
                            <td><a>com.kleientertainment.doNotStarvePocket</a></td>
                            <td> 4.0</td>
                            <td>
                                <button type="\&quot;button\&quot;" class="btn btn-success btn-xs">已上架</button>
                            </td>
                            <td class="\&quot;project_progress\&quot;"> 平板</td>
                            <td> 全部游戏》休闲游戏》冒险</td>
                        </tr>

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
                        <h2>为APP xxxxx 新增版本信息
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

                        <form class="form-horizontal form-label-left" novalidate>

                            <p>请填写信息

                            </p>
                            <span class="section"> </span>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="softwareName">软件名称
                                    <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="softwareName" class="form-control col-md-7 col-xs-12"
                                           name="softwareName" placeholder="请输入文件名称"
                                           required="required" type="text">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="APKName">APK名称<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="APKName" name="APKName" required="required"
                                           placeholder="请输入APK名称"
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="supportROM">支持ROM<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" id="supportROM" name="supportROM"
                                           required="required" placeholder="请输入支持的ROM"
                                           class="form-control col-md-7 col-xs-12">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       for="appInfo">版本简介 <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">

                                <textarea id="appInfo" required="required" name="appInfo"
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
                                    <input id="logoPicPath" type="file" name="logoPicPath" required="required"
                                           class="optional form-control col-md-7 col-xs-12">
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <button id="send" type="submit" class="btn btn-success">保存
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
</div>
<!-- /page content -->


</body>
</html>
