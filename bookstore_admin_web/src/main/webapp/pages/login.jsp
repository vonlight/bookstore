<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">


	<title>登录</title>


	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.6 -->
	<!-- Font Awesome -->
	<!-- Ionicons -->
	<!-- Theme style -->
	<!-- iCheck -->
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
	<style>
		html, body {
			height: 90%;
		}
	</style>
</head>
<body class="hold-transition login-page" style="background-image: url(${pageContext.request.contextPath}/img/image/qqq.jpg);" >
<div class="login-box" >
	<div class="login-logo">


		<b>购书系统</b>后台管理

	</div>
	<!-- /.login-logo -->
	<div class="login-box-body"  >
		<p class="login-box-msg">登录系统</p>
		<%--错误信息弹出框--%>
		<div class="alert alert-danger alert-dismissible" style="display: none" id = "errorTip">
			<button type="button" class="close" onclick = "javascript:closeFun();" >&times;</button>
			<div id = "errorMessage" class="emg">
				${error_message}
			</div>
			<div id = "login_errorMessage" class="emg">
			</div>
			<div id = "password_errorMessage" class="emg">
			</div>
		</div>
		<%--错误信息弹出框--%>

		<form id = "login_form" method="post" action="${pageContext.request.contextPath }/manage/user/login.do">

			<div class="form-group has-feedback">
				<input type="text" class="form-control" name = "username" placeholder="用户名" id = "username">
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" class="form-control" placeholder="密码" name = "password" id = "password">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="row">
				<!-- /.col -->
				<div class="col-xs-6 col-xs-push-3">
					<button type="submit" class="btn btn-primary btn-block   ">登录</button>
				</div>
				<!-- /.col -->
			</div>
			<div>
				<hr>
				<span style = "font-size: 11px;color: #b3b5b5;">This site is protected by reCAPTCHA and the Google Privacy Policy and Terms of Service apply.</span>
			</div>

		</form>

		<!-- /.social-auth-links -->

	</div>
	<!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script>

    //进行格式校验
    function checkUsername() {
        let username = $("#username").val();
        let regex_username = /^\w{6,20}$/;
        let flag = regex_username.test(username);
        if(flag) {
            $("#username").css("border", "");
            $("#errorTip").css("display", "none");
        } else {
            $("#username").css("border", "1px solid red");
            $("#errorTip").css("display", "none");
            $(".emg").html("");
            $("#login_errorMessage").html("用户名为6-20位的字母或数字");
            $("#errorTip").css("display", "block");
        }
        return flag;
    }


    function checkPassword() {
        let password = $("#password").val();
        let regex_password = /^\w{6,12}$/;
        let flag = regex_password.test(password);
        if(flag) {
            $("#password").css("border", "");
            $("#errorTip").css("display", "none");
        } else {
            $("#password").css("border", "1px solid red");
            $("#errorTip").css("display", "none");
            $(".emg").html("");
            $("#password_errorMessage").html("密码为6-12位的字母或数字");
            $("#errorTip").css("display", "block");
        }
        return flag;
    }
    $(function() {
        $("#login_form").submit(function() {
            let flag = checkUsername() && checkPassword();
            return flag;
        });

        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });

        if('${error_message}' != "") {
			$("#errorTip").css("display", "block");
		}
        $("#username").blur(checkUsername);
        $("#password").blur(checkPassword);
    });

    function closeFun() {
        $("#errorTip").css("display", "none");
    }

</script>
</body>

</html>