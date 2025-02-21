<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 학번, 이름, 학과, 성별 -->
	<!-- stu-join-result.jsp -->
	<form name="stu" action="stu-join-result.jsp">
		<div>
			학번 : <input name="stuNo">
		</div>
		<div>
			이름 : <input name="stuName">
		</div>
		<div>
			학과 : <input name="stuDept">
		</div>
		<div>
			성별 : 
			<input type="radio" name="stuGender" value="M" checked> 남자
			<input type="radio" name="stuGender" value="F"> 여자
		</div>
		<div>
			<input type="button" onclick="fnCheck()" value="저장">
		</div>
	</form>
</body>
</html>

<script>
	let stu = document.stu;
	
	function fnCheck(){
		if(stu.stuNo.value.length != 8){
			alert("학번은 8자리입니다!");
			return;
		}
		if(stu.stuName.value =="" || stu.stuDept.value ==""){
			alert("모든 값을 채워주세요.");
			return;
		}
		stu.submit();
	}
	
	function fnCheck2(){
		window.open{
			"id-check.jsp?stuNo="+ stu.stuNo.value,
			"check",
			"width=300,height=300"
		}
	}
</script>