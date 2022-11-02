<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<link rel="stylesheet" href="${contextRoot}/css/index.css">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<c:if test="${!empty guest}">
		<c:set var="userOrigin" value="${user}" />
		<c:set var="user" value="${guest}" />
	</c:if>
			<c:forEach items="${postsToShow}" var="p" varStatus="vs">
				<c:if test="${p.whoCanSeeIt != 0 }" >
				<div class="panel" style="padding:2%">
						<i class="activity__list__icon fa fa-question-circle-o"></i>
								<div>
									<a
										href="${contextRoot}/timmy/readUserById/${p.getPostUser().getUserId()}" style="color:black;text-decoration:none;">
										<img src="${contextRoot}/${p.getPostUser().getPhotoPath()}"
										alt="" style="width: 40px; height: 40px; border-radius: 50%;"/>
										&nbsp;&nbsp;${p.postUser.getNickName()}
									</a> &nbsp;
									<!-- whoCanSeeIt圖示 -->
									<c:if test="${p.getWhoCanSeeIt() == 1}">
									<i id="public" class="fa fa-globe" aria-hidden="true"></i>
									</c:if>
									<c:if test="${p.getWhoCanSeeIt() == 2}">
									<i id="followers" class="fa fa-users" aria-hidden="true"></i>
									</c:if>
									<c:if test="${p.getWhoCanSeeIt() == 3}">
									<i id="onlyMe" class="fa fa-lock" aria-hidden="true"></i>
									</c:if>
								</div>

								<!-- 下拉式menu -->
								<div class="dropdown" style="float: right; margin-right: 5%;">
									<button class="dropbtn" style="visibility: hidden;">Dropdown</button>
									<i class="fa fa-ellipsis-h" style="font-size: 22px"></i>
									<div class="dropdown-content">
										<c:if test="${p.postUser.getUserId() != user.getUserId()}">
										<form method="post" action="${contextRoot}/reportPost.controller?postId=${p.getPostId()}">
										<a><button type="submit" class="btn btn-light">report</button></a>
										</form>
										</c:if>
									</div>
								</div>
							<div class="activity__list__body entry-content">

								<!-- post內文 -->
								<p>${p.getPostText()}</p>

								<!-- post圖片 -->
								<c:forEach items="${p.getPostImg()}" var="pImg" varStatus="loop">
									<ul class="gallery">
										<li><img src="${contextRoot}/${pImg.getPostImgPath()}">
										</li>
									</ul>
								</c:forEach>
								<c:if test="${!empty p.getPostBeShared()}">
							<div id="postBeShared"
								style="border: solid; border-width: 1px; border-color: #E0E0E0; padding: 3%; margin: 3%; height: 50%; overflow: auto;">
								<!--原作者資訊 -->
								<a
									href="${contextRoot}/timmy/readUserById/${p.getPostBeShared().getPostUser().getUserId()}">
									<img
									src="${contextRoot}/${p.getPostBeShared().getPostUser().getPhotoPath()}"
									alt="" style="width: 40px; height: 40px; border-radius: 50%;" />
									${p.getPostBeShared().postUser.getNickName()}
								</a> &nbsp;
								<!-- whoCanSeeIt圖示 -->
								<c:if test="${p.getPostBeShared().getWhoCanSeeIt() == 1}">
									<i id="public" class="fa fa-globe" aria-hidden="true"></i>
								</c:if>
								<c:if test="${p.getPostBeShared().getWhoCanSeeIt() == 2}">
									<i id="followers" class="fa fa-users" aria-hidden="true"></i>
								</c:if>
								<c:if test="${p.getPostBeShared().getWhoCanSeeIt() == 3}">
									<i id="onlyMe" class="fa fa-lock" aria-hidden="true"></i>
								</c:if>
								<!--被分享貼文內容 -->
								<p>${p.getPostBeShared().getPostText()}</p>
								<c:forEach items="${p.getPostBeShared().getPostImg()}"
									var="sharedPostImg" varStatus="loop">
									<ul class="gallery">
										<li><img
											src="${contextRoot}/${sharedPostImg.getPostImgPath()}">
										</li>
									</ul>
								</c:forEach>
							</div>
						</c:if>
							</div> 
							<!-- 按讚/評論/修改/刪除 按鈕 -->
							<div class="activity__list__footer">
								<a id="like${vs.index}"> <i onclick="likeIconFunction(this)"
									class="fa fa-thumbs-up"></i>${p.getPostLike()}</a> <a
									id="commentCount${vs.index}"> <i class="fa fa-comments"></i>${p.getComments().size()}</a>
							<c:if test="${!empty guest}">
								<c:if test="${p.postUser.getUserId() == userOrigin.getUserId()}">
									<a href="#" role="button" data-toggle="modal"
										data-target="#myModal${vs.index}"
										id="viewDetailButton${vs.index}"> <i class="fa fa-pencil"></i>Edit
									</a>
									<a href="#" role="button" data-toggle="modal"
										data-target="#myModal${vs.index}deleteCheck"
										id="viewDetailButton${vs.index}"> <i class="fa fa-trash"></i>Delete
									</a>
								</c:if>
							</c:if>
							<c:if test="${empty guest}">
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
								</c:if>
								<div style="margin-left: auto;">
									<fmt:formatDate pattern='YYYY-MM-dd HH:mm:ss' value='${p.getPostTime()}' />
								</div>
							</div>
