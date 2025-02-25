<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file="../db.jsp"%>
<body>
	<%
	String SI = "";
	SI = request.getParameter("SI");
	String selected = "";
	%>
	시: <select id="si" onchange="fnSelect(this.value)">
		<option>::선택::</option>
		<%
		ResultSet rs = stmt.executeQuery("SELECT DISTINCT SI FROM AREA");
		while (rs.next()) {
			if(SI=="서울특별시"){
				selected = "selected";
			}
		%>
			<option <%=selected%>><%=rs.getString("SI") %></option>
		<%
		}
		%>
	</select>
구: <select onchange="fnSelectGu(this.value)">
		<option>::선택::</option>
		<%
		rs = stmt.executeQuery("SELECT DISTINCT GU FROM AREA WHERE SI='"+SI+"' AND GU IS NOT NULL");
	
		while (rs.next()) {
		%>
			<option><%=rs.getString("GU") %></option>
		<%
		}
		%>
	</select>
동: <select>
		<option>::선택::</option>
		<%
		String GU = request.getParameter("GU");
		rs = stmt.executeQuery("SELECT DISTINCT DONG FROM AREA WHERE GU='"+GU+"' AND DONG IS NOT NULL");
	
		while (rs.next()) {
		%>
			<option><%=rs.getString("DONG") %></option>
		<%
		}
		%>
	</select>
</body>
</html>

<script>
	function fnSelect(SI){
		location.href="?SI="+SI;
	}
	function fnSelectGu(GU){
		location.href="?GU="+GU;
	}
	
</script>