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
<title>个人资料</title>


     <script type="text/javascript">

    	$(function() {
			$("#userDetail_li").addClass("active");

            if('${message}' != "") {
                $("#message_Model").modal("show");
            }
			let user = $(".user").prop("disabled", "disabled");


            $("#userUpdateForm").submit(function() {
                let flag = checkEmail() && checkName()  ;
                return flag;
            });
            $("#passwordeUpdateForm").submit(function() {
                let flag = checkPassword() && checkOkPassword()  ;
                return flag;
            });


            $("#password").blur(checkPassword);
            $("#password").blur(checkOkPassword);
            $("#okPassword").blur(checkOkPassword);
            $("#name").blur(checkName);
            $("#email").blur(checkEmail);

		});

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
                    $("#okPassword_error").html("");
                    return true;
                } else {
                    $("#okPassword").css("border", "1px solid red");
                    $("#okPassword_error").html("确认密码不能为空");
                    return false;
                }
            } else {
                $("#okPassword").css("border", "1px solid red");
                $("#okPassword_error").html("两次输入的密码不一致");
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

        function updateFun() {
			$("#username").val("${user.username}");
			$("#name").val("${user.name}");
            $("#name").css("border", "");
            $("#name_error").html("");
			$("#email").val("${user.email}");
            $("#email").css("border", "");
            $("#email_error").html("");
            $("#sex").val("${user.sex}");
			$("#userUpdate").modal("show")
		}

		function passwordUpdateFun() {
            $("#password").val(null);
            $("#password").css("border", "");
            $("#password_error").html("");
            $("#okPassword").val(null);
            $("#okPassword").css("border", "");
            $("#okPassword_error").html("");
            $("#passwordUpdate").modal("show");
		}
	 </script>

</head>
<body>
	<!-- 横幅导航条开始 -->
	
	<jsp:include page="/pages/common/nav.jsp"></jsp:include>
	<!--  横幅下方的主体开始 -->
	<div class="container">
			<div class="row info-content "   >
				<form id="registerForm" class="form-horizontal " id = "form"   method="post" action="javascript:void(0);" style="margin-top: 20px;" >
					<div class="form-group ">
						<label class="col-sm-2 control-label col-sm-push-2" >用户名</label>
						<div class="col-sm-3 col-sm-push-2">
							<input type="text"
								class="form-control user" placeholder="请输入您的用户名" value = "${user.username}" disabled  onblur = "validUsername(this)">

						</div>

						<div class="col-sm-3">

						</div>
					</div>
					<div class="form-group" >
						<label class="col-sm-2 control-label col-sm-push-2">姓名</label>
						<div class="col-sm-3 col-sm-push-2">
							<input type="text"
								class="form-control user" placeholder="请输入您的真实姓名" value = "${user.name}">
						</div>
					</div>
					<div class="form-group">

						<label class="col-sm-2 col-sm-push-2 control-label" >性别：</label>
						<div class="col-sm-1 col-sm-push-2">
							<%--<input type="text" class="form-control" id = "author" name="author" size="50">--%>
							<select class="form-control user "  >
								<c:choose>
									<c:when test="${user.sex eq 1}">
										<option value="1" selected>男</option>
										<option value= "2" >女</option>
									</c:when>
									<c:otherwise>
										<option value="1" >男</option>
										<option value= "2" selected>女</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 col-sm-push-2 control-label">电子邮箱:</label>
						<div class="col-sm-3 col-sm-push-2">
							<input type="text"
								   class="form-control user" placeholder="请输入您的邮箱" value = "${user.email}">
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-2 col-sm-push-2 control-label"></label>
						<div class="col-sm-3 col-sm-push-2">
							<button  id="btn_submit" class="btn btn-success" style="margin-right: 30px; height: 30px" onclick = "javascript:updateFun();">
								<span class="glyphicon glyphicon-pencil">资料修改</span>
							</button>

							<button type="reset" class="btn btn-info" style="margin-right: 30px; height: 30px" onclick = "javascript:passwordUpdateFun()">
								<span class="glyphicon glyphicon-edit" >重置密码</span>
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

	<%--资料修改模态窗--%>
	<div class="modal fade" id="userUpdate">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="exampleModalLabel">资料修改</h4>
				</div>
				<div class="modal-body ">
					<div align="center">
						<span style="color:red;"></span>
						<form  class="form-horizontal" action="<c:url value="/user/updateUser.do"/>" method="post" id = "userUpdateForm" >
							<input type="hidden" name="id" id = "id" value = "${user.id}">
							<div class="form-group">
								<label class="col-sm-3 control-label" for = "username">用户名 ：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control"  id = "username" name="username" size="50" disabled>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for = "name">姓名 ：</label>
								<div class="col-sm-4">
									<input type="text" required class="form-control"  id = "name" name="name" size="50">
								</div>
								<span id = "name_error" style="color: red; float: left  "></span>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for = "sex">性别 ：</label>
								<div class="col-sm-4">
									<%--<input type="text" class="form-control" value="${user.name}" id = "sex" name="sex" size="50">--%>
										<select class="form-control " name = "sex" id = "sex">
												<option value="1">男</option>
												<option value= "2" >女</option>
										</select>

								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for = "email">电子邮箱 ：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" required id = "email" name="email" size="50">
								</div>
								<span id = "email_error" style="color: red; float: left  "></span>
							</div>


							<table>
								<tr>
									<td><input type = "submit" class="btn btn-success btn-sm" value="提交" id = "productSubmit" /></td>
									<td>&nbsp;&nbsp;<input type="button" class="btn btn-danger btn-sm" data-dismiss="modal" value="取消" /></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<%--密码修改模态窗--%>
		<div class="modal fade" id="passwordUpdate">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="exampleModalLabel_password">密码修改</h4>
					</div>
					<div class="modal-body ">
						<div align="center">
							<span style="color:red;"></span>
								<form  class="form-horizontal" action="<c:url value="/user/updatePassword.do"/>" method="post" id = "passwordeUpdateForm" >
								<input type="hidden" name="id"  value = "${user.id}">
								<div class="form-group">
									<label class="col-sm-3 control-label" for = "password">新密码 ：</label>
									<div class="col-sm-4">
										<input type="password" required class="form-control"  id = "password" name="password" size="50" >
									</div>
									<span id = "password_error" style="color: red; float: left  "></span>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for = "okPassword">确认密码 ：</label>
									<div class="col-sm-4">
										<input type="password" required class="form-control"  id = "okPassword" size="50">
									</div>
									<span id = "okPassword_error" style="color: red; float: left "></span>
								</div>

									<tr>
										<td><input type = "submit" class="btn btn-success btn-sm" value="提交" /></td>
										<td>&nbsp;&nbsp;<input type="button" class="btn btn-danger btn-sm" data-dismiss="modal" value="取消" /></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
	</div>



	<%--提示框--%>

	<!-- Modal -->
	<div class="modal fade" id="message_Model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel1_del">提示框</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ">
					<span id = "message">${message}</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	</div>
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

 