<!-- 							</li> -->
<!-- 					</ul> -->
					<!-- 取得按讚關聯的postID -->
					<input id="likedPostId${vs.index}" value="${p.getPostId()}"
						style="visibility: hidden;">
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

					<!-- 彈出貼文修改框 -->
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
										<textarea id="postText${p.postId}" name="postText" class="form-control"
											style="border-style:; overflow: hidden;margin: 20px 0;">${p.getPostText()}</textarea>
											<script>
												$(function(){
													$("#postText${p.postId}").change(function(e){
														var contextRoot = "/demo";
														let id = "${p.postId}";
														$.ajax({
															url: contextRoot + "/timmy/updatePostTextAjax?text=" + e.target.value + "&id=" + id  ,
															method: "get",
															success: console.log("success"),
														})
													})
												})
											</script>
										<div style="margin:20px 10px ;">
											<table class="table" id="editPhotoTable${p.postId}">
												<tbody>
													<tr>
														<c:forEach items="${p.getPostImg()}" var="pImg" varStatus="loop">
															<td id="showPostImg${pImg.postImgId}"><img name="${pImg.postImgId}o" src="${contextRoot}${pImg.getPostImgPath()}" width="100px"></td>
														</c:forEach>
													</tr>
													<tr id="testEvent${p.getPostId()}">
														<c:forEach items="${p.getPostImg()}" var="pImg" varStatus="loop">
															<td id="td${pImg.postImgId}">
																<button type="button" class="btn btn-outline-secondary icon smallIcon delPostImgBtn" name="${pImg.postImgId}">
																	<img src="${contextRoot}/img/userimg/delete.png" width="30" class="smallIcon delPostImgBtn" name="${pImg.postImgId}">
																</button>
															</td>
														</c:forEach>
													</tr>
												</tbody>
											</table>
										</div>
										<!-- footer -->
										<div>
											<div>
												<label> <input
													style="position: absolute; opacity: 0;" type="file"
													name="postImg" id="file${p.postId}" multiple
													accept="image/gif,image/jpeg,image/x-png" /> <i
													class="fa fa-image"></i>
												</label> &emsp; <label> <input
													style="position: absolute; opacity: 0;" type="file"
													name="postVideo" id="video${p.postId}" accept="video/*" /> <i
													class="fa fa-video-camera"></i>
												</label>
											</div>
											<button type="button" id="closeBTN${p.postId}" class="btn btn-sm btn-rounded btn-info">close</button>
											<div id="deleteTimesRecord${p.postId}" style="display:none">0</div>
											<script type="text/javascript">
												$(function(){
													var contextRoot = "/demo";
													var add = 1;
													onceAdd = 0;
													var delTimes = 0;
// 													以下是上傳圖片的方法---------------------------------------------
													$("#file${p.postId}").change(function(e){
														showPhoto(this);
													})
													$("#closeBTN${p.postId}").click(function(){
														add = 0;
														onceAdd = 0;
														delTimes = 0;
														$("#deleteTimesRecord${p.postId}")[0].innerHTML = 0;
														window.location.reload();
													})
													// 更改input 就會執行以下方法
													function showPhoto(input){
														var datas;
														var photoJsonArray = [];
														for (let i=0; i<input.files.length; i++){
															if (input.files && input.files[0]){
																var reader = new FileReader();
																// 圖片讀取完會做的事
																reader.onload = function(e){
																	 // 取得照片table的子節點
																	let postImg = $("#editPhotoTable${p.postId}").children().children()[0];
																	let postImgDel = $("#editPhotoTable${p.postId}").children().children()[1];
																	// 預覽圖片
																	let deleteTime = parseInt($("#deleteTimesRecord${p.postId}")[0].innerHTML);
																	postImg.innerHTML = postImg.innerHTML + "<td><img name='add" + add  + "o' src='"+ e.target.result +"' width='100px'></td>";
																	postImgDel.innerHTML = postImgDel.innerHTML + "<td><button type='button' name='add" + (add) + "' class='btn btn-outline-secondary icon smallIcon delPostImgBtn' ><img name='add" + (add) + "' src='${contextRoot}/img/userimg/delete.png' width='30' class='smallIcon delPostImgBtn'></button></td>";
																	add += 1;
																	// 整理要傳送的單筆資料
																	var datao = {
																			"img64": e.target.result,   // 讀取圖片完的Bytes
																			"type": input.files[i].type + deleteTime,   // 該圖片的type
																			"id": "${p.postId}"   // 該貼文的ID
																	};
																	// 把每一筆資料存進JSON陣列
																	photoJsonArray.push(datao);
																	// 轉換一下格式
																	datas = JSON.stringify(photoJsonArray);
																	// 當所有圖片讀取完之後，傳回後端
																	if (i == input.files.length - 1){
																		$.ajax({
																			url: contextRoot + '/timmy/uploadPostImgAjax',  // 該controller在PostSettingController
																			contentType: 'application/json; charset=utf-8',
																			dataType: 'text',
																			method: 'post',
																			data: datas,
																			success: function(result){
																				console.log("result:" + result);
																			},
																			error: function(result){
																				console.log(result);
																			}
																		});
																	}
																}
																// 圖片開始讀取
																reader.readAsDataURL(input.files[i]);
																}
														}
													}
// 													以下是刪除圖片的方法---------------------------------------------
													// 由於動態新增的元素無法增添事件處理，所以使用父元素代替，因事件會傳遞
													var postID = '${p.postId}';
													$("#testEvent${p.getPostId()}").on("click", function(e){
														if (e.target.classList.contains('delPostImgBtn')){
															let iD = e.target.getAttribute("name") // ${pImg.postImgId}
	//															跳出彈出視窗
															console.log(iD);
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
															      'Your photo has been removed.',
															      'success'
															    ).then((result) => {
																	  if (result.isConfirmed) {
	//																			刪掉資料庫的資料
																			$.ajax({
																				url: contextRoot + "/timmy/deletePostImgAjax?imgId=" + iD + "&postId=" + postID +"&onceAdd=" + onceAdd,
																				method: 'get',
																				success: function(result){
																					// 刪掉該圖片有關的html
																					$("button[name='" +iD +"']").parent('td')[0].remove();
																					$("img[name='" + iD + "o']").parent('td')[0].remove();
																					onceAdd += 1;
																					if (iD.includes("add")){
																						delTimes += 1;
																					}
																					
																					$("#deleteTimesRecord${p.postId}")[0].innerHTML = delTimes;
																				},
																				error: function(result){
																					console.log(result);
																				}
																			})
																		  }
																		})
															  }
															})
														}
													})
												});
											</script>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- 彈出貼文刪除確認 -->
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
										action="${contextRoot}/movePostToTrash.controllerT?postId=${p.getPostId()}">
										<button type="submit" class="btn btn-info">Move</button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<!-- 評論 -->
					<div style="background-color: #F0F0F0; padding: 15px; border-radius: 1%">
					<!-- 重複的結構 -->
					<div id="ItemsCard${p.getPostId()}">
						<div>
							<c:forEach items="${p.getComments()}" var="c" varStatus="Cvs">
								<div class="comment${p.getPostId()}" class="box-footer box-comments">
									<div class="box-comment">
										<div class="comment-text">
										
										<a href="${contextRoot}/timmy/readUserById/${c.getUser().getUserId()}" style="color:black;text-decoration:none;">
											<img class="img-circle img-sm"
												src="${contextRoot}/${c.getUser().getPhotoPath()}"
												alt="User Image"
												style="width: 40px; height: 40px; border-radius: 50%">
												&nbsp;${c.getUser().getNickName()}
										</a>
										<br>
										<!-- 	取得評論id -->
										<input id="commentId${Cvs.index}" value="${c.getCommentId()}"
										style="display:none">
										<p class="text-muted pull-right courseTime${p.getPostId()}"><fmt:formatDate pattern='YYYY-MM-dd HH:mm:ss' value='${c.getCommentTime()}' /></p>
											<!-- 	是作者才會顯示的修改刪除按鈕		 -->
	<!-- 										Todo: 修正會員管理趣無法修改貼文的問題 -->
											<c:if test="${!empty guest }"> 
												<c:if test="${c.user.getUserId() == userOrigin.getUserId()}">
													<p style="float: right; margin-right: 30px">
													<a href="#" role="button" data-toggle="modal"
														data-target="#myModal${c.getCommentId()}deleteCommentCheck"
														id="viewDetailButton${Cvs.index}"><img src="${contextRoot}/img/userimg/delete.png" class="udateicon" width="25">
													</a>
													</p>
												</c:if>
											</c:if>
											<c:if test="${empty guest }"> 
												<c:if test="${c.user.getUserId() == user.getUserId()}">
													<p style="float: right; margin-right: 30px">
														<a href="#" role="button" data-toggle="modal"
															data-target="#myModal${c.getCommentId()}deleteCommentCheck"
															id="viewDetailButton${Cvs.index}"><img src="${contextRoot}/img/userimg/delete.png" class="udateicon" width="25">
														</a>
													</p>
												</c:if>
											</c:if>
										</div>
										
										&emsp; &emsp; ${c.getCommentText()}
