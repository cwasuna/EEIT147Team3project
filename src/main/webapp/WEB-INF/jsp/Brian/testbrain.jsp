<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>圖</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>


</head>
<body>
	<div>


		<canvas id="sumMoneyChart" width="400" height="400"></canvas>

	</div>

	<!--******************************************************************************************************* 1 -->


	<script>
		//------------------------------------------------------------------------------------------------------------------------------------------		
		var SumMoney = "${OrdersBySumMoney}";
		var month = "${OrdersByMonth}";
		

		var ctx = document.getElementById("sumMoneyChart").getContext('2d');
		var myChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels :JSON.parse(month),
				datasets : [ {
					label : '# of Votes',
					data :JSON.parse(SumMoney),
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255,99,132,1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});

		// 				function filterData(){
		// 					const dates2=[...dates];
		// 					console.log('dates2:'+dates2);
		// 					const startdate = document.getElementById('startdate');
		// 					const enddate = document.getElementById('enddate');
		// 					console.log('startdate:'+startdate);
		// 					console.log('enddate:'+enddate);
		// 					// get index number in array
		// 					let indexstartdate = dates2.indexOf(startdate.value);

		// 					console.log('indexstartdate:'+indexstartdate);

		// 					if(	!dates2.includes(startdate.value)){

		// 						let newIndex=0;
		// 						for(item of dates2){

		// 							if(	new Date(startdate.value)	> new Date(item)){

		// 							//console.log(	new Date(startdate.value),new Date(item),new Date(startdate.value)	> new Date(item))
		// 								newIndex++;
		// 							}
		// 						}
		// 						indexstartdate=newIndex

		// 					} 

		// 					let indexenddate = dates2.indexOf(enddate.value);
		// 					console.log('indexenddate:'+indexenddate);

		// 					if (!dates2.includes(enddate.value)) {

		// 						let newIndex=0;
		// 						for(item of dates2){

		// 							if(	new Date(enddate.value)	> new Date(item)){

		// 							//console.log(	new Date(enddate.value),new Date(item),new Date(enddate.value)	< new Date(item))
		// 								newIndex++;
		// 							}
		// 						}
		// 						indexenddate=newIndex
		// 					}

		// 					//slice the array only showing the selected section / slice
		// 					const filterDate = dates2.slice(indexstartdate, indexenddate + 1);

		// 					// replace the labels in the chart
		// 					myChart.config.data.labels = filterDate;

		// 					// datapoints
		// 					const datapoints2 = [...datapoints];
		// 					const filterDatapoints = datapoints2.slice(indexstartdate, indexenddate + 1)

		// 					myChart.config.data.datasets[0].data = filterDatapoints;

		// 					myChart.update();
		// 				}
	</script>
</body>
</html>