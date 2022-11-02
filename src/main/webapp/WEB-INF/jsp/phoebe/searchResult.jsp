<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../timmy/layout/navbar.jsp" />
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<title>PET.COM / Search result</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js">
	</script>
	
<!-- alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<div class="container">
		<br>
			<!-- Rrepetitive Sstructure(user) -->
				<div class="panel" style="padding-top: 2%">
				<h3>People</h3>
					<c:forEach items="${userList}" var="u" varStatus="vs">
							<div>
								<a href="${contextRoot}/timmy/readUserById/${u.getUserId()}">
								<img src="${contextRoot}/${u.getPhotoPath()}"
									alt="" style="width: 45px; height: 45px; border-radius: 50%;"/> ${u.getNickName()}
								</a>
							</div>
							<div class="activity__list__body entry-content">

								<!-- User Information Card -->
								<i class="fa fa-paw"></i>
								<c:forEach items="${u.getPets()}" var="pet" varStatus="loop">
									<span style="border: solid; border-radius: 5%; border-color: #E0E0E0; border-width: 1px; padding: 15px 10px 18px 10px; margin: 5px">
									
									<c:if test='${fn:contains(pet.petPhotoPath, ".")}'>
									<img alt="" src="${contextRoot}/${pet.getPetPhotoPath()}" style="height: 50px; width: 50px; border-radius: 30%">
									</c:if>
									
									<c:if test='${!fn:contains(pet.petPhotoPath, ".")}'>
									<img alt="" src="/demo/img/petimg/pawprint.png" style="height: 50px; width: 50px; border-radius: 30%">
									</c:if>
									
									<c:if test="${pet.getPetType() == 0}"><span class="badge badge-info">Cat</span></c:if>
									<c:if test="${pet.getPetType() == 1}"><span class="badge badge-info">Dog</span></c:if>
									<c:if test="${pet.getPetType() == 2}"><span class="badge badge-info">Others</span></c:if>
									${pet.getPetName()}
									<c:if test="${pet.getPetGender() == 0}"><span class="badge badge-dark"><i class="fa fa-venus" aria-hidden="true"></i></span></c:if>
									<c:if test="${pet.getPetGender() == 1}"><span class="badge badge-dark"><i class="fa fa-mars" aria-hidden="true"></i></span></c:if>
									</span>
								</c:forEach>
							</div>
							<div class="activity__list__body entry-content">
							<i class="fa fa-map-marker" aria-hidden="true"></i>&ensp; ${u.getAddress()}
							</div>
							<hr>
							</c:forEach>
						</div>
			<!--Rrepetitive Sstructure(user) -->
			
			<!-- Rrepetitive Sstructure(post) -->
			<c:forEach items="${postList}" var="p" varStatus="vs">
			<c:if test="${p.getWhoCanSeeIt() == 1}">
				<div class="panel" style="padding-top: 2%">
<!-- 					<ul class="panel-activity__list"> -->
<!-- 						<li> -->
						<i class="activity__list__icon fa fa-question-circle-o"></i>
<!-- 							<div class="activity__list__header"> -->
							<a href="${contextRoot}/timmy/readUserById/${p.getPostUser().getUserId()}">
								<img src="${contextRoot}/${p.getPostUser().getPhotoPath()}"
									alt="" style="width: 45px; height: 45px; border-radius: 50%;"/> ${p.postUser.getNickName()}
							</a>&nbsp;
									<c:if test="${p.getWhoCanSeeIt() == 1}">
							<i id="public" class="fa fa-globe" aria-hidden="true" title="public"></i>
						</c:if>
						<c:if test="${p.getWhoCanSeeIt() == 2}">
							<i id="followers" class="fa fa-users" aria-hidden="true" title="followers"></i>
						</c:if>
						<c:if test="${p.getWhoCanSeeIt() == 3}">
							<i id="onlyMe" class="fa fa-lock" aria-hidden="true" title="only me"></i>
						</c:if>
<!-- 							</div> -->
							
							<!-- 取得按讚關聯的postID -->
							<input id="likedPostId${vs.index}" value="${p.getPostId()}" style="visibility: hidden;">
						
								<!-- 下拉式menu -->
								<div class="dropdown" style="float: right; margin-right: 5%;">
									<button id="demo1" class="dropbtn" style="visibility: hidden;">Dropdown</button>
									<i class="fa fa-ellipsis-h" style="font-size: 22px"></i>
									<div class="dropdown-content" style="min-width: 100px;">
										
										<c:if test="${p.postUser.getUserId() != user.getUserId()}">
