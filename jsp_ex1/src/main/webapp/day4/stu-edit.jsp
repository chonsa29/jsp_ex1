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
		String stuId= request.getParameter("stuId");
		String query = "UPDATE TBL_STULIST SET STU_DEPT='소프트웨어' WHERE STU_ID = '"+ stuId +"'";
		int result = stmt.executeUpdate(query);
		
		if(result !=0) out.println("수정이 완료되었습니다.");
 	%>

</body>
</html>