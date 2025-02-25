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
	<form name="stu" action="add-student-result.jsp" method="get">
		<div>
			학생 아이디: <input name="stuId">
		</div>
		<div>
			이름: <input name="stuName">
		</div>
		<div>
			학과: <input name="stuDept">
		</div>
		<div>
			과목: <input name="subject">
		</div>
		<div>
			점수: <input name="grade">
		</div>
		<input type="button" value="제출" onclick="register();">
	</form>
</body>
</html>

<script>
	let stu = document.stu;

	function register(){
		if(stu.stuId.value.length==0 || stu.stuName.value.length==0 || stu.stuDept.value.length==0 || stu.subject.value.length==0 || stu.grade.value.length==0){
			alert("빈 값 x");
			return;
		}
		if(stu.stuId.value.length!=4){
			alert("아이디는 4글자만 입력 가능");
			return;
		}
		if(stu.grade.value < 0 || stu.grade.value >100){
			alert("점수는 0부터 100사이의 값");
			return;
		}
		stu.submit();
	}
</script>