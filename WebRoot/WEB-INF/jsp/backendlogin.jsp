<%--
  Created by IntelliJ IDEA.
  User: x
  Date: 2017/11/7
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>管理员登录页 </title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="https://colorlib.com/polygon/gentelella/css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath }/statics/css/custom.min.css" rel="stylesheet">


</head>

<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form  action="${pageContext.request.contextPath }/backenduser/Blogin">
                    <h1>管理员登录</h1>
                    <font color="#c00fff">*</font>
                    <div style="display: inline; color:red">
                        ${error}
                    </div>
                    <div>
                        <input type="text" name="userCode" value="${backenduser.userCode}" class="form-control" id="userCode" placeholder="用户名" required="" />
                    </div>
                            <font color="#c00fff">*</font>
                            <div id="userCodeDiv" style="display: inline; color:red"></div>
                    <div>
                        <input type="password" name="userPassword" value="${backenduser.userPassword}" id="userPassword" class="form-control" placeholder="密码" required="" />
                    </div>
                            <font color="#c00fff">*</font>
                            <div id="userPasswordDiv" style="display: inline; color:red"></div>
                    <div>
                        <input type="submit" value="登录">
                        <input type="reset" value="重置"/>
                        <a class="reset_pass" href="#">忘记密码?</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">


                        <div class="clearfix"></div>
                        <br />

                        <div>
                            <h1>欢迎使用!</h1>
                            <p>©2016 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and Terms</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>

    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
    $(function () {

        $("#userCode").blur(function(){

            var userCode = $(this).val();

            if (userCode == null || userCode == "") {
                $("#userCodeDiv").html("用户名不能为空！");
            }

        })

        $("#userPassword").blur(function () {
            var userPassword = $(this).val()
            if(userPassword == null || userPassword == ""){
                $("#userPasswordDiv").html("密码不能为空！")
            }
        })


    })
</script>

</body>
</html>

