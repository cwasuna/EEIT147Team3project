<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PET.COM / Login</title>
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
									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Login</p>
<!-- 									form -->
									<form class="mx-1 mx-md-4"
										action="${contextRoot}/timmy/checkLogin.controller" method="post">
										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												${errors.email }
												<input name="email" type="email" id="form3Example3c"
													class="form-control" placeholder="Email"
													required="required" />
											</div>
										</div>
										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="form-outline flex-fill mb-0">
												${errors.pwd }
												<input name="password" type="password" id="form3Example4c"
													class="form-control" placeholder="Password"
													required="required" />
											</div>
										</div>
										<div><span>Remember Me </span><input type="checkbox" name="rememberMe" value="on" style="display:inline"><span style="color:red">&emsp;${errors.failed }</span></div>
										<div>&emsp;&emsp;</div>
										<div class="d-flex justify-content-center mx-6 mb-3 mb-lg-4">
											<button type="submit" class="btn btn-primary btn-lg">Login</button>&emsp;&emsp;
											<button type="button" class="btn btn-outline-success btn-lg" id="forgetPwdBtn">Forgot password</button>
										</div>
									</form>
										<button id="buildNewPwdBtn" style="display:none">buildNewPwdBtn</button>
										<script>
											$(function(){
												$("#buildNewPwdBtn").click(function(){
													var contextRoot = "/demo";
													Swal.fire({
													  title: 'New Password',
													  html:
														    'New Pwd  :<input id="swal-input1" type="password" class="swal2-input">' +
														    'Check Pwd:<input id="swal-input2" type="password" class="swal2-input">',
													  showCancelButton: true,
													  confirmButtonText: 'Submit',
													  showLoaderOnConfirm: true,
													  backdrop: true,
													  preConfirm: () => {
													         let newPwd = document.getElementById('swal-input1').value;
													    	 let checkPwd = document.getElementById('swal-input2').value;
													    	 if (newPwd != checkPwd){
													    		 Swal.showValidationMessage("Please enter the correct password!");
													    	 } else {
													    		 let datas = {
													    				 "postId":verifyingEmail,
													    				 "commentText":checkPwd
													    		 };
													    		 console.log( "postId: " + verifyingEmail)
													    		 let datao = JSON.stringify(datas);
													    		 $.ajax({
													    			 url: contextRoot + "/timmy/updateForgottenPwdAjax",
													    			 method: 'post',
													    			 contentType: "application/json",
																	 dataType: 'text',
																	 data: datao,
																	 success: function(result){
																		 console.log("ajax: " + result);
																	 },
																	 error: function(error){
																		 console.log(result);
																	 }
													    		 })
													    	 }
													  },
													  allowOutsideClick: () => !Swal.isLoading()
													}).then((result) => {
													  if (result.isConfirmed) {
													    Swal.fire({
													      title: 'Updated Success!',
													    })
													  }
													})
												});
// 												$("#buildNewPwdBtn").click();
												
											});
										</script>
									<script type="text/javascript">
										$(document).ready(function() {
											var contextRoot = "/demo";
											const acco = $('input[name="email"]');
											acco[0].setAttribute("value", "${cookie.userCookie.value}");
											if (acco[0].value != "") {
												$('input[name="rememberMe"]')[0].setAttribute("checked", "")
											}
											$("#forgetPwdBtn").click(function(){
												Swal.fire({
													  title: 'Enter your email',
													  text: 'We will send you an email to verify your account',
													  input: 'text',
													  inputAttributes: {
													    autocapitalize: 'off'
													  },
													  showCancelButton: true,
													  confirmButtonText: 'Submit',
													  showLoaderOnConfirm: true,
													  backdrop: true,
													  preConfirm: (login) => {
													    return $.ajax({
													    	url: contextRoot + "/timmy/checkEmailAjax?email=" + login,
													    	success: function(result){
													    		if (result == 'emailNotFound'){
													    			Swal.showValidationMessage("Email was not found!");
													    		}
													    		console.log("ajax success:" + result);
													    		verifyingEmail = login;
													    	}
													    })
													  },
													  allowOutsideClick: () => !Swal.isLoading()
													}).then((result) => {
													  if (result.isConfirmed) {
// 													    Swal.fire({
// 													      title: 'Check your email to verify your account',
// 													    })
														console.log(result.value);
                                                        Swal.fire({
                                                            title: 'Please enter the number which sent to your email',
                                                              html: '<input id="swal-input3" class="swal2-input">',
                                                              focusConfirm: false,
                                                              preConfirm: () => {
                                                               let verifyNumber = document.getElementById('swal-input3').value;
                                                               console.log(verifyNumber);
                                                               if (verifyNumber == result.value){
                                                                   console.log("success");
                                                                   $("#buildNewPwdBtn").click();
                                                                   
                                                               } else {
                                                                   Swal.showValidationMessage("error");
                                                               }
                                                              }
                                                        })
													  }
													})
												
											});
										});
									</script>
								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://images.unsplash.com/photo-1450778869180-41d0601e046e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2896&q=80"
										class="img-fluid" alt="Sample image">

								</div>
								
							</div>
							<button class="btn btn-outline-info" id="newm1" style="margin-right: 5px">New Account</button>
							<button class="btn btn-outline-info" id="nm1" style="margin-right: 5px">Mary</button>
							<button class="btn btn-outline-info" id="nm2" style="margin-right: 5px">Sam</button>
							<button class="btn btn-outline-info" id="fm" style="margin-right: 5px">流浪動物之家</button>
							<button class="btn btn-outline-info" id="mm" style="margin-right: 5px">管理員</button>
							<script>
								$(function(){
									$("#newm1").on("click", function(){
										$("#form3Example3c").attr("value", "dack00925@gmail.com")
										$("#form3Example4c").attr("value", "12345678")
									});
									$("#nm1").on("click", function(){
										$("#form3Example3c").attr("value", "mary@gmail.com")
										$("#form3Example4c").attr("value", "12345678")
									});
									$("#nm2").on("click", function(){
										$("#form3Example3c").attr("value", "sam@gmail.com")
										$("#form3Example4c").attr("value", "12345678")
									});
									$("#fm").on("click", function(){
										$("#form3Example3c").attr("value", "mainfoundation@gmail.com")
										$("#form3Example4c").attr("value", "12345678")
									});
									$("#mm").on("click", function(){
										$("#form3Example3c").attr("value", "manager@gmail.com")
										$("#form3Example4c").attr("value", "12345678")
									});
									console.log("${newAccountToBuild}")
									if ("${newAccountToBuild}".length > 0){
										
										Swal.fire({
											icon: 'success',
											title: "Success! Welcome~"
										})
										
									}
								})
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.29/dist/sweetalert2.all.min.js"></script>
	
</body>
</html>