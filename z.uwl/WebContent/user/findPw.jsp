<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	// $(function() {
	// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	// 		$("button").on("click", function() {
	// 			self.location = "/user/findId?userId=${user.userId}"
	// 		});
	// 	});


	$(function() {

		// 	$("#userId").focus();

		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button#findPw").on(
				"click",
				function() {

					$("form").attr("method", "POST").attr("action",
							"/user/getUser").submit();
				});
	});

</script>
</head>


<body>



	<form>
		<div id=findPw>
			<hr>
			아 이 디 <input type="text" id="userId" name="userId" placeholder="ID">
			<hr>
			이 름 <input type="text" id="name" name="name" placeholder="이름">
			<button type="button" id="findPw">비밀번호 찾기</button>
		</div>
	</form>




</body>


</html>