<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<jsp:include page="../timmy/layout/navbar.jsp" />
<jsp:include page="../Alan/layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />


<html>
<head>
<link href="${contextRoot}/css/shoppingcar.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>PET.COM</title>
</head>
<body>
	<div class="container"></div>
	<div class="text-center mb-5">
		<h3>確認訂單</h3>
	</div>
	<!--  放進購物車內容 -->
	<form action="${contextRoot}/Alan/Orders" method="post">
	<div class="card-body">
		<div class="card mb-3">
			<div class="card-body">
				<div class="">
					<div class="row flex-fill">
						<div class="col-sm-12">
							<div class="row flex-fill">
								<table class="table table-striped" style="margin: 3% 3% 1% 3%">
									<tr>
										<td><h4>圖片</h4></td>
										<td><h4>商品名稱</h4></td>
										<td><h4>購買數量</h4></td>
										<td><h4>單價</h4></td>
										<td><h4>總計</h4></td>
										<td style="display:none"></td>
									</tr>
									<c:set var="totalPrice" value="${0}"></c:set>
									<c:forEach items='${shoppingCarList}' var='orders'>
										<tr>
											<td><img
												src="${contextRoot}${orders.products.productImg}"
												class="rounded" alt="..." width="95" height="95"></td>
											<td>${orders.products.productName}</td>
											<td>${orders.quantity}</td>
											<td>${orders.products.productPrice}</td>
											<td>${orders.quantity*orders.products.productPrice}</td>
											<c:set var="totalPrice" value="${totalPrice + orders.quantity * orders.products.productPrice}"></c:set>
											<td style="display:none">
												<input type="hidden" name="Q" value="${orders.quantity}" style="display:none">
												<input type="hidden" name="Id" value="${orders.products.productId}" style="display:none">
												<input type="hidden" name="orderSubtotal" value="${orders.products.productPrice}" style="display:none">
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<div style="float:right;margin-right:7%">總計: ${totalPrice}</div><br>
					<button style="float:right;margin:1% 7% 0 0  " class="btn btn-outline-primary" type="button" onclick="document.getElementById('submitBtn').click()" >確認購買</button>
				</div>
			</div>
		</div>
	</div>
	<button id="submitBtn" style="display:none"></button>
	</form>
</body>
</html>