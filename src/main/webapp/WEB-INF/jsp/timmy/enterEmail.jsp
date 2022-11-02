<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="${contextRoot}/timmy/buildEmailCertification.controller" method="get">
		Your email:<input name="email" required>${error}
		<button>submit</button>
	</form>
	<button>back</button>
</body>
</html>