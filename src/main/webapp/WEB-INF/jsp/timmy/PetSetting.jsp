<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
</head>
<style>
.petModal {
/* 	left: 400px; */
}

#defaultPetImg {
	width: 200px;
	display: block;
	margin: 10px auto 10px auto;
}

.petPhotoImg {
	width: 200px;
	max-height: 160px;
	border:1px solid #dee2e6;
	border-radius: 30%;
}

#viewDetailButtonAdd{
	border:0px solid white;
	display:block; 
	margin:auto;
	
}
#viewDetailButtonAdd:hover{
	background-color: #F0F0F0;
}
.smallIcon:hover{
	background-color: #F0F0F0;
}
.editPetPhoto{
	width: 300px;
}

.tableHead{
	width: 100%;
	margin:2% 0 1% 0;
}

</style>

<body>
	<c:if test="${!empty guest}">
		<c:set var="userOrigin" value="${user}" />
		<c:set var="user" value="${guest}" />
	</c:if>
				<table class="tableHead" >
					
						<c:if test="${empty guest || guest == userOrigin}">
							<tr>
								<td class="col-md-4"><h5>Photo</h5></td>
								<td class="col-md-2"><h5>Name</h5></td>
								<td class="col-md-4"><h5>About</h5></td>
								<td class="col-md-1"><h5>Edit</h5></td>
								<td class="col-md-1"><h5>Delete</h5></td>
							</tr>
						</c:if>
						<c:if test="${!(empty guest || guest == userOrigin)}">
							<tbody >
								<tr>
									<td class="col-md-4"><h5>Photo</h5></td>
									<td class="col-md-2"><h5>Name</h5></td>
									<td class="col-md-4"><h5>About</h5></td>
								</tr>
							</tbody>
						</c:if>
					
				</table>
				<c:forEach items="${user.pets }" var="p" varStatus="vs">
					<!-- 					<div class="col"> -->
					<!-- 						<div class="card"> -->
                                <table class="table" id="allDisplay${vs.index}">
	                                <tbody>
	                                	<tr>
	                                		<td class="col-md-4">
												<c:if test='${fn:contains(p.petPhotoPath, ".")}'>
													<img src="${contextRoot}${p.petPhotoPath}" class="petPhotoImg " id="petImgPreview{vs.index}">
												</c:if>
												<c:if test='${!fn:contains(p.petPhotoPath, ".")}'>
													<img src="${contextRoot}/img/petimg/pawprint.png" class="petPhotoImg" id="petImgPreview{vs.index}">
												</c:if>
											</td >
											<td class="col-md-2">
												<h6>${p.petName}</h6>
											</td>
											<td class="col-md-4">
												<p>${p.petDescription}</p>
											</td>
											<c:if test="${empty guest || guest == userOrigin}">
												<td class="col-md-1">
													<a class="rounded-pill" role="button" data-toggle="modal" data-target="#myModal${vs.index}pet" id="viewDetailButton${vs.index}">
														<img src="${contextRoot}/img/userimg/pencil.png" width="30" class="smallIcon">
													</a>
												</td>
												<td class="col-md-1">
													<a class="rounded-pill" role="button" id="deleteButton${vs.index}" >
														<img src="${contextRoot}/img/userimg/delete.png" width="30" class="smallIcon">
													</a>
													<script>
													
													$(document).ready(function() {
														var contextRoot = "/demo";
														$("#deleteButton${vs.index}").click(function(){
															Swal.fire({
																  title: 'Are you sure?',
																  icon: 'warning',
																  showCancelButton: true,
																  confirmButtonColor: '#3085d6',
																  cancelButtonColor: '#d33',
																  confirmButtonText: 'Remove'
																}).then((result) => {
																  if (result.isConfirmed) {
																    Swal.fire(
																      'Success!',
																      'Your Pet has been removed.',
																      'success'
																    ).then((result) => {
																		  if (result.isConfirmed) {
																			  $.ajax({
																			    	url: contextRoot + "/timmy/deletePetById/${p.petId}",
																			    	method: "get",
																			    	success: function(result){
																			    		console.log(result);
																			    		$("#allDisplay${vs.index}")[0].style = "display:none";
																			    	},
																			    	error: function(result){
																			    		console.log(result);
																			    	},
																			    })
																			  }
																			})
																  }
																})
														});
													})
													</script>
												</td>
											</c:if>
	                                	</tr>
                                	</tbody>
                                </table>
								
					<div class="modal fade petModal" id="myModal${vs.index}pet">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- 彈出標題 -->
								<div class="modal-header">
									<h4 class="modal-title">Edit:</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<!-- 彈出內容 -->
								<div class="modal-body">
									<!-- 修改表單 -->
									<form:form id="form${vs.index}" class="form" method="post"
										modelAttribute="newPet" action="${contextRoot}/timmy/editPet"
										enctype="multipart/form-data">
										<form:input path="petId" type="hidden" value="${p.petId}"
											id="petId${vs.index}" />
										<!--頭像上傳-->
										<div class="container">
											<c:if test='${fn:contains(p.petPhotoPath, ".")}'>
												<img src="${contextRoot}${p.petPhotoPath}" id="preview_progressbarTW_img${vs.index}" class="editPetPhoto"> 
											</c:if>
											<c:if test='${!fn:contains(p.petPhotoPath, ".")}'>
												<img src="${contextRoot}/img/petimg/pawprint.png" id="preview_progressbarTW_img${vs.index}" class="editPetPhoto">
											</c:if>
											<input type="file" name="testfile" id="testfile${vs.index}" style="display: none;">
										</div>
										<script>
											$(document).ready(function() {
												var contextRoot = "/demo";
												$("#preview_progressbarTW_img${vs.index}").click(function() {
														$("#testfile${vs.index}").click();
												});
												var file = document.getElementById("testfile${vs.index}");
												file.onchange = function() {
													console.log(file.files[0]);
													readURL(this);
													console.log(this.files[0].type);
												};
												function readURL(input) {
													if (input.files&& input.files[0]) {
														var reader = new FileReader();
														reader.onload = function(e) {
															document.getElementById("preview_progressbarTW_img${vs.index}").setAttribute("src", e.target.result);
														}
													}
													reader.readAsDataURL(input.files[0]);
												}
											});
										</script>
										<!--暱稱-->
										<div class="form-group" style="text-align: left;">
											<label>Name:</label>
											<form:input path="petName" type="text" class="form-control"
												value="${p.petName}" id="petName${vs.index}" />
										</div>
										<!--生日-->
										<div class="form-group" style="text-align: left;">
											<label>Birthday:</label>
											<form:input id="myDate${vs.index}" path="petBirthday"
												type="date" class="form-control" />
											<!--取得生日-->
											<div id="hideDate${vs.index}" hidden="true">
												<fmt:formatDate pattern='yyyy-MM-dd'
													value='${p.petBirthday}' />
											</div>
										</div>
										<script type="text/javascript">
											$("#myDate${vs.index}").val(
													$("#hideDate${vs.index}")
															.html().trim());
										</script>
										<div class="form-group" style="text-align: left;">
											<label>Gender:</label><br>
											<!--選項男-->
											<form:radiobutton id="myRadiobutton1${vs.index}"
												path="petGender" value="1" label="Male" />
											<!--選項女-->
											<form:radiobutton id="myRadiobutton0${vs.index}"
												path="petGender" value="0" label="Female" />
										</div>
										<script type="text/javascript">
											if ("${p.petGender}" == 1) {
												$("#myRadiobutton1${vs.index}")
														.attr("checked", "true");

											} else if ("${p.petGender}" == 0) {
												$("#myRadiobutton0${vs.index}")
														.attr("checked", "true");
											}
										</script>
										<!--自介-->
										<div class="form-group" style="text-align: left;">
											<label for="exampleFormControlTextarea1">About:</label>
											<form:textarea id="myTextarea${vs.index}"
												path="petDescription" class="form-control aa" rows="3" />
										</div>
										<script type="text/javascript">
											$("#myTextarea${vs.index}").val(
													"${p.petDescription}");
										</script>
										<!-- 按鈕 -->
										<div class="modal-footer">
											<button type="button" class="btn btn-primary"
												data-dismiss="modal" id="sub${vs.index}">Submit</button>
											<button type="button" class="btn btn-danger"
												data-dismiss="modal" id="closeplz${vs.index}">Close</button>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>
					<script>
						$(document).ready(function() {
							var contextRoot = "/demo";
							var checkGender = "${p.petGender}";
							$("#myRadiobutton1${vs.index}").click(function() {
								checkGender = 1;
							});
							$("#myRadiobutton0${vs.index}").click(function() {
								checkGender = 0;
							});
							$("#sub${vs.index}").click(function() {
								var petId = $("#petId${vs.index}")[0].value;
								var file = document.getElementById("preview_progressbarTW_img${vs.index}").getAttribute("src");
								var petName = $("#petName${vs.index}")[0].value;
								var petBirthday = $("#myDate${vs.index}")[0].value;
								var petIntroduction = $("#myTextarea${vs.index}")[0].value;
								var datas = {
									"id" : petId,
									"file" : file,
									"name" : petName,
									"birthday" : petBirthday,
									"gender" : checkGender,
									"introduction" : petIntroduction
								};
								var jsonData = JSON.stringify(datas);
								console.log(jsonData);
								$.ajax({
									url : contextRoot + "/timmy/updatePetDataAjax",
									method : 'post',
									contentType : 'application/json',
									data : jsonData,
									success : function(result) {
										console.log(result);
										window.location.reload();
// 										$("#closeplz${vs.index}").click();
										if (file.includes("base64"))
											document.getElementById("petImgPreview{vs.index}").setAttribute("src", file);
									},
									error : function(error) {
										console.log(error);
									}
								})
							})
						});
					</script>
				</c:forEach>
				<!-- 			------------------------------------------------ -->
				<c:if test="${empty guest || guest == userOrigin}">
					<a class="btn btn-outline-secondary btn-icon-text btn-edit-profile" role="button"
						data-toggle="modal" data-target="#myModaladd"
						id="viewDetailButtonAdd"><img src="${contextRoot}/img/petimg/add.png" width="100px" >
						</a>
					<div class="modal fade petModal" id="myModaladd">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- 彈出標題 -->
								<div class="modal-header">
									<h4 class="modal-title">New Pet:</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
	
								<form class="form" method="post"
									action="${contextRoot}/pet/insertNewPet.controller"
									enctype="multipart/form-data">
									<div class="modal-body">
										<label>Name:</label>
										<!-- ------------------ -->
										<input type="file" id="addPetImg" name="file"
											style="display: none;">
										<!-- ------------------ -->
										<div>
											<input class="form-control" name="petName" type="text">
										</div>
										<label>Photo:</label>
										<!-- ------------------ -->
										<div>
											<img src="${contextRoot}/img/petimg/pawprint.png"
												id="defaultPetImg">
										</div>
										<!-- ------------------ -->
										<br>
										<div class="form-group" style="text-align: left;">
											<label>Breed:&nbsp;&nbsp;&nbsp;&nbsp;</label> <input
												id="testingChecked" type="radio" name="petType" value="1">Dog
											&nbsp;&nbsp; <input type="radio" name="petType" value="0">Cat
											&nbsp;&nbsp;
										</div>
										<!-- ------------------ -->
										<div class="form-group" style="text-align: left;">
											<label>Gender:&nbsp;&nbsp;&nbsp;</label> <input type="radio"
												name="petGender" id="testingChecked2" value="1">Male &nbsp;&nbsp; <input
												type="radio" name="petGender" value="0">Female
										</div>
										<!-- ------------------ -->
										<div class="form-group" style="text-align: left;">
											<label>Birthday</label> <input name="petBirthday" type="date"
												class="form-control">
										</div>
										<!-- ------------------ -->
										<label>Introduction:</label>
										<div>
											<textarea class="form-control" name="petDescription"></textarea>
										</div>
										<input name="petPhotoPath" style="display: none" value="">
										<!-- ------------------ -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											id="oneBtnToInsertNewPet" style="margin-right:auto">一鍵填入</button>
										<button type="submit" class="btn btn-primary"
											id="submitPetDetails">Add</button>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">Close</button>
									</div>
									<script>
									$(function(){
										$("#oneBtnToInsertNewPet").on("click", function(){
											$("input[name=petName]").attr("value", "testPetName");
											$("#testingChecked").attr("checked", "true");
											$("#testingChecked2").attr("checked", "true");
											$("input[name=petBirthday]").attr("value", "2022-01-01");
											$("textarea[name=petDescription]").text("testing...")
										});
									})
									</script>
								</form>
							</div>
						</div>
					</div>
				</c:if>
</body>
<script>
	$(document).ready(
			function() {
				var contextRoot = "/demo";
				var img64 = "";
				var imgType = "";
				$('#defaultPetImg').click(function() {
					$('#addPetImg').click();
				});
				var file = document.getElementById("addPetImg");
				file.onchange = function() {
					readFile(this);
				};
				function readFile(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();
						reader.onload = function(e) {
							img64 = e.target.result;
							imgType = file.files[0].type;
							document.getElementById("defaultPetImg").setAttribute(
									"src", e.target.result);
						}
					}
					reader.readAsDataURL(input.files[0]);
				}
			});
</script>

</html>