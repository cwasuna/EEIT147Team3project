<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
	#emailerror,
	#oldpwderror,
	#newpwderror {
		color: red;
	}

	.col-sm-2 {
		padding: 0;
		text-align: center;
	}

	.icon {
		background-color: white;
		border: 2px solid #ced4da;
	}
</style>

<body>
	<c:if test="${!empty guest}">
		<c:set var="user" value="${guest}" />
	</c:if>
	<label class="form-label">Email:</label>
	<p id="emailerror" style="display:inline"></p>
	<div class="row" id="write" style="display: none">
		<div class="col-sm-5" style="padding-right: 0">
			<input type="text" class="form-control" name="font" id="num">
		</div>
		<div class="input-group mb-2 col-sm-5" style="padding-right: 0">
			<div class="input-group-prepend">
				<div class="input-group-text">@</div>
			</div>
			<input type="text" class="form-control" name="below" id="inlineFormInputGroup">
		</div>
		<div class="col-sm-2">
			<button class="btn btn-outline-secondary icon smallIcon" id="enter">
				<img src="${contextRoot}/img/userimg/enter.png" class="udateicon" width="18">
			</button>
		</div>
	</div>
	<%-- </form> --%>
	<div class="row" id="show">
		<div class="col-sm-11" style="padding-right: 1">
			<input id="showEmail" class="form-control" name="email" value="${user.email }" disabled="disabled">
		</div>
		<div class="col-sm-1" style="padding-right: 0" >
			<button id="pencil" class="btn btn-outline-secondary icon smallIcon">
				<img src="${contextRoot}/img/userimg/pencil.png" class="udateicon" width="18">
			</button>
		</div>
	</div>
	<br>
	<div>
		<label class="form-label">Password:</label>
		<div class="row" id="show"> 
			<div class="col-sm-11" style="padding-right: 1">
				<input class="form-control" type="password" id="password" name="password" value="${user.password }" disabled="disabled">
			</div>
			<div class="col-sm-1" style="padding-right: 0">
				<a class="btn btn-outline-secondary icon smallIcon" role="button" data-toggle="modal" data-target="#myModal" id="viewDetailButton"><img src="${contextRoot}/img/userimg/pencil.png" width="18"></a>
			</div>
		</div>
		<!-- 框體調整 -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- 彈出標題 -->
					<div class="modal-header">
						<h4 class="modal-title">Edit Password:</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<!-- 彈出內容 -->
					<div class="modal-body">
						<!-- 修改表單 -->
						<form>
							<div class="form-row" style="text-align: left;">
								<!--密碼-->
								<div class="form-group col-md-6" style="text-align: left;">
									<!-- 								----------------------------------- -->
									<label for="inputPassword4">Please enter the old
										password：</label><p id="oldpwderror"></p>
									<div class="row" id="show">
										<div class="col-sm-11" style="padding-right: 1">
											<input class="form-control" type="password" id="oldpwd">
										</div>
										<button type="reset" id="reset" style="display:none"></button>
										<div class="col-sm-1" style="padding-right: 0">
											<button type="button" class="btn btn-outline-secondary icon smallIcon"
												id="checkPassword">
												<img src="${contextRoot}/img/userimg/enter.png" id="pwdenter"
													width="18">
												<img src="${contextRoot}/img/userimg/check.png" id="checkicon"
													width="22" style="display:none">
											</button>
										</div>
									</div>
									<!-- 								----------------------------------- -->
									<div id="updPwd" style="display:none">
										<label>New Password：</label>
										<div class="row">
											<div class="col-sm-11" style="padding-right: 1">
												<input class="form-control" type="password" id="newpwd" required="required" maxlength="12">
											</div>
										</div>
										<label>Check Password：</label><p id="newpwderror"></p>
										<div class="row">
											<div class="col-sm-11" style="padding-right: 1">
												<input class="form-control" type="password" id="checkpwd" required="required" maxlength="12">
											</div>
											<div class="col-sm-1" style="padding-right: 0" >
												<button type="button" class="btn btn-outline-secondary icon" id="checkpwdicon" style="display:none">
													<img src="${contextRoot}/img/userimg/check.png" 
															width="22">
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="edit" style="display:none">Edit</button>
								<button type="button" class="btn btn-danger" id="closeit" data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div>
		<label class="form-label">Nickname:</label> <input class="form-control userSetting" name="nickName"
			value="${user.nickName }">
	</div>
	<br>
	<div>
		<label class="form-label">Birthday:</label>
		<input id="showDate" type="date" class="form-control userSetting" name="birthday">
		<div id="hideDate" hidden="true">
			<fmt:formatDate pattern='YYYY-MM-dd' value='${user.birthday}' />
		</div>
	</div>
	<br>
	<div>
		<label class="form-label">Phone:</label> <input class="form-control userSetting" name="phone"
			value="${user.phone }" maxlength="10">
	</div>
	<br>
	<div style="margin-bottom:8px">
		<label class="form-label">Address:</label>
		<div class="row" id="showAddress">
			<div class="col-sm-11" style="padding-right: 1">
				<input class="form-control userSetting" name="address" value="${user.address }" id="address" disabled="disabled">
			</div>
			<div class="col-sm-1" style="padding-right: 0">
				<button id="pencilAddress" class="btn btn-outline-secondary icon smallIcon" onclick="editAddress()" >
					<img src="${contextRoot}/img/userimg/pencil.png" width="18" >
				</button>
			</div>
		</div>
	</div>
		
	<div class="row" id="editAddress" style="display:none">
		<div class="col-sm-3" style="padding-right: 0">
			<select id="town" class="custom-select" onchange="setPosition()"></select>
		</div>
		<div class="col-sm-3" style="padding-right: 0">
			<select id="position" class="custom-select" onchange="setPositionNumber()"></select> 
		</div>
		<div style="display: none">
			<input id="positionNumber" type="text" class="form-control" placeholder="輸入地區號碼"> 
		</div>
		<div class="col-sm-5" style="padding-right: 1">
			<input id="completeAddress" type="text" class="form-control" placeholder="輸入地址" >
		</div>
		<div class="col-sm-1" style="padding-right: 0">
			<button class="btn btn-outline-secondary icon smallIcon" id="enterAddress" onclick="setAddress()">
				<img src="${contextRoot}/img/userimg/enter.png" width="18">
			</button>
		</div>
	</div>
	<br>
	<div>
		<label class="form-label">Introduction:</label>
		<textarea class="form-control userSetting" name="selfIntroduction">${user.selfIntroduction }</textarea>
	</div>
	<div>
		<h4>&nbsp;&nbsp;</h4>
		<button id="fastEnter" type="button" class="btn btn-primary" style="margin-left:80%">一鍵修改</button>
		<script>
			$(function(){
				$("#fastEnter").on("click", function(){
					let testName = "changetest";
					let testBirthday = "2022-01-01";
					let testPhone = "0912345678";
					let testIntroduction = "testing..........."
					$("input[name=nickName]").attr("value", testName);
					$("input[name=birthday]").attr("value", testBirthday);
					$("input[name=phone]").attr("value", testPhone);
					$("textarea[name=selfIntroduction]").text(testIntroduction);
					$("#hello").text(testName);
					$("#navBarName")[0].innerHTML = "&emsp;" + testName;
					$("#preShowBirthday").text(testBirthday);
					$("#preShowPhone").text(testPhone);
					$("#preShowIntroduction").text(testIntroduction);
					let dataOrigin = {
							"name":testName,
							"birthday":testBirthday,
							"phone":testPhone,
							"introduction": testIntroduction
					};
					$.ajax({
						url: "/demo/timmy/oneBtnToUpdateUserAjax",
						contentType: "application/json",
						method: "post",
						data: JSON.stringify(dataOrigin),
						success: function(result){
							console.log(result);
						},
						error: function(result){
							console.log(result);
						}
					})
				})
			});
		</script>
	</div>
		
