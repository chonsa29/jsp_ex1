<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="register" action="join_result.jsp" method="get">
		<div>
			아이디 : <input name="id">
		</div>
		<div>
			비밀번호 : <input type="password" name="pwd">
		</div>
		<div>
			비밀번호 확인 : <input type="password" name="pwd2">
		</div>
		<div>
			이름 : <input name="userName">
		</div>
		<div>
			핸드폰 : <select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
		</div>
		<div>
			성별 : <label><input type="radio" name="gender" value="M">
				남</label> <label><input type="radio" name="gender" value="F">
				여</label>
		</div>
		<div>
			<label><input type="checkbox" name="hobby" value="운동">
				운동</label> <label><input type="checkbox" name="hobby" value="독서">
				독서</label> <label><input type="checkbox" name="hobby" value="영화감상">
				영화감상</label> <label><input type="checkbox" name="hobby" value="코딩">
				코딩</label> <label><input type="checkbox" name="hobby" value="게임">
				게임</label>
		</div>
		<div>
			<input type="button" value="회원가입" onclick="fnRegister()">
		</div>
	</form>
</body>
</html>

<script>
	function fnRegister() {
		let register = document.register;

		if (register.id.value.length < 6) {
			alert("6글자 이상 아이디를 입력해주세요.");
			return;
		}

		if (register.pwd.value.length < 6) {
			alert("6글자 이상 비밀번호를 입력해주세요.");
			return;
		}

		if (register.pwd.value != register.pwd2.value) {
			alert("비밀번호가 서로 다릅니다.");
			return;
		}
		const regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;

		if (regExp.test(register.pwd.value)) {
			register.submit();
		} else {
			alert("특수문자를 하나 포함해야합니다.");
		}
	}
</script>