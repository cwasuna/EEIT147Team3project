<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<jsp:include page="../timmy/layout/navbar.jsp" />


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
<!--  All snippets are MIT license http://bootdey.com/license -->
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<title>profile timeline - Bootdey.com</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>

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
<script>
function loadXMLDoc()
{
	var xmlhttp;
	if (window.XMLHttpRequest)
	{
		//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		// IE6, IE5 浏览器执行代码
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET","${contextRoot}/ajaxtest",true);
	xmlhttp.send();
}
</script>


<!-- //CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<!-- //jq -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>



</head>




<body>
	<div class="wrap">
		<div class="left">
			<div class="container panel-heading shadow-lg p-3 mb-5 bg-body rounded">
				<div class="row justify-content-left">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<form action="${contextRoot}/fileuploadjoey" method="post"
									enctype="multipart/form-data">
									<img src="${contextRoot}${oneMember.photoPath}"
										style="width: 200px; height: 200px; border-radius: 50%;">
									<input type="hidden" id="${userId}" name="userId"
										value="${oneMember.userId}"> <br /> <input
										type="file" name="file"> <br /> <input type="submit"
										value="Submit" />
								</form>


							</div>
						</div>
					</div>
				</div>

	


				<div class="row justify-content-left">
					<div class="col-12">
						<div class="card">
						<div class="input-group mb-3 ">
							<div class="card-body">
							
								<div class="card-header">編輯公開資訊</div>
								
  								
								<form:form class="form" method="post" modelAttribute="oneMember"
									action="${contextRoot}/editMember">
									<form:input type="hidden" path="userId" />

									<form:input type="hidden" path="photoPath" />
										<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1">暱稱</span>
										
										<form:input type="text" path="nickName" 
										class="form-control" aria-label="nickName" aria-describedby="basic-addon1"/>
										</div>	
										<div class="input-group-prepend ">
										<span class="input-group-text" id="basic-addon1">簡介</span>
										
										<form:textarea type="text" path="selfIntroduction" style="height: 100px;"
											class="form-control" aria-label="selfIntroduction" aria-describedby="basic-addon1"/>
										</div>
									<!-- 							<br /> -->
									<!-- 							電話： -->
											<form:input type="hidden" path="phone" />
											<!-- 							<br /> -->
											<!-- 							地址： -->
											<form:input type="hidden" path="address" />
											<!-- 							<br /> -->
											<!-- 							生日： -->
											<form:input type="hidden" path="birthday" />
											<!-- 							<br /> -->
											<!-- 							分類： -->
											<form:input type="hidden" path="category" />
											<!-- 							<br /> -->
											<!-- 							信箱： -->
											<form:input type="hidden" path="email" />
											<!-- 							<br /> -->
											<!-- 							性別： -->
											<form:input type="hidden" path="gender" />
											<!-- 							<br /> -->
											<!-- 							密碼： -->
											<form:input type="hidden" path="password" />
											
											<button type="submit" class="btn btn-secondary">Submit</button>
								</form:form>
								
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="row justify-content-left">
					<div class="col-12">
						<div class="card">
							<div class="input-group mb-3 ">
								<div class="card-body">
									<div class="card-header">編輯私人資訊</div>
										<form:form class="form" method="post" modelAttribute="oneMember" action="${contextRoot}/editMember">
										<form:input type="hidden" path="userId" />
										<form:input type="hidden" path="photoPath" />
										<form:input type="hidden" path="selfIntroduction" />

										<form:input type="hidden" path="category" />
										<form:input type="hidden" path="gender" />
											<div class="input-group-prepend ">
												<span class="input-group-text" id="basic-addon1">電話</span>
												<form:input type="text" path="phone"
												class="form-control" aria-label="phone" aria-describedby="basic-addon1" />
											</div>
											<div class="input-group-prepend ">
												<span class="input-group-text" id="basic-addon1">地址</span>
												<form:input type="text" path="address"
												class="form-control" aria-label="address" aria-describedby="basic-addon1" />	
											</div>	
											<div class="input-group-prepend ">
												<span class="input-group-text" id="basic-addon1">生日</span>
												<form:input type="date" path="birthday"
												class="form-control" aria-label="birthday" aria-describedby="basic-addon1" />
											</div>
											<div class="input-group-prepend ">
												<span class="input-group-text" id="basic-addon1">信箱</span>
												<form:input type="text" path="email" 
												class="form-control" aria-label="email" aria-describedby="basic-addon1"/>
											</div>
											<div class="input-group-prepend ">
												<span class="input-group-text" id="basic-addon1">密碼</span>
												<form:input type="text" path="password" 
												class="form-control" aria-label="password" aria-describedby="basic-addon1"/>
											</div>							
											<button type="submit" class="btn btn-secondary">Submit</button>
										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			






		<div class="right">
			<div class="col-lg-12">
				<div class="panel">
					<div class="panel-heading">
						<span id="tab-1">Activity Feed</span>
						<span id="tab-2">Add Product</span> 
						<span id="tab-3">Order History</span> 
						<div id="tab">
							<ul>
								<li><a href="#tab-1">Activity Feed</a></li>
								<li><a href="#tab-2">Add Product</a></li>
								<li><a href="#tab-3">Order History</a></li>
							</ul>
							<!-- 頁籤的內容區塊 -->
							<div class="tab-content-1 tab-content-border">
								<div class="panel-content panel-activity" style="padding-top:20px">
									<div id="postManagerDiv" style="display:">
										<jsp:include page="../timmy/PostSetting.jsp" />
									</div>
								</div>
							</div>
							<div class="tab-content-2">
							<div class="panel-content panel-activity">
									
								<c:if test="${!empty user}">
									<form action="${contextRoot}/addProductJoey" class="panel-activity__status" method="post" enctype="multipart/form-data">
										<div class="addProd"><!--父元素-->
		   									<div class="addProdLeft ">
												<div class="panel-content panel-activity">
														<figure>
															<label>
																<img style="max-width:228px; max-height: 200px; margin-left:18px; margin-top:18px;" id="recipt" src="${contextRoot}/img/joeyimg/default_product_image.png" />
																<input type="file" id="rfile" name="productImg" onchange="photochange1(event,recipt)" accept=".png, .jpg, .jpeg" style="display: none;" />
															</label>
														</figure>
														<script type="text/javascript"> 
															function photochange1(event,imgid){
															var img=document.getElementById(imgid.id);
													 		var reader = new FileReader();
													 			img.src = URL.createObjectURL(event.target.files[0]);
													 			img.onload = function() {
													      		URL.revokeObjectURL(img.src) // free memory
													    		}
															}
		 												</script>
												</div>
											</div>
		    								<div class="addProdRight">
		    								<div class="panel-content panel-activity ">
												<div class="input-group mb-3">
													<span class="input-group-text">商品名稱</span> 
													<input type="text" class="form-control" placeholder="Product Name" name="productName" id="quickAddProductName" aria-label="Username"> <span
														class="input-group-text">金額</span> <input type="text" class="form-control" placeholder="Price"
														id="quickAddProductPrice" name="productPrice" aria-label="Server">
														
												</div>
												<div class="input-group">
													<span class="input-group-text">商品說明</span>
														<textarea style="height: 180px;" placeholder="Product Discription"
															name="productContext" class="form-control"
															aria-label="With textarea" id="productContext" ></textarea>
														<div class="d-grid d-md-block">
														  <button class="btn btn-primary quickAddProduct " type="button" style="height:88.5px;">一鍵輸入</button>
														  <button class="btn btn-secondary btn-block" type="button" id="addProductBtn" style="height: 88.5px;">新增商品</button>
														</div>
<!-- 														<div class="row g-2"> -->
<!-- 														  <button class="btn btn-primary btn-sm btn-block quickAddProduct" type="button">一鍵輸入</button> -->
<!-- 														  <button class="btn btn-secondary btn-sm btn-block" type="button" id="addProductBtn" >新增商品</button> -->
<!-- 														</div> -->
														<script type="text/javascript">
														$(".quickAddProduct").click(function() {
															  $("#quickAddProductName").val("全方位貓咪天然糧 8磅");
															  $("#quickAddProductPrice").val("2375");
															  $("#productContext").val("高肉類蛋白質營養好吸收，低碳水無穀配方，滿足愛吃肉肉的毛孩需求。低致敏系列含單一蛋白質配方，針對易食物過敏的毛孩設計。皮毛保健蘊含豐富Omega油脂，能柔亮毛髮，益生菌注入加強腸胃健康。");
															 });
														</script>
												</div>
													
											</div>
											
																
											</div>
										</div><!--wrap-->
								</form>
								<script>
									$(function(){
										$("#addProductBtn").on("click", function(){
											let imgName = $("#rfile")[0].files[0].name;
											let imgType = $("#rfile")[0].files[0].type;
											var reader = new FileReader();
											reader.onload = function(e){
												let img64 = e.target.result;
												let productName = $("input[name=productName]").val();
												let productPrice = $("input[name=productPrice]").val();
												let productContext = $("#productContext").val();
												let dataOrigin = {
														"productName":productName,
														"productPrice":productPrice,
														"productContext":productContext,
														"imgName":imgName,
														"imgType":imgType,
														"img64": img64
												};
												let datas = JSON.stringify(dataOrigin);
												console.log(datas);
												$.ajax({
													url: '/demo/joey/addNewProductAjax',
													contentType: 'application/json',
													dataType: 'text',
													method: 'post',
													data: datas,
													success: function(result) {
														console.log(result);
														Swal.fire({
															  icon: 'success',
															  title: 'This product has been created.',
															  showConfirmButton: false,
															  timer: 1500
															}).then(() => {
																window.location.reload();
															})
													},
													error: function(error) {
														console.log(error);
													}
												});
											}
											reader.readAsDataURL($("#rfile")[0].files[0]);
										})
									})
								</script>
									</c:if>
									
										<!-- 重複的結構（商品）-->
										
										<%int count = 0;%>
										<c:forEach items="${produtsToShow}" var="prod" varStatus="vs">
										<c:if test="${prod.productStatus == 1}">
											<%count++;%>
											<form
												action="${contextRoot}/editProdutjoey?productId=${prod.getProductId()}"
												class="panel-activity__status" method="post"
												enctype="multipart/form-data">
												
											<div class="editProd">
											   
											   <div class="editProdLeft">
											   	<div class="panel-content panel-activity">
											   		<figure class="figure">
<%-- 													<img id="<%=count%>" --%>
															<label id="productImg${prod.getProductId()}"><img id="<%=count%>"
																src="${contextRoot}${prod.getProductImg()}" 
																style="max-width:228px; max-height: 200px; margin-left:18px; margin-top:18px;" 
																class="figure-img img-fluid rounded "/> 
<!-- 														type="file" id="rfile" name="productImg" -->
															<input
															type="file" id="rfile${prod.getProductId()}" name="productImg"
															onchange="photochange(event,<%=count%> )"
															accept=".png, .jpg, .jpeg" style="display: none;" />
													</label>
													</figure>
												</div>
											   </div>
												<script type="text/javascript"> 
														function photochange(event,imgid){ 
	
														 console.log(imgid); 
				 											 console.log(imgid.id); 
															 var img=document.getElementById(imgid); 
				 											 var reader = new FileReader(); 
				 											 img.src = URL.createObjectURL(event.target.files[0]);
				 											 
				 											 img.onload = function() {
				 											      URL.revokeObjectURL(img.src) // free memory
															} 
																} 
// 														此為修改商品圖片的ajax
														$(function(){	//jQuery文件備妥處理器
															$("#rfile${prod.getProductId()}").on("change", function(){
																readURL(this); //這個function
															});
															var file = document.getElementById("#rfile${prod.getProductId()}");
															function readURL(input) {
																if (input.files && input.files[0]) {
																	var reader = new FileReader();
																	reader.onload = function(e) {
																		var datao = {
																			"id": ${prod.getProductId()},
																			"type": "",
																			"img64": e.target.result
																		};
																		var datas = JSON.stringify(datao);
																		$.ajax({
																				url: '/demo/joey/uploadProductImgAjax',
																				contentType: 'application/json',
																				dataType: 'text',
																				method: 'post',
																				data: datas,
																				success: function(result) {
																					console.log(result);
																					Swal.fire({
																						  icon: 'success',
																						  title: 'This change has been saved',
																						  showConfirmButton: false,
																						  timer: 1500
																						})
																				},
																				error: function(error) {
																					console.log(error);
																				}
																			});
																	}
																}
																reader.readAsDataURL(input.files[0]);
															}
														})
														
												</script> 
											<div class="editProdRight">
												<div class="panel-content panel-activity">
												<div class="input-group mb-3">

													<span class="input-group-text">商品名稱</span> <input
														type="text" class="form-control" id="productName${prod.getProductId()}"
														value="${prod.getProductName()}" name="productName"
														aria-label="Username"> <span
														class="input-group-text">金額</span> <input type="text" id="productPrice${prod.getProductId()}"
														class="form-control" value="${prod.getProductPrice()}"
														name="productPrice" aria-label="Server">

												</div>
												<div class="input-group">
													<span class="input-group-text">商品說明</span>
													<textarea style="height: 180px" name="productContext" class="form-control" id="description${prod.getProductId()}"
														aria-label="With textarea">${prod.getProductContext()}</textarea>
<!-- 													<button type="submit" -->
<!-- 														class="btn btn-secondary">修改商品</button> -->
													<div class="d-grid d-md-block ">
														  <button id="updateProductBtn${prod.getProductId()}" type="button" class="btn btn-secondary" style="height: 88.5px;">修改商品</button>
														  <button id="removeProductBtn${prod.getProductId()}" type="button" class="btn btn-danger btn-block"style="height: 88.5px;">刪除商品</button>
														</div>
													
														
												</div>
											</div>
											</div>
										</div>
									</form>
									<script>
										$(function(){
											
											$("#updateProductBtn${prod.getProductId()}").click(function(e){
// 												console.log(e.target.getAttribute("id"));
// 												console.log($("#productImg${prod.getProductId()}").children()[1])
												let imgSRC = $("#productImg${prod.getProductId()}").children()[1].files;
												console.log(imgSRC);
												console.log("imgSRC: " + imgSRC[0]);
												let productName = $("#productName${prod.getProductId()}").val();
												//console.log("productName:" + productName);
												let productPrice = $("#productPrice${prod.getProductId()}").val();
												let description = $("#description${prod.getProductId()}").val();
												let dataOrigin = {
														"productId":${prod.getProductId()},
														"productName":productName,
														"productPrice":productPrice,
														"description":description
												};
												let datas = JSON.stringify(dataOrigin);
												console.log(datas);
												$.ajax({
													url: "/demo" + "/joey/UpdateProductAjax",
													method: 'post',
													contentType: 'application/json',
													data: datas,
													success: function(){
                                                        Swal.fire({
                                                            icon: 'success',
                                                            title: 'This change has been saved.',
                                                            showConfirmButton: false,
                                                            timer: 1500
                                                          })
													}
												})
											})
										});
										
										

											
	$(function(){

		
		$("#removeProductBtn${prod.getProductId()}").click(function(e){

			let dataOrigin2 = {
					"productId":${prod.getProductId()}
			};		
			
			
			
			let datas2 = JSON.stringify(dataOrigin2);
			console.log(datas2);
			$.ajax({
				url: "/demo" + "/joey/removeProductAjax",
				method: 'post',
				contentType: 'application/json',
				data: datas2,
				success: function(){
                    Swal.fire({
                        icon: 'success',
                        title: 'This product has been removed.',
                        showConfirmButton: false,
                        timer: 1500
						}).then(() => {
							window.location.reload();
						})
						}})})	})
             
									</script>
								
									</c:if>
										</c:forEach>
										
										<!-- 					重複的結構 -->
										<script type="text/javascript">
										
											function photochange(event,imgid){
												
											 console.log(imgid);
											 console.log(imgid.id);
											 var img=document.getElementById(imgid);
											 var reader = new FileReader();
											 img.src = URL.createObjectURL(event.target.files[0]);
											 img.onload = function() {
											      URL.revokeObjectURL(img.src) // free memory
											}
												</script>
								
								
							</div>
							</div>
							
							<div class="tab-content-3">
								
								
										<canvas id="myChart"></canvas>
										<script type="text/javascript">
							
							var dateArray = new Array();
							
							var incomeArray = new Array();
							
							<c:forEach items="${ordersToShow}" var="o" varStatus="vs">
								dateArray.push('${o.getOrderDate()}');
								incomeArray.push('${o.getOrderPrice()}');
							</c:forEach>
							var newDateArray = new Array();
							for (let i=0;i<dateArray.length;i++){
								newDateArray.push(dateArray[i].substring(0,10))
							}</script>
										
										<input onchange="filterData()" type="date" id="startdate" value="2022-01-01"> 
										<input onchange="filterData()" type="date" id="enddate" value="2022-09-15">
																		

								
								<script type="text/javascript"
									src="https://cdn.jsdelivr.net/npm/chart.js"></script>
								<script>
    // setup 
	const dates = newDateArray;
	console.log('dates:'+dates);
	// const dates = ['2021-08-25', '2021-08-26', '2021-08-27', '2021-08-28', '2021-08-29', '2021-08-30', '2021-09-01'];
	const datapoints = incomeArray;
	// const datapoints = [1, 2, 3, 4, 5, 6, 8];
	// console.log('datapoints:'+datapoints);
    const data = {
      labels: dates,
      datasets: [{
        label: 'Weekly Sales',
        data: datapoints,
//         backgroundColor: [
//           'rgba(255, 26, 104, 0.2)',
//           'rgba(54, 162, 235, 0.2)',
//           'rgba(255, 206, 86, 0.2)',
//           'rgba(75, 192, 192, 0.2)',
//           'rgba(153, 102, 255, 0.2)',
//           'rgba(255, 159, 64, 0.2)',
//           'rgba(0, 0, 0, 0.2)'
//         ],
//         borderColor: [
//           'rgba(255, 26, 104, 1)',
//           'rgba(54, 162, 235, 1)',
//           'rgba(255, 206, 86, 1)',
//           'rgba(75, 192, 192, 1)',
//           'rgba(153, 102, 255, 1)',
//           'rgba(255, 159, 64, 1)',
//           'rgba(0, 0, 0, 1)'
//         ],
        borderWidth: 1
      }]
    };

    // config 
    const config = {
      type: 'bar',
      data,
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

    // render init block
    const myChart = new Chart(
      document.getElementById('myChart'),
      config
    );

	function filterData(){
		const dates2=[...dates];
		console.log('dates2:'+dates2);
		const startdate = document.getElementById('startdate');
		const enddate = document.getElementById('enddate');
		console.log('startdate:'+startdate);
		console.log('enddate:'+enddate);
		// get index number in array
		let indexstartdate = dates2.indexOf(startdate.value);
		
		console.log('indexstartdate:'+indexstartdate);
		
		if(	!dates2.includes(startdate.value)){
			
			let newIndex=0;
			for(item of dates2){
				
						
				if(	new Date(startdate.value)	> new Date(item)){
								
				//console.log(	new Date(startdate.value),new Date(item),new Date(startdate.value)	> new Date(item))
					newIndex++;
				}
			}
			indexstartdate=newIndex
			
		} 
		
		let indexenddate = dates2.indexOf(enddate.value);
		console.log('indexenddate:'+indexenddate);

		if (!dates2.includes(enddate.value)) {
			
		
			let newIndex=0;
			for(item of dates2){
				
							
				if(	new Date(enddate.value)	> new Date(item)){
					
				//console.log(	new Date(enddate.value),new Date(item),new Date(enddate.value)	< new Date(item))
					newIndex++;
				}
			}
			indexenddate=newIndex
		}
		
		
		//slice the array only showing the selected section / slice
		const filterDate = dates2.slice(indexstartdate, indexenddate + 1);

		// replace the labels in the chart
		myChart.config.data.labels = filterDate;

		// datapoints
		const datapoints2 = [...datapoints];
		const filterDatapoints = datapoints2.slice(indexstartdate, indexenddate + 1)

		myChart.config.data.datasets[0].data = filterDatapoints;

		myChart.update();
	}

    </script>
								



								<table class="table table-hover display" id="order_table">
									<thead>
										<tr>
											<th scope="col">訂單日期</th>
											<th scope="col">訂單金額</th>
											<th scope="col">施主大名</th>
											<th scope="col">商品名稱</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${ordersToShow}" var="o" varStatus="vs">
											<tr>
												<td id="aaa" scope="row">${o.getOrderDate()}</td>
												<td>${o.getOrderPrice()}</td>
												<td>${o.getOrderUser().getNickName()}</td>
												<td>
													<c:forEach items="${o.orderDetails}" var="od">
														${od.products.productName}
														<br>
													</c:forEach>
												</td>

											</tr>
										</c:forEach>
									</tbody>

								</table>

								<script type="text/javascript">
									$(document).ready( function () {
    								$('#order_table').DataTable(); 
									} );
								</script>
							</div>
									
						</div>
					</div>

				</div>
			</div>
			</div>

</div>






<style type="text/css">
			
.addProd{ /*父元素*/
    width: 100%;
    display: flex;

}
.addProdLeft{
    width: 30%;
}
.addProdRight{
    width: 70%;
}		

.editProd{ /*父元素*/
    width: 100%;
    display: flex;
}
.editProdLeft{
    width: 30%;
}
.editProdRight{
    width: 70%; 
}	
			

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
	margin-bottom: 30px;
	color: #696969;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.08);
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
	border-radius: 0 0 2px 2px;
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

.wrap { /*父元素*/
	width: 100%;
	height: 200px;
	display: flex;
	/* justify-content: space-between; */
	margin-top: 15px;
}

.left {
	/*     background: red; */
	/*     width: 50%; */
	/*     height: 200px; */
	
}

.right {
	/*     background: blue; */
	/*     width: 50%; */
	/*     height: 200px; */
	
}

#tab {
	width: 1000px;
	background: #c5d2cb;
	border: solid 1px #161616;
}

/* 頁籤ul */
#tab>ul {
	/* overflow: hidden; */
	margin: 0;
	padding: 10px 20px 0 20px;
}

#tab>ul>li {
	list-style-type: none;
}