<%-- 										<form method="post" action="${contextRoot}/reportPost.controller?postId=${p.getPostId()}"> --%>
										<a><button id="report${vs.index}" type="submit" class="btn btn-light">report</button></a>
<%-- 										</form> --%>
										</c:if>
									</div>
								</div>
							
						<script>	
						//檢舉貼文ajax
						$(document).ready(function() {
							var contextRoot = "/demo";
							$("#report${vs.index}").off().click(function() {
								var id = $("#likedPostId${vs.index}")[0].value;
								var datas = {
									"id" : id
								};
								var jsonData = JSON.stringify(datas);
								console.log(jsonData);

								$.ajax({
									url : contextRoot + "/reportPost.controller",
									method : 'post',
									contentType : 'application/json',
									data : jsonData,
									success : function(result) {
										console.log(result);
										
 										//刷新
 										window.location.reload();

									},
									error : function(error) {
										console.log(error);
									}
								})
							})
						});
						
					</script>
								
							<div class="activity__list__body entry-content">

								<!-- Post Content-->
								<p>${p.getPostText()}</p>

								<!-- Post Img -->
								<c:forEach items="${p.getPostImg()}" var="pImg" varStatus="loop">
									<ul class="gallery">
										<li><img src="${contextRoot}/${pImg.getPostImgPath()}">
										</li>
									</ul>
								</c:forEach>

							</div>
							<!-- 	按讚/評論/修改/刪除/分享 按鈕 -->
							<div class="activity__list__footer">
								<a id="like${vs.index}"> <i onclick="likeIconFunction(this)" class="fa fa-thumbs-up"></i>${p.getPostLike()}</a>
								<a id="commentCount${vs.index}"> <i class="fa fa-comments"></i>${p.getComments().size()}</a>

								<c:if test="${p.postUser.getUserId() == user.getUserId()}">
									<a href="#" role="button" data-toggle="modal"
										data-target="#myModal${vs.index}"
										id="viewDetailButton${vs.index}"> <i class="fa fa-pencil"></i>Edit
									</a>
									<a href="#" role="button" data-toggle="modal"
										data-target="#myModal${vs.index}deleteCheck"
										id="viewDetailButton${vs.index}"> <i class="fa fa-trash"></i>Delete
									</a>
								</c:if>
								<!--分享 -->
								<c:if test="${p.postUser.getUserId() != user.getUserId()}">
									<a href="#" role="button" data-toggle="modal"
										data-target="#myModal${vs.index}Share"
										id="viewDetailButton${vs.index}"> <i class="fa fa-share" aria-hidden="true"></i>Share
									</a>
								</c:if>
								
								<span> <i class="fa fa-clock"></i>${p.getPostTime()}
								</span>
							</div>
<!-- 							</li> -->
<!-- 					</ul> -->

					<script>
						//按讚ajax
						$(document).ready(function() {
							var contextRoot = "/demo";
							$("#like${vs.index}").off().click(function() {
								var id = $("#likedPostId${vs.index}")[0].value;
								var datas = {
									"id" : id
								};
								var jsonData = JSON.stringify(datas);
								console.log(jsonData);
								
								$.ajax({
									url : contextRoot + "/postLike.controller",
									method : 'post',
									contentType : 'application/json',
									data : jsonData,
									success : function(result) {
										console.log(result);
										
// 										局部刷新，讓按讚數可以馬上顯示
										$( "#like${vs.index}" ).load(window.location.href + " #like${vs.index}" );
									},
									error : function(error) {
										console.log(error);
									}
								})
							})
						});
					</script>

					<!-- 修改貼文modal -->
					<div class="modal fade" id="myModal${vs.index}" role="dialog">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<!-- head -->
								<div class="modal-header">
									<h4 class="modal-title">Edit post</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<!-- body -->
								<div class="modal-body">
									<form
										action="${contextRoot}/editPost.controller?postId=${p.getPostId()}"
										class="panel-activity__status" method="post"
										enctype="multipart/form-data">
										<img src="${contextRoot}/${p.getPostUser().getPhotoPath()}"
											style="width: 40px; height: 40px; border-radius: 50%;">
										${user.getNickName()} <select name="whoCanSeeIt">
											<option value="1">Public</option>
											<option value="2">Follower</option>
											<option value="3">Only me</option>
										</select>
										<textarea name="postText" class="form-control"
											style="border-style: none; overflow: hidden">${p.getPostText()}</textarea>

										<div id="result" name="result"></div>

										<!-- footer -->
										<div>
											<div>
												<a href=#><label> <input
													style="position: absolute; opacity: 0;" type="file"
													name="postImg" id="file" multiple
													onchange="readAsDataURL()"
													accept="image/gif,image/jpeg,image/x-png" /> <i
													class="fa fa-image"></i>
												</label></a>
