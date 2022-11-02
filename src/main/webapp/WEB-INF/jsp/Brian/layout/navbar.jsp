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
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<ul class="navbar-nav mr-auto my-2 my-lg-0 navbar-nav-scroll"
				style="max-height: 100px; padding-left: 5%">
				<li class="nav-item active" style="margin-left: 10%"><a
					class="nav-link" href="${contextRoot}/getMainPagePosts.controller">
						<img src="${contextRoot}/img/userimg/home.png" style="width: 30px"><span
						class="sr-only">(current)</span>
				</a><br></li>
				<li class="nav-item" style="margin-left: 10%"><a
					class="nav-link"
					href="${contextRoot}/timmy/accountsetting.controller"> <img
						src="${contextRoot}/img/userimg/user.png" style="width: 30px"><span
						class="sr-only">(current)</span>
				</a><br></li>
				<!-- 				小郭 -->
				<li class="nav-item" style="margin-left: 20%"><a
					class="nav-link" href="${contextRoot}/findById2"><img
						src="${contextRoot}/img/userimg/user.png" style="width: 30px"><span
						class="sr-only">(current)</span> </a></li>
			</ul>
	</nav>
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

</body>
</html>