/* 頁籤上的文字 */
#tab>ul>li>a {
	text-decoration: none;
	font-size: 15px;
	color: #333;
	float: left;
	padding: 10px;
	margin-left: 5px;
}

/*頁籤div內容*/
#tab>div {
	clear: both;
	padding: 0 15px;
	height: 0;
	overflow: hidden;
	visibility: hidden;
}

/*第一筆的底色*/
span:target ~ #tab>ul li:first-child a {
	background: #c5d2cb;
}

span:target ~ #tab>div:first-of-type {
	visibility: hidden;
	height: 0;
	padding: 0 15px;
}

/*頁籤變換&第一筆*/
span ~ #tab>ul li:first-child a, #tab-1:target ~ #tab>ul li a[href$="#tab-1"],
	#tab-2:target ~ #tab>ul li a[href$="#tab-2"], #tab-3:target ~ #tab>ul li a[href$="#tab-3"],
	#tab-4:target ~ #tab>ul li a[href$="#tab-4"] {
	background: #fff;
	border-radius: 5px 5px 0 0;
}

span ~ #tab>ul li:first-child a::before, #tab-1:target ~ #tab>ul li a[href$="#tab-1"]::before,
	#tab-2:target ~ #tab>ul li a[href$="#tab-2"]::before, #tab-3:target ~
	#tab>ul li a[href$="#tab-3"]::before, #tab-4:target ~ #tab>ul li a[href$="#tab-4"]::before
	{
	background-color: white;
	height: 100%;
}

