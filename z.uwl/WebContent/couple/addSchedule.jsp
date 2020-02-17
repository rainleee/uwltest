<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form action="/couple/addSchedule2" method="post">
        <h3>스케줄 등록</h3>
        
        <input type="text" name="userId" value="${userId }"><br>
        
        postTitle : <input type="text" name="postTitle"><br>
        postDate : <input type="text" name="postDate"><br>
        place : <input type="text" name="place"><br>
        postContent : <input type="text" name="postContent"><br>
        
        <button type="submit">등록</button>
        
    </form>
</body>
</html>