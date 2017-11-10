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

  </head>

  <body class="nav-md">



  <!-- app列表内容区 -->
  <div id="Content" class="right_col" role="main" >
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





  </body>
</html>