</body>
<script src="${contextRoot}/js/timmy_js/updatedata.js"></script>
<script src="${contextRoot}/js/timmy_js/checkpassword.js"></script>
<script>
	$(document).ready(function () {
		var hideDate = $("#hideDate").html();
		var showDate = $("#showDate");
		document.getElementById("showDate").setAttribute("value", hideDate.trim());
	});
</script>
<script>
	$(document)
		.ready(
			function () {
				var emailString = "${user.email}";
				var atpos = emailString.lastIndexOf("@");
				var num = emailString.substring(0, atpos);
				var mail = emailString.substring(atpos + 1);
				var contextRoot = "/demo";
				$("#num")[0].setAttribute("value", num);
				$("#inlineFormInputGroup")[0].setAttribute("value",
					mail)
				$("#pencil").click(
					function () {
						$("#show")[0].setAttribute("style",
							"display:none");
						$("#write")[0].setAttribute("style",
							"display:");
						$("#num").focus();
						$("#num")[0].value = "";
						$("#num")[0].value = num;
					});
				var font = $("#num");
				var fn = font[0].getAttribute("value");
				var below = $("#inlineFormInputGroup");
				var be = below[0].getAttribute("value");
				$('#write').blur(
					function () {
						$("#show")[0].setAttribute("style",
							"display:");
						$("#write")[0].setAttribute("style",
							"display:none");

					});
				$("#enter")
					.click(
						function () {
							fn = font[0].value;
							be = below[0].value;
							var errors = document
								.getElementById("emailerror");
							errors.innerHTML = "";
							if (fn.length == 0 || be.length == 0) {
								errors.innerHTML = "column is empty";
								font[0].value = num;
								below[0].value = mail;
							}
							if (num == fn && mail == be) {
								$("#show")[0].setAttribute(
									"style", "display:");
								$("#write")[0]
									.setAttribute("style",
										"display:none");
							} else if (errors.innerHTML.length == 0) {
								var datao = {
									"value": fn,
									"header": be
								};
								$.ajax({
										url: contextRoot + "/timmy/updateEmailAjax",
										contentType: "application/json",
										dataType: 'text',
										method: 'post',
										data: JSON.stringify(datao),
										success: function (result) {
											console.log("ajax success:" + result);
											if (result == "email has been used") {
												errors.innerHTML = result;
												
											} else {
												emailString = result;
												atpos = emailString.lastIndexOf("@");
												num = emailString.substring(0, atpos);
												mail = emailString.substring(atpos + 1);
												$("#showEmail")[0].value = num + "@" + mail;
												$("#show")[0].setAttribute("style","display:");
												$("#write")[0].setAttribute("style","display:none");
												document.getElementById("preShowEmail").innerHTML = result;
											}
										},
										error: function (error) {
											console.log(error);
										}
									})
							}
						});
			});
