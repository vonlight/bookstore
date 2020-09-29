<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pages-getOrderInfo.css" />
<link rel="stylesheet"
	  href="${pageContext.request.contextPath}/resources/plugins/select2/select2.css">
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
	<title>结算页</title>

    <style>
		th{
			text-align: center;
		}
		td{
			text-align: center;
		}
	</style>
</head>

<body class="container">
	<jsp:include page="common/nav.jsp"></jsp:include>

	<div class="cart py-container">
		<!--logoArea-->
		<div class="logoArea">
			<div class="fl"><img src="${pageContext.request.contextPath}/image/pay/Logo.png" style="width:200px;height:100px"/><span class="title">结算页</span></div>
		</div>
		<form method="post" action = "${pageContext.request.contextPath}/order/orderSubmit.do" >
		<!--主内容-->
		<div class="checkout py-container">
			<div class="checkout-tit">
				<h4 class="tit-txt">填写并核对订单信息</h4>
			</div>
			<div class="checkout-steps">
				<!--收件人信息-->
				<div class="step-tit">
					<h5>
						收件人信息
						<span>
							<a data-toggle="modal" onclick="javascript:addFun();" class="newadd">新增收货地址</a>
						</span>
					</h5>
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
									<tr>
										<td >${address.name}</td>
										<td>${address.phone}</td>
										<td>${address.province}${address.city}${address.district}${address.detail}</td>
										<td >
											<input type="radio" class="addressRadio" checked name="addressId"  value = "${address.id}">
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr >
										<td>${address.name}</td>
										<td>${address.phone}</td>
										<td>${address.province}${address.city}${address.district}${address.detail}</td>
										<td >
											<input type="radio" class="addressRadio" name="addressId"  value = "${address.id}">
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</tbody>
					</table>
				</div>

				</div>
				<div class="hr"></div>
				<!--支付和送货-->
				<div class="payshipInfo">
					<div class="step-tit">
						<h5>支付方式</h5>
					</div>
					<div class="step-cont">
						<ul class="payType">
							<li class="selected" ng-click="selectPayType('1')">微信付款<span title="点击取消选择"></span></li>
						</ul>
					</div>
					<div class="hr"></div>
				</div>
			</div>
			<input style="float:right;width: 160px;height: 50px " class="btn btn-danger btn-lg" type="submit" value="提交订单">
		</form>
		</div>
		共计 : <span style="color: red;font-size: 30px;">¥${totalMoney}</span>
	</div>
	<!-- 底部栏位 -->

</body>



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
					<form  class="form-horizontal" action="<c:url value="/address/addAddress.do"/>" method="post" id = "form" >
						<input type="hidden" name="userId" value="${session_user.id}">
						<input type="hidden" name="totalMoney" value="${totalMoney}">
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
								<input type="text" class="form-control" required id = "phone" name="phone" size="50">
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


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/jquery.easing/jquery.easing.min.js"></script>

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/sui/sui.min.js"></script>--%>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery-qrcode-0.14.0/jquery-qrcode-0.14.0.js"></script>
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
    $(function() {
        $("#form").submit(function() {
            let flag = checkPhone();
            return flag;
        });
        $("#phone").blur(checkPhone);
	})
</script>
</html>