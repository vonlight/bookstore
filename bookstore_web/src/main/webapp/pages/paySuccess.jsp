<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<title>支付页-成功</title>
		<%--<link rel="icon" href="/assets/img/favicon.ico">--%>
		
	
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pages-paysuccess.css" />
    
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/taobao.css" rel="stylesheet" />
	
</head>

	<body>
		<jsp:include page="common/nav.jsp"></jsp:include>
          
		<div class="cart py-container">
			<!--logoArea-->
			<div class="logoArea">
				<div class="fl "><img src="${pageContext.request.contextPath}/image/pay/Logo.png" style="width:200px;height:100px"/><span class="title">支付页</span></div>
			</div>
			<!--主内容-->
			<div class="paysuccess">
				<div class="success">
					<h3><img src="${pageContext.request.contextPath}/image/pay/right.png" width="48" height="48">　恭喜您，支付成功啦！</h3>
					<div class="paydetail">
					<p>支付方式：微信支付</p>
					<p >支付金额：
						<span style = "color : red; font-size: 20px"><stong>¥<fmt:formatNumber value="${amount}" pattern="0.00"></fmt:formatNumber>元</stong></span>
					</p>
					<p class="button"><a href="${pageContext.request.contextPath}/order/showOrder.do" class="sui-btn btn-xlarge btn-danger">查看订单</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/product/index.do" class="sui-btn btn-xlarge ">继续购物</a></p>
				    </div>
				</div>
				
			</div>
		</div>
		<!-- 底部栏位 -->
</body>

</html>