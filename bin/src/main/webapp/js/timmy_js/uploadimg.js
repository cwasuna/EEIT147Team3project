$(document).ready(function () {
		$('#preview_progressbarTW_img').click(function(){
			$('#testfile').click();
		});
		var file = document.getElementById("testfile");
		file.onchange = function() {
			console.log(file.files[0]);
			readURL(this);
			console.log(this.files[0].type);
		};
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById("preview_progressbarTW_img")
							.setAttribute("src", e.target.result);
					console.log(typeof e.target.result);
					var datao = {
						"img64": e.target.result,
						"type": file.files[0].type
					}	
					var datas = JSON.stringify(datao);
					$.ajax({
						url: "<c:url value='/user/uploadImgAjax' />?id=${user.userId}",
						contentType: 'application/json',
						dataType: 'text',
						method: 'post',
						data: datas,
						success: function (result){
							console.log(result);
						},
						error: function (error){
							console.log(error);
						}	
					});
				}
			}
			reader.readAsDataURL(input.files[0]);
		}
	});