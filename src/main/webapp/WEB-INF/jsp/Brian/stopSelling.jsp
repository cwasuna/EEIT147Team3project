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
<title>商品頁面</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
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
	<span id="tab-1">主頁</span>
	<span id="tab-2">頁面1</span>
	<!--分頁 -->
	<div id="tab">
		<ul>
			<li><a href="#tab-1">商品</a></li>
			<li><a href="#tab-2">商品移除</a></li>
		</ul>
		<!-- 		被檢舉文章 -->
		<div class="tab-content-1 tab-content-border">
				<div class="panel-content panel-activity">
					<div id="postManagerDiv" style="display:">
				<table id="testTable" class="table">
					<thead>
						<tr>
							<th>基金會</th>
							<th>Products</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="Users" items="${Products}" varStatus="vs">
							<c:if test="${Users.category == 2 }">
								<tr><td>${Users.nickName}</td>
									<td class="">
									<table class="table table-borderless">
										<c:forEach items="${Users.foundation.products}" var="Usersp" varStatus="vs">
											<c:if test="${Usersp.productStatus == 1 }">
												<tr>
													<td class="">
														<h4>${Usersp.productName}</h4>
														<span><i class="fa fa-clock">${Usersp.productDate}</i> </span>
														<div id="box">${Usersp.productContext}</div>
														<ul  style="list-style: none;">
															<li><img class="photoPath" src="${contextRoot}${Usersp.productImg}"></li>
														</ul>
													</td>
													<td class=""><a
														class="rounded-pill btn btn-outline-danger font-weight-bold"
														href="${contextRoot}/stopProducts?id=${Usersp.productId}"
														role="button">
														<img src="${contextRoot}/img/userimg/delete.png" class="udateicon" width="30">
														</a>
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
								
												
											</td>
 									<!--移除 -->
									
									
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
<!-- 		<!-- 		移除文章 --> 
		<div class="tab-content-2 tab-content-border">
				<div class="panel-content panel-activity">
					<div id="postManagerDiv" style="display:">
				<table id="test2Table" class="table">
					<thead>
						<tr>
							<th class="col-md-3" style="font-weight: bold;">基金會</th>
							<th class="col-md-6">Products</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="Users" items="${Products}" varStatus="vs">
							<c:if test="${Users.category == 2 }">
								<tr><td>${Users.nickName}</td>
									<td class="col-md-6">
									<table class="table table-borderless">
										<c:forEach items="${Users.foundation.products}" var="Usersp" varStatus="vs">
											<c:if test="${Usersp.productStatus == 0}">
												<tr>
													<td class="col-md-3">
														<a href="#">${Usersp.productName}</a>
														<span><i class="fa fa-clock">${Usersp.productDate}</i> </span>
														<div id="box">${Usersp.productContext}</div>
														<ul  style="list-style: none;">
															<li><img class="photoPath" src="${contextRoot}${Usersp.productImg}"></li>
														</ul>
													</td>
													<td class="col-md-3"><a
														class="rounded-pill btn btn-outline-success font-weight-bold"
														href="${contextRoot}/stopProductsRestoration?id=${Usersp.productId}"
														role="button">
														<img src="${contextRoot}/img/userimg/reply.png" class="udateicon" width="30">
														</a>
													</td>
												</tr>
											</c:if>
										</c:forEach>
									</table>
								
												
											</td>
 									<!--移除 -->
									
									
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
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