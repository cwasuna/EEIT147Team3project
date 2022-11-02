<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body onload="chartjstest()">
<canvas id="myChart" width="400" height="200"></canvas>
<script>
var content =[];

function chartjstest(){
//  var ctx = document.getElementById('myChart');
//  var count=0;
//  var xhr = new XMLHttpRequest();
//  xhr.withCredentials = true;

//  xhr.addEventListener("readystatechange", function() {
//    if(this.readyState === 4) {
//     var data = JSON.parse(this.responseText);
//     for(var i =0;i<5;i++){
//       content +=data[i].foodsName;
//       console.log(data[i].foodsName+"1");
//       count=count+1;
      
//     }
    
//     console.log(count+"1");
//     console.log(data[i].foodsName+"2");
  
  var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
       labels: ['一月', '二月', '三月','四月','五月','六月'],
       datasets: [{
         backgroundColor: [
           'rgba(255, 99, 132, 0.2)',
           'rgba(54, 162, 235, 0.2)',
           'rgba(255, 206, 86, 0.2)'
         ],
         borderColor: [
           'rgba(255,99,132,1)',
           'rgba(54, 162, 235, 1)',
           'rgba(255, 206, 86, 1)',
           'rgba(75, 192, 192, 1)'
         ],
         borderWidth: 1,
         label: '銷售業績(百萬)',
         data: [count, 49, 72,50,588]
       }]
    }
  })
    
   }   
 });
//  xhr.open("GET", "http://localhost:8090/cookblog/find/foods/all",true);
//  xhr.send();
 

}

</script >

	<form class="form" method="GET" enctype="multipart/form-data"
		action="${contextRoot}/findById">
		<div>
			會員ID： <input type="text" name="id">
			<button>show member</button>
		</div>
	</form>

</body>
</html>