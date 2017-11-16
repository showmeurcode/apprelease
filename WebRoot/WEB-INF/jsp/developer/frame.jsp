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

    <title>APP开发者管理| </title>

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
                    <a href="###" class="site_title"><i class="fa fa-paw"></i> <span>APP发布系统</span></a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile">
                    <div class="profile_pic">
                        <img src="images/img.jpg" alt="..." class="img-circle profile_img">
                    </div>
                    <div class="profile_info">
                        <span>欢迎,</span>

                        <h2>${sessionScope.devUserSession.devName}</h2>

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
                    <a data-toggle="tooltip"  data-placement="top" title="Logout" href="${pageContext.request.contextPath }/devuser/loginout">
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
                                <img src="images/img.jpg" alt="">${sessionScope.devUserSession.devName}
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
                                <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i>登出</a></li>
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
                <small>${sessionScope.devUserSession.devName}</small>
                ，请在左侧选择操作
            </h3>


        </div>
        <!-- /page content -->



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
<script src="${pageContext.request.contextPath }/statics/js/appfrom.js"></script>

<script src="${pageContext.request.contextPath }/statics/js/appfrom.js"></script>


<!-- Custom Theme Scripts -->
<script src="../build/js/custom.min.js"></script>
<input type="hidden" id="rootpath" value="${pageContext.request.contextPath}">
<input type="hidden" id="devUserId" value="${sessionScope.devUserSession.id}">
<script type="text/javascript">
    $(function () {
//        ===============================尹晓晨 分页显示app列表，按级显示查询条件，并按条件查询app================================================================
        var rootpath=$("#rootpath").val();//获取根路径
        var devUserId=$("#devUserId").val();//获取根路径
        var params="";//声明关联查询条件的全局变量
        var table;
        function showApps () {//根据页码显示app列表
            var data="devId="+devUserId;
            /* alert(data)*/
            if(params!=""){
                data+="&"+params;
            }
            $.ajax({
                type:"GET",
                url:rootpath+"/appInfo/showAllApps",
                data:data,
                dataType:"html",
                success:function (data) {
                    $("#apptobody").html(data)
                    table=$('#listTable').DataTable({
                        "bLengthChange": false, //是否显示修改显示数据数量的菜单
                        "iDisplayLength": 5,//设置每页默认显示多少数据
                        searching : false, //去掉搜索框方法一：百度上的方法，但是我用这没管用
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
            });

        }
        $("#showAllApps").click(function () {
            params="";// 全局变量归0
            $("#Content").load("${pageContext.request.contextPath}/appCategory/showlevelmethod2  #Content>*");
            /*$.pjax({
                url: '${pageContext.request.contextPath}/appCategory/showlevelmethod2',
                container: '#Content',//本网页的容器
                maxCacheLength:20,//缓存历史页面数
                cache: true,
                fragment: "#Content",//目标网页的容器
                timeout: 8000
            });*/
            showApps ();//显示所有app列表(后台拼接html法)
        });

        // 注册点击的多级联动事件
        $("body").on("change", ".levels",function () {//select选项改变使用.change（）事件
            var value=$(this).find("option:checked").attr("value");
            var $nowselect=$(this);
            var $nextselect= $nowselect.parents(".form-group").next().find(".levels");
            $.ajax({
                type:"GET",
                url:rootpath+"/appCategory/showsonlevel.json",
                data:"parentId="+value,
                dataType:"json",
                success:function (data) {
                    $nextselect.empty();
                    $nextselect.append("<option value='0'>--请选择--</option>");
                    if(data!=null&&data.length!=0){
                        $.each(data,function (index,category) {
                            /*  alert(category.categoryName);*/
                            $nextselect.append(" <option value='"+category.id+"'>"+category.categoryName+"</option>")

                        })
                    }
                }
            });
        });
        // 查询按钮点击时，赋予全局变量param新的值（关联查询条件），紧接着进行查询获取数据
        $("body").on("click", "#querysubmit",function () {
            params=$("#queryform").serialize();
            table.destroy();
            showApps ();
        });
        //        ====================================尹晓晨APP上下架操作==================================================================
        $("body").on("click", ".putonApp,.putoffApp",function () {
            var className= $(this).attr("class");
            var appInfoId= $(this).attr("id");
            var $this=$(this);
            var data="className="+className+"&id="+appInfoId;
            $.ajax({
                type:"GET",
                url:rootpath+"/appInfo/putonandoff",
                data:data,
                dataType:"json",
                success:function (data) {
                    $this.html(data.option);//修改上架或下架选项
                    $this.attr("class",data.className);//修改类名
                    $this.parents("tr").find(".btn-success").html(data.statusName);//修改状态

                }
            });
        });

        //        ====================================尹晓晨新增app版本信息==================================================================
        $("body").on("click", ".addAppVersion",function () {
            var  appId= $(this).attr("id");
            $("#Content").load("/apprelease/appVersion/addAppVersion?appId="+appId+"  #Content>*");
        });

        $("body").on("click", "#addversionbutton",function () {
            //验证开始（输入框在前台验证，文件上传在后端验证）
            var istrue=false;
           /* if($("body #versionaddform #versionNo").val()==""){
                alert("版本号不能为空"); return false;
            }
            if($("body #versionaddform #versionSize").val()==""){
                alert("版本大小不能为空"); return false;
            }
            if($("body #versionaddform #versionInfo").val().trim()==""||null){
                alert("内容简介不能为空"); return false;
            }*/
           var data= $("body #versionaddform").serialize();
            alert(data);
            $.ajax({
                type:"GET",
                url:rootpath+"/appInfo/putonandoff",
                data:data,
                dataType:"json",
                success:function (data) {
                    $this.html(data.option);//修改上架或下架选项
                    $this.attr("class",data.className);//修改类名
                    $this.parents("tr").find(".btn-success").html(data.statusName);//修改状态

                }


            })




            istrue=true;
            if(istrue==true){
                alert("上传成功");
                params="";// 全局变量归0
                //执行列出app列表页面
                $("#Content").load("/apprelease/appCategory/showlevelmethod2  #Content>*");
                showApps ();//显示所有app列表(后台拼接html法)
            }
        });



//        ==========================================================张玮钰==================================================================

        $("#addNewApp").click(function () {
            $("#Content").load("${pageContext.request.contextPath}/appInfo/add  #Content>*");
        });

        $("body").on("click","#send1",function () {
            var bparam = $("#appadd").serialize();

            $.ajax({
                type:"POST",
                url:rootpath+"/appInfo/updateadd",
                data:bparam,
                dataType:"json",
                success:function (data) {
                    if (data.status == "success") {
                        alert("添加成功");
                    } else {
                        alert("添加失败");
                    }
                },
                error:function (data) {
                    alert("添加大失败");
                }
            });
            alert("异步之后");
        });

        $("body").on("click",".deleteApp",function () {
            if (confirm("确定要删除APP")) {
                var id=$(this).attr("id");
                $.ajax({
                    type:"POST",
                    url:rootpath+"/appInfo/delApp",
                    data:"id="+id,
                    dataType:"json",
                    success:function (data) {
                        $("#Content").load("${pageContext.request.contextPath}/appCategory/showlevelmethod2  #Content>*");
                        showApps ();
                        if(data.status=="success"){
                            alert("删除成功！")
                        }else {
                            alert("删除失败！")
                        }
                    },
                    error:function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("XMLHttpRequest.status："+XMLHttpRequest.status);
                        alert("XMLHttpRequest.readyState："+XMLHttpRequest.readyState);
                        alert("textStatus："+textStatus);
//                readystate: 4  status: 400 textStatus: error
                    }
                })
            } else {}

        });


//        ==============================================================李高珊==============================================================

        //加载更新的页面
        $("body").on("click",".changeApp",function () {
            var status = $(this).parents("tr").find(".btn-xs").html();
            var appId=$(this).attr("id");


            if (status == "审核通过" || status == "已上架" || status == "已下架") {
                alert("该APP应用的状态为：【"+status+"】，不能修改！")
            } else {
                $("#Content").load("${pageContext.request.contextPath}/appInfo/changeApp?id="+appId+"  #Content>*");
            }




        });


        //一级分类改变关联的二级分类
        $("body").on("change","#categoryLevel1",function () {
            var categoryLevel1 = $(this).val();
            $.ajax({
                type:"POST",
                url:rootpath+"/appCategory/getlevelByparent",
                data:"parentId="+categoryLevel1,
                dataType:"html",
                success:function (data) {
                    $("#categoryLevel2").html(data);
                }
            });
        });

        //二级分类改变关联的三级分类
        $("body").on("change","#categoryLevel2",function () {
            var categoryLevel2 = $(this).val();
            $.ajax({
                type:"POST",
                url:rootpath+"/appCategory/getlevelByparent",
                data:"parentId="+categoryLevel2,
                dataType:"html",
                success:function (data) {
                    $("#categoryLevel3").html(data);
                }
            });
        });

        //点击保存进行数据更改
        $("body").on("click","#send",function () {

           var bparams = $("#changeApp").serialize();
           alert(bparams);
            $.ajax({

                type:"POST",
                url:rootpath+"/appInfo/updateApp",
                data:bparams,
                dataType:"json",
                success:function (data) {
                    if (data.status == "success") {
                        alert("修改成功");
                    } else {
                        alert("修改失败");
                    }
                    
                },
//                XMLHttpRequest：XMLHttpRequest.readyState: 状态码的意思
//            0 － （未初始化）还没有调用send()方法
//            1 － （载入）已调用send()方法，正在发送请求
//            2 － （载入完成）send()方法执行完成，已经接收到全部响应内容
//            3 － （交互）正在解析响应内容
//            4 － （完成）响应内容解析完成，可以在客户端调用了
//                XMLHttpRequest：XMLHttpRequest.status:
//            textStatus：错误原因
            error:function (XMLHttpRequest, textStatus, errorThrown) {
                alert("XMLHttpRequest.status："+XMLHttpRequest.status);
                alert("XMLHttpRequest.readyState："+XMLHttpRequest.readyState);
                alert("textStatus："+textStatus);
//                readystate: 4  status: 400 textStatus: error
                }

            });
            alert("异步之后");

        });

        //点击返回操作
        $("body").on("click",".btn-primary",function () {
            $("#Content").load("${pageContext.request.contextPath}/appCategory/showlevelmethod2  #Content>*");
            showApps ();
        });

        //点击查看
        $("body").on("click",".viewApp",function () {
            var appId=$(this).attr("id");
            $("#Content").load("${pageContext.request.contextPath}/appInfo/viewApp?id="+appId+"  #Content>*");
        });

        //点击保存并提交审核
        $("body").on("click","#CommitAndSave",function () {

            var info = $("#changeApp").serialize();
            $.ajax({
                type:"POST",
                url:rootpath+"/appInfo/CommitAndSave",
                data:info,
                dataType:"json",
                success:function (data) {
                    if (data.status == "success") {
                        alert("修改成功");
                    } else {
                        alert("修改失败");
                    }

                },
                error:function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("XMLHttpRequest.status："+XMLHttpRequest.status);
                    alert("XMLHttpRequest.readyState："+XMLHttpRequest.readyState);
                    alert("textStatus："+textStatus);
                }
            });

        })



    })

</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/appfrom.js"></script>
</body>
</html>