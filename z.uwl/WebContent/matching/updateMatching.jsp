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
       <h3>매칭 확인</h3>
        <input type="text" name="userId" value="${userId }"><br><br>
        매칭되었습니다. 수락하시겠습니까?<br>
        <a href="/matching/updateMatching2?userId=${userId}">수락</a>
        <a href="/matching/updateMatching3?userId=${userId}">거절</a>
    </form>
</body>
</html>