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
<%@include file="../db.jsp" %>
<body>
<table>
		<tr>
			<th>이름</th>
			<th>학과</th>
			<th>과목명</th>
			<th>점수</th>
		</tr>
		<%
		String stuName = request.getParameter("stuName");
		try {
			ResultSet rs = stmt.executeQuery("SELECT S.STU_ID, STU_NAME, STU_DEPT, SUBJECT, GRADE "+
					"FROM TBL_STULIST S "+
					"INNER JOIN TBL_GRADE G ON S.STU_ID = G.STU_ID "+
					"WHERE STU_NAME='" + stuName+"'");
			while (rs.next()) {
		%>
		<tr>
			<td id="stuName"><%=rs.getString("STU_NAME")%></td>
			<td><%=rs.getString("STU_DEPT")%></td>
			<td><%=rs.getString("SUBJECT")%></td>
			<td><%=rs.getString("GRADE")%></td>
			<input hidden class="stuId" value="<%=rs.getString("STU_ID") %>">
		</tr>
		<%
		}
		} catch (SQLException e) {
		out.println("오류 발생");
		}
		%>
	</table>
	<button onclick="fnDelete()">삭제</button>
	<button onclick="fnEdit()">수정</button>
	
</body>
</html>


<script>
function fnDelete(){
	let select = document.querySelector(".stuId");
	if(!confirm("정말 삭제하시겠습니까?")){
		return;
	}
	location.href="stu-delete.jsp?stuId="+select.value;
}

function fnEdit(){
	let select = document.querySelector(".stuId");
	location.href = "stu-edit.jsp?stuId="+select.value;
}
</script>