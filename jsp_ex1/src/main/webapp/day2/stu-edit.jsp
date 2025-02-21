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
		String stuNo= request.getParameter("stuNo");
		String query = "SELECT * FROM STUDENT WHERE STU_NO = '"+ stuNo +"'";
		ResultSet rs = stmt.executeQuery(query);
		rs.next();
 	%>
 	<div>
 		이름: <input name="stuName" value="<%= rs.getString("STU_NAME") %>">
 	</div>
 	<div>
 		학과: <input name="stuDept" value="<%= rs.getString("STU_DEPT") %>">
 	</div>
</body>
</html>