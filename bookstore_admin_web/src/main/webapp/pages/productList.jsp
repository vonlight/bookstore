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

<title>商品列表</title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">

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
			<h2 class="page-header" >商品管理</h2>
				<div class="pull-right">

					<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal" data-whatever="添加商品" id = "addBtn" style="margin: 5px" ><span class="glyphicon glyphicon-plus"></span>添加商品</button>
				</div>
			<div class="row">
				<div class="col-md-12">
					<!-- Custom Tabs -->
					<div class="box">

						<!-- /.box-header -->
						<div class="nav-tabs-custom">
							<%--分类标签--%>
							<ul class="nav nav-tabs" id = "categoryHtml">

							</ul>
						</div>
						<div class="box-body table-responsive no-padding">
							<table class="table table-hover">
								<tr>
								<tr>
									<th width="10%">图书ID</th>
									<th width="10%">标题</th>
									<th width="10%">价格</th>
									<th width="10%">折扣</th>
									<th width="10%">折后价</th>
									<th>状态</th>
									<th>操作</th>
								</tr>
								</tr>
								<c:forEach items="${pageInfo.list}" var="product">
									<tr>
										<td>${product.id}</td>
										<td>${product.title}</td>
										<td>¥<fmt:formatNumber value="${product.price}" pattern="0.00"></fmt:formatNumber></td>
										<td>${product.discount}</td>
										<td>¥<fmt:formatNumber value="${product.discountPrice}" pattern="0.00"></fmt:formatNumber></td>
										<c:choose>
											<c:when test="${product.disabled eq 0}">
												<td>
													在售
													<a onclick="closeProductFun('${product.id}', this)" class="btn bg-yellow btn-xs">下架</a>
												</td>
											</c:when>
											<c:otherwise>
												<td>
													下架
													<a onclick="openProductFun('${product.id}', this)" class="btn bg-green btn-xs">上架</a>
												</td>
											</c:otherwise>
										</c:choose>
										<td>
											<a href = "<c:url value="/manage/product/showProduct.do?id=${product.id}"/>" class="btn bg-light-blue btn-xs">修改</a>
											<a href = "<c:url value="/manage/product/findByProductId.do?productId=${product.id }"/>" class="btn bg-olive btn-xs">详情</a>
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
											<a href="${pageContext.request.contextPath}/manage/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}" aria-label="Previous">首页</a>
										</li>
										<c:if test="${(pageInfo.pageNum-1) >= 1}">
											<li>
												<a href="${pageContext.request.contextPath}/manage/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageInfo.pageNum-1}">上一页</a>
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
														<a  href="${pageContext.request.contextPath}/manage/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageNum}">${pageNum}</a>
													</li>
												</c:when>
												<c:when test="${pageNum == param.page}">
													<li class = "active">
														<a  href="${pageContext.request.contextPath}/manage/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageNum}">${pageNum}</a>
													</li>
												</c:when>
												<c:otherwise>
													<li >
														<a  href="${pageContext.request.contextPath}/manage/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageNum}">${pageNum}</a>
													</li>
												</c:otherwise>
											</c:choose>
										</c:forEach>


										<c:if test="${(pageInfo.pageNum+1) <= pageInfo.pages}">
											<li>
												<a href="${pageContext.request.contextPath}/manage/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageInfo.pageNum+1}">下一页</a>
											</li>
										</c:if>
										<c:if test="${(pageInfo.pageNum+1) > pageInfo.pages}">
											<li class="disabled">
												<a href="javascript:void(0);">下一页</a>
											</li>
										</c:if>
										<li>
											<a href="${pageContext.request.contextPath}/manage/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageInfo.pages}" aria-label="Next">尾页</a>
										</li>
									</ul>
								</div>
							</nav>
						</div>
						<%--分页结束--%>
						<!-- 添加物品弹出框 -->
						<div class="modal fade"   id="exampleModal">
							<div class="modal-dialog" style = "top:auto">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="exampleModalLabel">添加商品</h4>
									</div>
									<div class="modal-body ">
										<div align="center">
											<span style="color:red;"></span>
											<form  class="form-horizontal" action="<c:url value="/manage/product/addProduct.do"/>" enctype="multipart/form-data" method="post" id = "addProduct">
												<div class="form-group">
													<label class="col-sm-3 control-label">商品类型：</label>
													<div class="col-sm-4">
														<select class="form-control category select2 " style="width: 100%" name="categoryCode" id="category"> </select>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for = "title">商品名称：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id = "title" required name="title" size="50">
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-3 control-label" for = "author">作者：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" id = "author" required name="author" size="50">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for = "publisher">出版社：</label>
													<div class="col-sm-4">
														<input type="text" class="form-control" required id = "publisher" name="publisher" size="50">
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-3 control-label" for = "price">价格：</label>
													<div class="col-sm-4">
														<input type="number" class="form-control" required step = "0.01" id = "price" name="price" size="50">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for = "storage">库存：</label>
													<div class="col-sm-4">
														<input type="number" min = "0" class="form-control" required id = "storage" name="storage" size="50">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for = "storage">折扣：</label>
													<div class="col-sm-4">
														<input type="number" step = "0.1" required max = "1" min = "0.1" class="form-control" id = "discount" name="discount" size="50">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" >图书封面：</label>
													<div class="col-sm-4">
														<a href="javascript:;" class="a-upload">
															<input type="file" required name="file" id="file">点击这里上传文件
														</a>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-3 control-label" for="description">商品描述：</label>
													<div class="col-sm-6">
														<textarea rows="5" cols="60" class="form-control" id = "description" name="description"></textarea>
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
						<!--弹出框结束-->



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

            let message = "${message}";
            if (message != "") {
                alert(message);
			}
            //查询一级分类数据开始
            $.get("${pageContext.request.contextPath}/manage/category/findAllFirstCategory.do", {}, function(data) {
                let categoryHtml = "";
                let categoryCode = getParameter("categoryCode")==null ? "" : getParameter("categoryCode");
                let findAllHtml = '<li class="dropdown ${findByCategoryCode} ${findAllOpenProduct} ${findAllCloseProduct}">\n' +
                    '                                    <a class="dropdown-toggle   " data-toggle="dropdown" href="#" >${not empty dropdown ? dropdown : "全部"}<span class="caret"></span>\n' +
                    '                                    </a>\n' +
                    '                                    <ul class="dropdown-menu">\n' +
                    '                                        <li role="presentation " class="${findByCategoryCode} sd"><a role="menuitem" tabindex="-1" href="${ctx}/manage/product/findByCategoryCode.do">全部</a></li>\n' +
                    '                                        <li role="presentation" class="${findAllOpenProduct} sd"><a role="menuitem" tabindex="-1" href="${ctx}/manage/product/findAllOpenProduct.do">上架</a></li>\n' +
                    '                                        <li role="presentation" class="${findAllCloseProduct} sd"><a role="menuitem" tabindex="-1" href="${ctx}/manage/product/findAllCloseProduct.do">下架</a></li>\n' +
                    '                                    </ul>\n' +
                    '                                </li>';
                let sdHtml = "";
                let searchHtml = '<li class="pull-right">\n' +
                    '\t\t\t\t\t\t\t\t\t<form method = "get" action="<c:url value="/manage/product/findByCategoryCodeAndTitle.do"/>" >\n' +
                    '\t\t\t\t\t\t\t\t\t<div class="input-group input-group-sm" style="width: 150px;">\n' +
                    '\t\t\t\t\t\t\t\t\t\t<input type = "hidden" value="${param.categoryCode}" name = "categoryCode" >\n' +
                    '\n' +
                    '\t\t\t\t\t\t\t\t\t\t<input type="text" value="${title}" name="title" id = "titleStr" class="form-control " placeholder="Search">\n' +
                    '\n' +
                    '\t\t\t\t\t\t\t\t\t\t<div class="input-group-btn">\n' +
                    '\t\t\t\t\t\t\t\t\t\t\t<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>\n' +
                    '\t\t\t\t\t\t\t\t\t\t</div>\n' +
                    '\t\t\t\t\t\t\t\t\t</div>\n' +
                    '\t\t\t\t\t\t\t\t</form>\n' +
                    '\t\t\t\t\t\t\t\t</li>'
                // let categoryHtml = "";
                for( let i = 0; i < data.length; i++) {
                    //根据1级分类查询所有二级分类
                    $.get("${pageContext.request.contextPath}/manage/category/findAllSecondCategoryCode.do",{"categoryCode" : data[i].code}, function(sd) {
                        let sdCategoryHtml = "";
                        for( let j = 0; j < sd.length; j++) {

                            sdCategoryHtml += '<option value="'+sd[j].code+'">'+sd[j].name.replace(/-/g, "")+'</option>';
                        }
                        sdHtml += '<optgroup label="' + data[i].name +'">'+sdCategoryHtml+'</optgroup>';
                        $(".category").html(sdHtml);
                    }, "JSON");
                    if (data[i].code == categoryCode.substring(0, 4)) {
                        categoryHtml += '<li class="active"><a href="${pageContext.request.contextPath}/manage/product/findByCategoryCode.do?categoryCode='+ data[i].code+'">'+data[i].name+'</a></li>';
                    } else {
                        categoryHtml += '<li ><a href="${pageContext.request.contextPath}/manage/product/findByCategoryCode.do?categoryCode='+ data[i].code+'" >'+data[i].name+'</a></li>';
                    }
                }

                $("#categoryHtml").html(findAllHtml + categoryHtml + searchHtml);
                let title = getParameter("title");
                if(title != null) {
                    title = decodeURIComponent(title);
                    $("#titleStr").val(title);
                }
            }, "JSON");
            let titleStr = getParameter("title");
            if(titleStr != null) {
                titleStr = decodeURIComponent(titleStr);
                $("#titleStr").val(titleStr);
            }
        })

		function closeProductFun(id, obj) {
            $.post("${pageContext.request.contextPath}/manage/product/closeProduct.do", {"id":id},function(){
                	let resultCloseHtml = '下架\n' +
                        '        <a onclick="openProductFun('+id.toString()+', this)" class="btn bg-green btn-xs">上架</a>';
					$(obj).parent().html(resultCloseHtml);
				}
            );
		}
		function openProductFun(id, obj) {
            $.post("${pageContext.request.contextPath}/manage/product/openProduct.do", {"id":id},function(){

                let resultOpenHtml = '在售\n' +
                        '        <a onclick="closeProductFun('+id.toString()+', this)" class="btn bg-yellow btn-xs">下架</a>';
                    $(obj).parent().html(resultOpenHtml);
                }
            );
		}
        //根据传递过来的参数name获取对应的值
        function getParameter(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
            var r = location.search.substr(1).match(reg);
            if (r!=null) return (r[2]); return null;
        }
	</script>

</body>

</html>