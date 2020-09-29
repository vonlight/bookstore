<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
	<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>订单详情</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<!-- Font Awesome -->
<!-- Ionicons -->
<!-- iCheck -->
<!-- Morris chart -->
<!-- jvectormap -->
<!-- Date Picker -->
<!-- Daterange picker -->
<!-- Bootstrap time Picker -->
<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css">-->
<!-- bootstrap wysihtml5 - text editor -->
<!--数据表格-->
<!-- 表格树 -->
<!-- select2 -->
<!-- Bootstrap Color Picker -->
<!-- bootstrap wysihtml5 - text editor -->
<!--bootstrap-markdown-->
<!-- Theme style -->
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<!-- Ion Slider -->
<!-- ion slider Nice -->
<!-- bootstrap slider -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- jQuery 2.2.3 -->
<!-- jQuery UI 1.11.4 -->
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- Bootstrap 3.3.6 -->
<!-- Morris.js charts -->
<!-- Sparkline -->
<!-- jvectormap -->
<!-- jQuery Knob Chart -->
<!-- daterangepicker -->
<!-- datepicker -->
<!-- Bootstrap WYSIHTML5 -->
<!-- Slimscroll -->
<!-- FastClick -->
<!-- iCheck -->
<!-- AdminLTE App -->
<!-- 表格树 -->
<!-- select2 -->
<!-- bootstrap color picker -->
<!-- bootstrap time picker -->
<!--<script src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>-->
<!-- Bootstrap WYSIHTML5 -->
<!--bootstrap-markdown-->
<!-- CK Editor -->
<!-- InputMask -->
<!-- DataTables -->
<!-- ChartJS 1.0.1 -->
<!-- FLOT CHARTS -->
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<!-- jQuery Knob -->
<!-- Sparkline -->
<!-- Morris.js charts -->
<!-- Ion Slider -->
<!-- Bootstrap slider -->
<!-- 页面meta /-->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/color	picker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
			<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper" style="padding: 10px">
			<!-- 内容头部 -->
			<section class="content-header">
				<div class="row">
					<a  class="pull-right btn btn-primary btn-sm" style="margin-right: 20px" onclick = "history.back(-1);"><span class="fa fa-arrow-left"></span>返回</a>
				</div>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">订单详情</h3>
					</div>
					<div class="box-body">

						<table class="table col-sm-10  table-hover ">
								<div class="form-group ">
									<tr>
										<td class="col-sm-2" align="right">
											<label > 订单号 :  </label>
										</td>
										<td align="left">
											<div class="col-sm-3 ">
												${order.orderCode}
											</div>
										</td>
									</tr>
									<tr>
										<td class="col-sm-2" align="right">
											<label > 创建时间 : </label>
										</td>
										<td align="left">
											<div class="col-sm-3 ">
												<fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
											</div>
										</td>
									</tr>
									<tr>
										<td class="col-sm-2" align="right">
											<label > 订单状态 : </label>
										</td>
										<td align="left">
											<div class="col-sm-3 ">
											<c:choose>
												<c:when test="${order.payStatus == 0}">
														未付款
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${order.status == 0}">
																已付款
																<a onclick = "confirmOrderFun(this, '${order.id}')" class="btn bg-yellow btn-xs" style="margin-left: 5px;">立即发货</a>
															</c:when>
															<c:when test="${order.status == 1 and order.receiveStatus == 0}">
																已付款
																<a onclick = "cancelOrderFun(this, '${order.id}')" class="btn bg-red btn-xs" style="margin-left: 5px;">取消发货</a>
															</c:when>
															<c:otherwise>
																已完成
															</c:otherwise>
														</c:choose>
												</c:otherwise>
											</c:choose>
											</div>
										</td>
									</tr>
									<tr>
										<td class="col-sm-2" align="right">
											<label > 支付金额 : </label>
										</td>
										<td align="left">
											<div class="col-sm-3 ">
												<%--${product.price}--%>
													¥<fmt:formatNumber value="${order.amount}" pattern="0.00"></fmt:formatNumber>
											</div>
										</td>
									</tr>
									<tr>
										<td class="col-sm-2" align="right">
											<label > 收件人 : </label>
										</td>
										<td align="left">
											<div class="col-sm-3 ">
												${order.orderDetail.name}
											</div>
										</td>
									</tr>
									<tr>
										<td class="col-sm-2" align="right">
											<label > 收件号码 : </label>
										</td>
										<td align="left">
											<div class="col-sm-3 ">
												${order.orderDetail.phone}
											</div>
										</td>
									</tr>
									<tr>
										<td class="col-sm-2" align="right">
											<label > 收件地址 : </label>
										</td>
										<td align="left">
											<div class="col-sm-12 ">
												${order.orderDetail.province}${order.orderDetail.city}${order.orderDetail.district}${order.orderDetail.detail}
											</div>
										</td>
									</tr>
								</div>
						</table>
						<table class="table col-sm-10  table-hover ">
							<div class="form-group ">
								<tr>
									<td class="col-sm-2" align="right" >
										<label > 商品列表 : </label>
									</td>
									<td align="center">
										<label > 商品图片   </label>
									</td>
									<td align="center">
										<label > 标题   </label>
									</td >
									<td align="center">
										<label > 折后价   </label>
									</td>
									<td align="center">
										<label > 购买数量   </label>
									</td>
									<td align="center">
										<label > 合计   </label>
									</td>
								</tr>
							</div>
							<c:forEach items="${order.orderProductList}" var="product">
								<div class="form-group ">
									<tr>
										<td class="col-sm-2" align="right" >
										</td>
										<td align="center">
											 <img src="${ctx}/img/image/product/${product.product.image}"  width="100" height="100" alt="...">
										</td>
										<td align="center">
											 ${product.product.title}
										</td >
										<td align="center">
											 ${product.product.discountPrice}
										</td>
										<td align="center">
											 ${product.orderNum}
										</td>
										<td align="center">
											 ¥<fmt:formatNumber value="${product.orderNum * product.product.discountPrice}" pattern="0.00"></fmt:formatNumber>
										</td>
									</tr>
								</div>
							</c:forEach>
						</table>
					</div>
				</div>

			</section>
			<!-- 正文区域 /-->


		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- 底部导航 /-->

	</div>

	<script
			src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
			src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script>
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {
			// 激活导航位置
			setSidebarActive("admin-index");
		});

      /*  已付款
        <a onclick = "confirmOrderFun(this, '${order.id}')" class="btn bg-yellow btn-xs" style="margin-left: 5px;">立即发货</a>
        已付款
        <a onclick = "cancelOrderFun(this, '${order.id}')" class="btn bg-red btn-xs" style="margin-left: 5px;">取消发货</a>*/

        function confirmOrderFun(obj, id) {
            $.post("${ctx}/manage/order/confirmOrder.do", {"id" : id}, function() {
                let resultHtml = '已付款' +
                ' <a onclick = "cancelOrderFun(this, ' + id.toString() +')" class="btn bg-red btn-xs" style="margin-left: 5px;">取消发货</a>'
                $(obj).parent().html(resultHtml);
            })
        }

        function cancelOrderFun(obj, id) {
            $.post("${pageContext.request.contextPath}/manage/order/cancelOrder.do", {"id" : id}, function() {
                let resultHtml = '已付款' +
                    ' <a onclick = "confirmOrderFun(this, '+ id.toString()+')" class="btn bg-yellow btn-xs" style="margin-left: 5px;">立即发货</a>'
                $(obj).parent().html(resultHtml);
            })
        }

	</script>

</body>
</html>