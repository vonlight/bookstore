<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/webbase.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/pages-weixinpay.css" />
<%@include file="common/header.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<title>微信支付页</title>
        <%--<link rel="icon" href="/assets/img/favicon.ico">--%>
		<link>


   <script type="text/javascript">
			$(function(){


				var recommend_code = "${order.imgUrl}";    //微信扫码支付
	            $("#qrcode_div").qrcode({
	                render : "canvas",        //设置渲染方式，有table和canvas，使用canvas方式渲染性能相对来说比较好
	                text : recommend_code,    //扫描了二维码后的内容显示,在这里也可以直接填一个网址，扫描二维码后
	                size : 150,               //大小
	                background : "#ffffff"    //二维码的后景色
	            });
				//调用后台
				//检测是否支付成功
				// let check = setInterval(() => {
				let check = setInterval(() => {
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/order/queryPayStatus.do",
                        data: {"orderCode" : '${order.orderCode}'},
                        success: function(msg){
                            if(msg == "ok"){
                                window.location = "${pageContext.request.contextPath}/order/paySuccess.do?amount=${order.amount}&id=${order.id}";
                            } else if(msg == "error") {
                                clearInterval(check);
                                alert("支付发生错误!");
                                window.location = "${pageContext.request.contextPath}/pages/payfail.jsp";
                            }
                        }
                    });
				}, 3000)
				setTimeout(() => {
                    clearInterval(check);
                    	alert("支付超时");
                   		 window.location = "${pageContext.request.contextPath}/pages/payfail.jsp";
				}, 300000)
			})

		</script>
</head>

	<body class="container">

		  <!-- 横幅导航条开始 -->
	<jsp:include page="common/nav.jsp"></jsp:include>
		<div class="cart py-container">
			<!--logoArea-->
			<div class="logoArea">
				<div class="fl"><img src="${pageContext.request.contextPath}/image/pay/Logo.png" style="width:200px;height:100px"/><span class="title">收银台</span></div>
				<a class = "btn btn-success" style = "display: none;" href = "${pageContext.request.contextPath}/order/paySuccess.do?amount=${order.amount}&id=${order.id}">老板键</a>
			</div>
		               
			<!--主内容-->
			<div class="checkout py-container  pay">
				<div class="checkout-tit">
					<h4 class="fl tit-txt"><span class="success-icon"></span><span  class="success-info">订单提交成功，请您及时付款！订单号：${order.orderCode}</span></h4>
                    <span class="fr"><em class="sui-lead">应付金额：</em><em  class="orange money">￥<fmt:formatNumber value="${order.amount}" pattern="0.00"></fmt:formatNumber></em>元</span>
					<div class="clearfix"></div>
				</div>				
				<div class="checkout-steps">
					<div class="fl weixin">微信支付</div>
                    <div class="fl sao"> 
                        <p class="red"></p>                      
                        <div class="fl code">
                        
                                <div id="qrcode_div"></div>
                                <div class="saosao">
                                <p>请使用微信扫一扫</p>
                                <p>扫描二维码支付</p>
                            </div>
                        </div>
                        <div class="fl phone">
                            
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
				</div>
			</div>

		<!-- 底部栏位 -->
		</div>

	</body>





	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/jquery.easing/jquery.easing.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/plugins/sui/sui.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery-qrcode-0.14.0/jquery-qrcode-0.14.0.js"></script>

</html>