<!-- 												&emsp; <label> <input -->
<!-- 													style="position: absolute; opacity: 0;" type="file" -->
<!-- 													name="postVideo" id="file" accept="video/*" /> <i -->
<!-- 													class="fa fa-video-camera"></i> -->
<!-- 												</label> -->
											</div>
											<button type="submit" class="btn btn-sm btn-rounded btn-info">Save</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 分享貼文Modal -->
					<div class="modal fade" id="myModal${vs.index}Share" role="dialog">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<!-- head -->
								<div class="modal-header">
									<h4 class="modal-title">Share post</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<!-- body -->
								<div class="modal-body">

									<!-- 登入者輸入區 -->
									<img src="${contextRoot}/${user.getPhotoPath()}"
										style="width: 40px; height: 40px; border-radius: 50%; float: none;">
									<textarea id="saySomeThing${p.getPostId()}" name="postText"
										class="form-control"
										style="border-style: none; overflow: hidden;"
										placeholder="Add a comment"></textarea>

									<!-- 被分享貼文區 -->
									<div id="postBeShared"
										style="border: solid; border-width: 1px; border-color: #E0E0E0; padding: 3%; margin: 3%; height: 50%; overflow: auto;">
										<img src="${contextRoot}/${p.getPostUser().getPhotoPath()}"
											style="width: 40px; height: 40px; border-radius: 50%;">
										${p.postUser.getNickName()}
										<p>${p.getPostText()}</p>
										<c:forEach items="${p.getPostImg()}" var="pImg"
											varStatus="loop">
											<ul class="gallery" style="list-style: none;">
												<li><img src="${contextRoot}/${pImg.getPostImgPath()}">
												</li>
											</ul>
										</c:forEach>
									</div>

									<!-- footer -->
									<div class="modal-footer">
										<button id="sharePost${p.getPostId()}" type="submit"
											class="btn btn-sm btn-rounded btn-info">Share</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<script type="text/javascript">
						//分享貼文ajax
						$(document) .ready(function() {
		var contextRoot="/demo";

		$("#sharePost${p.getPostId()}") .off() .click(function() {
				var id=${p .getPostId()}

				;
				var saySomeThing=$("#saySomeThing${p.getPostId()}")[0].value;

				var datas= {
					"id" : id,
					"saySomeThing" : saySomeThing
				}

				;
				var jsonData=JSON .stringify(datas);
				console .log(jsonData);

				$ .ajax({

					url : contextRoot + "/sharePost.controller",
					method : 'post',
					contentType : 'application/json',
					data : jsonData,
					success : function(result) {
						console .log(result);

						//局部刷新
						window.location .reload();
						//關掉modal
						$("#myModal${vs.index}deleteCommentCheck") .modal('hide');
						$("body") .removeClass("modal-open");
						$(".modal-backdrop") .remove();
					}

					,
					error : function(error) {
						console .log(error);
					}
				})
		})
});
					</script>

					<!-- Delete Comfirm -->
					<div class="modal fade" id="myModal${vs.index}deleteCheck"
						tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">Move to
										your trash?</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Items in your trash will be
									automatically deleted after 30 days.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-light"
										data-dismiss="modal">Cancel</button>
									<form method="Post"
										action="${contextRoot}/movePostToTrash.controller?postId=${p.getPostId()}">
										<button type="submit" class="btn btn-info">Move</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					
								<!-- 評論 -->
					<div style="background-color: #F0F0F0; padding: 15px; border-radius: 1%">
						<div id="commentDiv">
						<c:forEach items="${p.getComments()}" var="c" varStatus="Cvs">
							<div id="comment${vs.index}" class="box-footer box-comments">
								<div class="box-comment">
									<div class="comment-text">
									
									<a href="${contextRoot}/timmy/readUserById/${p.getPostUser().getUserId()}">
										<img class="img-circle img-sm"
											src="${contextRoot}/${c.getUser().getPhotoPath()}"
											alt="User Image"
											style="width: 40px; height: 40px; border-radius: 50%">
										<span class="username" style="font-weight: bold;">
											${c.getUser().getNickName()} </span>
									</a>
									
									<!-- 	取得評論id -->
									<input id="commentId${vs.index}" value="${c.getCommentId()}"
									style="visibility: hidden">

										<!-- 	是作者才會顯示的修改刪除按鈕		 -->
										<c:if test="${c.user.getUserId() == user.getUserId()}">
											<span style="float: right; margin-left: 10px">
											<a href="#" role="button" data-toggle="modal"
												data-target="#myModal${vs.index}deleteCommentCheck"
												id="viewDetailButton${vs.index}"> <i class="fa fa-trash"></i>
											</a>
											</span>
