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
<title>购物车</title>

	

<script type="text/javascript">

    //入口函数
	$(function() {
	    //订单提交事件开始
	    $("#form").submit(function() {
            let products = $("input[type = 'checkbox']:gt(0)");
            let orderInfoVal = "${session_user.id}";
            for(i = 0; i < products.length; i++) {
                if(products[i].checked) {
                    // orderInfo
                    orderInfoVal += ("#" + products[i].value);
                }
            }
            if (orderInfoVal === "${session_user.id}") {
                alertFun("请选择需要购买的商品信息!");
                return false;
            } else {
                $(".orderInfo").val(orderInfoVal);
                return true;
            }
        });
	    //订单提交事件结束
        //购物车删除事件开始
        $("#del_form").submit(function() {
            let products = $("input[type = 'checkbox']:gt(0)");
            let orderInfoVal = "${session_user.id}";
            for(i = 0; i < products.length; i++) {
                if(products[i].checked) {
                    // orderInfo
                    orderInfoVal += ("#" + products[i].value);
                }
            }
            if (orderInfoVal === "${session_user.id}") {
                alertFun("请选择需要删除的商品信息!");
                return false;
            } else {
                $(".orderInfo").val(orderInfoVal);
                return true;
            }
        });
        //购物车删除事件结束

	})
	//计算总金额
	function totalMoney() {
        $.get("${pageContext.request.contextPath}/shopcar/totalMoney.do?id=${session_user.id}", function(totalMoney) {
            $("#totalMoney").html(totalMoney.toFixed(2));
            $("#totalMoney_hidden").val(totalMoney.toFixed(2));
        });
	}
	//计算单产品总金额
	function productMoney(productId, discountPrice, num) {
	    let money = discountPrice * num;
        $("#productMoney" + productId).html(money.toFixed(2))
    }

 	//全选复选框
	function checkAll(obj) {
	    $(".itemCheck").prop("checked", obj.checked);
	    if(obj.checked) {
            totalMoney();
            //更新选中数量
            selectProduct();
		} else {
	        let a = 0;
            $("#totalMoney").html(a.toFixed(1));
            $("#totalMoney_hidden").val(a.toFixed(1));
            $(".selectNum").html(0);
		}
	}
	//选中商品数量
	function selectProduct() {
	    let products = $("input[type = 'checkbox']:gt(0)");
	    let num = 0;

	    for(i = 0; i < products.length; i++) {
	        if(products[i].checked) {
	            num+=1;
			}
		}
        $(".selectNum").html(num);
	}
	//复选框事件
	function checkboxFun(obj, productId) {

	    if (obj.checked) {
			let money = parseFloat($("#productMoney" + productId).html()) + parseFloat($("#totalMoney").html());
			$("#totalMoney").html(money.toFixed(2));
			$("#totalMoney_hidden").val(money.toFixed(2));
            selectProduct();
		} else {
            let money = parseFloat($("#totalMoney").html()) - parseFloat($("#productMoney" + productId).html());
            if(money > 0) {
            	$("#totalMoney").html(money.toFixed(2));
            	$("#totalMoney_hidden").val(money.toFixed(2));
			} else {
                let a = 0;
                $("#totalMoney").html(a.toFixed(1));
                $("#totalMoney_hidden").val(a.toFixed(1));
			}
            selectProduct();
		}

	}
    // + 事件
    function addFun(productId, repertory, discountPrice){
        var num = parseInt($("#" + productId).val());
        if(num + 1 <= repertory) {
            $("#" + productId).val(num + 1);
            productMoney(productId, discountPrice, num + 1);
            $.get("${pageContext.request.contextPath}/shopcar/updateShopcar.do", {"productId" : productId, "buynum" : num + 1, "userId" : ${session_user.id}});
        }
        let checkbox = $("#checkbox" + productId).get(0);

        if(checkbox.checked) {
            let money = parseFloat($("#totalMoney").html()) + discountPrice;
            $("#totalMoney").html(money.toFixed(2));
            $("#totalMoney_hidden").val(money.toFixed(2));
        }
    }

    // -事件
    function devFun(productId, discountPrice){

        var num = $("#" + productId).val();

        if(num>1){
            //重新给输入框中的value赋值
            $("#" + productId).val(num - 1);
            productMoney(productId, discountPrice, num - 1);
            $.get("${pageContext.request.contextPath}/shopcar/updateShopcar.do", {"productId" : productId, "buynum" : num - 1, "userId" : ${session_user.id}});
        }
        let checkbox = $("#checkbox" + productId).get(0);

        if(checkbox.checked) {
            let money = parseFloat($("#totalMoney").html()) - discountPrice;
            $("#totalMoney").html(money.toFixed(2));
            $("#totalMoney_hidden").val(money.toFixed(2));
        }
    }



    //购买数量输入框失焦事件
    function validNum(obj,productId, repertory, discountPrice){
		let money = parseFloat($("#totalMoney").html()) - parseFloat($("#productMoney" + productId).html());
        //1、判断用户输入的是否是数字   isNaN: is Not a Number
        if(isNaN(obj.value)||obj.value < 1){
            //用户输入的不是数字或者小于1的数字 都不合法,则 使用默认购买数量
            obj.value = 1;

        }else if(obj.value > repertory){
            obj.value = 1;
            alertFun("购买数量已超过库存数，请核实");

        }else{
            //防止用户用户输入小数    假设用户输入3 == 》3  用户输入  3.5 == 》4   对用户输入的值 进行向上取整
            obj.value = Math.ceil(obj.value);
            //发送请求更新购物车中购买的数量
        }
        productMoney(productId, discountPrice, obj.value);
        $.get("${pageContext.request.contextPath}/shopcar/updateShopcar.do", {"productId" : productId, "buynum" : obj.value, "userId" : ${session_user.id}});

        //--------------------------------------------------------
        let checkbox = $("#checkbox" + productId).get(0);

        if(checkbox.checked) {
            money = money + parseFloat($("#productMoney" + productId).html());
            $("#totalMoney").html(money.toFixed(2));
            $("#totalMoney_hidden").val(money.toFixed(2));
        }
    }

	//错误信息展示
    function alertFun(message) {
	    $("#error_Message").html(message);
        $("#error_Model").modal("show");
    }

