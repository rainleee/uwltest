<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<script type="text/javascript">
	//============= ȸ���������� Event  ó�� =============	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click", function() {
			self.location = "/user/updateUser?userId=${user.userId}"
		});
	});
</script>
</head>


<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! addUser ���� �ƴ� �׽�Ʈ���� -->
<body>
	
	
			<div class="col-xs-8 col-md-4">${user.userName}</div>
	
	���̵� <div>${user.userId}</div>
	�̸� ${user.name}
	<button type="button" id="updateUser">��������</button>

</body>




</html>