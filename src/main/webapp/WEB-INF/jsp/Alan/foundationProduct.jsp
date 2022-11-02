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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:forEach items='${usersList}' var='user'>
			<div class="row align-items-center">
				<div class="col-lg-6 mb-4 mb-lg-0">
					<div class="mx-auto text-center">
						
						<div class="wrap">
							<div class="left">
							<p></p>
								<img src="${contextRoot}${user.photoPath}" class="rounded"
									alt="..." width="220" height="220">
							</div>
						</div>
						<p></p>
						<div><h2 align="left" class="w-90">${user.nickName}</h2></div>
						<p></p>
						<p align="left" class="mb-4">${user.selfIntroduction}</p>
						
					</div>
				</div>
		</c:forEach>
		<div class="col-lg-6">
			<div class="ps-lg-6 ps-xl-10 w-lg-80">
				<form action="${contextRoot}/Alan/insertShoppingCar" method="post">
					<!-- 這個form 回傳的Controller -->
					<div class="mb-4"></div>
					<c:forEach items='${foundationList}' var='foundation' end="0">
						<c:forEach items='${foundation.products}' var='product'>
							<c:if test="${product.productStatus == 1 }">
									<div class="www" id="headingOne"> <!-- 框框顏色 -->
										<div class="mb-0">
										<table width="100%">
										<tr>
										<td><input  type="checkbox" name="checkbox"
												value="${product.productId}"
												onclick="oncheck(${product.productId})" />
											<!-- 利用script 功能 oncheck 使用函式 把 商品與數量的值一起傳入後端 -->

											${product.productName}</td>
										<td align="right">
										 請選擇數量<select name="quantity"
												id="quantity${product.productId}">
												
												<option >0</option>
												<option >1</option>
												<option >2</option>
												<option >3</option>
												<option >4</option>
												<option >5</option>
												<option >6</option>
												<option >7</option>
												<option >8</option>
												<option >9</option>
												<option >10</option>
											</select>
										
										</td>
										</tr>
										</table>
											<!--  勾選需要商品進購物車 -->
											

										       
			
											<div>單價${product.productPrice}</div>
											
									

									</div>

								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
					<div align="right">
					<button  type="submit" class="btn btn-secondary mt-5">加入購物車</button>
					</div>


				</form>

			</div>

		</div>
	</div>



	<style type="text/css">
.wrap { /*父元素*/
	width: 200%;
	height: 250px;
	display: flex;
	justify-content: space-between;
}

.left {
position: absolute;
	background: #FFF2F2;
	width: 30%;
	height: 0px;
	top: 0px;
	right: 0px;
	left: 0px;
	
}

.right {
	background: #FFF2F2;
	width: 50%;
	height: 200px;
}

.www{
 background-color:#fff7f7;
 margin: 2px 0px;
 padding: 15px;
}
</style>
	<script>    <!-- 上方oncheck用的函式 -->

	 <!-- function oncheck(id){
	 var selected = document.getElementById("quantity"+id).value;
	  
		alert(selected); 
	 } -->

</script>

</body>

</html>