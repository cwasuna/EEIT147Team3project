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
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


		
			<div class="row justify-content-center gapsectionsecond">
				<div class="col-lg-7 text-center">
					<div class="title-big pb-3 mb-3">
					
					</div>
					<p class="ml3">我們與一些基金會合作，提供捐出糧食幫助流浪動物。</p>
				</div>
			</div>

			<div class="row pt-5">
				<c:forEach items='${usersList}' var='user'>
					<div class="col-lg-4 pb-5 pb-lg-0">
						<div class="wrap-price">
							<div class="price-innerdetail text-center">

								<ul>
									<h4>${user.nickName}</h4>
									<!--	<h5>${user.selfIntroduction}</h5>
									 <h4>${user.money}</h4> -->	
										
										<div><img src="${contextRoot}${user.photoPath}" class="rounded"
									alt="..." width="200" height="200">	</div>
										
									

									<form action="${contextRoot}/Alan/foundationProduct" method="post">
										<input type="hidden" value="${user.foundation.foundationId}"
											name=foundationId />
										<button type="submit" class="btn btn-secondary mt-5">立即幫助 請點我</button>
									</form>
								</ul>
							</div>

						</div>
					</div>
				</c:forEach>
			</div>
	<style type="text/css">
	
.wrap { /*父元素*/
	width: 100%;
	height: 200px;
	display: flex;
	justify-content: space-between;
}

.left {
	background: red;
	width: 50%;
	height: 200px;
}

.right {
	background: blue;
	width: 50%;
	height: 200px;
}

.ml3 {
  font-weight: 500;
  font-size: 1.5em;
}
</style>
<script>
var textWrapper = document.querySelector('.ml3');
textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

anime.timeline({loop: true})
  .add({
    targets: '.ml3 .letter',
    opacity: [0,1],
    easing: "easeInOutQuad",
    duration: 500,
    delay: (el, i) => 150 * (i+1)
  }).add({
    targets: '.ml3',
    opacity: 0,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 20000
  });


</script>	

</body>
</html>