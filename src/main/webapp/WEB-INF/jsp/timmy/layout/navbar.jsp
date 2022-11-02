<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<!-- <title>PET.COM</title> -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.29/dist/sweetalert2.all.min.js"></script>

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="${contextRoot}/getMainPagePosts.controller" style="margin-left:5%" >PEEiT -147.com</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarScroll" aria-controls="navbarScroll"
			aria-expanded="false" aria-label="Toggle navigation" >
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarScroll">
			<ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll"
				style="max-height: 100px; padding-left:5%">
				<li class="nav-item active" style="margin-left:10%">
					<a class="nav-link" href="${contextRoot}/getMainPagePosts.controller">
						<img src="${contextRoot}/img/userimg/home.png" style="width:30px"><span class="sr-only">(current)</span>
					</a>
				</li>
<!-- 				--------------------------------------------- -->
				<c:if test="${empty user }">
					<li class="nav-item" style="margin-left:10%">
						<a class="nav-link loginFirstBtn" role="button">
							<img src="${contextRoot}/img/userimg/user.png" style="width:30px"><span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item" style="margin-left:10%">
						<a class="nav-link loginFirstBtn" role="button">
							<img src="${contextRoot}/img/userimg/heart.png" style="width:30px"> <span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item" style="margin-left:10%">
						<a class="nav-link loginFirstBtn" role="button">
							<img src="${contextRoot}/img/userimg/chat.png" style="width:30px"> <span class="sr-only">(current)</span>
						</a>
					</li>
				</c:if>
<!-- 				--------------------------------------------- -->
				
				<c:if test="${user.category == 1}">
					<li class="nav-item" style="margin-left:10%">
						<a class="nav-link" href="${contextRoot}/timmy/accountsetting.controller">
						<img src="${contextRoot}/img/userimg/user.png" style="width:30px"><span class="sr-only">(current)</span>
						</a>
					</li>
				</c:if>
<!-- 				小郭 -->
				<c:if test="${user.category == 2}">
					<li class="nav-item" style="margin-left:10%"><a class="nav-link"
						href="${contextRoot}/findById2"><img src="${contextRoot}/img/userimg/user.png" style="width:30px"><span class="sr-only">(current)</span>
					</a></li>
				</c:if>
				<!-- 				嘉鴻 -->
				<c:if test="${user.category == 1 || user.category == 2 }" >
					<li class="nav-item" style="margin-left:10%">
						<a class="nav-link" href="${contextRoot}/Alan/foundation">
							<img src="${contextRoot}/img/userimg/heart.png" style="width:30px"> <span class="sr-only">(current)</span>
						</a>
					</li>
				</c:if>
<!-- 				小郭 -->
				<c:if test="${user.category == 1 || user.category == 2 || user.category == 3}">
				<li class="nav-item" style="margin-left:10%"><a class="nav-link"
					href="${contextRoot}/websocket"><img src="${contextRoot}/img/userimg/chat.png" style="width:30px"> <span class="sr-only">(current)</span>
				</a></li>
				</c:if>
<!-- 				亭孝 -->
				<c:if test="${user.category == 3}">
					<li class="nav-item" style="margin-left:10%">
						<a class="nav-link" href="${contextRoot}/memberChart"><img src="${contextRoot}/img/userimg/profile.png" style="width:30px"><span class="sr-only">(current)</span>
				</a></li>
				</c:if>
<!-- 				<li class="nav-item" style="margin-left:10%"><a class="nav-link" -->
<%-- 					href="${contextRoot}/eventPage"><img src="${contextRoot}/img/userimg/party.png" style="width:30px"><span class="sr-only">(current)</span> --%>
<!-- 				</a></li> -->
			</ul>
			<form:form class="d-flex" method="GET" action="${contextRoot}/phoebe/search">
				<input class="form-control mr-2" type="search" placeholder="Search"
					aria-label="Search" name="search" required>
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form:form>

			<c:if test="${empty user}">

				<form:form method="GET" action="${contextRoot}/timmy/">

					<button type="submit" class="btn btn-light">Login</button>
				</form:form>
			</c:if>

			
			<c:if test="${empty user}">
				<form method="GET" action="${contextRoot}/timmy/signUp">
					<button type="submit" class="btn btn-info">Sign Up</button>
				</form>
			</c:if>
			<c:if test="${!empty user}" >
				<c:if test="${user.category == 1}" >
				<div id="navBarName">&emsp;${user.getNickName()}</div>
					<a class="nav-link" href="${contextRoot}/timmy/accountsetting.controller">
						<img id="navUserPhoto" src="${contextRoot}${user.photoPath}" style="max-height:50px; border-radius:50%">
				  	</a>
				 </c:if>
				<c:if test="${user.category == 2}" >
				<div id="navBarName">&emsp;${user.getNickName()}</div>
					<a class="nav-link" href="${contextRoot}/findById2">
						<img id="navUserPhoto" src="${contextRoot}${user.photoPath}" style="max-height:50px; border-radius:50%">
				  	</a>
				 </c:if>
				<c:if test="${user.category == 3}" >
					<a class="nav-link" href="${contextRoot}/memberChart">
						<img id="navUserPhoto" src="${contextRoot}/img/userimg/profile.png" style="width:30px">
				  	</a>
				 </c:if>
			</c:if>
			<c:if test="${!empty user}">
				<form method="GET" action="${contextRoot}/timmy/logout">
					<button type="submit" class="btn btn-outline-danger">Logout</button>
				</form>
			</c:if>
		</div>
	</nav>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script>
		$(document).ready(function() {
			$(".loginFirstBtn").on("click", function(){
				Swal.fire({
						title: '請先登入',
						confirmButtonText: 'Ok!'
				}).then(() => {
					document.location.href= "/demo/timmy/";
			});
			})
		})
	</script>
</body>

</html>