<!-- 											<span style="float: right"> -->
<!-- 											<a href="#" role="button" data-toggle="modal" -->
<%-- 												data-target="#myModal${vs.index}" --%>
<%-- 												id="viewDetailButton${vs.index}"> <i --%>
<!-- 												class="fa fa-pencil" ></i> -->
<!-- 											</a> -->
<!-- 											</span> -->

										</c:if>
									</div>
									<span class="text-muted pull-right">${c.getCommentTime()}</span>
									&emsp; &emsp; ${c.getCommentText()}
									<hr>
								</div>
							</div>
						</c:forEach>
						</div>

						<div class="box-footer">
							<img class="img-responsive img-circle img-sm"
								src="${contextRoot}/${user.getPhotoPath()}" alt="Alt Text"
								style="width: 40px; height: 40px; border-radius: 50%">

							<div class="img-push">
								<input type="text" class="form-control input-sm" required
									id="commentText${vs.index}"
									placeholder="Press enter to post comment" name="commentText">
<!-- 								<button type="button" class="btn btn-info" data-dismiss="modal" -->
<%-- 									id="sub${vs.index}">Submit</button> --%>

								<!-- 取得評論關聯的postID -->
								<input id="postId${vs.index}" value="${p.getPostId()}"
									style="visibility: hidden;">
							</div>

							<script type="text/javascript">
 									</script>
						</div>
					</div>
				</div>
				
				<!-- 彈出評論刪除確認 -->
					<div class="modal fade" id="myModal${vs.index}deleteCommentCheck"
						tabindex="-1" role="dialog"
						aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">Delete Comment?</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">Are you sure you want to delete this comment?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-light"
										data-dismiss="modal">No</button>
										<button id="deleteComment${vs.index}" type="submit" class="btn btn-info">Delete</button>
									
								</div>
							</div>  
						</div>
					</div>
				
				<script>
						//送出評論ajax
						$(document).ready(function() {
							var contextRoot = "/demo";
// 							$("#sub${vs.index}").off().click(function() {
							document.querySelector('#commentText${vs.index}').addEventListener('keypress', function (event) {
								if (event.key === 'Enter') {//監聽鍵盤輸入事件，當事件為「Eenter」時執行程式
								var postId = $("#postId${vs.index}")[0].value;
								var commentText = $("#commentText${vs.index}")[0].value;
								var datas = {
									"postId" : postId,
									"commentText" : commentText
								};
								var jsonData = JSON.stringify(datas);
								console.log(jsonData);
								event.target.value = ''; //清除input內容
								
								$.ajax({
 									
									url : contextRoot + "/addComment.controller",
									method : 'post',
									contentType : 'application/json',
									data : jsonData,
									success : function(result) {
										console.log(result);
										
										//局部刷新，讓新增的評論可以馬上顯示
										window.location.reload();
									},
									error : function(error) {
										console.log(error);
									}
								})
								}})
						});
						
						//刪除評論ajax
						$(document).ready(function() {
							var contextRoot = "/demo";
							$("#deleteComment${vs.index}").off().click(function() {
								var id = $("#commentId${vs.index}")[0].value;
								var datas = {
									"id" : id
								};
								var jsonData = JSON.stringify(datas);
								console.log(jsonData);
								
								$.ajax({
									url : contextRoot + "/deleteComment.controller",
									method : 'post',
									contentType : 'application/json',
									data : jsonData,
									success : function(result) {
										console.log(result);
										
 										//局部刷新
 										window.location.reload();
										//關掉modal
										$( "#myModal${vs.index}deleteCommentCheck").modal('hide');
										$("body").removeClass("modal-open");
										$( ".modal-backdrop").remove();
									},
									error : function(error) {
										console.log(error);
									}
								})
							})
						});
						
					</script>

			</c:if>
			</c:forEach>
			<!--Rrepetitive Sstructure(post) -->
			
	</div>
