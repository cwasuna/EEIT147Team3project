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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

<link href="${contextRoot}/css/shoppingcar.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container"></div>
	<div class="text-center mb-5">
		<div>
			<table id="table_id" class="display">  
				<thead>
					<tr>
						<th scope="col">訂單編號</th>
						<th scope="col">訂單金額</th>
						<th scope="col">購買數量</th>
						<th scope="col">商品名稱</th>
						<th scope="col">商品單價</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items='${usersList}' var="users" varStatus="vs">
						<tr>
							<td id="aaa" scope="row">${users.orderNo}</td>

							<td>${users.orderPrice}</td>
							<td><c:forEach items='${users.orderDetails}' var="od">${od.orderQuantity}
														<br>
								</c:forEach></td>
							<td><c:forEach items='${users.orderDetails}' var="od">${od.products.productName}
														<br>
								</c:forEach></td>
							<td><c:forEach items='${users.orderDetails}' var="od">${od.products.productPrice}
														<br>
								</c:forEach></td>

						</tr>
					</c:forEach>
				</tbody>

			</table>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#table_id').DataTable();
				});
			</script>
		</div>
	</div>
	<div class="card mb-3"></div>
	<div class="card-body">
		<div>
			<div class="row flex-fill">
				<div class="col-sm-5"></div>


				<div class="col-sm-4 py-2"></div>
				<div class="col-sm-3 text-lg-end"></div>
			</div>

		</div>

	</div>



</body>
</html>