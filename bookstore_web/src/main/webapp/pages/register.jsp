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
<link rel="stylesheet"
	  href="${pageContext.request.contextPath}/resources/plugins/select2/select2.css">
<title>注册页面</title>


     <script type="text/javascript">
		 //校验用户名是否存在
		 var validUsernameFlag = true;
    	function validUsername(obj){
            if(obj.value!=null && obj.value!=""){
            	//开始发送异步请求校验登录名是否存在
            	$.ajax({
             	   type: "POST",//请求的方式
             	   url: "${pageContext.request.contextPath}/user/validUsername.do",//请求的地址
             	   data: {"username" : obj.value},//需要传递至后台的参数
             	   success: function(msg){ //如果后台正常处理数据，没有出现异常则会自动回调 success中的函数，后台会将消息赋给  msg
                       if (msg != "") {
                           $("#username").css("border", "1px solid red");
                           $("#username_error").html(msg);
                           validUsernameFlag = false;
                       } else {
                           validUsernameFlag = true;
                       }
             	   }
             	});
            }
    	}

    	$(function() {

            if('${message}' != "") {
                $("#error_Model").modal("show");
            }




			$("#register_li").addClass("active");
			$("#registerForm").submit(function() {
            	let flag = checkUsername() && checkPassword() && checkEmail() && checkName() && checkAddress() && checkPhone() && checkOkPassword() &&  validUsernameFlag;
			    return flag;
			});
			$("#username").blur(checkUsername);
            $("#password").blur(checkPassword);
            $("#password").blur(checkOkPassword);
			$("#okPassword").blur(checkOkPassword);
			$("#name").blur(checkName);
			$("#phone").blur(checkPhone);
			$("#email").blur(checkEmail);
			$("#address").blur(checkAddress);
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
         function checkOkPassword() {
             let okPassword = $("#okPassword").val();
             let password = $("#password").val();
             let regex_okPassword = /^.+$/;
             let flag = regex_okPassword.test(okPassword);
             if(okPassword == password) {

                 if(flag) {
                     $("#okPassword").css("border", "");
                     $("#okpassword_error").html("");
                     return true;
                 } else {
                     $("#okPassword").css("border", "1px solid red");
                     $("#okpassword_error").html("确认密码不能为空");
                     return false;
                 }
			 } else {
                 $("#okPassword").css("border", "1px solid red");
                 $("#okpassword_error").html("两次输入的密码不一致");
                 return false;
			 }
         }
         function checkName() {
             let name = $("#name").val();
             let regex_name = /^.+$/;
             let flag = regex_name.test(name);
             if(flag) {
                 $("#name").css("border", "");
                 $("#name_error").html("");
             } else {
                 $("#name").css("border", "1px solid red");
                 $("#name_error").html("姓名不能为空");
             }
             return flag;
         }
         function checkPhone() {
             let phone = $("#phone").val();
             let regex_phone = /^\d{11}$/;
             let flag = regex_phone.test(phone);
             if(flag) {
                 $("#phone").css("border", "");
                 $("#phone_error").html("");
             } else {
                 $("#phone").css("border", "1px solid red");
                 $("#phone_error").html("手机号为11位的数字");
             }
             return flag;
         }
         function checkEmail() {
             let email = $("#email").val();
             let regex_email = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
             let flag = regex_email.test(email);
             if(flag) {
                 $("#email").css("border", "");
                 $("#email_error").html("");
             } else {
                 $("#email").css("border", "1px solid red");
                 $("#email_error").html("邮箱格式有误");
             }
             return flag;
         }
         function checkAddress() {
             let address = $("#address").val();
             let regex_address = /^.+$/;
             let flag = regex_address.test(address);
             if(flag) {
                 $("#address").css("border", "");
                 // $("#address_error").html("");
                 // $("#address").prop("placeholder", "分类不能为空");
             } else {
                 $("#address").css("border", "1px solid red");
                 // $("#address_error").html("详细地址不能为空");
                 $("#address").prop("placeholder", "详细地地址不能为空");
             }
             return flag;
         }
	 </script>

</head>
<body>
	<!-- 横幅导航条开始 -->
	
	<jsp:include page="/pages/common/nav.jsp"></jsp:include>
	<!--  横幅下方的主体开始 -->
	<div class="container">
		<div class="row info-content" >
			<form id="registerForm" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/user/userRegister.do" style="margin-top: 20px;" >
				<div class="form-group">
					<label class="col-sm-2 control-label" for = "username">用户名</label>
					<div class="col-sm-3">
						<input type="text" id="username" name="username"
							class="form-control" placeholder="请输入您的用户名"  onblur = "validUsername(this)">
					</div>
					<div class="col-sm-3">

					<span id = "username_error" style="color: red; "></span>
					</div>
				</div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for = "password">登录密码</label>
                    <div class="col-sm-3">
                        <input type="password" id="password" name="password"
                               class="form-control" placeholder="请输入您的密码">
                    </div>
					<span id = "password_error" style="color: red; "></span>

				</div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for = "okPassword">确认密码</label>
                    <div class="col-sm-3">
                        <input type="password" id="okPassword" name="okpassword"
                               class="form-control" placeholder="请输入您的确认密码">
                    </div>
					<span id = "okpassword_error" style="color: red; "></span>
				</div>
				<div class="form-group" >
					<label class="col-sm-2 control-label" for = "name">真实姓名</label>
					<div class="col-sm-3">
						<input type="text" id="name"  name="name"
							class="form-control" placeholder="请输入您的真实姓名">
					</div>
					<span id = "name_error" style="color: red; "></span>

				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">性别</label>
					<div class="col-sm-3">
						<label>男:</label><input  name="sex" value="1" type="radio"
							checked="checked">
                        <label>女:</label>
                        <input name="sex" value="2" type="radio" >
					</div>
				</div>
				<div class="form-group" >
					<label class="col-sm-2 control-label"  for = "phone">联系电话</label>
					<div class="col-sm-3">
						<input type="text" id="phone"  name="phone"
							class="form-control" placeholder="请输入您的电话">
					</div>
					<span id = "phone_error" style="color: red; "></span>

				</div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for = "email">电子邮箱:</label>
                    <div class="col-sm-3">
                        <input type="text" id="email"  name="email"
                               class="form-control" placeholder="请输入您的邮箱">
                    </div>
					<span id = "email_error" style="color: red; "></span>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label" >地址</label>
							<div id="distpicker4" class="col-sm-8" >
									<select class="col-sm-2 select2" id="province9" name = "province"></select>
									<select class="col-sm-2 select2" id="city9" name = "city"></select>
									<select class="col-sm-2 select2" id="district9" name = "district" ></select>
							</div>

				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label" for = "address">详细地址:</label>
					<div class="col-sm-8">
						<textarea id="address" required name="detail" rows="4" cols="30"
								  class="form-control" placeholder="请输入您的详细地址"></textarea>
					</div>
					<span id = "address_error" style="color: red; "></span>
				</div>


				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-3">
						<button type="submit" id="btn_submit" class="btn btn-success" style="margin-right: 30px">
							<span class="glyphicon glyphicon-user">注册</span>
						</button>

						<button type="reset" class="btn btn-info">
							<span class="glyphicon glyphicon-edit">重置</span>
						</button>
					</div>
				</div>
			</form>

		</div>
        <%--恭喜，注册成功！请登录您的注册邮箱进行激活您的账号，激活后才能登录。--%>

		<%--提示框--%>
		<div class="modal fade" id="error_Model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel1">提示</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body ">
						<div >${message}</div>
						<div >${error_message}</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>

	</div>
	<script src="${pageContext.request.contextPath}/resources/jqplugin/js/distpicker.data.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jqplugin/js/distpicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jqplugin/js/main.js"></script>
	<script
			src="${pageContext.request.contextPath}/resources/plugins/select2/select2.full.min.js"></script>
	<script>
        $(document).ready(function() {
            // 选择框
            $(".select2").select2();

        });
	</script>
</body>
</html>

 