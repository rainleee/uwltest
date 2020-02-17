<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
	<form action="">
        <input type="text" name="userId" value="${userId}"><br>
        <br>
        <h3>날짜를 입력하면 스케줄을 보여줍니다.</h3>
        <input type="text" name="postDate"><br>
        <button type="button">스케줄목록보기</button><br>
        <br>
        <h3>스케줄 목록</h3>
    </form>
    
    
    
<script>
	$(function() {
		var userId = $('input[name="userId"]').val();
		var postDate = '';
		$('button').on('click', function() {
			
			postDate = $('input[name="postDate"]').val();
			$.ajax({
				url: '/couple/rest/getScheduleList2/' + userId + '/' + postDate,
				method: 'POST',
				data: JSON.stringify({
					userId: userId,
					postDate: postDate
				}),
				headers: {
					'Accept': 'application/json',
					'Content-Type': 'application/json'
				},
				success: function(data) {
					for(var i = 0; i < data.list.length; i++) {
						var displayValue = 'postDate : ' + data.list[i].postDate + '<br>'
						+ 'postTitle : ' + data.list[i].postTitle + '<br>';
						
						$('form').append(displayValue);
					}
				},
				error: function (request, status, error) {
                    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
			});
		});
	});
</script>
</body>
</html>