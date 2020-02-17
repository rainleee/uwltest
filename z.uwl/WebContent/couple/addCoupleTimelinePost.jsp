<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form action="/couple/addCoupleTimelinePost2" method="post">
        <h3>커플 타임라인 게시글 등록</h3>
        
        <input type="text" name="userId" value="${userId }"><br>
        
        uploadFileName : <input type="text" name="uploadFileName"><br>
        place : <input type="text" name="place"><br>
        postTitle : <input type="text" name="postTitle"><br>
        postContent : <input type="text" name="postContent"><br>
        
        <button type="submit">등록</button>
        
    </form>
</body>
</html>