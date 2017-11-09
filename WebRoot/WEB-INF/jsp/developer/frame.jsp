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

    <title>APP开发者管理! | </title>

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
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">


    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/statics/css/custom.min.css" rel="stylesheet">


</head>

<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>APP发布系统</span></a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile">
                    <div class="profile_pic">
                        <img src="images/img.jpg" alt="..." class="img-circle profile_img">
                    </div>
                    <div class="profile_info">
                        <span>欢迎,</span>
                        <h2>某某某</h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->

                <br/>

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <h3>开发者</h3>
                        <ul class="nav side-menu">
                            <li><a><i class="fa fa-home"></i>APP应用管理<span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="javascript:;" id="showAllApps">个人APP维护</a></li>
                                    <li><a href="###" id="addNewApp">上传新APP</a></li>
                                </ul>
                            </li>
                            <li><a><i class="fa fa-edit"></i> 个人账户管理<span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">

                                    <li><a href="###">修改资料</a></li>
                                    <li><a href="###">重置密码</a></li>


                                </ul>
                            </li>
                            <li><a><i class="fa fa-desktop"></i> UI Elements <span
                                    class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="general_elements.html">General Elements</a></li>
                                    <li><a href="media_gallery.html">Media Gallery</a></li>
                                    <li><a href="typography.html">Typography</a></li>
                                    <li><a href="icons.html">Icons</a></li>
                                    <li><a href="glyphicons.html">Glyphicons</a></li>
                                    <li><a href="widgets.html">Widgets</a></li>
                                    <li><a href="invoice.html">Invoice</a></li>
                                    <li><a href="inbox.html">Inbox</a></li>
                                    <li><a href="calendar.html">Calendar</a></li>
                                </ul>
                            </li>


                        </ul>
                    </div>

                </div>
                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small">
                    <a data-toggle="tooltip" data-placement="top" title="Settings">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Lock">
                        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Logout">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                    </a>
                </div>
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <nav>
                    <div class="nav toggle">
                        <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                    </div>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="">
                            <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                               aria-expanded="false">
                                <img src="images/img.jpg" alt="">John Doe
                                <span class=" fa fa-angle-down"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-usermenu pull-right">
                                <li><a href="javascript:;"> Profile</a></li>
                                <li>
                                    <a href="javascript:;">
                                        <span class="badge bg-red pull-right">50%</span>
                                        <span>Settings</span>
                                    </a>
                                </li>
                                <li><a href="javascript:;">Help</a></li>
                                <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                            </ul>
                        </li>

                        <li role="presentation" class="dropdown">
                            <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown"
                               aria-expanded="false">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-green">6</span>
                            </a>
                            <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                <li>
                                    <a>
                                        <span class="image"><img src="images/img.jpg" alt="Profile Image"/></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span class="image"><img src="images/img.jpg" alt="Profile Image"/></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span class="image"><img src="images/img.jpg" alt="Profile Image"/></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <a>
                                        <span class="image"><img src="images/img.jpg" alt="Profile Image"/></span>
                                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                                    </a>
                                </li>
                                <li>
                                    <div class="text-center">
                                        <a>
                                            <strong>See All Alerts</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->


        <%--————————————————————————————————————————————————————主内容区↓———————————————————————————————————————————————————————————--%>







            <!-- 欢迎页内容区 -->
            <div id="Content" class="right_col" role="main">

                <h3>欢迎登录app发布系统
                    <small>xxxxxxxxxx</small>
                    ，请在左侧选择操作
                </h3>


            </div>
            <!-- /page content -->


