<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 선언문 -->
	<%!//선언문
	int number = 10;

	int sum(int x, int y) {
		return x+y;
	}%>
	<!-- 스크립틀릿 -->
	<%
	out.println("<h1>" + number + "</h1>");
	String name = "홍길동";
	for(int i = 1 ;i<10;i++){
		out.println(i);
	}
	%>
	<!-- 표현식 -->
	<%--표현식2 --%>
	<div style="color:red;'"><%= sum(3,5)%></div>
</body>
</html>