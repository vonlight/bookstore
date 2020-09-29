<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 页面头部 -->
<header class="main-header " >
	<!-- Logo -->
	<a href="${pageContext.request.contextPath}/manage/order/indexOrder.do" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<%--<span class="logo-mini"><b>数据</b></span> <!-- logo for regular state and mobile devices -->--%>
		<span class="logo-lg "><b>购书系统</b>后台管理</span>
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">

				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> 欢迎, ${session_user.name} <span class="hidden-xs">
					</span>
				</a>
					<ul class="dropdown-menu" >
						<!-- User image -->
							<img src="${pageContext.request.contextPath}/img/image/333.png" width="100%" height="50%">
						<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-left">
								<a href="http://localhost:8888/bookstore_web/product/index.do" target="_Blank" class="btn btn-default btn-flat">访问官网</a>
							</div>
							<div class="pull-right">
								<a href="${pageContext.request.contextPath}/manage/user/logout.do"
									class="btn btn-default btn-flat">注销</a>
							</div>
						</li>
					</ul></li>

			</ul>
		</div>
	</nav>
</header>
<!-- 页面头部 /-->