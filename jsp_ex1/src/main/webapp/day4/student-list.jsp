<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, tr, td {
	border-collapse: collapse;
	border: 1px solid black;
	text-align:center;
}
</style>
</head>
<%@include file="../db.jsp"%>
<body>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>점수</th>
		</tr>
		<%
		try {
			ResultSet rs = stmt.executeQuery("SELECT S.STU_ID, STU_NAME, STU_DEPT,AVG(GRADE) AS GRADE FROM TBL_STULIST S INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID GROUP BY S.STU_ID, STU_NAME, STU_DEPT ORDER BY GRADE DESC");
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("STU_ID")%></td>
			<td><a href ="student-view.jsp?stuName=<%=rs.getString("STU_NAME")%>"><%=rs.getString("STU_NAME")%></a></td>
			<td><%=rs.getString("STU_DEPT")%></td>
			<td><%=rs.getString("GRADE")%></td>
		</tr>
		<%
		}
		} catch (SQLException e) {
		out.println("오류 발생");
		}
		%>
	</table>
	<button onclick="fnAdd()">학생 추가</button>
</body>
</html>

<script>
function fnAdd(){
	location.href="add-student.jsp";
}
</script>