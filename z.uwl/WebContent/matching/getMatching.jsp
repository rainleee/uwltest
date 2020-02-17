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
       <h3>사람들 프로필로 갈 수 있는 목록</h3>
        <input type="text" name="userId" value="${userId }"><br><br>
        <a href="/matching/addMatching?userId=${userId}&secondUserId=user01">user01</a><br>
        <a href="/matching/addMatching?userId=${userId}&secondUserId=user02">user02</a><br>
        <a href="/matching/addMatching?userId=${userId}&secondUserId=user03">user03</a>
    </form>
</body>
</html>