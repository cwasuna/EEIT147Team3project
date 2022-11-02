<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../timmy/layout/navbar.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>檢舉頁面</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">

<link rel="stylesheet" href="${contextRoot}/css/report_index.css">

<style type="text/css">
.photoPath { 
 	width: 150px; 
 	
 	
 	 	
} 
</style>
</head>
<body>
	<div class="wrap">
		<div class="left">
			<div class="container">
				<div class="row justify-content-left">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="col-lg-12">
				<div class="panel">
					<div class="panel-heading">
						<!-- 頁簽開始 -->
						<span id="tab-1">被檢舉文章</span> <span id="tab-2">移除文章</span>
						<!--分頁 -->
						<div id="tab">
							<ul>
								<li><a href="#tab-1">被檢舉文章</a></li>
								<li><a href="#tab-2">移除文章</a></li>
							</ul>
							<!-- 		被檢舉文章 -->
							<div class="tab-content-1 tab-content-border">
								<div class="panel-content panel-activity">
									<div id="postManagerDiv">
										<table id="testTable" class="table">
											<thead>
												<tr>
													<th class="col-md-6">貼文</th>
													<th class="col-md-3">移除 / 取消</th>
													<th class="col-md-3">帳號</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="p" items="${posts}" varStatus="vs">
													<c:if test="${p.isReport==1}">
														<tr>
															<%-- 									<td class="col-md-3">${users.email}</td> --%>
															<td class="col-md-6">
																<%-- 												<a href="#">${users.getNickName()}</a> --%>

																<!-- post內文 -->
																<div id="box">
																	${p.getPostText()}
																	<!-- post圖片 -->
																	<c:forEach items="${p.getPostImg()}" var="pImg"
																		varStatus="loop">
																		<ul class="gallery" style="list-style: none;">
																			<li><img class="photoPath" 
																				src="${contextRoot}/${pImg.getPostImgPath()}"></li>
																		</ul>
																	</c:forEach>
																</div> <script type="text/javascript">
																	// 													function show() {
																	// 														var box = document
																	// 																.getElementById("box");
																	// 														var text = box.innerHTML; //text是所有的文本
																	// 														var newBox = document
																	// 																.createElement("div"); //截取要一开始先显示的一部分放入newBox里面
																	// 														var btn = document
																	// 																.createElement("a");
																	// 														newBox.innerHTML = text
																	// 																.substring(0,
																	// 																		50);
																	// 														btn.innerHTML = text.length > 51 ? "...顯示全部"
																	// 																: "";
																	// 														btn.href = "###";
																	// 														btn.onclick = function() {
																	// 															if (btn.innerHTML == "...顯示全部") {
																	// 																btn.innerHTML = "隱藏部份";
																	// 																newBox.innerHTML = text;
																	// 															} else {
																	// 																btn.innerHTML = "...顯示全部";
																	// 																newBox.innerHTML = text
																	// 																		.substring(
																	// 																				0,
																	// 																				50);
																	// 															}
																	// 														}
																	// 														box.innerHTML = "";
																	// 														box.appendChild(newBox);
																	// 														box.appendChild(btn);
																	// 													}
																	// 													show();
																</script>
															</td>
															<!--移除 -->
															<td class="col-md-3"><a
																class="rounded-pill btn btn-outline-danger font-weight-bold"
																href="${contextRoot}/removePosts?id=${p.postId}"
																role="button">
																<img src="${contextRoot}/img/userimg/delete.png" class="udateicon" width="30">
																</a> 
															<!--取消移除 -->
															 <a
																class="rounded-pill btn btn-outline-success font-weight-bold"
																href="${contextRoot}/cancelRemovePosts?id=${p.postId}"
																role="button">
																<img src="${contextRoot}/img/userimg/reply.png" class="udateicon" width="30">
																</a></td>
															<td class="col-md-3">${p.postUser.email}</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<script>
									$(document)
											.ready(
													function() {
														$('#testTable')
																.DataTable(
																		{
																			paging : false,

																			"dom" : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6 'f>>"
																					+ "<'row'<'col-sm-12'tr>>"
																					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>"
																		});
													});
								</script>
							</div>

							<!------------------------------------------------------------------------------------------------------------------------------->
							<!-- 		移除文章 -->
							<div class="tab-content-2 tab-content-border">
								<div class="panel-content panel-activity">
									<div id="postManagerDiv">
										<table id="test2Table" class="table">
											<thead>
												<tr>
													<th class="col-md-6">Posts</th>
													<th class="col-md-3">&nbsp;</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="p" items="${posts}" varStatus="vs">
													<c:if test="${p.isBanned==1}">
														<tr>
															<td class="col-md-6">
																<!-- post內文 -->
																<div id="box2">
																	${p.getPostText()}
																	<!-- post圖片 -->
																	<c:forEach items="${p.getPostImg()}" var="pImg"
																		varStatus="loop">
																		<ul class="gallery" style="list-style: none;">
																			<li><img
																				src="${contextRoot}/${pImg.getPostImgPath()}"></li>
																		</ul>
																	</c:forEach>
																</div> <script type="text/javascript">
																	// 													function show() {
																	// 														var box = document
																	// 																.getElementById("box2");
																	// 														var text = box.innerHTML; //text是所有的文本
																	// 														var newBox = document
																	// 																.createElement("div"); //截取要一开始先显示的一部分放入newBox里面
																	// 														var btn = document
																	// 																.createElement("a");
																	// 														newBox.innerHTML = text
																	// 																.substring(0,
																	// 																		20);
																	// 														btn.innerHTML = text.length > 21 ? "...顯示全部"
																	// 																: "";
																	// 														btn.href = "###";
																	// 														btn.onclick = function() {
																	// 															if (btn.innerHTML == "...顯示全部") {
																	// 																btn.innerHTML = "隱藏部份";
																	// 																newBox.innerHTML = text;
																	// 															} else {
																	// 																btn.innerHTML = "...顯示全部";
																	// 																newBox.innerHTML = text
																	// 																		.substring(
																	// 																				0,
																	// 																				20);
																	// 															}
																	// 														}
																	// 														box.innerHTML = "";
																	// 														box.appendChild(newBox);
																	// 														box.appendChild(btn);
																	// 													}
																	// 													show();
																</script>
															</td>
															<td class="col-md-3"><a
																class="rounded-pill btn btn-outline-success font-weight-bold"
																href="${contextRoot}/removePostsRestoration?id=${p.postId}"
																role="button">
																<img src="${contextRoot}/img/userimg/reply.png" class="udateicon" width="30">
																</a></td>
															<td class="col-md-3">${p.postUser.email}</td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<script>
										//DataTable
										$(function() {
											$("#test2Table")
													.DataTable(
															{
																paging : false,

																"dom" : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6 'f>>"
																		+ "<'row'<'col-sm-12'tr>>"
																		+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>"
															});
										});
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"></script>
<script
	src="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap4.min.css"></script>
</html>