</script>
<script>
function setTown() {
    AddressArray = [
        ['台北市', '100中正區', '103大同區', '104中山區', '105松山區', '106大安區', '108萬華區', '110信義區', '111士林區', '112北投區', '114內湖區', '115南港區', '116文山區'],
        ['台北縣', '207萬里鄉', '208金山鄉', '220板橋市', '221汐止市', '222深坑鄉', '223石碇鄉', '224瑞芳鎮', '226平溪鄉', '227雙溪鄉', '228貢寮鄉', '231新店市', '232坪林鄉', '233烏來鄉', '234永和市', '235中和市', '236土城市', '237三峽鎮', '238樹林市', '239鶯歌鎮', '241三重市', '242新莊市', '243泰山鄉', '244林口鄉', '247蘆洲市', '248五股鄉', '248新莊市', '249八里鄉', '251淡水鎮', '252三芝鄉', '253石門鄉'],
        ['台中市', '400中區', '401東區', '402南區', '403西區', '404北區', '406北屯區', '407西屯區', '408南屯區'],
        ['台中縣', '411太平市', '412大里市', '413霧峰鄉', '414烏日鄉', '420豐原市', '421后里鄉', '422石岡鄉', '423東勢鎮', '424和平鄉', '426新社鄉', '427潭子鄉', '428大雅鄉', '429神岡鄉', '432大肚鄉', '433沙鹿鎮', '434龍井鄉', '435梧棲鎮', '436清水鎮', '437大甲鎮', '438外埔鄉', '439大安鄉'],
        ['台東縣', '950台東市', '951綠島鄉', '952蘭嶼鄉', '953延平鄉', '954卑南鄉', '955鹿野鄉', '956關山鎮', '957海端鄉', '958池上鄉', '959東河鄉', '961成功鎮', '962長濱鄉', '963太麻里鄉', '964金峰鄉', '965大武鄉', '966達仁鄉'],
        ['台南市', '700中西區', '701東區', '702南區', '704北區', '708安平區', '709安南區'],
        ['台南縣', '710永康市', '711歸仁鄉', '712新化鎮', '713左鎮鄉', '714玉井鄉', '715楠西鄉', '716南化鄉', '717仁德鄉', '718關廟鄉', '719龍崎鄉', '720官田鄉', '721麻豆鎮', '722佳里鎮', '723西港鄉', '724七股鄉', '725將軍鄉', '726學甲鎮', '727北門鄉', '730新營市', '731後壁鄉', '732白河鎮', '733東山鄉', '734六甲鄉', '735下營鄉', '736柳營鄉', '737鹽水鎮', '741善化鎮', '741新市鄉', '742大內鄉', '743山上鄉', '744新市鄉', '745安定鄉'],
        ['宜蘭縣', '260宜蘭市', '261頭城鎮', '262礁溪鄉', '263壯圍鄉', '264員山鄉', '265羅東鎮', '266三星鄉', '267大同鄉', '268五結鄉', '269冬山鄉', '270蘇澳鎮', '272南澳鄉', '290釣魚台'],
        ['花蓮縣', '970花蓮市', '971新城鄉', '972秀林鄉', '973吉安鄉', '974壽豐鄉', '975鳳林鎮', '976光復鄉', '977豐濱鄉', '978瑞穗鄉', '979萬榮鄉', '981玉里鎮', '982卓溪鄉', '983富里鄉'],
        ['金門縣', '890金沙鎮', '891金湖鎮', '892金寧鄉', '893金城鎮', '894烈嶼鄉', '896烏坵鄉'],
        ['南投縣', '540南投市', '541中寮鄉', '542草屯鎮', '544國姓鄉', '545埔里鎮', '546仁愛鄉', '551名間鄉', '552集集鎮', '553水里鄉', '555魚池鄉', '556信義鄉', '557竹山鎮', '558鹿谷鄉'],
        ['南海島', '817東沙群島', '819南沙群島'],
        ['屏東縣', '900屏東市', '901三地門鄉', '902霧台鄉', '903瑪家鄉', '904九如鄉', '905里港鄉', '906高樹鄉', '907鹽埔鄉', '908長治鄉', '909麟洛鄉', '911竹田鄉', '912內埔鄉', '913萬丹鄉', '920潮州鎮', '921泰武鄉', '922來義鄉', '923萬巒鄉', '924崁頂鄉', '925新埤鄉', '926南州鄉', '927林邊鄉', '928東港鎮', '929琉球鄉', '931佳冬鄉', '932新園鄉', '940枋寮鄉', '941枋山鄉', '942春日鄉', '943獅子鄉', '944車城鄉', '945牡丹鄉', '946恆春鎮', '947滿州鄉'],
        ['苗栗縣', '350竹南鎮', '351頭份鎮', '352三灣鄉', '353南庄鄉', '354獅潭鄉', '356後龍鎮', '357通霄鎮', '358苑裡鎮', '360苗栗市', '361造橋鄉', '362頭屋鄉', '363公館鄉', '364大湖鄉', '365泰安鄉', '366銅鑼鄉', '367三義鄉', '368西湖鄉', '369卓蘭鎮'],
        ['桃園縣', '320中壢市', '324平鎮市', '325龍潭鄉', '326楊梅鎮', '327新屋鄉', '328觀音鄉', '330桃園市', '333龜山鄉', '334八德市', '335大溪鎮', '336復興鄉', '337大園鄉', '338蘆竹鄉'],
        ['高雄市', '800新興區', '801前金區', '802苓雅區', '803鹽埕區', '804鼓山區', '805旗津區', '806前鎮區', '807三民區', '811楠梓區', '812小港區', '813左營區', '817東沙群島', '819南沙群島'],
        ['高雄縣', '814仁武鄉', '815大社鄉', '820岡山鎮', '821路竹鄉', '822阿蓮鄉', '823田寮鄉', '824燕巢鄉', '825橋頭鄉', '826梓官鄉', '827彌陀鄉', '828永安鄉', '829湖內鄉', '830鳳山市', '831大寮鄉', '832林園鄉', '833鳥松鄉', '840大樹鄉', '842旗山鎮', '843美濃鎮', '844六龜鄉', '845內門鄉', '846杉林鄉', '847甲仙鄉', '848桃源鄉', '849那瑪夏鄉', '851茂林鄉', '852茄萣鄉'],
        ['基隆市', '200仁愛區', '201信義區', '202中正區', '203中山區', '204安樂區', '205暖暖區', '206七堵區'],
        ['連江縣', '209南竿鄉', '210北竿鄉', '211莒光鄉', '212東引鄉'],
        ['釣魚台', '290釣魚台'],
        ['雲林縣', '630斗南鎮', '631大埤鄉', '632虎尾鎮', '633土庫鎮', '634褒忠鄉', '635東勢鄉', '636台西鄉', '637崙背鄉', '638麥寮鄉', '640斗六市', '643林內鄉', '646古坑鄉', '647莿桐鄉', '648西螺鎮', '649二崙鄉', '651北港鎮', '652水林鄉', '653口湖鄉', '654四湖鄉', '655元長鄉'],
        ['新竹市', '300北區', '300東區', '300香山區'],
        ['新竹縣', '300寶山鄉', '302竹北市', '303湖口鄉', '304新豐鄉', '305新埔鎮', '306關西鎮', '307芎林鄉', '308寶山鄉', '310竹東鎮', '311五峰鄉', '312橫山鄉', '313尖石鄉', '314北埔鄉', '315峨眉鄉'],
        ['嘉義市', '600西區', '600東區'],
        ['嘉義縣', '602番路鄉', '603梅山鄉', '604竹崎鄉', '605阿里山鄉', '606中埔鄉', '607大埔鄉', '608水上鄉', '611鹿草鄉', '612太保市', '613朴子市', '614東石鄉', '615六腳鄉', '616新港鄉', '621民雄鄉', '622大林鎮', '623溪口鄉', '624義竹鄉', '625布袋鎮'],
        ['彰化縣', '500彰化市', '502芬園鄉', '503花壇鄉', '504秀水鄉', '505鹿港鎮', '506福興鄉', '507線西鄉', '508和美鎮', '509伸港鄉', '510員林鎮', '511社頭鄉', '512永靖鄉', '513埔心鄉', '514溪湖鎮', '515大村鄉', '516埔鹽鄉', '520田中鎮', '521北斗鎮', '522田尾鄉', '523埤頭鄉', '524溪州鄉', '525竹塘鄉', '526二林鎮', '527大城鄉', '528芳苑鄉', '530二水鄉'],
        ['澎湖縣', '880馬公市', '881西嶼鄉', '882望安鄉', '883七美鄉', '884白沙鄉', '885湖西鄉']
    ]
    var townNode = document.getElementById("town");
    var txt1 = '<option value="0">縣市';
    for (let i = 1; i <= AddressArray.length; i++)
        txt1 += "<option value='" + (i - 1) + "''> " + AddressArray[i - 1][0];
    townNode.innerHTML = txt1;
}
function setPosition() {
    var townValue = document.querySelector("#town").value;
    var txt2 = '<option value="0">鄉鎮市區';
    for (let i = 1; i < AddressArray[townValue].length; i++)
        txt2 += "<option value='" + (i - 1) + "''> " + AddressArray[townValue][i].substring(3);
    var positionNode = document.getElementById("position");
    positionNode.innerHTML = txt2;
}
function setPositionNumber() {
    var townValue = document.querySelector("#town").value;
    var positionNode = document.getElementById("position");
    var positionNumber = AddressArray[townValue][parseInt(positionNode.value) + 1].substring(0, 3);
    var positionNumberNode = document.querySelector("#positionNumber")
    positionNumberNode.setAttribute("value", positionNumber);
    console.log(positionNumber)
    console.log(positionNode.value);
    console.log(positionNode.options[positionNode.selectedIndex].text)
}
function setAddress() {
    var tow = document.getElementById("town").options[document.getElementById("town").selectedIndex].text;
    var pos = document.getElementById("position").options[document.getElementById("position").selectedIndex].text;
    var com = document.getElementById("completeAddress").value;
    var add = document.getElementById("address");
    var newAddress = tow + pos + com;
    add.setAttribute("value", newAddress);
    var xhr = new XMLHttpRequest();
    if (xhr != null) {
	     xhr.onreadystatechange = function(){
		if (xhr.readyState === 4) {
				if (xhr.status === 200) {
					console.log("Ajax success")
					console.log(xhr.responseText)
				}
			}	
		};
		 xhr.open("GET", "<c:url value='/timmy/updateAddressAjax/' />?address=" + newAddress, true);
		 xhr.send();
	 }
    var editAddress = document.getElementById("editAddress");
    editAddress.setAttribute("style", "display:none");
}

function editAddress(){
	var editAddress = document.getElementById("editAddress");
	if (editAddress.getAttribute("style")=="display:")
    	editAddress.setAttribute("style", "display:none");
	else
		editAddress.setAttribute("style", "display:");
}

setTown();
setPosition();
</script>
</html>