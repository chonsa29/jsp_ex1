<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
	border-collapse: collapse;
	border: 1px solid black;
	padding: 5px 5px;
	text-align: center;
}
</style>
</head>
<body>

	<%@include file="../db.jsp"%>
	<!--학번, 이름, 학과, 성별(남자, 여자) -->
	<table>
		<tr>
			<th>선택</th>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>성별</th>
		</tr>
		<%
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			while (rs.next()) {
				String stuNo = rs.getString("STU_NO");
		%>
		<tr>
			<td><input type="radio" name="select" value="<%=stuNo%>"></td>
			<td><%=stuNo%></td>
			<td><a href="stu-view.jsp?stuNo=<%=stuNo%>"><%=rs.getString("STU_NAME")%></a></td>
			<td><%=rs.getString("STU_DEPT")%></td>
			<td><%=rs.getString("STU_GENDER").equals("M") ? "남자" : "여자"%></td>
		</tr>
		<%
		}
			} catch (SQLException e) {
			out.println("오류발생!");
			}
		%>
	</table>
	<div>
		<button onclick="fnRemove()">삭제</button>
	</div>
</body>

</html>
<script>
	function fnRemove(){
		let select = document.querySelector("input[name='select']:checked");
		console.log(select);
		location.href="stu-delete.jsp?stuNo="+select.value;
		//stu-delete.jsp 페이지로 이동
		//학번을 같이 넘기기
	}
</script>