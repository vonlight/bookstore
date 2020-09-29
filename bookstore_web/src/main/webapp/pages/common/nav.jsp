<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 引入c标签 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- 横幅导航条开始 -->
	<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">显示导航条</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/product/index.do">网上书城</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="${index}"><a href="${pageContext.request.contextPath}/product/index.do" >首页</a></li>
					<li class="${shopcarFindByUserId}"><a href="${pageContext.request.contextPath}/shopcar/findByUserId.do">购物车</a></li>
					<li class="${showOrder}"><a href="${pageContext.request.contextPath}/order/showOrder.do">我的订单</a></li>
					<li class="${addressFindByUserId}"><a href="${pageContext.request.contextPath}/address/findByUserId.do">地址管理</a></li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<c:choose>
						<c:when test="${not empty session_user}">
							<li id = "userDetail_li"><a href="${pageContext.request.contextPath}/user/userDetail.do">欢迎[<span style = "color:red;">${session_user.name}</span>]访问!</a></li>
							<li><a href="${pageContext.request.contextPath}/user/logout.do">退出</a></li>
							<%--<li id = "register_li"><a href="${pageContext.request.contextPath}/register.do">免费注册</a></li>--%>
							<c:if test="${session_user.role==2}">
							<li><a href="http://localhost:8808/bookstore_admin_web/index.jsp" target="_Blank">后台管理</a></li>
							</c:if>
						</c:when>
						<c:otherwise>
							</a></li>
							<li><a href="${pageContext.request.contextPath}/pages/login.jsp">登录</a></li>
							<li><a href="${pageContext.request.contextPath}/register.do">免费注册</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>