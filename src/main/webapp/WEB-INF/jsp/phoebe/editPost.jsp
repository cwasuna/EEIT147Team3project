<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit Post</title>
</head>
<body>
	<form action="${contextRoot}/editPost.controller?postId=${p.getPostId()}"
		class="panel-activity__status" method="post"
		enctype="multipart/form-data">
		<img src="${contextRoot}/img/phoebeImg/DefaultUserImage.png"
			style="width: 40px; height: 40px; border-radius: 50%;">
		${Users.getNickName()} <select name="whoCanSeeIt">
			<option value="1">Public</option>
			<option value="2">Follower</option>
			<option value="3">Only me</option>
		</select>
		<textarea name="postText"
			placeholder="Share what you've been up to..." class="form-control"></textarea>

		<div id="result" name="result"></div>

		<div class="actions">
			<div class="btn-group">
				<label> <input style="position: absolute; opacity: 0;"
					type="file" name="postImg" id="file" multiple
					onchange="readAsDataURL()"
					accept="image/gif,image/jpeg,image/x-png" /> <i
					class="fa fa-image"></i>
				</label> &emsp; <label> <input
					style="position: absolute; opacity: 0;" type="file"
					name="postVideo" id="file" accept="video/*" /> <i
					class="fa fa-video-camera"></i>
				</label>
			</div>
			<button type="submit" class="btn btn-sm btn-rounded btn-info">
				Post</button>
		</div>
	</form>
</body>
</html>