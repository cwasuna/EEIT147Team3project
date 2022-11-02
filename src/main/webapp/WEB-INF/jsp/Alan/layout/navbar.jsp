<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
</head>

<div>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	 	
				
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
							href="${contextRoot}/Alan/foundation">基金會<span class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${contextRoot}/Alan/checkOrder">歷史訂單<span class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link"
							href="${contextRoot}/Alan/shoppingCar">購物車<span class="sr-only">(current)</span></a></li>
					</ul>
			</div>
	</nav>
	</div>
				






</body>
</html>