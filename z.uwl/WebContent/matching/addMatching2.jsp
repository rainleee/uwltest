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
       <h3>꽃 보내는거 확인</h3>
        <input type="text" name="userId" value="${userId }">
        <input type="text" name="secondUserId" value="${secondUserId }"><br><br>
        <input type="text" name="secondUserId" value="${secondUserId}">님에게 꽃을 보내시겠습니까? 30일 후 취소가 가능합니다.<br>
        <a href="/matching/addMatching3?userId=${userId}&secondUserId=${secondUserId}">확인</a>
    </form>
</body>
</html>