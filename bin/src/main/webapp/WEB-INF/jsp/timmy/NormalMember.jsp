<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<<<<<<< HEAD
<script src="${contextRoot}/js/timmy_js/uploadimg.js"></script>
=======
>>>>>>> Joey
</head>
<body>
	<img src="${contextRoot}/${user.photoPath}" width="200"
		id="preview_progressbarTW_img">
<<<<<<< HEAD
	<input type="file" name="testfile" id="testfile" style="display: none;">
=======
	<input type="file" name="testfile" id="testfile" style="display:none;">
	
>>>>>>> Joey
	<h1>hello! ${user.nickName}</h1>
	<table>
		<tr>
			<td>follow</td>
			<td>fans</td>
<<<<<<< HEAD
			<td>posts</td>
		</tr>
		<tr>
			<td><a
				href="/user/followersManager.controller?id=${user.userId}">${fn:length(user.follows)}</a>
			</td>
			<td><a href="/user/fansManager.controller?id=${user.userId}">${fn:length(user.fans)}</a></td>
			<td>${fn:length(user.posts)}</td>
		</tr>
	</table>
<%-- 	<c:forEach var="one" items="${user.posts}"> --%>
<%-- 		<div>${one.text}</div> --%>
<%-- 	</c:forEach> --%>
	<ul>
		<li><a href="${contextRoot}/user/postManager.controller"
			class="a_post">貼文管理</a></li>
		<li><a href="${contextRoot}/user/memberDetail.controller"
			class="a_post">個人資料</a></li>
		<li><a href="${contextRoot}/user/petManager.controller"
			class="a_post">寵物管理</a></li>
	</ul>
</body>
<script>
	
</script>
=======
		</tr>
		<tr>
			<td>${fn:length(user.follows)}</td>
			<td>${fn:length(user.fans)}</td>
		</tr>
	</table>
	<ul>
		<li><a href="petmanager.controller">寵物管理</a></li>
		<li><a href="postmanager.controller"></a></li>
		<li><a href=""></a></li>
		<li><a href=""></a></li>
	</ul>
	<script>
	$(document).ready(function () {
		$('#preview_progressbarTW_img').click(function(){
			$('#testfile').click();
		});
		var file = document.getElementById("testfile");
		file.onchange = function() {
			console.log(file.files[0]);
			readURL(this);
			console.log(this.files[0].type);
		};
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById("preview_progressbarTW_img")
							.setAttribute("src", e.target.result);
					console.log(typeof e.target.result);
					var datao = {
						"img64": e.target.result,
						"type": file.files[0].type
					}	
					var datas = JSON.stringify(datao);
					$.ajax({
						url: "<c:url value='/uploadImgAjax' />?id=${user.userId}",
						contentType: 'application/json',
						dataType: 'text',
						method: 'post',
						data: datas,
						success: function (result){
							console.log(result);
						},
						error: function (error){
							console.log(error);
						}	
					});
				}
			}
			reader.readAsDataURL(input.files[0]);
		}
	});
	</script>
</body>
>>>>>>> Joey

</html>