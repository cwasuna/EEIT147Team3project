<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>

	<nav class="navbar navbar-light">
		<a class="navbar-brand" href="${contextRoot}/memberChart">數據統計</a>
	</nav>
	<nav class="navbar navbar-light ">
		<a class="navbar-brand" href="${contextRoot}/memberManagement">會員管理</a>
	</nav>
	<nav class="navbar navbar-light ">
		<a class="navbar-brand" href="${contextRoot}/memberReport">檢舉文章</a>
	</nav>
	<nav class="navbar navbar-light ">
		<a class="navbar-brand" href="${contextRoot}/memberProducts">商品管理</a>
	</nav>

	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>

</body>
</html>