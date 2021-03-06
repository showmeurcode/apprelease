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

    <title>开发人员登录页 </title>

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
                <form action="${pageContext.request.contextPath }/devuser/login" method="post">
                    <h1>开发人员登录</h1>
                    <font color="#c00fff">*</font>
                    <div style="display: inline; color:red">
                        ${error}
                    </div>
                    <div>
                        <input  name="devCode" value="${devUser.devCode}" type="text" class="form-control" id="devCode" placeholder="用户名" aria-placeholder="请输入用户名" required="" />
                    </div>
                    <font color="#c00fff">*</font>
                    <div id="devCodeDiv" style="display: inline; color:red"></div>

                    <div>
                        <input name="devPassword" value="${devUser.devPassword}" type="password" id="password" class="form-control" placeholder="密码"  aria-placeholder="请输入密码" required="" />
                    </div>
                    <font color="#c00fff">*</font>
                    <div id="passwordDiv" style="display: inline; color:red"></div>
                    <div>

                        <input type="submit" value="登录">
                        <input type="reset" value="重置"/>
                        <a class="reset_pass" href="#">忘记密码?</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">新用户?
                            <a href="###" id="showregister"class="to_register"> 现在注册</a>
                        </p>

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

        <div id="register" class="animate form registration_form">
            <section class="login_content">
                <form>
                    <h1>Create Account</h1>
                    <div>
                        <input type="text" class="form-control" placeholder="Username"  required="" />
                    </div>
                    <div>
                        <input type="email" class="form-control" placeholder="Email"  required="" />
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="Password" required="" />
                    </div>
                    <div>
                        <a class="btn btn-default submit" href="index.html">Submit</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">Already a member ?
                            <a href="#signin" class="to_register"> Log in </a>
                        </p>

                        <div class="clearfix"></div>
                        <br />

                        <div>
                            <h1><i class="fa fa-paw"></i> Gentelella Alela!</h1>
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
        $("#showregister").click(function () {
            alert("抱歉！测试阶段暂不支持注册！");
            $("#register").show();
        })


            $("#devCode").blur(function(){

                var devCode = $(this).val();

                if (devCode == null || devCode == "") {
                    $("#devCodeDiv").html("用户名不能为空！");
                }

            })

            $("#password").blur(function () {
                var password = $(this).val()
                if(password == null || password == ""){
                    $("#passwordDiv").html("密码不能为空！")
                }
            })


    })
</script>

</body>
</html>

