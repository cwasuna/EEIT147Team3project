<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" 
xmlns:svg="http://www.w3.org/2000/svg">

<head>
<meta charset="UTF-8">
<title></title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/timmy_js/uploadimg.js"></script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${contextRoot}/css/user_setting.css">
</head>
<style>
/* #preview_progressbarTW_img { */
/* 	width: 200px; */
/* 	height: 150px; */
/* 	display: block; */
/* 	margin: 20px auto 20px auto; */
/* 	border-radius: 40%; */
/* } */

table {
	text-align: center;
	font-size: 200%;
}
td {
	width: 50%;
}
#ulnav {
	padding: 0;
	list-style: none;
	margin-bottom:50px;
	display: flex;
	justify-content: center;
}

#ulnav li {
	margin: auto;
}

#navSetting {
	margin: auto 20%;
}
.iconImg{
	width:15%;
}
ul li button{
	border:0;
}
.container{
	margin-bottom: 5%;
}
</style>

<body>
<%-- 	<jsp:include page="layout/navbar.jsp" /> --%>
<!-- 	-------------------------------------------- -->

<!-- 	-------------------------------------------- -->
	<div class="container">
<%-- 		<img src="${contextRoot}/${user.photoPath}" --%>
<!-- 			id="preview_progressbarTW_img"> <input type="file" -->
<!-- 			name="testfile" id="testfile" style="display: none;"> -->
		<table class="table table-borderless">
			<thead>
				<tr>
					<td id="hello" colspan="2">Hello! ${user.nickName}</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Follow</td>
					<td>Fans</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td><a
						href="/timmy/followersManager.controller?id=${user.userId}">${fn:length(user.follows)}</a>
					</td>
					<td><a href="/timmy/fansManager.controller?id=${user.userId}">${fn:length(user.fans)}</a>
					</td>
				</tr>
			</tfoot>
		</table>
<%-- 		<span id="id" style="display: none;">${user.userId}</span> --%>

<!-- 		<ul id="ulnav"> -->
<%-- 			<li><button id="postManager"><img src="${contextRoot}/img/userimg/social-media.png" class="iconImg"></button></li> --%>
<%-- 			<li><button id="settingManager"><img src="${contextRoot}/img/userimg/user.png" class="iconImg"></button></li> --%>
<%-- 			<li><button id="petManager"><img src="${contextRoot}/img/userimg/pet.png" class="iconImg"></button></li> --%>
<!-- 		</ul> -->
<!-- 		<div id="navSetting"> -->
<!-- 			<div id="postManagerDiv" style=""> -->
<%-- 				<jsp:include page="PostSetting.jsp" /> --%>
<!-- 			</div> -->
<!-- 			<div id="settingManagerDiv" style="display: none"> -->
<%-- 				<jsp:include page="UserSetting.jsp" /> --%>
<!-- 			</div> -->
<!-- 			<div id="petManagerDiv" style="display: none"> -->
<%-- 				<jsp:include page="PetSetting.jsp" /> --%>
<!-- 			</div> -->
		</div>
</body>




<script>
	$(document).ready(function() {
		var contextRoot = "/demo";
		var pmd = $("#postManagerDiv")[0];
		var smd = $("#settingManagerDiv")[0];
		var emd = $("#petManagerDiv")[0];
		$("#postManager").click(function() {
			if (pmd.getAttribute("style") == "display: none") {
				pmd.setAttribute("style", "");
				smd.setAttribute("style", "display: none");
				emd.setAttribute("style", "display: none");
			}
		});
		$("#settingManager").click(function() {
			if (smd.getAttribute("style") == "display: none") {
				smd.setAttribute("style", "");
				pmd.setAttribute("style", "display: none");
				emd.setAttribute("style", "display: none");
			}
		});
		$("#petManager").click(function() {
			if (emd.getAttribute("style") == "display: none") {
				emd.setAttribute("style", "");
				smd.setAttribute("style", "display: none");
				pmd.setAttribute("style", "display: none");
			}
		});

	})
</script>

</html>