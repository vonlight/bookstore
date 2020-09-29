<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<!-- 通过动态标签引入公共jsp页面 -->
<%@ include file="/pages/common/header.jsp"%>

 <!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录页面</title>

	<script>

		$(function() {
		    $("#login_form").submit(function() {
				let flag = checkUsername() && checkPassword();
                return flag;
			});
            $("#username").blur(checkUsername);
            $("#password").blur(checkPassword);
		})
        //进行格式校验
        function checkUsername() {
            let username = $("#username").val();
            let regex_username = /^\w{6,20}$/;
            let flag = regex_username.test(username);
            if(flag) {
                $("#username").css("border", "");
                $("#username_error").html("");
            } else {
                $("#username").css("border", "1px solid red");
                $("#username_error").html("用户名为6-20位的字母或数字");
            }
            return flag;
        }


        function checkPassword() {
            let password = $("#password").val();
            let regex_password = /^\w{6,12}$/;
            let flag = regex_password.test(password);
            if(flag) {
                $("#password").css("border", "");
                $("#password_error").html("");
            } else {
                $("#password").css("border", "1px solid red");
                $("#password_error").html("密码为6-12位的字母或数字");
            }
            return flag;
        }
	</script>

</head>
<body>
	<!-- 横幅导航条开始 -->
	
   <jsp:include page="/pages/common/nav.jsp"></jsp:include>
    
	<!-- /.navbar -->
	<!--  横幅下方的主体开始 -->
	<div class="container  text-center"  >
		<!-- 入门-->
		<!-- 登录界面 -->
		<div class="page-header">
			<h1>用户登录</h1>&nbsp;
			<span style="color:red;">${error_message}</span>
			<span style="color:red;">${message}</span>
			<span style="color:green;">${login_success_message}</span>
		</div>
		<form class="form-horizontal" method="post"action="${pageContext.request.contextPath}/user/login.do" id = "login_form">
					<span id = "username_error" style="color: red; "></span>
			<div class="form-group">
				<div class="col-sm-4  col-sm-push-4">
					<input class="form-control" placeholder="用户名" type="text" id="username" name="username" />

				</div>
			</div>
			<span id = "password_error" style="color: red; "></span>
			<div class="form-group">
				<div class="col-sm-4  col-sm-push-4">
					<input class="form-control" placeholder="密码" id="password" type="password" name="password" />
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-4  col-sm-push-4">
					<div class="btn-group btn-group-justified" role="group"
						aria-label="...">
						<div class="btn-group" role="group">
							<button type="submit" id="loginBtn" class="btn btn-success">
								<span class="glyphicon glyphicon-log-in"></span>&nbsp;登录
							</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-danger" onclick="window.location = '${pageContext.request.contextPath}/register.do'">
								<span class="glyphicon glyphicon-edit"></span>注册
							</button>
						</div>
					</div>
				</div>
			</div>
		</form>

		<!-- 彈出框-->
		<div id="myModal" class="modal bs-example-modal-sm fade">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">登录提示</h4>
					</div>
					<div class="modal-body">
						<p id="tip"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="sure" type="button" class="btn btn-primary"
							data-dismiss="modal">确定</button>
					</div>
				</div>
			</div>
		</div>



	</div>
	<!--/.container-->
	<!--  横幅下方的主体结束 -->
</body>
</html>