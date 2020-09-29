<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<title>支付页-失败</title>
		<link rel="icon" href="/assets/img/favicon.ico">
		
	
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pages-payfail.css" />
    
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/css/taobao.css" rel="stylesheet" />
	<script type="text/javascript" src="js/plugins/jquery/jquery.min.js"></script>
	
</head>

	<body>
		<!--head-->
		
	      <jsp:include page="common/nav.jsp"></jsp:include>
	
		<div class="cart py-container">
			<!--logoArea-->
			<div class="logoArea">
				<div class="fl"><img src="${pageContext.request.contextPath}/image/pay/Logo.png" style="width:200px;height:100px"/><span class="title">支付页</span></div>
			</div>
			<!--主内容-->
			<div class="payfail">
				<div class="fail">
					<h3><img src="${pageContext.request.contextPath}/image/pay/fail.png" width="48" height="48">　支付失败，请稍后再试</h3>
					<div class="fail-text">
					<p class="button"><a href="${pageContext.request.contextPath}/index.jsp" class="sui-btn btn-xlarge btn-danger">返回首页</a></p>
				    </div>
				</div>
				
			</div>
		</div>
		<!-- 底部栏位 -->

</body>

</html>