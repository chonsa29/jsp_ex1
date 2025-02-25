<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 10px;
	text-align: center;
}

.page {
	margin:10px 5px;
}

.page a {
	padding: 5px;
	border: 1px solid #ccc;
	text-align: center;
	text-decoration: none;
	color: black;
}

.page .active {
	background-color: #ddd;
	font-weight: bold;
}

.pageSize{
	margin:auto;
}
</style>
</head>
<body>
	<%@include file="../db.jsp"%>

	<%
	int pageSize = 5; // 기본값
	if (request.getParameter("pageSize") != null) {
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
	}
	%>

	<select class="pageSize" onchange="fnChange(this.value)">
		<option value="3" <%= pageSize == 3 ? "selected" : "" %>>3개씩</option>
		<option value="5" <%= pageSize == 5 ? "selected" : "" %>>5개씩</option>
		<option value="10" <%= pageSize == 10 ? "selected" : "" %>>10개씩</option>
		<option value="15" <%= pageSize == 15 ? "selected" : "" %>>15개씩</option>
		<option value="20" <%= pageSize == 20 ? "selected" : "" %>>20개씩</option>
	</select>

	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>

		<%
		int currentPage = 1;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		ResultSet rs = null;

		ResultSet rsCnt = stmt.executeQuery("SELECT COUNT(*) AS TOTAL FROM BOARD");
		rsCnt.next();
		int total = rsCnt.getInt("TOTAL");
		int pageList = (int) Math.ceil((double) total / pageSize);

		String query = "SELECT B.BOARDNO, B.TITLE, B.USERID, B.CNT, TO_CHAR(B.CDATETIME,'YYYY-MM-DD') AS CDATETIME, COUNT(B.BOARDNO) AS CNT2 " 
		+"FROM BOARD B "+ 
		"LEFT JOIN BOARD_COMMENT C ON C.BOARDNO = B.BOARDNO "+
		"GROUP BY B.BOARDNO, B.TITLE, B.USERID, B.CNT, B.CDATETIME "+
		"OFFSET " + (currentPage - 1) * pageSize + " ROWS FETCH NEXT " + pageSize + " ROWS ONLY";
		rs = stmt.executeQuery(query);
		while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("BOARDNO")%></td>
			<td><%=rs.getString("TITLE")%>(<%=rs.getString("CNT2") %>)</td>
			<td><%=rs.getString("USERID")%></td>
			<td><%=rs.getString("CNT")%></td>
			<td><%=rs.getString("CDATETIME")%></td>
		</tr>
		<%
		}
		%>
	</table>
	<div class="page">
		<%
		out.println("<a href='?page=" + (currentPage != 1 ? currentPage - 1 : 1) + "&pageSize=" + pageSize + "'><</a>");
		for (int i = 1; i <= pageList; i++) {
			if (currentPage == i) {
				out.println("<a href='?page=" + i + "&pageSize=" + pageSize + "' class='active'>" + i + "</a>");
			} else {
				out.println("<a href='?page=" + i + "&pageSize=" + pageSize + "'>" + i + "</a>");
			}
		}
		out.println("<a href='?page=" + (currentPage != pageList ? currentPage + 1 : pageList) + "&pageSize=" + pageSize + "'> > </a>");
		%>
	</div>
</body>
</html>

<script>
function fnChange(size) {
    const params = new URLSearchParams(window.location.search);
    params.set('pageSize', size);
    params.set('page', 1); 
    window.location.search = params.toString();
}
</script>
