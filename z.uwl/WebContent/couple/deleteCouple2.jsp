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
       <h3>매칭 끊기 확인</h3>
       
        <input type="text" name="userId" value="${userId }"><br>
        <input type="text" name="secondUserId" value="${secondUserId }">님과 매칭을 끊으시겠습니까?<br>
        
        <a href="/couple/deleteCouple3?userId=${userId }&secondUserId=${secondUserId}">확인</a>
    </form>
</body>
</html>