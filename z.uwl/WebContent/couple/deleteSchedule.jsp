<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form action="">
        <h3>스케줄 삭제 확인</h3>
        <input type="text" name="userId" value="${userId }">
        <input type="text" name="postNo" value="${postNo }"><br>
        스케줄을 삭제하시겠습니까?<br>
        <a href="/couple/deleteSchedule2?postNo=${postNo}">삭제</a>
    </form>
</body>
</html>