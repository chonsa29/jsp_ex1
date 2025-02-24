<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, th, tr, td{
		border-collapse:collapse;
		border: 1px solid black;
		text-align:center;
		padding: 10px;
	}
</style>
</head>
<body>
<!-- EMP, DEPT, SALGRADE 테이블 -->
<!-- 사번, 이름, 급여, 급여등급, 팀장, 부서명 출력 -->
<!-- 급여 등급순으로 내림차순 -->

<%@ include file="../db.jsp" %>

<table>
	<tr>
		<th>사번</th>
		<th>이름</th>
		<th>급여</th>
		<th>급여등급</th>
		<th>팀장</th>
		<th>부서명</th>
	</tr>

<%
	ResultSet rs = null;
	try{
		rs = stmt.executeQuery("SELECT E.EMPNO, E.ENAME, E.SAL, GRADE, E2.ENAME AS MGR, E.DEPTNO, DNAME "+
				"FROM EMP E " +
				"LEFT JOIN EMP E2 ON E.MGR = E2.EMPNO " +
				"INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO " +
				"INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL ORDER BY GRADE DESC");
		while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("EMPNO") %></td>
				<td><%=rs.getString("ENAME") %></td>
				<td><%=rs.getString("SAL") %></td>
				<td><%=rs.getString("GRADE") %></td>
				<td><a href="emp-t-chart.jsp?MGR=<%=rs.getString("MGR")%>"><%=rs.getString("MGR") %></a></td>
				<td><a href="emp-d-chart.jsp?deptNo=<%=rs.getString("DEPTNO")%>"><%=rs.getString("DNAME") %></a></td>
			</tr>
			<%
		}
	}catch(SQLException e){
		out.println("오류발생");
	}
%>
</table>
</body>
</html>