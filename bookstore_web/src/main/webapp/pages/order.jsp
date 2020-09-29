<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 通过动态标签引入公共jsp页面 -->
<%@ include file="/pages/common/header.jsp"%>

<!-- 引入格式化标签 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 

<!DOCTYPE html>
<html lang="zh_CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品详情</title>


	  <style>
		  th {
			  text-align: center;
		  }
		  td{
			  text-align: center;
		  }
	  </style>
  </head>
  <script>
	  <%--$(function() {--%>
	      <%--var a = '${}'--%>
	  <%--})--%>
  </script>
  <body>

	

  
 <!-- 横幅导航条开始 -->
   <jsp:include page="/pages/common/nav.jsp"></jsp:include>

	<!--  横幅下方的主体开始 -->
    <div class="container">
				<div class="table table-condensed">
					<div align="center"   >
						<form action="${pageContext.request.contextPath}/product/findByCategoryCodeAndTitle.do" method="get" class="form-inline"  >
							<input type="text" placeholder="Search" class="form-control "  style = "width : 40%; margin-right: 10px;" name="title" id = "title" >
							<input type="submit" value="搜索"   class="btn btn-default ">
						</form>
					</div>

					<table class="table" >

						<thead >
						<tr >

							<th style="text-align: left">
                                <a type="button" class="btn btn-default ${allOrder}" style="margin-left: 10px;margin-right: 10px;" href="${ctx}/order/showOrder.do">所有订单</a>
                                <a type="button" class="btn btn-default ${showPay}" style="margin-left: 10px;margin-right: 10px;" href="${ctx}/order/showPay.do">已支付</a>
                                <a type="button" class="btn btn-default ${noPay}" style="margin-left: 10px;margin-right: 10px;" href="${ctx}/order/showNoPay.do">待支付</a>
									<%--<form class="input-group input-group-sm" >
										<input type="text" name="table_search" style="width: 150px;" class="form-control pull-right" placeholder="Search">

										<div class="input-group-btn">
											<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
										</div>
									</form>--%>
							</th>

						</tr>
						</thead>
					</table>
				<!-- 遍历订单 -->
				<c:forEach items="${pageInfo.list}" var="order">
				<table class="table table-hover table-bordered table-striped " >

				     <thead>
						<tr bgcolor="#EAF8FF">

							<th style="width: 20%">
								订单号
							</th>
							<th style="width: 20%">下单时间</th>
							<th style="width: 20%">发货时间</th>
							<th style="width: 8%">发货状态</th>
							<th style="width: 8%">订单总金额</th>
							<th style="width: 14%">操作</th>
						</tr>
					</thead>

					<tbody>
					    <tr align="center">
								<td >
									 ${order.orderCode}
								</td>
								<td>
								   <fmt:formatDate value="${order.createDate}" pattern="yyyy年MM月dd日 HH:mm:ss"/> 
								</td>
								<td>
									<fmt:formatDate value="${order.sendDate}" pattern="yyyy年MM月dd日 HH:mm:ss"/> 
								</td>
								<td>
								   <c:choose>
								      <c:when test="${order.status eq '0'}">未发货</c:when>
								      <c:otherwise>已发货</c:otherwise>
								   </c:choose>
								</td>
								<td>
									<strong style="color:red;">
										¥<fmt:formatNumber value="${order.amount}" pattern="0.00"></fmt:formatNumber>
									</strong>
								</td>
								<td>
								   <c:choose>
								      <c:when test="${order.payStatus eq '0'}">
										  <a type="button" class="btn btn-primary btn-xs" href="${ctx}/order/payOrder.do?id=${order.id}">去支付</a>
										  <a type="button" class="btn btn-danger btn-xs" style="margin-left: 10px;" href="${ctx}/order/deleteOrder.do?id=${order.id}">取消</a>
									  </c:when>
									   <c:when test="${order.status eq '1' and order.receiveStatus eq '0'}">
										   <a type="button" class="btn btn-success btn-sm" style="margin-left: 10px;margin-right: 10px;" onclick = "confirmOrderFun(this, ${order.id})">确认收货</a>
									   </c:when>
									   <c:when test="${order.receiveStatus eq '1'}">
										   完成
									   </c:when>
								      <c:otherwise>已支付</c:otherwise>
								   </c:choose>
								</td>
							</tr>
					
					</tbody>
					

					<c:forEach items="${order.orderProductList}" var="orderProductList">
					<tbody>
					
						
					 
							<tr>
								<td>
									<img alt="商品图片" style="width:50px;height:70px" src="${pageContext.request.contextPath}/image/product/${orderProductList.product.image}">
								</td>
								<td >
                                    ${orderProductList.product.title}
								</td>
								<td >
									¥<fmt:formatNumber value="${orderProductList.product.discountPrice}" pattern="0.00"></fmt:formatNumber>
								</td>
								<td>
								     ${orderProductList.orderNum}
								</td>
								<td>
									<strong>¥<fmt:formatNumber value="${orderProductList.product.discountPrice * orderProductList.orderNum}" pattern="0.00"></fmt:formatNumber></strong>
								</td>
								<td>
								</td>
							</tr>
						
					</tbody>

					</c:forEach>

				</table>
				</c:forEach>

			</div>

		<%--分页开始--%>
		<div class="row">

			<nav>
				<div align="center">
					<ul class="pagination" >
						<li>
							<a href="${pageContext.request.contextPath}/order/${pageDo}" aria-label="Previous">首页</a>
						</li>
						<c:if test="${(pageInfo.pageNum-1) >= 1}">
							<li>
								<a href="${pageContext.request.contextPath}/order/${pageDo}?page=${pageInfo.pageNum-1}">上一页</a>
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
										<a  href="${pageContext.request.contextPath}/order/${pageDo}?page=${pageNum}">${pageNum}</a>
									</li>
								</c:when>
								<c:when test="${pageNum == param.page}">
									<li class = "active">
										<a  href="${pageContext.request.contextPath}/order/${pageDo}?page=${pageNum}">${pageNum}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li >
										<a  href="${pageContext.request.contextPath}/order/${pageDo}?page=${pageNum}">${pageNum}</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>


						<c:if test="${(pageInfo.pageNum+1) <= pageInfo.pages}">
							<li>
								<a href="${pageContext.request.contextPath}/order/${pageDo}?page=${pageInfo.pageNum+1}">下一页</a>
							</li>
						</c:if>
						<c:if test="${(pageInfo.pageNum+1) > pageInfo.pages}">
							<li class="disabled">
								<a href="javascript:void(0);">下一页</a>
							</li>
						</c:if>
						<li>
							<a href="${pageContext.request.contextPath}/order/${pageDo}?page=${pageInfo.pages}" aria-label="Next">尾页</a>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		<%--分页结束--%>

    </div>
  <script>
	  function confirmOrderFun(obj, id) {
	      $.post("${ctx}/order/confirmOrder.do", {"id" : id}, function() {
              let resultHtml = '完成';
              $(obj).parent().html(resultHtml);
		  })
	  }
  </script>
  </body>
</html>