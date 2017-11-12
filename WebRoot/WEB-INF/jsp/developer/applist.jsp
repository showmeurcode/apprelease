<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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





    <form  onkeydown="if(event.keyCode==13)return false;" action="###" id="queryform" class="form-horizontal form-label-left" style="float: left">



      <div class="form-group"style="float: left">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">软件名称</label>
        <div class="col-md-9 col-sm-9 col-xs-12">
          <input type="text" name="softwareName" id="autocomplete-custom-append" class="form-control col-md-10"/>
        </div>
      </div>



      <div class="form-group"style="float: left">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">所属平台</label>
        <div class="col-md-9 col-sm-9 col-xs-12">
          <select name="flatformId" class="form-control">
            <option value="0">--请选择--</option>
            <option value="1">手机</option>
            <option value="2">平板</option>
            <option value="3">通用</option>
          </select>
        </div>
      </div>
      <div class="form-group"style="float: left">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">一级分类</label>
        <div class="col-md-9 col-sm-9 col-xs-12">
          <select name="categoryLevel1"id="categoryLevel1" class="form-control  levels">
            <option value="0">--请选择--</option>
          <c:forEach items="${appCategory1List}" var="appCategory1">
            <option value="${appCategory1.id}">${appCategory1.categoryName}</option>
          </c:forEach>


          </select>
        </div>
      </div>
      <div class="form-group"style="float: left">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">二级分类</label>
        <div class="col-md-9 col-sm-9 col-xs-12">
          <select name="categoryLevel2"id="categoryLevel2"  class="form-control levels">
            <option value="0">--请选择--</option>
          </select>
        </div>
      </div>
      <div class="form-group"style="float: left">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">三级分类</label>
        <div class="col-md-9 col-sm-9 col-xs-12">
          <select name="categoryLevel3" id="categoryLevel3" class="form-control  levels">
            <option value="0">--请选择--</option>
          </select>
        </div>
      </div>

      <div class="form-group"style="float: left">
        <label class="control-label col-md-3 col-sm-3 col-xs-12">APP状态</label>
        <div class="col-md-9 col-sm-9 col-xs-12">
          <select name="status" class="form-control">
            <option value="0">--请选择--</option>
            <option value="1" class="option">待审核</option>
            <option value="2">审核通过</option>
            <option value="3">审核未通过</option>
            <option value="4">已上架</option>
            <option value="5">已下架</option>

          </select>
        </div>
      </div>



      <div class="ln_solid"></div>
      <div class="form-group">
        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
          <button type="button" id ="querysubmit"class="btn btn-success">查询</button>
        </div>
      </div>

    </form>









    <div class="row">
      <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
          <div class="x_title">
            <h2>APP列表d
              <small></small>
            </h2>

          </div>
          <div class="x_content">

            <table id="listTable" class="table table-striped table-bordered">
              <thead>
              <tr>
                <th style="width: 8%">软件名称</th>
                <th style="width: 5%">apk名称</th>
                <th style="width: 5%">软件大小</th>
                <th style="width: 3%">所属平台</th>
                <th style="width: 14%">所属分类</th>
                <th style="width: 5%">状态</th>
                <th style="width: 5%">下载次数</th>
                <th style="width: 5%">最新版本号 </th>
                <th style="width: 5%">操作</th>
              </tr>
              </thead>
              <tbody  id="apptobody">
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