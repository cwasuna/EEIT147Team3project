$(document).ready(function() {
		var contextRoot = "/demo";
		$(".userSetting").on("change", function(e) {
			var val = e.target.value;
			var hea = e.target.getAttribute("name")
			var datat = {
				"value" : val,
				"header" : hea
			};
			console.log(datat);
			$.ajax({
				url : contextRoot + '/timmy/updateDataAjax',
				contentType : 'application/json',
				dataType : 'text',
				method : 'post',
				data : JSON.stringify(datat),
				success : function(result) {
					console.log(result);
					if (hea == "nickName") {
						var head = document.getElementById("hello");
						head.innerHTML = result;
						var puN = document.querySelectorAll(".postUserName");
						if (puN != null){
								for (var i=0; i<puN.length;i++)
								puN[i].innerHTML = result;
						}
						var pSNN = document.querySelectorAll(".preShowNickName");
						if (pSNN != null){
								for (let j=0; j<pSNN.length;j++){
									pSNN[j].innerHTML = result;
								}
						}
						var nBN = document.querySelectorAll("#navBarName");
						if (nBN != null){
								for (let j=0; j<nBN.length;j++){
									nBN[j].innerHTML = '&emsp;' + result;
								}
						}
					}
					if (hea == "email") {
						var err = document.getElementById("emailerror");
						err.innerHTML = result;
						document.getElementById("preShowEmail").innerHTML = result;
					}
					if (hea == "birthday"){
						document.getElementById("preShowBirthday").innerHTML = result;
					}
					if (hea == "phone"){
						document.getElementById("preShowPhone").innerHTML = result;
					}
					if (hea == "selfIntroduction"){
						document.getElementById("preShowIntroduction").innerHTML = result;
					}
				},
				error : function(error) {
					console.log(error);
				}
			})
		})

	});
