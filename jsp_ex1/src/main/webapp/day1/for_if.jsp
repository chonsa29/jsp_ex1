<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		int num =10;
	%>
	
	<%
		for (int i = 5; i > 0; i--) {
			for (int j = i; j > 0; j--) {
				out.println("*");
			}
			out.println("<br>");
		}
		
		if(num %2 == 1){
			out.println("홀수");
		}else{
			out.println("짝수");
		}
	
	%>
</body>
</html>