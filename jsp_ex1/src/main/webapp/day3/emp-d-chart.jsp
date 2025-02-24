<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body>
	<%@include file="../db.jsp"%>
	<%
	String deptNo = request.getParameter("deptNo");
	String query = "SELECT * FROM EMP WHERE DEPTNO = '" + deptNo + "'";
	ResultSet rs = stmt.executeQuery(query);
	while (rs.next()) {
	%>
	<input hidden class="ename" value="<%=rs.getString("ENAME")%>">
	<input hidden class="sal" value = "<%=rs.getString("SAL") %>">
	<%
	}
	%>
	<div id="chart"></div>
</body>
</html>

<script>
	let ename = document.querySelectorAll(".ename");
	let enameList = [];
	let sal = document.querySelectorAll(".sal");
	let salList = [];
	for (let i = 0; i < ename.length; i++) {
		enameList.push(ename[i].value);
	}
	for(let i = 0;i<sal.length;i++){
		salList.push(sal[i].value);
	}
	var options = {
		series : [ {
			data : salList,
		} ],
		chart : {
			type : 'bar',
			height : 350
		},
		plotOptions : {
			bar : {
				borderRadius : 4,
				borderRadiusApplication : 'end',
				horizontal : true,
			}
		},
		dataLabels : {
			enabled : false
		},
		xaxis : {
			categories : enameList,
		}
	};

	var chart = new ApexCharts(document.querySelector("#chart"), options);
	chart.render();
</script>