<!-- 		</div> -->


	<style type="text/css">
/* Profile_page */
body {
	background: #dcdcdc;
	margin-top: 20px;
}

.profile-cover {
	position: relative;
	z-index: 0;
}

.panel {
	padding: 1px 15px 15px 15px;
	color: #696969;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.08);
	margin-bottom: 30px;	
}

.profile-cover__action {
	display: -ms-flexbox;
	display: -webkit-box;
	display: flex;
	padding: 120px 30px 10px 153px;
	border-radius: 5px 5px 0 0;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-ms-flex-pack: end;
	-webkit-box-pack: end;
	justify-content: flex-end;
	overflow: hidden;
	background: url(https://bootdey.com/img/Content/bg1.jpg) no-repeat;
	background-size: cover;
}

.profile-cover__action>.btn {
	margin-left: 10px;
	margin-bottom: 10px;
}

.profile-cover__img {
	position: absolute;
	top: 120px;
	left: 30px;
	text-align: center;
	z-index: 1;
}

.profile-cover__img>img {
	max-width: 120px;
	border: 5px solid #fff;
	border-radius: 50%;
}

.profile-cover__img>.h3 {
	color: #393939;
	font-size: 20px;
	line-height: 30px;
}

.profile-cover__img>img+.h3 {
	margin-top: 6px;
}

.profile-cover__info .nav {
	margin-right: 28px;
	padding: 15px 0 10px 170px;
	color: #999;
	font-size: 16px;
	line-height: 26px;
	font-weight: 300;
	text-align: center;
	text-transform: uppercase;
	-ms-flex-pack: end;
	-webkit-box-pack: end;
	justify-content: flex-end;
}

.profile-cover__info .nav li {
	margin-top: 13px;
	margin-bottom: 13px;
}

.profile-cover__info .nav li:not(:first-child) {
	margin-left: 30px;
	padding-left: 30px;
	border-left: 1px solid #eee;
}

.profile-cover__info .nav strong {
	display: block;
	margin-bottom: 10px;
	color: #e16123;
	font-size: 34px;
}

@media ( min-width : 481px) {
	.profile-cover__action>.btn {
		min-width: 125px;
	}
	.profile-cover__action>.btn>span {
		display: inline-block;
	}
}

@media ( max-width : 600px) {
	.profile-cover__info .nav {
		display: block;
		margin: 90px auto 0;
		padding-left: 30px;
		padding-right: 30px;
	}
	.profile-cover__info .nav li:not(:first-child) {
		margin-top: 8px;
		margin-left: 0;
		padding-top: 18px;
		padding-left: 0;
		border-top: 1px solid #eee;
		border-left-width: 0;
	}
}

.panel {
	margin-bottom: 30px;
	color: #696969;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.08);
}

.panel-heading {
	color: #393939;
	padding: 10px 20px;
	border-width: 0;
	border-radius: 0;
}

.panel-heading:after, .panel-heading:before {
	content: " ";
	display: table;
}

.panel-heading:after {
	clear: both;
}

.panel-title {
	float: left;
	margin-top: 3px;
	margin-bottom: 3px;
	font-size: 14px;
	line-height: 24px;
	font-weight: 700;
	text-transform: uppercase;
}

.panel-title
												select {
	border-width: 0;
	background-color: transparent;
	text-transform: uppercase;
}

.panel-title
												select option {
	text-transform: capitalize;
}

.panel-title .select2 {
	display: block;
	min-width: 200px;
}

.panel-title .select2-selection {
	height: auto;
	padding: 0;
	background-color: transparent;
	border-width: 0;
	border-radius: 0;
	overflow: hidden;
	white-space: nowrap;
}

.no-outlines .panel-title .select2-selection {
	outline: 0;
}

.panel-title .select2-selection .select2-selection__rendered {
	float: left;
	margin-right: 8px;
	padding: 0;
	line-height: inherit;
}

.panel-title .select2-selection .select2-selection__arrow {
	float: left;
	display: block;
	position: relative;
	top: auto;
	right: auto;
	width: auto;
	height: auto;
}

.panel-title .select2-selection .select2-selection__arrow:before {
	content: "\f107";
	font-family: " Font Awesome\ 5 Free ";
	font-weight: 700;
}

.panel-title .select2-container--open .select2-selection__arrow:before {
	content: "\f106";
}

.panel-heading .dropdown {
	float: right;
}

.panel-heading .dropdown .dropdown-toggle {
	margin: -10px -20px;
	padding: 10px 20px;
	color: #999;
	border-width: 0;
	font-size: 14px;
	line-height: 30px;
	cursor: pointer;
}

.panel-heading .dropdown .dropdown-toggle:after, .toolbar__nav>li>a>span
	{
	display: none;
}

.panel-heading .dropdown-menu {
	top: 30px !important;
	left: auto !important;
	right: -20px;
	margin: 0;
	padding: 10px 0;
	border-width: 0;
	border-radius: 4px 0 0 4px;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.08);
	-webkit-transform: none !important;
	transform: none !important;
	z-index: 1001;
}

