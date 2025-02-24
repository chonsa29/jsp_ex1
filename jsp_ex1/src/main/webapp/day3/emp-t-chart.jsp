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
	String MGR = request.getParameter("MGR");
	String query = "SELECT E2.ENAME, COUNT(*) AS CNT " + "FROM EMP E1 " + "INNER JOIN EMP E2 ON E1.MGR = E2.EMPNO "
			+ "GROUP BY E2.ENAME ORDER BY CNT DESC";
	ResultSet rs = stmt.executeQuery(query);
	while (rs.next()) {
	%>
	<input hidden class="ename" value="<%=rs.getString("ENAME") %>">
	<input hidden class="cnt" value="<%=rs.getString("CNT") %>">
	<%
	}
	%>
	<div id="chart"></div>
</body>
</html>
<script>
	let ename = document.querySelectorAll(".ename");
	let cnt = document.querySelectorAll(".cnt");
	let enameList = [];
	let cntList = [];
	
	for(let i = 0;i<ename.length;i++){
		enameList.push(ename[i].value);
	}
	for(let i = 0;i<cnt.length;i++){
		cntList.push(parseInt(cnt[i].value));
	}
	
	
	var options = {
		series : cntList,
		chart : {
			width : 380,
			type : 'pie',
		},
		labels : enameList,
		responsive : [ {
			breakpoint : 480,
			options : {
				chart : {
					width : 200
				},
				legend : {
					position : 'bottom'
				}
			}
		} ]
	};
	var chart = new ApexCharts(document.querySelector("#chart"), options);
	chart.render();
</script>