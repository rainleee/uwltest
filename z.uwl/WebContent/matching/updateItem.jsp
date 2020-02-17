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
       <h3>창 사용 확인</h3>
        <input type="text" name="userId" value="${userId }">
        <input type="text" name="secondUserId" value="${secondUserId }"><br><br>
        <input type="text" name="secondUserId" value="${secondUserId}">님에게 창을 사용하시겠습니까?<br>
        <a href="/matching/updateItem3?userId=${userId}&secondUserId=${secondUserId}">확인</a>
    </form>
</body>
</html>