<%-- 										<p class="courseTime" style="display:none">${c.getCommentId()}</p> --%>
										<hr>
									</div>
								
								
						<!-- 彈出評論刪除確認 -->
						<div class="modal fade" id="myModal${c.getCommentId()}deleteCommentCheck"
							tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Delete Comment?</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<p aria-hidden="true">&times;</p>
										</button>
									</div>
									<div class="modal-body">Are you sure you want to delete this comment?</div>
									<div class="modal-footer">
										<button id="deleteComment${c.getCommentId()}" type="submit" class="btn btn-info">Delete</button>
										<button type="button" class="btn btn-light"
											data-dismiss="modal">No</button>
									</div>
								</div>  
							</div>
						</div>
								
								<script type="text/javascript">
								//刪除評論ajax
								$(document).ready(function() {
									var contextRoot = "/demo";
									$("#deleteComment${c.getCommentId()}").off().click(function() {
										var id = ${c.getCommentId()};
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
	//	 										$( "#commentDiv" ).load(window.location.href + " #commentDiv" );
	//	 										$( "#commentCount${vs.index}" ).load(window.location.href + " #commentCount${vs.index}" );
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
								</div>
								</c:forEach>
							</div>
						</div>
						<script>
						$(function(){
							  var DESC = function(a, b) {
								   let x = $(a).find('.courseTime${p.getPostId()}').text();
								   let y = $(b).find('.courseTime${p.getPostId()}').text();
								   console.log("x: " + x);
								   console.log("y: " + y);
								   return new Date(x) > new Date(y) ? 1 : -1;
							  }
							  function sortByInput(sortBy) {
								   var sortEle = $('#ItemsCard${p.getPostId()}>div>.comment${p.getPostId()}').sort(sortBy);
								   $('#ItemsCard${p.getPostId()}>div').empty().append(sortEle);
							  }
							  sortByInput(DESC);
						})
						</script>
					<!-- 重複的結構 -->
						<div class="box-footer">
						<c:if test="${!empty guest}">
							<img class="img-responsive img-circle img-sm"
								src="${contextRoot}/${userOrigin.getPhotoPath()}" alt="Alt Text"
								style="width: 40px; height: 40px; border-radius: 50%">
						</c:if>
						<c:if test="${empty guest}">
							<img class="img-responsive img-circle img-sm"
								src="${contextRoot}/${user.getPhotoPath()}" alt="Alt Text"
								style="width: 40px; height: 40px; border-radius: 50%">
						</c:if>
							<div class="img-push" style="margin-top:15px">
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
							$(document) .ready(function() {
								var contextRoot="/demo";
								$("#like${vs.index}") .off() .click(function() {
										var id=$("#likedPostId${vs.index}")[0].value;
										var datas= {
											"id" : id
										}
										var jsonData=JSON .stringify(datas);
										console .log(jsonData);
										$ .ajax({
											url : contextRoot + "/postLike.controller",
											method : 'post',
											contentType : 'application/json',
											data : jsonData,
											success : function(result) {
												console .log(result);
												// 局部刷新，讓按讚數可以馬上顯示
												$("#like${vs.index}") .load(window.location.href + " #like${vs.index}");
											}
											,
											error : function(error) {
												console .log(error);
											}
										})
									})
							});
 							</script>
						</div>
					</div>
				</div>
				
				<script>
						//送出評論ajax
						$(document).ready(function() {
							var contextRoot = "/demo";
// 							$("#sub${vs.index}").off().click(function() {
							document.querySelector('#commentText${vs.index}').addEventListener('keypress', function (event) {
								if (event.key === 'Enter') {  //監聽鍵盤輸入事件，當事件為「Eenter」時執行程式
								var postId = $("#postId${vs.index}")[0].value;
								var commentText = $("#commentText${vs.index}")[0].value;
								var datas = {
									"postId" : postId,
									"commentText" : commentText
								};
								var jsonData = JSON.stringify(datas);
								console.log(jsonData);
								event.target.value = '';  //清除input內容
								
								$.ajax({
 									
									url : contextRoot + "/addComment.controller",
									method : 'post',
									contentType : 'application/json',
									data : jsonData,
									success : function(result) {
										console.log(result);
										
// 										局部刷新，讓新增的評論可以馬上顯示
										window.location.reload();
// 										$( "#commentDiv" ).load(window.location.href + " #commentDiv" );
// 										$( "#commentCount${vs.index}" ).load(window.location.href + " #commentCount${vs.index}" );

										//新增HTML，創建元素後塞入目標元素
// 							            let tempdiv1 = document.createElement('div');
// 							            let tempdiv2 = document.createElement('div');
// 							            let tempdiv3 = document.createElement('div');
// 							            let tempa1 = document.createElement('a');
// 							            let tempimg = document.createElement('img');
// 							            let tempspan1 = document.createElement('span');
// 							            let tempspan2 = document.createElement('span');
// 							            let tempa2 = document.createElement('a');

// 							            let tempInput = document.createElement('input');
// 							            tempInput.type = 'checkbox';

// 							            let tempSpan = document.createElement('span');
// 							            tempSpan.innerHTML = newTodoString;

// 							            let tempBTN = document.createElement('button');
// 							            tempBTN.classList.add('btn');
// 							            tempBTN.classList.add('btn-danger');
// 							            tempBTN.innerHTML = '刪除';

// 							            tempLabel.appendChild(tempInput);
// 							            tempLabel.appendChild(tempSpan);

// 							            tempLi.appendChild(tempLabel);
// 							            tempLi.appendChild(tempBTN);

// 							            todoMain.appendChild(tempLi);

									},
									error : function(error) {
										console.log(error);
									}
								})
								}})
						});
						
					</script>
				</c:if>
			</c:forEach>
</body>
<script type="text/javascript">
//上傳一張圖片
// imgInp.onchange = evt => {
// 	  const [file] = imgInp.files
// 	  if (file) {
// 	    blah.src = URL.createObjectURL(file)
// 	  }
// 	}

//上傳多張圖片
var result=document.getElementById("result");  
var file=document.getElementById("file");  

function readAsDataURL(){  

var file = document.getElementById("file").files;
var result=document.getElementById("result");  

for(i = 0; i< file.length; i ++) {
    var reader    = new FileReader();    
    reader.readAsDataURL(file[i]);  
    reader.onload=function(e){  
        //多圖預覽
        result.innerHTML = result.innerHTML + '<img src="' + this.result +'" alt=""  width="auto" height="100"/>';  
    }

}

}  

</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.29/dist/sweetalert2.all.min.js"></script>

</html>