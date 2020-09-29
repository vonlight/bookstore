<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 通过动态标签引入公共jsp页面 -->
<%@ include file="/pages/common/header.jsp"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <!-- 引入函数 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>网上购书系统首页</title>
	<script>
		//查询二级分类数据开始
        $(function() {
            let categoryCode = getParameter("categoryCode");
            if(categoryCode != null) {
                $.get("${pageContext.request.contextPath}/category/findAllSecondCategoryCode.do",{"categoryCode" : categoryCode}, function(data) {
                    let secondCategoryHtml = "";
                    let categoryCode = getParameter("categoryCode") + "";
                    for( i = 0; i < data.length; i++) {
                        if (data[i].code === categoryCode) {
                            secondCategoryHtml += '<a style = "margin-left:10px;" href="${pageContext.request.contextPath}/product/index.do?categoryCode=' +data[i].code+ '" class="btn btn-default btn-primary">' +data[i].name.replace(/-/g, "")+'</a>';
                        } else {
                            secondCategoryHtml += '<a style = "margin-left:10px;" href="${pageContext.request.contextPath}/product/index.do?categoryCode=' +data[i].code+ '" class="btn btn-default">' +data[i].name.replace(/-/g, "")+'</a>';
                        }
                    }
                    $("#secondCategory").html(secondCategoryHtml);
                }, "JSON");
            }

            let title = getParameter("title");
            if(title != null) {
                title = decodeURIComponent(title);
                $("#title").val(title);
			}
        })
		//查询二级分类数据开始结束
	</script>

</head>
<body>
	<!-- 横幅导航条开始 -->
	<jsp:include page="/pages/common/nav.jsp"></jsp:include>


	<!-- 横幅导航条结束 -->
	<!--  横幅下方的主体开始 -->
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<!-- 侧边导航开始 -->
			<jsp:include page="productAside.jsp"></jsp:include>
			<!--  侧边导航结束 -->
			<!-- 内容主体开始 -->
			<div class="col-xs-12 col-sm-9">

				<div class="alert" role="alert" >

					<div align="center"  >
						<form action="${pageContext.request.contextPath}/product/findByCategoryCodeAndTitle.do" method="get" class="form-inline"  >
							<!-- 如果当前选择了商品的类型，仅在该类型下面进行搜索 -->

							<input type = "hidden" value="${param.categoryCode}" name = "categoryCode" >
                            <input type="text" class="form-control " style = "width: 60%; margin-right: 10px;" name="title" id = "title" placeholder = "Search" >
							<input type="submit" value="搜索"   class="btn btn-default ">
						</form>
					</div>
					<%--二级导航栏--%>
					<div align="center" id = "secondCategory"></div>
					<%--二级导航栏--%>
				</div>

				<div class="row">

					<c:forEach items="${pageInfo.list}" var="product">
						<div class="col-xs-6 col-lg-4">
							<span class="thumbnail"> <a
								href="${pageContext.request.contextPath}/product/detail.do?id=${product.id}">

									<img
									src="${pageContext.request.contextPath}/image/product/${product.image}"  style="width:180px;height:200px;margin-top: 5px; margin-bottom: 10px"
									alt="..." >
									<p style="height: 20px; overflow: hidden;"  align="center">${product.title}</p>
							</a>
                                <p align="center">
									<span>${product.author}&nbsp;著</span>

								</p>
								<p align="center">
									<span style="color: red;" >¥<fmt:formatNumber value="${product.discountPrice}" pattern="0.00"></fmt:formatNumber></span>&nbsp;<span class="price">¥${product.price}</span>

								</p>
							</span>
						</div>
					</c:forEach>


				</div>




				<!--  分页开始 -->
				<div class="row">
					<nav>
						<div align="center">
							<ul class="pagination" >
								<li>
									<a href="${pageContext.request.contextPath}/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}" aria-label="Previous">首页</a>
								</li>
								<c:if test="${(pageInfo.pageNum-1) >= 1}">
									<li>
										<a href="${pageContext.request.contextPath}/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageInfo.pageNum-1}">上一页</a>
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
												<a  href="${pageContext.request.contextPath}/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageNum}">${pageNum}</a>
											</li>
										</c:when>
										<c:when test="${pageNum == param.page}">
											<li class = "active">
												<a  href="${pageContext.request.contextPath}/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageNum}">${pageNum}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li >
												<a  href="${pageContext.request.contextPath}/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageNum}">${pageNum}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<c:if test="${(pageInfo.pageNum+1) <= pageInfo.pages}">
									<li>
										<a href="${pageContext.request.contextPath}/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageInfo.pageNum+1}">下一页</a>
									</li>
								</c:if>
								<c:if test="${(pageInfo.pageNum+1) > pageInfo.pages}">
									<li class="disabled">
										<a href="javascript:void(0);">下一页</a>
									</li>
								</c:if>
								<li>
									<a href="${pageContext.request.contextPath}/product/${pageResources}?categoryCode=${param.categoryCode}&title=${param.title}&page=${pageInfo.pages}" aria-label="Next">尾页</a>
								</li>
							</ul>
						</div>
					</nav>
				</div>
				<!-- 分页结束 -->
			</div>
			<!-- 内容主体结束 -->
		</div>

	</div>
</body>
</html>