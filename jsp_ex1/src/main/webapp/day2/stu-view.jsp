<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
<%@include file="../db.jsp" %>

<body>
	<%
		//학번, 이름, 학과, 학년, 시험 점수
		String stuNo = request.getParameter("stuNo");
		ResultSet rs = stmt.executeQuery("SELECT * FROM STUDENT S"+
										" INNER JOIN ENROL E ON E.STU_NO = S.STU_NO"
										+" WHERE S.STU_NO='"+stuNo+"'");
		
		while(rs.next()){
			%>
				<div >학번 : <span id="stuNo"><%= rs.getString("STU_NO") %></span></div>
				<div>이름 : <%= rs.getString("STU_NAME") %></div>
				<div>학과 : <%= rs.getString("STU_DEPT") %></div>
				<div>학년 : <%= rs.getString("STU_GRADE") %></div>
				<div>시험 점수 : <%= rs.getString("ENR_GRADE") %></div>				
			<%			
		}
		
	%>
	
	<input type="button" value="수정" onclick="fnEdit()">
</body>
</html>
<script>
	function fnEdit(){
		console.log(document.querySelector("#stuNo").innerText);
		location.href="stu-edit.jsp?stuNo="+ document.querySelector("#stuNo").innerText;
	}
</script>