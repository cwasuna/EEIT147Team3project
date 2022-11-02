<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<jsp:include page="../brianlayout/navbar.jsp" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>會員頁面施工中</title>
</head>

<body>
	<div class="container">
		<h1>會員頁面</h1>
		<c:forEach var="users" items="${page.content}">
			<div class="row justify-content-center">
				<div class="col-8">
					<div class="card">
						<div class="card-body">
							<div>${users.email}
								<div class="text-right">
									<!-- 修改按鈕 -->
									<a class="btn btn-primary " role="button" data-toggle="modal"
										data-target="#myModal">修改</a>
									<!-- 框體調整 -->
									<div class="modal" id="myModal">
										<div class="modal-dialog">
											<div class="modal-content">
												<!-- 彈出標題 -->
												<div class="modal-header">
													<h4 class="modal-title">修改資料</h4>
													<button type="button" class="close" data-dismiss="modal">&times;</button>
												</div>
												<!-- 彈出內容 -->
												<div class="modal-body">
													<!-- 修改表單 -->
													<form:form class="form" method="post"
														modelAttribute="users" action="${contextRoot}/postUser">
														<form:input path="userId" type="hidden"
															value="${users.userId}" />
														<!--email-->
														<div class="form-row" style="text-align: left;">
															<div class="form-group col-md-6">
																<label for="group">Email</label>
																<form:input path="email" type="email"
																	class="form-control" id="inputEmail4" />
															</div>
															<!--密碼-->
															<div class="form-group col-md-6"
																style="text-align: left;">
																<label for="inputPassword4">Password</label>
																<form:input path="password" type="text"
																	class="form-control" id="inputPassword4" />
															</div>
														</div>
														<!--暱稱-->
														<div class="form-group" style="text-align: left;">
															<label for="inputAddress">Nick name</label>
															<form:input path="nickName" type="text"
																class="form-control" id="inputAddress" />
														</div>
														<!--電話-->
														<div class="form-group" style="text-align: left;">
															<label for="inputAddress">phone</label>
															<form:input path="phone" type="text" class="form-control"
																id="inputAddress" />
														</div>
														<!--地址-->
														<div class="form-group" style="text-align: left;">
															<label for="inputAddress">Address</label>
															<form:input path="address" type="text"
																class="form-control" id="inputAddress" />
														</div>
														<!--生日-->
														<div class="form-group" style="text-align: left;">
															<label for="inputAddress">Birthday之後換</label>
															<form:input path="birthday" type="text"
																class="form-control" id="inputAddress" />
														</div>
														<!--圖-->
														<div class="form-group" style="text-align: left;">
															<label for="inputAddress">photoPath之後換</label>
															<form:input path="photoPath" type="text"
																class="form-control" id="inputAddress" />
														</div>
														<!--性別-->
														<div class="form-group" style="text-align: left;">
															<label for="inputAddress">gender之後換</label>
															<form:input path="gender" type="text"
																class="form-control" id="inputAddress" />
														</div>
														<!--權限-->
														<div class="form-group" style="text-align: left;">
															<label for="inputAddress">category之後換</label>
															<form:input path="category" type="text"
																class="form-control" id="inputAddress" />
														</div>

														<!--自介-->
														<div class="form-group" style="text-align: left;">
															<label for="exampleFormControlTextarea1">selfIntroduction</label>
															<form:textarea path="selfIntroduction"
																class="form-control" id="exampleFormControlTextarea1"
																rows="3" />
														</div>
														<!-- 按鈕 -->
														<div class="modal-footer">
															<button type="button" class="btn btn-danger"
																data-dismiss="modal">Close</button>
															<button type="submit" class="btn btn-primary">Submit</button>
														</div>
													</form:form>
												</div>
											</div>
										</div>
									</div>
									<a class="btn btn-danger " onclick="return confirm('確認刪除?')"
										href="${contextRoot}/message/deleteMessage/${workMessage.id}"
										role="button">刪除</a> <a class="btn btn-info "
										href="${contextRoot}/message/editMessage/${workMessage.id}"
										role="button">貼文記錄</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

		<div class="row justify-content-center">
			<div class="col-8">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
					<c:choose>
						<c:when test="${page.number != pageNumber -1}">
							<a href="${contextRoot}/memberManagement?p=${pageNumber}">
								${pageNumber} </a>
						</c:when>
						<c:otherwise>
							${pageNumber}
						</c:otherwise>								
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
</body>

</html>