.panel-heading .dropdown-menu a {
	padding: 5px 15px;
	color: #999;
	font-size: 13px;
	line-height: 23px;
}

.panel-heading .dropdown-menu a:hover {
	color: #e16123;
}

.panel-heading .dropdown-menu i {
	min-width: 15px;
	margin-right: 6px;
	font-size: 11px;
	text-align: center;
}

.panel-subtitle {
	margin: 20px 0;
}

.panel-subtitle:first-child {
	margin-top: 0;
}

.panel-subtitle .h5 {
	color: #999;
	font-weight: 600;
}

.panel-subtitle .h5 small {
	color: #777;
}

.panel-body {
	padding: 20px;
}

.panel-content, .panel-social {
	position: relative;
	border-radius: 0 0 4px 4px;
}

.panel-content {
	border-top: 1px solid #eee;
	padding: 31px 20px 33px;
}

.panel-about table {
	width: 100%;
	word-break: break-word;
}

.panel-about table tr+tr td, .panel-about table tr+tr th {
	padding-top: 8px;
}

.panel-about table th {
	min-width: 120px;
	color: #2bb3c0;
	font-weight: 400;
	vertical-align: top;
}

.panel-about table th>i {
	min-width: 14px;
	margin-right: 8px;
	text-align: center;
}

.panel-social {
	padding: 0 20px 33px;
	z-index: 0;
}

.panel-heading+.panel-social {
	padding-top: 21px;
	border-top: 1px solid #eee;
}

.panel-social>.nav {
	-ms-flex-pack: center;
	-webkit-box-pack: center;
	justify-content: center;
}

.panel-social>.nav>li:not(:last-child) {
	margin-right: 20px;
}

.panel-social>.nav>li>a {
	color: #ccc;
}

.panel-activity__status>.actions {
	display: -ms-flexbox;
	display: -webkit-box;
	display: flex;
	padding: 10px 20px;
	background-color: #ebebea;
	border-style: solid;
	border-width: 0 1px 1px;
	border-color: #ccc;
	border-bottom-left-radius: 4px;
	border-bottom-right-radius: 4px;
}

.btn-link {
	display: inline-block;
	color: inherit;
	font-weight: inherit;
	cursor: pointer;
	background-color: transparent;
}

button.btn-link {
	border-width: 0;
}

.panel-activity__status>.actions>.btn-group>.btn-link:not(:last-child) {
	margin-right: 25px;
}

.panel-activity__status>.actions>.btn-group>.btn-link {
	padding-left: 0;
	padding-right: 0;
	color: #9c9c9c;
}

.btn-info {
	background-color: #2bb3c0;
	border: none;
}

.btn-group, .btn-group-vertical {
	position: relative;
	display: -ms-inline-flexbox;
	display: inline-flex;
	vertical-align: middle;
}

.panel-activity__status>.actions>.btn-group {
	-ms-flex: 1;
	-webkit-box-flex: 1;
	flex: 1;
	font-size: 16px;
}

.panel-activity__list {
	margin: 60px 0 0;
	padding: 0;
	list-style: none;
}

.panel-activity__list, .panel-activity__list>li {
	position: relative;
	z-index: 0;
}

