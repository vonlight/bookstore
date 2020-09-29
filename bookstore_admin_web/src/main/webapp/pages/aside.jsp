<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>
				</p>
				<a href="javascript:void(0);"><i class="fa fa-circle text-success"></i> 在线</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">菜单</li>
			<li class="${index_aside}"><a
				href="${pageContext.request.contextPath}/manage/order/indexOrder.do"><i
					class="fa fa-dashboard "></i> <span>首页</span></a></li>

			<li class="treeview ${product_aside} ${category_aside}"><a href="#"> <i class="fa fa-shopping-cart"></i>
					<span>商品</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>


			</a>


				<ul class="treeview-menu">
					<li class="${product_aside}">
						<a href="${pageContext.request.contextPath}/manage/product/findByCategoryCode.do"> <i
							class="fa fa-cart-plus"></i> 商品管理
					</a>
					</li>
					<li class="${category_aside}"><a
						href="${pageContext.request.contextPath}/manage/category/categoryList.do"> <i
							class="fa fa-location-arrow"></i> 类型管理
					</a></li>
				</ul>

			</li>
			<li class="treeview ${order_aside}"><a href="#"> <i class="fa  fa-list-alt"></i>
					<span>订单</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li class="${order_aside}"><a
						href="${pageContext.request.contextPath}/manage/order/orderFindAll.do">
							<i class="fa fa-list-ol"></i> 订单管理
					</a></li>

				</ul></li>
			<li class="treeview ${user_aside}" ><a href="#"> <i class="fa fa-group"></i>
				<span >用户</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li class="${user_aside}"><a
							href="${pageContext.request.contextPath}/manage/user/findAllRoleOne.do">
						<i class="fa fa-male"></i> 用户管理
					</a></li>

				</ul></li>

		</ul>
	</section>
	<!-- /.sidebar -->
</aside>