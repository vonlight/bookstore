<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>
	<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>类型列表</title>

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
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
				<h1>
					分类管理</h1>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">分类操作</h3>
						<a href="<c:url value="/manage/category/showAddCategory.do"/>" class="btn btn-sm btn-success pull-right">
							<i class="glyphicon glyphicon-plus"></i>
						</a>
					</div>

					<div class="box-body">
						<div class="tab-pane" id="tab-treetable">
							<table id="collapse-table" class="table table-bordered table-hover dataTable">
								<thead>
								<tr>
									<th width="25%" style = "">CODE</th>
									<th width="25%" style = "">类型名称</th>
									<th width="25%" style = "">备注</th>
									<th width="25%" style = "">操作</th>
								</tr>
								</thead>


							</table>
						</div>


					</div>
				</div>

			</section>
			<!-- 正文区域 /-->
			<div id="myModal" class="modal bs-example-modal-sm fade">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title">提示信息</h4>
						</div>
						<div class="modal-body">
							<p id="tip">${message}</p>
						</div>
						<div class="modal-footer">
							<button id="sure" type="button" class="btn btn-primary"
									data-dismiss="modal">确定</button>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- 底部导航 /-->
	</div>


	<script>
        $.widget.bridge('uibutton', $.ui.button);
	</script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<%--<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>--%>
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script>

		$(function() {
			let message = "${message}";

			if (message != "") {
			    $("#myModal").modal("show");
			}


            //查询一级分类数据开始
            $.get("${pageContext.request.contextPath}/manage/category/findAllFirstCategory.do", {}, function(data) {
                let categoryHtml = "";

                let a = 0;
                for( let i = 0; i < data.length; i++) {
                    //改为同步ajax , 不然顺序会乱
                    //通过一级分类搜索二级分类
					$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/manage/category/findAllSecondCategoryCode.do",
						data : {"categoryCode" : data[i].code},
						dataType : "json",
						async : false, //开启ajax同步
						success : function(sd) {
                            let sdCategoryHtml = "";
                            for( let j = 0; j < sd.length; j++) {
                                sdCategoryHtml += '<tr data-tt-id="'+sd[j].code+'" data-tt-parent-id="'+data[i].code+'">\n' +
                                    '\t\t\t\t\t\t\t\t\t<td>'+sd[j].code+'</td>\n' +
                                    '\t\t\t\t\t\t\t\t\t<td>'+sd[j].name+'</td>\n' +
                                    '\t\t\t\t\t\t\t\t\t<td>'+sd[j].remark+'</td>\n' +
                                    '\t\t\t\t\t\t\t\t\t<td>'+
                                    '<a href = "${pageContext.request.contextPath}/manage/category/showUpdate.do?code='+sd[j].code+'" class="btn bg-light-blue btn-xs">修改</a> ' +
                                    '<a href = "${pageContext.request.contextPath}/manage/category/deleteCategory.do?code='+sd[j].code+'" class="btn bg-red btn-xs">删除</a> ' +
                                    '</td>\n' +
                                    '\t\t\t\t\t\t\t\t</tr>'

                            }
                            categoryHtml += '<tr data-tt-id="'+data[i].code+'">\n' +
                                '\t\t\t\t\t\t\t\t\t<td>'+data[i].code+'</td>\n' +
                                '\t\t\t\t\t\t\t\t\t<td>'+data[i].name+'</td>\n' +
                                '\t\t\t\t\t\t\t\t\t<td>'+data[i].remark+'</td>\n' +
                                '\t\t\t\t\t\t\t\t\t<td>'+
                                '<a href = "${pageContext.request.contextPath}/manage/category/showUpdate.do?code='+data[i].code+'" class="btn bg-light-blue btn-xs">修改</a> ' +
                                '<a href = "${pageContext.request.contextPath}/manage/category/deleteCategory.do?code='+data[i].code+'" class="btn bg-red btn-xs">删除</a> ' +
                                '</td>\n' +
                                '\t\t\t\t\t\t\t\t</tr>' + sdCategoryHtml;
                            $("#collapse-table").append(categoryHtml);
                            categoryHtml = "";
                            // debugger;
                            a += 1;
                            if (a == data.length) {
                                // 生成下拉树
                                $("#collapse-table").treetable({
                                    expandable: true
                                });
                            }
						}
					})
                }
            }, "JSON");
		})

	</script>
</body>

</html>