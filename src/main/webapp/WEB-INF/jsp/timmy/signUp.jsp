<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="../timmy/layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET.COM / Sign Up</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<section class="vh-100" style="background-color: #eee;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign
										up</p>

									<form:form class="form" method="post" modelAttribute="users"
										action="${contextRoot}/timmy/signUp.controller">

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<input name="nickName" type="text" id="form3Example4c"
													class="form-control NAME" placeholder="Your Name"
													required="required" autocomplete="off"/>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-user fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<form:input path="email" type="email" id="form3Example1c"
													class="form-control EMAIL" placeholder="Email"
													required="required" autocomplete="off"/> <div style="color:red">${error}</div>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												<form:input path="password" type="Password"
													id="form3Example1c" class="form-control PWD"
													placeholder="Password" required="required" autocomplete="off"/>
											</div>
										</div>

										<p>Please select a membership category：</p>
										<div>
											<form:radiobutton path="Category" value="1" onclick="changeToMember()"
												required="required" class="MEMBER" />
											member <br>
											<form:radiobutton path="Category" value="2" onclick="changeToCharity()"/>
											charity
										</div>
										
										<div style="display:none" id="moneydiv">
										</div>
										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="submit" class="btn btn-primary btn-lg">Register</button>
										</div>
										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="button" id="signUpBtnn" class="btn btn-outline-primary btn-lg">快速填入</button>
										</div>
										<script>
											function changeToMember(){
												document.getElementById('moneydiv').innerHTML = '';
											}
											function changeToCharity(){
												document.getElementById('moneydiv').innerHTML = '<form:input path="money" id="money" value="0"></form:input>';
											}
											$(function(){
												$("#signUpBtnn").click(function(){
													$(".NAME").attr("value", "Jack");
													$(".EMAIL").attr("value", "dack00925@gmail.com");
													$(".PWD").attr("value", "12345678");
													$(".MEMBER").attr("checked", "true");
												})
											})
										</script>
									</form:form>

								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://images.unsplash.com/photo-1581888227599-779811939961?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2274&q=80"
										class="img-fluid" alt="Sample image">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>