.panel-activity__list:before {
	content: " ";
	display: none;
	position: absolute;
	top: 20px;
	left: 35px;
	bottom: 0;
	border-left: 2px solid #ebebea;
}

.activity__list__icon {
	display: none;
	position: absolute;
	top: 2px;
	left: 0;
	min-width: 30px;
	color: #fff;
	background-color: #2bb3c0;
	border-radius: 50%;
	line-height: 30px;
	text-align: center;
}

.panel-activity__list, .panel-activity__list>li {
	position: relative;
	z-index: 0;
}

.activity__list__header {
	position: relative;
	min-height: 35px;
	padding-top: 4px;
	padding-left: 45px;
	color: #999;
	z-index: 0;
}

.activity__list__body {
	padding-top: 13px;
	padding-left: 43px;
}

.entry-content
												.gallery {
	margin: 0;
	list-style: none;
	padding: 0;
}

.entry-content .gallery, .m-error {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
}

.entry-content .gallery>li {
	padding-right: 20px;
	-ms-flex-preferred-size: 0;
	flex-basis: 0;
	-ms-flex-positive: 1;
	flex-grow: 1;
	max-width: 100%;
}

.gallery>li img {
	max-width: 100%;
	height: auto;
}

.entry-content blockquote:last-child, p:last-child, table:last-child, ul:last-child
	{
	margin-bottom: 0;
}

.entry-content blockquote:last-child, p:last-child, table:last-child, ul:last-child
	{
	margin-bottom: 0;
}

.entry-content blockquote p:before {
	content: "\f10d";
	color: #999;
	margin-right: 12px;
	font-family: "FontAwesome";
	font-size: 24px;
	font-weight: 900;
}

.activity__list__header
												img {
	position: absolute;
	top: 0;
	left: 0;
	max-width: 35px;
	border-radius: 50%;
}

.activity__list__header a {
	color: #222;
	font-weight: 600;
}

.activity__list__footer {
	display: -ms-flexbox;
	display: -webkit-box;
	display: flex;
	margin-top: 23px;
	margin-left: 43px;
	padding: 13px 8px 0;
	color: #999;
	border-top: 1px dotted #ccc;
}

.activity__list__footer a {
	color: inherit;
}

.activity__list__footer a+a {
	margin-left: 15px;
}

.activity__list__footer i {
	margin-right: 8px;
}

.activity__list__footer a:hover {
	color: #222;
}

.activity__list__footer span {
	margin-left: auto;
}

.panel-activity__list>li+li {
	margin-top: 51px;
}

.weather--panel {
	padding: 24px 20px 36px;
	border-radius: 5px;
	text-align: center;
}

.weather--title {
	font-size: 18px;
	line-height: 28px;
	font-weight: 600;
}

.weather--title
												.fa {
	margin-right: 5px;
	font-size: 30px;
	line-height: 40px;
}

.weather--info {
	margin-top: 14px;
	font-size: 46px;
	line-height: 56px;
}

.weather--info .wi {
	margin-right: 10px;
}

.bg-blue {
	background-color: #2bb3c0;
}

.bg-orange {
	background-color: #e16123;
}

.todo--panel .list-group, .user--list>li, .user--list>li>a {
	position: relative;
	z-index: 0;
}

.hero-height {
	max-height: 314px;
}

.hero-height .mCSB_scrollTools .mCSB_dragger
												.mCSB_dragger_bar {
	background: rgb(233, 236, 238);
}

.todo--panel .list-group {
	margin-bottom: 0;
	padding-top: 23px;
	padding-bottom: 25px;
}

.todo--panel
												.list-group:before {
	content: " ";
	position: absolute;
	top: 0;
	left: 20px;
	right: 20px;
	border-top: 1px solid #eee;
}

.todo--panel .list-group-item {
	margin-top: 27px;
	padding: 0;
	border-width: 0;
}

li.list-group-item:first-child {
	margin-top: 0;
}

.todo--label {
	padding-left: 20px;
	padding-right: 30px;
	color: #696969;
	font-weight: 400;
}

.todo--input {
	display: none;
}

.todo--text {
	display: block;
	position: relative;
	padding-left: 39px;
	-webkit-transition: color 0.25s;
	transition: color 0.25s;
	cursor: pointer;
	z-index: 0;
}

.todo--input:checked+.todo--text {
	color: #999;
	text-decoration: line-through;
}

