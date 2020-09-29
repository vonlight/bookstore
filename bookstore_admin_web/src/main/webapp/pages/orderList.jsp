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

	<title>订单列表</title>

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

<style>
	th {
		text-align: center;
	}
	td{
		text-align: center;
	}
</style>
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
		<h2 class="page-header" >订单管理</h2>
		<div class = "pull-right">
			<form method = "get" action="${ctx}/manage/order/orderSearch.do" class="pull-right">
				<div class="input-group input-group-sm" style="width: 150px;">
					<input type="text" value="${orderCode}" name="orderCode" id = "orderCodeStr" class="form-control " placeholder="Search">
					<div class="input-group-btn">
						<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
					</div>
				</div>
			</form>
		</div>
		<div class="row">
			<div class="col-md-12">
				<!-- Custom Tabs -->
				<div class="box">
					<div class="nav-tabs-custom">
						<%--分类标签--%>
						<ul class="nav nav-tabs">
							<li class="${orderFindAll}"><a href="${ctx}/manage/order/orderFindAll.do">全部</a></li>
							<li class="${showPay}"><a href="${ctx}/manage/order/showPay.do">已支付</a></li>
							<li class="${showNoPay}"><a href="${ctx}/manage/order/showNoPay.do">未支付</a></li>
						</ul>
					</div>
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">
							<tr>
							<tr>
								<th width="20%">订单编号</th>
								<th width="10%">收件人</th>
								<th width="10%">订单总金额</th>
								<th width="20%">下单时间</th>
								<th width="10%">支付状态</th>
								<th width="10%">发货状态</th>
								<th>操作</th>
							</tr>
							</tr>
							<c:forEach items="${pageInfo.list}" var="order">
								<tr>
									<td>${order.orderCode}</td>
									<td>${order.orderDetail.name}</td>

									<td>¥<fmt:formatNumber value="${order.amount}" pattern="0.00"></fmt:formatNumber></td>
									<td><fmt:formatDate value="${order.createDate}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate></td>
									<c:choose>
										<c:when test="${order.payStatus == 0}">
											<td>
												未支付
											</td>
										</c:when>
										<c:otherwise>
											<td>
												已支付
											</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${order.status == 0}">
											<td >
												未发货
											</td>
										</c:when>
										<c:otherwise>
											<td>
												已发货
											</td>
										</c:otherwise>
									</c:choose>
									<td>
										<c:choose>
											<c:when test="${order.payStatus == 0}">
												<a href = "javascript:void(0); " class="btn bg-gray-active disabled btn-xs">发货</a>
											</c:when>
											<c:when test="${order.payStatus == 1 and order.status == 0}">
												<a onclick = "confirmOrderFun(this, '${order.id}');" class="btn bg-yellow btn-xs">发货</a>

											</c:when>
											<c:when test="${order.payStatus == 1 and order.status == 1 and order.receiveStatus == 0}">
												<a onclick = "cancelOrderFun(this, '${order.id}')" class="btn bg-red btn-xs">取消</a>
											</c:when>
											<c:otherwise>
												<a href = "javascript:void(0); " class="btn bg-green disabled btn-xs">完成</a>
											</c:otherwise>
										</c:choose>
										<a href = "${ctx}/manage/order/findByOrderId.do?id=${order.id}" class="btn bg-light-blue btn-xs">详情</a>
									</td>
								</tr>
							</c:forEach>
						</table>

					</div>
					<!-- /.box-body -->
					<!-- 分页开始 -->
					<div class="row">

						<nav>
							<div style="margin-top: 20px;margin-bottom: 20px" align="center">
								<ul class="pagination pagination-sm no-margin" >
									<li>
										<a href="${pageContext.request.contextPath}/manage/order/${pageResource}?orderCode=${param.orderCode}" aria-label="Previous">首页</a>
									</li>
									<c:if test="${(pageInfo.pageNum-1) >= 1}">
										<li>
											<a href="${pageContext.request.contextPath}/manage/order/${pageResource}?orderCode=${param.orderCode}&page=${pageInfo.pageNum-1}">上一页</a>
										</li>
									</c:if>
									<c:if test="${(pageInfo.pageNum-1) < 1}">
										<li class="disabled">
											<a href="javascript:void(0);">上一页</a>
										</li>
									</c:if>
									<%--实现分页标签前5后4效果--%>
									<c:choose>
										<c:when test="${pageInfo.pages >= 10}">
											<c:choose>
												<c:when test="${pageInfo.pageNum > pageInfo.pages - 4}">
													<c:set var="begin" value="${pageInfo.pages-9}"/>
													<c:set var="end" value="${pageInfo.pages}"/>
												</c:when>
												<c:when test="${pageInfo.pageNum < 5}">
													<c:set var="begin" value="1"/>
													<c:set var="end" value="10"/>
												</c:when>
												<c:otherwise>
													<c:set var="begin" value="${pageInfo.pageNum - 5}"/>
													<c:set var="end" value="${pageInfo.pageNum + 4}"/>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:set var="begin" value="1"/>
											<c:set var="end" value="${pageInfo.pages}"/>
										</c:otherwise>
									</c:choose>

									<c:forEach begin="${begin}" end="${end}" var="pageNum">
										<c:choose>
											<c:when test="${empty param.page and pageNum == 1}">
												<li class = "active">
													<a  href="${pageContext.request.contextPath}/manage/order/${pageResource}?orderCode=${param.orderCode}&page=${pageNum}">${pageNum}</a>
												</li>
											</c:when>
											<c:when test="${pageNum == param.page}">
												<li class = "active">
													<a  href="${pageContext.request.contextPath}/manage/order/${pageResource}?orderCode=${param.orderCode}&page=${pageNum}">${pageNum}</a>
												</li>
											</c:when>
											<c:otherwise>
												<li >
													<a  href="${pageContext.request.contextPath}/manage/order/${pageResource}?orderCode=${param.orderCode}&page=${pageNum}">${pageNum}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>


									<c:if test="${(pageInfo.pageNum+1) <= pageInfo.pages}">
										<li>
											<a href="${pageContext.request.contextPath}/manage/order/${pageResource}?orderCode=${param.orderCode}&page=${pageInfo.pageNum+1}">下一页</a>
										</li>
									</c:if>
									<c:if test="${(pageInfo.pageNum+1) > pageInfo.pages}">
										<li class="disabled">
											<a href="javascript:void(0);">下一页</a>
										</li>
									</c:if>
									<li>
										<a href="${pageContext.request.contextPath}/manage/order/${pageResource}?orderCode=${param.orderCode}&page=${pageInfo.pages}" aria-label="Next">尾页</a>
									</li>
								</ul>
							</div>
						</nav>
					</div>
					<%--分页结束--%>



				</div>

				<!-- nav-tabs-custom -->
			</div>
			<!-- /.col -->

			<!-- /.col -->
		</div>
		<!-- /.row -->


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

    //根据传递过来的参数name获取对应的值
    function getParameter(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
        var r = location.search.substr(1).match(reg);
        if (r!=null) return (r[2]); return null;
    }
    $(function() {
        let orderCode = getParameter("orderCode");
        if(orderCode != null) {
            orderCode = decodeURIComponent(orderCode);
            $("#orderCodeStr").val(orderCode);
        }
    })

	function confirmOrderFun(obj, id) {
		$.post("${ctx}/manage/order/confirmOrder.do", {"id" : id}, function() {
			let resultHtml = '<a onclick = "cancelOrderFun(this, '+id.toString()+')" class="btn bg-red btn-xs">取消</a>' +
                ' <a href = "${ctx}/manage/order/findByOrderId.do?id='+id.toString()+'" class="btn bg-light-blue btn-xs">详情</a>';
            $(obj).parent().prev().html("已发货");
            $(obj).parent().html(resultHtml);
        })
	}

	function cancelOrderFun(obj, id) {
        $.post("${pageContext.request.contextPath}/manage/order/cancelOrder.do", {"id" : id}, function() {
            let resultHtml = '<a onclick = "confirmOrderFun(this, '+id.toString()+');" class="btn bg-yellow btn-xs">发货</a>' +
            ' <a href = "${ctx}/manage/order/findByOrderId.do?id='+id.toString()+'" class="btn bg-light-blue btn-xs">详情</a>';
            $(obj).parent().prev().html("未发货");
            $(obj).parent().html(resultHtml);
		})
	}
</script>

<script>

</script>
</body>

</html>