<<<<<<< HEAD
            <!-- app列表内容区 -->
            <div id="showAllAppsContent" class="right_col" role="main" hidden>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>APP列表
                                    <small>Users</small>
                                </h2>

                            </div>
                            <div class="x_content">

                                <table id="listTable" class="table table-striped table-bordered">
                                    <thead>
                                    <tr>
                                        <th style="width: 5%">软件名称</th>
                                        <th style="width: 5%">apk名称</th>
                                        <th style="width: 5%">软件大小</th>
                                        <th style="width: 5%">所属平台</th>
                                        <th style="width: 10%">所属分类</th>
                                        <th style="width: 5%">状态</th>
                                        <th style="width: 10%">下载次数</th>
                                        <th style="width: 10%">最新版本号 </th>
                                        <th style="width: 40%">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>关屏锁定</td>
                                        <td>
                                            <a>guanpingsuoding</a>

                                        </td>
                                        <td>
                                            3.00m
                                        </td>
                                        <td class="project_progress">
                                            手机
                                        </td>
                                        <td>
                                           全部应用》》撒大声地》盛世嫡妃
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-success btn-xs">审核通过</button>
                                        </td>
                                        <td>
                                            30
                                        </td>
                                        <td>
                                            v1.1.2
                                        </td>
                                        <td>


                                            <div class="btn-group">
                                                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                                                    点击操作
                                                    <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">

                                                    <li><a href="#">下架</a> </li>
                                                    <li><a href="#">新增版本</a> </li>
                                                    <li><a href="#">修改版本</a> </li>
                                                    <li><a href="#">查看</a> </li>
                                                    <li><a href="#">修改</a> </li>
                                                    <li><a href="#">删除</a> </li>

                                                </ul>
                                            </div>

                                        </td>
                                    </tr>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!--新增app内容区 -->
            <div id="addNewAppContent" class="right_col" role="main" hidden>

                <div class="">
                    <div class="page-title">



                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>新增APP基础信息
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
                                                   for="interfaceLanguage">界面语言<span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="interfaceLanguage" name="interfaceLanguage"
                                                       required="required" placeholder="请输入软件支持的界面语言"
                                                       class="form-control col-md-7 col-xs-12">
                                                <div></div>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                   for="softwareSize">软件大小 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="softwareSize" name="softwareSize"
                                                       required="required" placeholder="请输入软件大小，单位是Mb"
                                                       class="form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                   for="downloads">下载次数 <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="downloads" type="text" name="downloads"
                                                       placeholder="请输入下载次数" required="required"
                                                       class="optional form-control col-md-7 col-xs-12">
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="flatformId"
                                                   class="control-label col-md-3">所属平台</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select name="flatformId" id="flatformId"
                                                        class="form-control col-md-7 col-xs-12" required="required">
                                                    <option value="0" selected>请选择</option> 
                                                    <option value="1">手机</option> 
                                                    <option value="2">平板</option> 
                                                    <option value="3">通用</option> 
                                                </select>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="categoryLevel1"
                                                   class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select name="categoryLevel1" id="categoryLevel1"
                                                        class="form-control col-md-7 col-xs-12" required="required">
                                                    <option value="0" selected>请选择</option> 
                                                    <option value="1">手机</option> 
                                                    <option value="2">平板</option> 
                                                    <option value="3">通用</option> 
                                                </select>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="categoryLevel2"
                                                   class="control-label col-md-3 col-sm-3 col-xs-12">二级分类</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select name="categoryLevel2" id="categoryLevel2"
                                                        class="form-control col-md-7 col-xs-12" required="required">
                                                    <option value="0" selected>请选择</option> 
                                                    <option value="1">手机</option> 
                                                    <option value="2">平板</option> 
                                                    <option value="3">通用</option> 
                                                </select>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label for="categoryLevel3"
                                                   class="control-label col-md-3 col-sm-3 col-xs-12">三级分类</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select name="categoryLevel3" id="categoryLevel3"
                                                        class="form-control col-md-7 col-xs-12" required="required">
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
                                                        <textarea id="appInfo" required="required" name="appInfo"
                                                                  class="form-control col-md-7 col-xs-12"
                                                                  placeholder="请输入本软件的相关信息，本信息作为软件的详细信息进行软件介绍。">
                                                        </textarea>
                                            </div>
                                        </div>
                                        <div class="item form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                                   for="logoPicPath">LOGO图片 <span class="required">*</span>
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
=======
>>>>>>> d1f015fe1a5c87c109dede29ca11e9120036eada







        <%--————————————————————————————————————————————————————主内容区↑———————————————————————————————————————————————————————————--%>

        <!-- footer content -->
        <footer>
            <div class="pull-right">
                Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
            </div>
            <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
    </div>
</div>


<!-- jQuery -->
<script src="${pageContext.request.contextPath }/statics/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath }/statics/js/fastclick.js"></script>
<!-- NProgress -->
<script src="${pageContext.request.contextPath }/statics/js/nprogress.js"></script>

<!-- iCheck -->
<script src="../vendors/iCheck/icheck.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath }/statics/js/custom.min.js"></script>

<!-- Datatables -->
<script src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/dataTables.bootstrap.js"></script>
<script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="../vendors/datatables.net-scroller/js/datatables.scroller.min.js"></script>
<script src="../vendors/jszip/dist/jszip.min.js"></script>
<script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

<!-- Custom Theme Scripts -->
<script src="../build/js/custom.min.js"></script>


<input type="hidden" id="rootpath" value="${pageContext.request.contextPath }">

<script type="text/javascript">
    $(function () {


    })

</script>


</body>
</html>