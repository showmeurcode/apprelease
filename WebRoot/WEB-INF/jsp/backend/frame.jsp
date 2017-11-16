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

    <title>APP后台管理系统! | </title>

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
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>APP后台管理系统</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>欢迎,</span>
                <h2>${sessionScope.backendUserSession.userName}</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                  <h3>系统管理员</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i>APP管理<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="javaScrinpt:;" id="showAllToexamineAPPS">APP审核</a></li>
                      <li><a href="javaScrinpt:;" id="advertisement">广告推广</a></li>

                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 用户管理<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="###">用户列表</a></li>
                      <li><a href="###">条件查找</a></li>
                      <li><a href="###">新增用户</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> 基础数据维护<span class="fa fa-chevron-down"></span></a>
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
              <a data-toggle="tooltip" data-placement="top" title="登出" href="${pageContext.request.contextPath }/backenduser/Bloginout">
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
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
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
                    <li><a href="Blogin.html"><i class="fa fa-sign-out pull-right"></i>登出</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
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
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
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
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
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
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
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

        <!-- page content -->
        <div class="right_col" role="main">

              <div class="title_left" id="Content" role="main">
                <h3>欢迎你：系统管理员 <small>${sessionScope.backendUserSession.userName}</small>，请在左侧选择操作</h3>
              </div>

        </div>
        <!-- /page content -->

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
    <script src="${pageContext.request.contextPath }/statics/js/jquery.pjax.js"></script>
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
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/appfrom.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
    <input type="hidden" id="rootpath" value="${pageContext.request.contextPath}">
  <script type="text/javascript">

  $(function () {

      <!--=========================================================审核APP列表信息展示  孔祥忠=======================================================-->

      var rootpath=$("#rootpath").val();//获取根路径

      var params="";//声明关联查询条件的全局变量
      var table;
     function showToexamineAPPS() {
         var data="status="+1;
         if(params!=""){
             data+="&"+params;
         }
         $.ajax({
             type:"GET",
             url:rootpath+"/appInfo/showAllToexamineAPPS", //注意此处斜杠不能少，否则无法显示APP信息
             data:data,   //注意此处不需要加引号("")
             dataType :"html",
             success : function (data) {

                 $("#appdetails").html(data)

                 table=$('#listTable').DataTable({
                     "bLengthChange": false, //是否显示修改显示数据数量的菜单
                     "iDisplayLength": 6,//设置每页默认显示多少数据
                     searching : false, //去掉搜索框
                     language: {
                         "sProcessing": "处理中...",
                         "sLengthMenu": "显示 _MENU_ 项结果",
                         "sZeroRecords": "没有匹配结果",
                         "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                         "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                         "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                         "sInfoPostFix": "",
                         "sSearch": "搜索:",
                         "sUrl": "",
                         "sEmptyTable": "表中数据为空",
                         "sLoadingRecords": "载入中...",
                         "sInfoThousands": ",",
                         "oPaginate": {
                             "sFirst": "首页",
                             "sPrevious": "上页",
                             "sNext": "下页",
                             "sLast": "末页"
                         },
                         "oAria": {
                             "sSortAscending": ": 以升序排列此列",
                             "sSortDescending": ": 以降序排列此列"
                         }
                     }
                 });

             }

         })
          
      }

      $("#showAllToexamineAPPS").click(function () {
          params="";// 全局变量归0
          $("#Content").load("${pageContext.request.contextPath}/appCategory/showlevelmethod2backend  #Content>*");

          showToexamineAPPS ();//显示所有app列表(后台拼接html法)
      });

      // 查询按钮点击时，赋予全局变量param新的值（关联查询条件），紧接着进行查询获取数据
      $("body").on("click", "#querysubmit",function () {
          params=$("#queryform").serialize();   //serialize() 方法通过序列化表单值，创建 URL 编码文本字符串。
          table.destroy();
          showToexamineAPPS ();
      });

      //单击 查看并审核APP 时传递appId到APPVersionController里做相应查询，然后根据新版本id判断是否可以审核该APP

      $("body").on("click",".ToexamineAPP",function () {
          var rootpath=$("#rootpath").val();
          var  appId= $(this).attr("id");
          //在这里即判断 有没有最新版本信息（通过按钮前面的那一列有没html值，若没有即弹出提示并returnfalse）.
          if($(this).parents(".xxx").prev().html().trim()==""){
              alert("该APP应用没有上传最新版本,不能进行审核操作！");
             return false;
          }
          $("#Content").load("${pageContext.request.contextPath}/appVersion/ToexamineAPPVersion?appId="+appId+"  #Content>*")






      })







  })



  </script>
  </body>
</html>