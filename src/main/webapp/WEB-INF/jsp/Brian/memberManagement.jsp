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
<title>會員頁面施工中</title>
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

<%-- <link rel="stylesheet" href="${contextRoot}/css/index.css"> --%>
<%-- <link rel="stylesheet" href="${contextRoot}/css/navs.css"> --%>
<link rel="stylesheet" href="${contextRoot}/css/member_management.css">
<style>
.photoPath { 
 	width: 200px; 
 	height: 150px; 
 	display: block; 
 	margin: 20px auto 20px auto; 
 	border-radius: 40%; 
 	display: block; 
 	display: block; 
} 
#testTable label input{

   width: 55%;
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
<!-- 	<div class="container"> -->
		<!--頁籤 -->
		<span id="tab-1">一般會員</span> 
		<span id="tab-2">基金會會員</span>
		<div id="tab">
			<ul>
				<li><a href="#tab-1">一般會員</a></li>
				<li><a href="#tab-2">基金會會員</a></li>
			</ul>
			<!--一般會員頁籤 -->
			<div class="tab-content-1 tab-content-border">
				<div class="panel-content panel-activity">
					<div id="postManagerDiv" style="display:">
					<table id="testTable" class="table">
						<thead>
							<tr>
								<th scope="col">Email</th>
								<th scope="col">&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="users" items="${userList}" varStatus="vs">
								<c:if test="${users.money==null}">
									<tr>
										<td>${users.email}</td>
										<td><a
											class="rounded-pill btn btn-outline-primary font-weight-bold"
											role="button" data-toggle="modal"
											data-target="#myModal${vs.index}"
											id="viewDetailButton${vs.index}">
											<img src="${contextRoot}/img/userimg/pencil.png" class="udateicon" width="30">
											</a>
											<div class="modal" id="myModal${vs.index}">
												<div class="modal-dialog">
													<div class="modal-content">
														<!-- 彈出標題 -->
														<div class="modal-header">
															<h4 class="modal-title">修改資料</h4>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<!-- 彈出內容 -->
														<div class="modal-body">
															<!-- 修改表單 -->
															<form:form class="form" method="post"
																modelAttribute="formUser"
																action="${contextRoot}/editUser"
																enctype="multipart/form-data">
																<form:input path="userId" type="hidden"
																	value="${users.userId}" />
																<!--頭像上傳-->
																<div class="container">
																	<img class="photoPath"
																		src="${contextRoot}${users.photoPath}"
																		id="preview_progressbarTW_img${vs.index}"> <input
																		type="file" name="testfile" id="testfile${vs.index}"
																		style="display: none;">
																</div>
																<script>
															$(document)
																	.ready(
																			function() {
																				var contextRoot = "/demo";
																				$(
																						"#preview_progressbarTW_img${vs.index}")
																						.click(
																								function() {
																									$(
																											"#testfile${vs.index}")
																											.click();
																								});
																				var file = document
																						.getElementById("testfile${vs.index}");
																				file.onchange = function() {
																					console
																							.log(file.files[0]);
																					readURL(this);
																					console
																							.log(this.files[0].type);

																				};
																				function readURL(
																						input) {
																					if (input.files
																							&& input.files[0]) {
																						var reader = new FileReader();
																						reader.onload = function(
																								e) {
																							document
																									.getElementById(
																											"preview_progressbarTW_img${vs.index}")
																									.setAttribute(
																											"src",
																											e.target.result);
// 																			console.log(e.target.result);
// 																			console.log(typeof e.target.result);
// 																			var datao = {
// 																				"img64": e.target.result,
// 																				"type": file.files[0].type,
// 																				"id": "${users.userId}"
// 																			}
// 																			var datas = JSON.stringify(datao);
// 																			$.ajax({
// 																					url: contextRoot + '/Brian/uploadImgAjax',
// 																					contentType: 'application/json',
// 																					dataType: 'text',
// 																					method: 'post',
// 																					data: datas,
// 																					success: function(result) {
// 																						console.log(result);
// 																					},
// 																					error: function(error) {
// 																						console.log(error);
// 																					}
// 																				});
																						}
																					}
																					reader
																							.readAsDataURL(input.files[0]);
																				}
																			});
														</script>
																<!--email-->
																<div class="form-row" style="text-align: left;">
																	<div class="form-group col-md-6">
																		<label for="group">Email</label>
																		<form:input path="email" type="email"
																			class="form-control" value="${users.email}" />
																	</div>
																	<!--密碼-->
																	<div class="form-group col-md-6"
																		style="text-align: left;">
																		<label for="inputPassword4">Password</label>
																		<form:input path="password" type="text"
																			class="form-control" value="${users.password}" />
																	</div>
																</div>
																<!--暱稱-->
																<div class="form-group" style="text-align: left;">
																	<label for="inputAddress">Nick name</label>
																	<form:input path="nickName" type="text"
																		class="form-control" value="${users.nickName}" />
																</div>
																<!--電話-->
																<div class="form-group" style="text-align: left;">
																	<label for="inputAddress">phone</label>
																	<form:input path="phone" type="text"
																		class="form-control" value="${users.phone}" />
																</div>
																<!--地址-->
																<div class="form-group" style="text-align: left;">
																	<label for="inputAddress">Address</label>
																	<form:input path="address" type="text"
																		class="form-control" value="${users.address}" />
																</div>
																<!--生日-->
																<div class="form-group" style="text-align: left;">
																	<label for="inputAddress">Birthday</label>
																	<form:input id="myDate${vs.index}" path="birthday"
																		type="date" class="form-control" />
																		<script type="text/javascript">
																		var date = new Date();
																		var year = date.getFullYear();
																		var month = ('0'+ (date.getMonth() + 1)).slice(-2);
																		var day = ('0' + date.getDate()).slice(-2);
																		// var day = date.getDay();
																		var time = year +'-'+ month +'-'+ day;
																		console.log(time);
																		document.getElementById("myDate${vs.index}").value = time;
																		//限制不能选择今天之后的日期（加上属性max）
																		document.getElementById("myDate${vs.index}").setAttribute('max', time);
																		</script>
																	<!--取得生日-->
																	<div id="hideDate${vs.index}" hidden="true">
																		<fmt:formatDate pattern='yyyy-MM-dd'
																			value='${users.birthday}' />
																	</div>
																</div>
																<script type="text/javascript">
												$(
														"#myDate${vs.index}")
														.val(
																$(
																		"#hideDate${vs.index}")
																		.html()
																		.trim());
											</script>
																<div class="form-group" style="text-align: left;">
																	<label for="inputAddress">gender</label><br>
																	<!--選項男-->
																	<form:radiobutton id="myRadiobutton1${vs.index}"
																		path="gender" value="1" label="Male" />
																	<!--選項女-->
																	<form:radiobutton id="myRadiobutton0${vs.index}"
																		path="gender" value="0" label="Female" />
																</div>
																<script type="text/javascript">
																if ("${users.gender}" == 1) {
																	$(
																			"#myRadiobutton1${vs.index}")
																			.attr(
																					"checked",
																					true);
																} else if ("${users.gender}" == 0) {
																	$(
																			"#myRadiobutton0${vs.index}")
																			.attr(
																					"checked",
																					true);
																}
															</script>
																<!--權限-->
																<div class="dropdown2" style="text-align: left;">
																	<!--下拉式選單-->
																	<label for="inputAddress">category</label><br>
																	<form:select id="myOption${vs.index}" path="category">
																		<!--選單內容-->
																		<c:if
																			test="${users.category == 0 } disabled=“disabled”">
																			<form:option value="1" label="一般會員" />
																			<form:option value="2" label="基金會" />
																		</c:if>
																		<c:if test="${users.category != 0 }">
																			<form:option value="1" label="一般會員" />
																			<form:option value="2" label="基金會" />
																		</c:if>
																		<c:if
																			test="${users.category != 0 } disabled=“disabled”">
																			<form:option value="0" label="停用中" />
																		</c:if>
																		<c:if test="${users.category == 0 }">
																			<form:option value="0" label="停用中" />
																		</c:if>
																	</form:select>
																</div>
																<script type="text/javascript">
																$(
																		"#myOption${vs.index}")
																		.val(
																				"${users.category}");
															</script>
																<br>
																<!--自介-->
																<div class="form-group" style="text-align: left;">
																	<label for="exampleFormControlTextarea1">selfIntroduction</label>
																	<form:textarea id="myTextarea${vs.index}"
																		path="selfIntroduction" class="form-control aa"
																		rows="3" />
																</div>
																<script type="text/javascript">
																$(
																		"#myTextarea${vs.index}")
																		.val(
																				"${users.selfIntroduction}");
															</script>
																<!-- 按鈕 -->
																<div class="modal-footer">
																	<button type="button"
																		class="rounded-pill btn btn-outline-danger font-weight-bold"
																		data-dismiss="modal">Close</button>
																	<button type="submit"
																		class="rounded-pill btn btn-outline-primary font-weight-bold">Submit</button>
																</div>
															</form:form>
														</div>
													</div>
												</div>
											</div> <!-- 										-------------------- --> <c:if
												test="${users.category != 0 }">
												<a id="aa${vs.index}"
													class="rounded-pill btn btn-outline-danger font-weight-bold"
													role="button">
													<img src="${contextRoot}/img/userimg/delete.png" class="udateicon" width="30">
													</a>
												<script type="text/javascript">
								<!--連接a標籤 要包住整個sweetalert2 -->
								$("#aa${vs.index}").on('click', function (e) {
									e.preventDefault();
									const href = $(this).attr('href')
									<!--sweetalert2控制按鈕顏色 -->
									const swalWithBootstrapButtons = Swal.mixin({
									  customClass: {
									    confirmButton: 'rounded-pill btn btn-outline-danger font-weight-bold',
									    
									    cancelButton: 'rounded-pill btn btn-outline-secondary font-weight-bold'
									  },
									  buttonsStyling: false
									})
									<!--sweetalert2官方提供的彈出視窗 -->
									swalWithBootstrapButtons.fire({
									  title: '確定停用嗎',
									  text:'',
									  icon: 'warning',
									  showCancelButton: true,
									  confirmButtonText: '確定停用',
									  cancelButtonText: '不要停用',
									  reverseButtons: true
									}).then((result) => {
									  if (result.isConfirmed) {
									    swal.fire(
									      '成功停用',
									      '',
									      'success')
									 <!--讓官方按鈕連controller -->
									    .then(function() {
											 window.location = "${contextRoot}/deleteUser?id=${users.userId}"})
									  } 
									  else if (
									    /* Read more about handling dismissals below */
									    result.dismiss === Swal.DismissReason.cancel
									  ) {
									    swal.fire(
									      '不停用',
									      '',
									      'success'
									    )
									  }
									})
								 })
								</script>
											</c:if> <!-- 										-------------------- --> <c:if
												test="${users.category == 0 }">
												<a
													class="rounded-pill btn btn-outline-success font-weight-bold"
													href="${contextRoot}/rebirthUser?id=${users.userId}"
													role="button">
													<img src="${contextRoot}/img/userimg/reply.png" class="udateicon" width="30">
													</a>
											</c:if> <!-- 										-------------------- -->
											 <!--貼文記錄按鈕 -->
										 <a
											class="rounded-pill btn btn-outline-info font-weight-bold"
											role="button" data-toggle="modal"
											data-target="#myRecordModal${vs.index}">
											<img src="${contextRoot}/img/userimg/application.png" class="udateicon" width="30">
											</a>
											<div class="modal" id="myRecordModal${vs.index}">
												<div class="modal-dialog modal-dialog-scrollable">
													<div class="modal-content">
														<!-- 彈出內容 -->
														<div class="modal-body">
															<c:forEach items="${users.posts}" var="p" varStatus="vs">
																<div class="card">
																	<div class="card-body" style="text-align: left;">
																		<a href="#">${p.postUser.getNickName()}</a>
																		
																		<!-- post內文 -->
																		<p>${p.getPostText()}</p>

																		<!-- post圖片 -->
																		<c:forEach items="${p.getPostImg()}" var="pImg"
																			varStatus="loop">
																			<ul class="gallery" style="list-style: none;">
																				<li><img
																					src="${contextRoot}/${pImg.getPostImgPath()}">
																				</li>
																			</ul>
																		</c:forEach>
																	</div>
																	<span> <i class="fa fa-clock">${p.getPostTime()}</i>
																	</span>
																</div>
															</c:forEach>
														</div>
														<div class="modal-footer">
															<button type="button"
																class="rounded-pill btn btn-outline-secondary font-weight-bold btn-lg btn-block"
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<script>
// 			DataTable
			$(function(){
				$("#testTable").DataTable({
					
					paging: false,
				  
				    "dom":"<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
				    "<'row'<'col-sm-12'tr>>" +
				    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>"
					
				});
				
			});
			</script>
			</div>
			</div>

			<!--基金會會員頁籤 -->
			<div class="tab-content-2 tab-content-border">
								<div class="panel-content panel-activity" style="padding-top:20px">
									<div id="postManagerDiv" style="display:">
					<table id="test2Table" class="table">
						<thead>
							<tr>
								<th scope="col">Email</th>
								<th scope="col">Edit</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="users" items="${userList}" varStatus="vs">
								<c:if test="${users.money!=null}">
									<tr>
										<td>${users.email}</td>
										<td><a
											class="rounded-pill btn btn-outline-primary font-weight-bold"
											role="button" data-toggle="modal"
											data-target="#myModal${vs.index}"
											id="viewDetailButton${vs.index}">
											<img src="${contextRoot}/img/userimg/pencil.png" class="udateicon" width="30">
											</a>
											<div class="modal" id="myModal${vs.index}">
												<div class="modal-dialog">
													<div class="modal-content">
														<!-- 彈出標題 -->
														<div class="modal-header">
															<h4 class="modal-title">修改資料</h4>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<!-- 彈出內容 -->
														<div class="modal-body">
															<!-- 修改表單 -->
															<form:form class="form" method="post"
																modelAttribute="formUser"
																action="${contextRoot}/editUser"
																enctype="multipart/form-data">
																<form:input path="userId" type="hidden"
																	value="${users.userId}" />
																<!--頭像上傳-->
																<div class="container">
																	<img class="photoPath"
																		src="${contextRoot}${users.photoPath}"
																		id="preview_progressbarTW_img${vs.index}"> <input
																		type="file" name="testfile" id="testfile${vs.index}"
																		style="display: none;">
																</div>
																<script>
															$(document)
																	.ready(
																			function() {
																				var contextRoot = "/demo";
																				$(
																						"#preview_progressbarTW_img${vs.index}")
																						.click(
																								function() {
																									$(
																											"#testfile${vs.index}")
																											.click();
																								});
																				var file = document
																						.getElementById("testfile${vs.index}");
																				file.onchange = function() {
																					console
																							.log(file.files[0]);
																					readURL(this);
																					console
																							.log(this.files[0].type);

																				};
																				function readURL(
																						input) {
																					if (input.files
																							&& input.files[0]) {
																						var reader = new FileReader();
																						reader.onload = function(
																								e) {
																							document
																									.getElementById(
																											"preview_progressbarTW_img${vs.index}")
																									.setAttribute(
																											"src",
																											e.target.result);
// 																			console.log(e.target.result);
// 																			console.log(typeof e.target.result);
// 																			var datao = {
// 																				"img64": e.target.result,
// 																				"type": file.files[0].type,
// 																				"id": "${users.userId}"
// 																			}
// 																			var datas = JSON.stringify(datao);
// 																			$.ajax({
// 																					url: contextRoot + '/Brian/uploadImgAjax',
// 																					contentType: 'application/json',
// 																					dataType: 'text',
// 																					method: 'post',
// 																					data: datas,
// 																					success: function(result) {
// 																						console.log(result);
// 																					},
// 																					error: function(error) {
// 																						console.log(error);
// 																					}
// 																				});
																						}
																					}
																					reader
																							.readAsDataURL(input.files[0]);
																				}
																			});
														</script>
																<!--email-->
																<div class="form-row" style="text-align: left;">
																	<div class="form-group col-md-6">
																		<label for="group">Email</label>
																		<form:input path="email" type="email"
																			class="form-control" value="${users.email}" />
																	</div>
																	<!--密碼-->
																	<div class="form-group col-md-6"
																		style="text-align: left;">
																		<label for="inputPassword4">Password</label>
																		<form:input path="password" type="text"
																			class="form-control" value="${users.password}" />
																	</div>
																</div>
																<!--暱稱-->
																<div class="form-group" style="text-align: left;">
																	<label for="inputAddress">Nick name</label>
																	<form:input path="nickName" type="text"
																		class="form-control" value="${users.nickName}" />
																</div>
																<!--電話-->
																<div class="form-group" style="text-align: left;">
																	<label for="inputAddress">phone</label>
																	<form:input path="phone" type="text"
																		class="form-control" value="${users.phone}" />
																</div>
																<!--地址-->
																<div class="form-group" style="text-align: left;">
																	<label for="inputAddress">Address</label>
																	<form:input path="address" type="text"
																		class="form-control" value="${users.address}" />
																</div>
																<!--生日-->
																<div class="form-group" style="text-align: left;">
																	<label for="inputAddress">Birthday</label>
																	<form:input id="myDate${vs.index}" path="birthday"
																		type="date" class="form-control" />
																		<script type="text/javascript">
																		var date = new Date();
																		var year = date.getFullYear();
																		var month = ('0'+ (date.getMonth() + 1)).slice(-2);
																		var day = ('0' + date.getDate()).slice(-2);
																		// var day = date.getDay();
																		var time = year +'-'+ month +'-'+ day;
																		console.log(time);
																		document.getElementById("myDate${vs.index}").value = time;
																		//限制不能选择今天之后的日期（加上属性max）
																		document.getElementById("myDate${vs.index}").setAttribute('max', time);
																		</script>
																	<!--取得生日-->
																	<div id="hideDate${vs.index}" hidden="true">
																		<fmt:formatDate pattern='yyyy-MM-dd'
																			value='${users.birthday}' />
																	</div>
																</div>
																<script type="text/javascript">
												$(
														"#myDate${vs.index}")
														.val(
																$(
																		"#hideDate${vs.index}")
																		.html()
																		.trim());
											</script>
																<div class="form-group" style="text-align: left;">
																	<label for="inputAddress">gender</label><br>
																	<!--選項男-->
																	<form:radiobutton id="myRadiobutton1${vs.index}"
																		path="gender" value="1" label="Male" />
																	<!--選項女-->
																	<form:radiobutton id="myRadiobutton0${vs.index}"
																		path="gender" value="0" label="Female" />
																</div>
																<script type="text/javascript">
																if ("${users.gender}" == 1) {
																	$(
																			"#myRadiobutton1${vs.index}")
																			.attr(
																					"checked",
																					true);
																} else if ("${users.gender}" == 0) {
																	$(
																			"#myRadiobutton0${vs.index}")
																			.attr(
																					"checked",
																					true);
																}
															</script>
																<!--權限-->
																<div class="dropdown2" style="text-align: left;">
																	<!--下拉式選單-->
																	<label for="inputAddress">category</label><br>
																	<form:select id="myOption${vs.index}" path="category">
																		<!--選單內容-->
																		<c:if
																			test="${users.category == 0 } disabled=“disabled”">
																			<form:option value="1" label="一般會員" />
																			<form:option value="2" label="基金會" />
																		</c:if>
																		<c:if test="${users.category != 0 }">
																			<form:option value="1" label="一般會員" />
																			<form:option value="2" label="基金會" />
																		</c:if>
																		<c:if
																			test="${users.category != 0 } disabled=“disabled”">
																			<form:option value="0" label="停用中" />
																		</c:if>
																		<c:if test="${users.category == 0 }">
																			<form:option value="0" label="停用中" />
																		</c:if>
																	</form:select>
																</div>
																<script type="text/javascript">
																$(
																		"#myOption${vs.index}")
																		.val(
																				"${users.category}");
															</script>
																<br>
																<!--自介-->
																<div class="form-group" style="text-align: left;">
																	<label for="exampleFormControlTextarea1">selfIntroduction</label>
																	<form:textarea id="myTextarea${vs.index}"
																		path="selfIntroduction" class="form-control aa"
																		rows="3" />
																</div>
																<script type="text/javascript">
																$(
																		"#myTextarea${vs.index}")
																		.val(
																				"${users.selfIntroduction}");
															</script>
																<!-- 按鈕 -->
																<div class="modal-footer">
																	<button type="button"
																		class="rounded-pill btn btn-outline-danger font-weight-bold"
																		data-dismiss="modal">Close</button>
																	<button type="submit"
																		class="rounded-pill btn btn-outline-primary font-weight-bold">Submit</button>
																</div>
															</form:form>
														</div>
													</div>
												</div>
											</div> <!-- 										-------------------- --> <c:if
												test="${users.category != 0 }">
												<a id="aa${vs.index}"
													class="rounded-pill btn btn-outline-danger font-weight-bold"
													role="button">
													<img src="${contextRoot}/img/userimg/delete.png" class="udateicon" width="30">
													</a>
												<script type="text/javascript">
								<!--連接a標籤 要包住整個sweetalert2 -->
								$("#aa${vs.index}").on('click', function (e) {
									e.preventDefault();
									const href = $(this).attr('href')
									<!--sweetalert2控制按鈕顏色 -->
									const swalWithBootstrapButtons = Swal.mixin({
									  customClass: {
									    confirmButton: 'rounded-pill btn btn-outline-danger font-weight-bold',
									    
									    cancelButton: 'rounded-pill btn btn-outline-secondary font-weight-bold'
									  },
									  buttonsStyling: false
									})
									<!--sweetalert2官方提供的彈出視窗 -->
									swalWithBootstrapButtons.fire({
									  title: '確定停用嗎',
									  text:'',
									  icon: 'warning',
									  showCancelButton: true,
									  confirmButtonText: '確定停用',
									  cancelButtonText: '不要停用',
									  reverseButtons: true
									}).then((result) => {
									  if (result.isConfirmed) {
									    swal.fire(
									      '成功停用',
									      '',
									      'success')
									 <!--讓官方按鈕連controller -->
									    .then(function() {
											 window.location = "${contextRoot}/deleteUser?id=${users.userId}"})
									  } 
									  else if (
									    /* Read more about handling dismissals below */
									    result.dismiss === Swal.DismissReason.cancel
									  ) {
									    swal.fire(
									      '不停用',
									      '',
									      'success'
									    )
									  }
									})
								 })
								</script>
											</c:if> <!-- 										-------------------- --> <c:if
												test="${users.category == 0 }">
												<a
													class="rounded-pill btn btn-outline-success font-weight-bold"
													href="${contextRoot}/rebirthUser?id=${users.userId}"
													role="button">
													<img src="${contextRoot}/img/userimg/reply.png" class="udateicon" width="30">
													</a>
											</c:if> <!-- 										-------------------- --> <!--貼文記錄按鈕 --> <a
											class="rounded-pill btn btn-outline-info font-weight-bold"
											role="button" data-toggle="modal"
											data-target="#myRecordModal${vs.index}">
											<img src="${contextRoot}/img/userimg/application.png" class="udateicon" width="30">
											</a>
											<div class="modal" id="myRecordModal${vs.index}">
												<div class="modal-dialog modal-dialog-scrollable">
													<div class="modal-content">
														<!-- 彈出內容 -->
														<div class="modal-body">
															<c:forEach items="${users.posts}" var="p" varStatus="vs">
																<div class="card">
																	<div class="card-body" style="text-align: left;">
																		<a href="#">${p.postUser.getNickName()}</a>

																		<!-- post內文 -->
																		<p>${p.getPostText()}</p>

																		<!-- post圖片 -->
																		<c:forEach items="${p.getPostImg()}" var="pImg"
																			varStatus="loop">
																			<ul class="gallery">
																				<li><img
																					src="${contextRoot}/${pImg.getPostImgPath()}">
																				</li>
																			</ul>
																		</c:forEach>
																	</div>
																	<span> <i class="fa fa-clock">${p.getPostTime()}</i>
																	</span>
																</div>
															</c:forEach>
														</div>
														<div class="modal-footer">
															<button type="button"
																class="rounded-pill btn btn-outline-secondary font-weight-bold btn-lg btn-block"
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div></td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<script>
// 			DataTable
			$(function(){
				$("#test2Table").DataTable({
					paging: false,
				    "dom":"<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6 'f>>" +
				    "<'row'<'col-sm-12'tr>>" +
				    "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>"
			    });
			});
			</script>
			</div>
		</div>
		<script>
		  $(function () {
		    $('#myTab li:last-child button').tab('show')
		  })
		</script>
	</div>
	<c:if test="${!empty searchCategory }">
		here is : ${searchCategory}
		<a href="javascript:window.location.href .tab-content-2">here</a>
	</c:if>
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