</script>
<style>
	th {
		text-align: center;
	}
	td {
		text-align: center;

	}
</style>
</head>
<body>
	<!-- 横幅导航条开始 -->
	
	<jsp:include page="/pages/common/nav.jsp"></jsp:include>

	<!-- /.navbar -->
	<!--  横幅下方的主体开始 -->
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">

			<!-- 内容主体开始 -->
			<div class="col-xs-12 col-sm-12">
				<div align="center"   >
					<form action="${pageContext.request.contextPath}/product/findByCategoryCodeAndTitle.do" method="get" class="form-inline"  >
						<input type="text" placeholder="Search" class="form-control "  style = "width : 40%; margin-right: 10px;" name="title" id = "title" >
						<input type="submit" value="搜索"   class="btn btn-default ">
					</form>
				</div>
				<div>当前位置：我的购物车</div>
				<div class="table-responsive">
					<table class="table table-hover table-bordered table-striped">
						<thead>
							<tr>
								<th><input type="checkbox" id="checkAll" onclick="checkAll(this)"></th>
								<th style="width: 10%">图片</th>
								<th style="width: 20%">名称</th>
								<th style="width: 20%">单价</th>
								<th style="width: 10%">库存</th>
								<th style="width: 20%">数量</th>
								<th style="width: 10%">金额</th>
								<th style="width: 10%">操作</th>
							</tr>
						</thead>
						<tbody>
						
						<c:forEach items="${shopcarList}" var="shopcar">
						     <tr>
								<td style="vertical-align: middle;">
									<%--复选框--%>
									<input type="checkbox" id = "checkbox${shopcar.product.id}" class="itemCheck" value = "${shopcar.product.id}_${shopcar.buynum}_<fmt:formatNumber value="${shopcar.product.discountPrice * shopcar.buynum}" pattern="0.00"></fmt:formatNumber>" onclick="checkboxFun(this, ${shopcar.product.id})"/>
								</td>
								<td>
									<img alt="商品图片" src="${pageContext.request.contextPath}/image/product/${shopcar.product.image}" style="width:100px;height:100px">
								</td>
								<td>
										${shopcar.product.title}
								</td>
								<td>
								   <c:if test="${shopcar.product.discount != 0.0}">
									    <span class="discountPrice" >¥<fmt:formatNumber value="${shopcar.product.discountPrice}" pattern="0.0"></fmt:formatNumber></span>
								  </c:if>

									¥<span class="price">${shopcar.product.price}</span>

								</td>
								 <td>
										 ${shopcar.product.storage}
								 </td>
								<td>
									<span class="glyphicon glyphicon-minus" onclick="devFun(${shopcar.product.id}, ${shopcar.product.discountPrice})"></span>
									
									<input id="${shopcar.product.id}" value="${shopcar.buynum}" style="width: 40px; text-align: center;" onblur="validNum(this,${shopcar.product.id}, ${shopcar.product.storage}, ${shopcar.product.discountPrice})"/>
									<span class="glyphicon glyphicon-plus" onclick="addFun(${shopcar.product.id}, ${shopcar.product.storage}, ${shopcar.product.discountPrice})"></span>
								</td>
                                 <%-- 商品金额--%>
								 <td ><span style = "color: red">¥</span><span style="color: red" id = "productMoney${shopcar.product.id}"><fmt:formatNumber value="${shopcar.product.discountPrice * shopcar.buynum}" pattern="0.00"></fmt:formatNumber></span></td>
								<td align="center">
									<a href="${pageContext.request.contextPath}/shopcar/deleteShopCar.do?productId=${shopcar.product.id}&userId=${session_user.id}"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
								</td>
							</tr>
						</c:forEach>
						

					
						</tbody>
					</table>
				</div>
			</div>
			<!-- 内容主体结束 -->
		</div>
		<!--/row-->
		<form action="${pageContext.request.contextPath}/shopcar/delCheckedShopCar.do" method="get" id="del_form">
			<input type="hidden" name="orderInfo" class="orderInfo"/>
			<button id="delOrder" class="btn btn-sm" type="submit" style = "background-color: #777;" >
				<span style = "color : white">删除选中</span> <span class="badge selectNum" style = "background-color: white;color: #777">0</span>
			</button>
		</form>
        <form action="${pageContext.request.contextPath}/order/confirmOrderInfo.do" method="get" id="form">
            <!-- 通过隐藏输入框 将订单相关信息传递至后台 -->
            <input type="hidden" name="orderInfo" class="orderInfo"/>
			<input type="hidden" name="totalMoney" id = "totalMoney_hidden">
            <div align="right">
			购物车商品总金额:<span id="totalMoney" style="color: red;">0.0</span>元&nbsp;&nbsp;&nbsp;&nbsp;
			<button id="commitOrder" class="btn btn-danger" type="submit" >
				去结算 <span class="badge selectNum" id = "selectNum">0</span>
			</button>
		</div>
        </form>



	</div>

<%--提示框--%>
	<div class="modal fade" id="error_Model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel1">错误信息</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ">
					<span id = "error_Message"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>