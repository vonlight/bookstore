<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/plugins/select2/select2.css">
    <title>地址管理</title>

	<style type="text/css">
		.panel-heading .btn
		{
			margin-top: -5px;
		}
		.panel-body
		{
			padding: 0;
		}
		div#distpicker4 {
			margin-left: -6px;
		}

	</style>
	<script>
		function updateFun(id, name , phone, province,city, district, detail, disabled) {
		    $("#id").val(id);
		    $("#name").val(name);
		    $("#phone").val(phone);
            $("#exampleModalLabel").html("修改地址");
            //修改地址选择控件
            $('#distpicker4').distpicker('destroy');
            $('#distpicker4').distpicker({
                placeholder: false,
                province: province,
                city: city,
                district: district
            });
		    $("#address").val(detail);
            // $("#disabled_div").remove();
			$("#disabled").val(disabled);
            $("#disabled").select2();
            $("#disabled_div").css({"display":"none"});
            $('#exampleModal').modal('show');
		}
        function addFun() {
            $("#name").val(null);
            $("#phone").val(null);
            $("#phone").css("border", "");
            $("#phone_error").html("");
            $('#distpicker4').distpicker('destroy');
            //重置地址选择控件
            $('#distpicker4').distpicker({
                placeholder: false
			});
            $("#address").val(null);
            $("#disabled").val('0');
            $("#exampleModalLabel").html("添加地址");
            $("#disabled").select2();
            $("#disabled_div").css({"display":"block"});
            $('#exampleModal').modal('show');
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
		$(function() {
		   let errorMessage = '${errorMessage}';
		   if (errorMessage != "") {
		       $("#error_Message").html(errorMessage);
		       $("#error_Model").modal("show");
           }
           $("#form").submit(function() {
               let flag = checkPhone();
               return flag;
           });
		   $("#phone").blur(checkPhone);
        });
	</script>
</head>

<body>

<!-- 横幅导航条开始 -->
	<jsp:include page="common/nav.jsp"></jsp:include>

<!-- 横幅导航条结束 -->
<div align="center">
	<span style="color: red;">${message}</span>
</div>
<!--  主体内容开始 -->
<div class="container">
	<div class="panel panel-default">
	    <div class="panel-heading">
	    	<span>地址管理</span>
	    	<span class="pull-right">
				<button type="button" class="btn btn-primary btn-sm" onclick="javascript:addFun();">
					<i class="glyphicon glyphicon-plus"></i>
				</button>

	    		<%--<a href="<c:url value="/pages/categoryAdd.jsp"/>" class="btn btn-primary btn-sm btn-success">

	    		</a>--%>
	    	</span>
	    </div>
	    <div class="panel-body">
		    <table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>姓名</th>
						<th >电话</th>
						<th>地址</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${addressList}" var="address">
						<c:choose>
							<c:when test="${address.disabled == 1}">
								<tr style="background-color: #e2e2e2;">
									<td>${address.name}</td>
									<td>${address.phone}</td>
									<td>${address.province}${address.city}${address.district}${address.detail}</td>
									<td >
										<span  class="label label-info"><a href="javascript:updateFun('${address.id}','${address.name}','${address.phone}','${address.province}', '${address.city}', '${address.district}', '${address.detail}', '${address.disabled}')" style="color: white;">修改</a></span>
										<span class="label label-danger"><a href="${pageContext.request.contextPath}/address/deleteAddress.do?id=${address.id}&userId=${address.userId}&disabled=${address.disabled}" style="color: white;">删除</a></span>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr >
									<td>${address.name}</td>
									<td>${address.phone}</td>
									<td>${address.province}${address.city}${address.district}${address.detail}</td>
									<td >
										<span  class="label label-info"><a href="javascript:updateFun('${address.id}','${address.name}','${address.phone}','${address.province}', '${address.city}', '${address.district}', '${address.detail}', '${address.disabled}')" style="color: white;">修改</a></span>
                                        <span class="label label-danger"><a href="${pageContext.request.contextPath}/address/deleteAddress.do?id=${address.id}&userId=${address.userId}&disabled=${address.disabled}" style="color: white;">删除</a></span>
                                        <span class="label label-default"><a href="${pageContext.request.contextPath}/address/setDefault.do?id=${address.id}&userId=${address.userId}" style="color: white;">设为默认</a></span>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
	    </div>
	</div>
    <hr>
	<!-- 弹出框 -->
	<div class="modal fade" id="exampleModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="exampleModalLabel">添加地址</h4>
				</div>
				<div class="modal-body ">
					<div align="center">
						<span style="color:red;"></span>
						<form  class="form-horizontal" action="<c:url value="/address/addOrUpdateAddress.do"/>" id = "form" method="post" >
							<input type="hidden" name="userId" value="${session_user.id}">
							<input type="hidden" name="id" id = "id">
							<div class="form-group">
								<label class="col-sm-3 control-label" for = "name">姓名 ：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" required id = "name" name="name" size="50">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label" for = "phone">电话：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" required id = "phone" name="phone" size="50" >
								</div>
								<span id = "phone_error" style="color: red; float: left;"></span>

							</div>


							<div class="form-group">
								<label class="col-sm-3 control-label" >地址：</label>
								<div id="distpicker4" class = "col-sm-7" >
									<select class="form-control select2" id="province9" name = "province"></select>
									<select class="form-control select2" id="city9" name = "city"></select>
									<select class="form-control select2" id="district9" name = "district" ></select>
								</div>

							</div>
							<div class="form-group" >
								<label class="col-sm-3 control-label" for = "address">详细地址：</label>
								<div class="col-sm-7"  >
									<textarea class="form-control" required rows="3" id = "address" name="detail"></textarea>
								</div>
							</div>
							<div class="form-group" id = "disabled_div" >
								<label class="col-sm-3 control-label" for = "disabled">是否默认：</label>
								<div class="col-sm-2">
									<%--<input type="text" class="form-control" id = "author" name="author" size="50">--%>
										<select class="form-control select2"  name="disabled" id="disabled">
											<option value="1">是</option>
											<option selected value= "0" >否</option>
										</select>
								</div>
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

<%--提示框--%>

    <!-- Modal -->
    <div class="modal fade" id="error_Model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">删除失败</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <span id = "error_Message"></span>
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