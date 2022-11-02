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
<title>PEEiT</title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
</style>
<body>
	<jsp:include page="layout/navbar.jsp" />
	<div class="container" style="margin-top: 3%">
		<div class="row">
			<div class="left">
				<div class="col-lg-12">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14460.01880763059!2d121.543412!3d25.0339145!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xedc006d25a9e35df!2z6LOH5bGV5ZyL6Zqb6IKh5Lu95pyJ6ZmQ5YWs5Y-4!5e0!3m2!1szh-TW!2stw!4v1661581304263!5m2!1szh-TW!2stw"
						width="640" height="480" style="border: 0;"></iframe>
					<!-- 				新建一個活動 -->
				</div>
			</div>
			<div class="right">
				<div class="col-lg-6">
					<a class="btn btn-outline-secondary btn-icon-text btn-edit-profile"
						role="button" data-toggle="modal" data-target="#myModaladd"
						id="viewDetailButtonAdd"><img
						src="${contextRoot}/img/petimg/add.png" width="100px"> </a>
					<div class="modal fade petModal" id="myModaladd">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- 彈出標題 -->
								<div class="modal-header">
									<h4 class="modal-title">Hold an event :</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<c:if test="${!empty newEvent }">
									<form:form class="form" method="post" action="${contextRoot}/event/insertNewEvent.controller" modelAttribute="newEvent">
										<div class="modal-body"> 
											<form:input class="form-control" path="eventId" type="text"
												style="display:none" />
											<!-- 										------------------ -->
											<label>Event Name:</label><img id="randomNameBtn" src="/demo/img/eventimg/dice.png" width="20" style="float:right;margin-right:20px"  >
											<div>
												<form:input class="form-control" path="eventName" type="text" />
											</div>
											<!-- 										------------------ -->
											<label>Introduction:</label>
											<div>
												<form:textarea class="form-control" path="eventDiscription" placeholder="say something ..."></form:textarea>
											</div>
											<!-- 										------------------ -->
											<label>Location:</label>
											<div>
												<form:input class="form-control" path="eventLocation"></form:input>
											</div>
<!-- 											------------------ -->  
											<label>How many people ?</label>
											<div class="row">
												<div class="col-sm-4" style="padding-right: 0">
													<form:input class="form-control" path="minNumPeople"
														type="number" value="0"/> 
												</div>
												<div><h4>&nbsp;&nbsp;-</h4></div>
												<div class="col-sm-4" style="padding-right: 0">
													<form:input class="form-control" path="maxNumPeople"
														type="number" value="0"/>
												</div>
											</div>
<!-- 											------------------  -->
											<label>Who can join ?</label>
											<div>
												<form:select class="form-control" path="whoCanJoin" type="text">
													<option value="0">my friends</option>
													<option value="1">followers</option>
													<option value="2">fans</option>
													<option value="3">all</option>
												</form:select>
											</div>
<!-- 										------------------ -->
											<label>Date:</label>
											<div class="form-group" style="text-align: left;">
												<form:input path="eventDate" type="date"
													class="form-control" />
											</div>
<!-- 										------------------ -->
											<label>Recruitment period:</label>
											<div class="row">
												<div class="col-sm-4" style="padding-right: 0">
													<form:input path="invitationBeginDate" type="date"
														class="form-control" />
												</div>
												<div><h4>&nbsp;&nbsp;-</h4></div>
												<div class="col-sm-4" style="padding-right: 0">
													<form:input path="invitationEndDate" type="date"
														class="form-control" />
												</div>
											</div>
<!-- 										------------------ -->
										</div>
										<div class="modal-footer">
											<form:button type="submit" class="btn btn-primary"
												id="submitPetDetails">Add</form:button>
											<button type="button" class="btn btn-danger"
												data-dismiss="modal">Close</button>
										</div>
									</form:form>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
 $(function(){
	 $("#randomNameBtn").click(function(){
		 let a = Math.floor(Math.random() * 4);
		 let randomName = ["來聚聚吧", "狗狗貓貓分享會", "交流一下呀", "嘿嘿嘿"]
		 $("input[name=eventName]").attr("value", randomName[a])
	 })
 })
</script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.29/dist/sweetalert2.all.min.js"></script>
</html>