/*頁籤內容顯示&第一筆*/
span ~ #tab>div:first-of-type, #tab-1:target ~ #tab>div.tab-content-1,
	#tab-2:target ~ #tab>div.tab-content-2, #tab-3:target ~ #tab>div.tab-content-3,
	#tab-4:target ~ #tab>div.tab-content-4 {
	visibility: visible;
	height: auto;
	background: #fff;
}

span {
	display: none;
}
</style>


			<script type="text/javascript">
			
		
	//上傳一張圖片（貼文）
	imgInp.onchange = evt => {
		  const [file] = imgInp.files
		  if (file) {
		    blah.src = URL.createObjectURL(file)
		  }
		}
	
	//上傳多張圖片（貼文）
var result=document.getElementById("result");  
var file=document.getElementById("file");  
  
function readAsDataURL(){  

    var file = document.getElementById("file").files;
    var result=document.getElementById("result");  
    console.log(result);

	console.log(file);
    for(i = 0; i< file.length; i ++) {
        var reader    = new FileReader();    
        reader.readAsDataURL(file[i]);  
        reader.onload=function(e){  
            //多圖預覽
            result.innerHTML = result.innerHTML + '<img src="' + this.result +'" alt=""  width="auto" height="100"/>';  
        }

    }
	
    
}  
//上傳一張圖片（商品）
imgInp.onchange = evt => {
	  const [file] = imgInp.files
	  if (file) {
	    blah.src = URL.createObjectURL(file)
	  }
	}

//上傳多張圖片（新增商品）
// var result2=document.getElementById("result2");  
// var file2=document.getElementById("file2");  

// function readAsDataURL2(){  
// document.getElementById("defaultProductImg").setAttribute("style", "display:none"); //將預設圖片隱藏
// var file2 = document.getElementById("file2").files;
// var result2 =document.getElementById("result2");  
// console.log(result2);
// console.log(file2);
// for(i = 0; i< file2.length; i ++) {
//     var reader    = new FileReader();    
//     reader.readAsDataURL(file2[i]);  
//     reader.onload=function(e){  
//         //多圖預覽
//         result2.innerHTML = result2.innerHTML + '<img src="' + this.result +'" alt=""  width="auto" height="180"/>';  
//     }

// }


// }





  
	</script>
</body>
<!-- //CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<!-- //jq -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.29/dist/sweetalert2.all.min.js"></script>

</html>

