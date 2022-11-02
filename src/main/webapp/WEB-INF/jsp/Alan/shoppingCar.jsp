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
		<div class="text-center mb-5">
  
  
			<p class="lead">您購買的的東西</p>
		</div>

		<div class="card mb-3">
			<form action="${contextRoot}/Alan/ShoppingCarcheckbox" method="post">
				<c:forEach items='${ShoppingCarProducts}' var='Products'>
					<div class="card-body">
						<div class="d-flex flex-column flex-lg-row">
							<span class="avatar avatar-text rounded-3 me-4 mb-2"><img src="${contextRoot}${Products.products.productImg}" class="rounded"
									alt="..." width="95" height="95">	</span>
							<div class="row flex-fill">
								<div class="col-sm-5">
									<h4 class="h5">${Products.products.productName}</h4>
								</div>
								<div class="col-sm-4 py-2">

									<input type="checkbox" id="check${Products.shoppingCarId}"
										 value="${Products.shoppingCarId}"
										onclick="oncheck(${Products.shoppingCarId})" required> 

									<!-- -1按鈕 -->
									<a
										href='${contextRoot}/Alan/newShoppingCarProduct?add=1&updateShoppingCarProducts=${Products.shoppingCarId}'>
										<!-- +1按鈕--> -
									</a> <input type='text' name='quantity'
										value="${Products.quantity}" class='qty' /> <a
										href='${contextRoot}/Alan/newShoppingCarProduct?add=2&updateShoppingCarProducts=${Products.shoppingCarId}'>
										<!-- +1按鈕--> +
									</a> 
									<div>單價:${Products.products.productPrice}</div>
<%-- 									<div>總計:<output name="result" for="${Products.products.productPrice}*${Products.quantity}">60</output></div> --%>
									<div>總計:${Products.products.productPrice * Products.quantity}</div>

								</div>
								<a
									href="${contextRoot}/Alan/deleteShoppingCarProduct?deleteShoppingCarProducts=${Products.shoppingCarId}">

									刪除 </a>
							</div>
						</div>

						<p>
							<span id="change${Products.shoppingCarId}"></span>
						</p>

					</div>
				</c:forEach>
				<button value="Action" id="touch" type="submit" 
					class="btn btn-secondary mt-5">前往購買</button>
			</form>
		</div>
	</div>

	<script>
	<!-- 上方oncheck用的函式 -->

	 function oncheck(id){
		 var flag = $("#check"+id).prop("checked");
		 
		 if(flag==true){
			 var selected = document.getElementById("check"+ id).value;
			 $("#change"+ id).replaceWith("<input type='hidden' name ='oldchange' id='change"+selected+"' value ="+selected+" />"); 
				var selected1 = document.getElementById("change" + id).value;
				console.log(selected1) 
		 } else{
			 var selected = document.getElementById("check"+ id).value;
			 $("#change"+ id).replaceWith("<input type='hidden' id='change"+selected+"' value ='0' />"); 
			 var selected2 = document.getElementById("change" + id).value;
			 console.log(selected2) 
		 }
		 
		
	 };  
	 
	 $('.ticket').on( 'keyup','.quantity',function(){
		 $(this).closest('.ticket').find('#total').text(price*quantity);
	  });
         
	 
  

	</script>

</body>
</html>