.todo--text:after, .todo--text:before {
	position: absolute;
	top: 50%;
	left: 0;
	margin-top: -10px;
	width: 20px;
	height: 20px;
	border-radius: 2px;
}

.todo--text:before {
	border: 1px solid #ccc;
	content: " ";
}

.todo--text:after {
	content: "\f00c";
	color: #fff;
	background-color: #009378;
	font-family: "FontAwesome";
	font-size: 11px;
	line-height: 21px;
	font-weight: 700;
	text-align: center;
	opacity: 0;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
	-webkit-transform: scale(0.3);
	transform: scale(0.3);
	-webkit-transition: opacity 0.25s linear, -webkit-transform 0.25s linear;
	transition: opacity 0.25s linear, transform 0.25s linear;
	transition: opacity 0.25s linear, transform 0.25s linear,
		-webkit-transform 0.25s linear;
}

.todo--input:checked+.todo--text:after {
	opacity: 1;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
	-webkit-transform: scale(1);
	transform: scale(1);
}

.todo--remove {
	position: absolute;
	top: 50%;
	right: 20px;
	margin-top: -15px;
	color: #999;
	font-size: 18px;
	line-height: 28px;
}

.todo--panel .input-group {
	border-top: 1px solid #eee;
}

.todo--panel .form-control {
	height: auto;
	padding: 13px 20px 14px;
	border-width: 0;
}

.todo--panel
												.btn-link {
	padding: 12px 16px;
	color: #ccc;
	font-size: 28px;
	border-width: 0;
	text-decoration: none;
}

.feeds-panel {
	margin: 20px 20px 0;
	padding-top: 17px;
	padding-bottom: 23px;
	border-top: 1px solid #ebebea;
}

.feeds-panel li {
	position: relative;
	width: 100%;
	min-height: 20px;
	padding-left: 40px;
	z-index: 0;
}

.feeds-panel li a {
	color: #e16123;
}

.feeds-panel li+li {
	margin-top: 12px;
}

.bg-red {
	background-color: #ff4040;
}

.bg-green {
	background-color: #009378;
}

.comments-panel>ul>li:after, .comments-panel>ul>li:before, .feeds-panel li:after,
	.feeds-panel li:before {
	content: " ";
	display: table;
}

.comments-panel>ul>li:after, .feeds-panel li:after {
	clear: both;
}

.feeds-panel .time {
	float: right;
	margin-left: 5px;
	color: #ccc;
	font-style: italic;
}

.feeds-panel .fa {
	position: absolute;
	top: 0;
	left: 0;
	min-width: 30px;
	border-radius: 2px;
	font-size: 12px;
	line-height: 30px;
	text-align: center;
}

.feeds-panel .text {
	color: #696969;
	line-height: 26px;
} /* 上傳圖片 */
.uploadImage {
	display: inline-block;
	vertical-align: top;
	position: relative;
	width: 90px;
	height: 90px;
	background: url("../點選上傳.png") no-repeat;
	background-size: cover;
	text-align: center;
	cursor: pointer;
}

.uploadImage p {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 10px;
	font-size: 14px;
	color: #999999;
}

.uploadImage input#file {
	width: 100%;
	height: 100%;
	opacity: 0;
	cursor: pointer;
}

.preview {
	position: relative;
	display: inline-block;
	vertical-align: top;
	margin-left: 10px;
	width: 90px;
	height: 90px;
	background: #E1E6ED;
	text-align: center;
}

.preview img {
	position: relative;
	z-index: 1;
	width: 100%;
	height: 100%;
}

.preview
												img[src=""] {
	opacity: 0;
	filter: Alpha(0); /* 相容IE8-9 */
}

.preview img:not([src]) {
	opacity: 0;
	filter: Alpha(0); /*
												相容IE8-9 */
}

.preview .word {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	line-height: 90px;
	font-size: 14px;
	color: #999999;
	z-index: 0;
}


/* 下拉式menu */
/* Dropdown Button */
.dropbtn {
	background-color: #04AA6D;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: black;
	padding: 10px;
	text-decoration: none;
	text-align: center;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: #FFFFFF;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
	background-color: #FFFFFF
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

/* 超連結樣式 */
 a:visited { 
 color:#8E8E8E; 
 text-decoration:none; 
 } 
 a:hover { 
 color:#000000; 
 text-decoration:underline; 
 } 
 
/*  按讚樣式 */
}
</style>
</body>
</html>