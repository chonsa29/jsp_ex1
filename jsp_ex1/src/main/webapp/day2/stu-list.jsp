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
	text-align:center;
}
</style>
</head>
<body>

	<%@include file="../db.jsp"%>
	<%
	ResultSet rs = null;
	try {
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
	
			//학번, 이름, 학과, 성별(남자, 여자)
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>학번</th>");
			out.println("<th>이름</th>");
			out.println("<th>학과</th>");
			out.println("<th>성별</th>");
			out.println("</tr>");
			out.println("<tr>");
			
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td>");
				out.println(rs.getString("STU_NO"));
				out.println("</td>");
				out.println("<td>");
				out.println(rs.getString("STU_NAME"));
				out.println("</td>");
				out.println("<td>");
				out.println(rs.getString("STU_DEPT"));
				out.println("</td>");
				out.println("<td>");
				String s = rs.getString("STU_GENDER");
				if(s.equals("M")) out.println("남자");
				else out.println("여자");
				out.println("</td>");
				out.println("</tr>");
			}
			
			out.println("</tr>");
			out.println("</table>");
		} catch (SQLException e) {
			out.println("오류발생!");
		}
	%>

</body>

</html>