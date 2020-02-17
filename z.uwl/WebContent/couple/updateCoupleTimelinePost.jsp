<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form action="/couple/updateCoupleTimelinePost2" method="post">
        <h3>커플 타임라인 게시글 수정</h3>
        <input type="text" name="userId" value="${userId }">
        <input type="text" name="postNo" value="${post.postNo }"><br>
        uploadFileName : <input type="text" name="uploadFileName" value="${post.uploadFileName }"><br>
        postDate : <input type="text" name="postDate" value="${post.postDate }"><br>
        place : <input type="text" name="place" value="${post.place }"><br>
        postTitle : <input type="text" name="postTitle" value="${post.postTitle }"><br>
        postContent : <input type="text" name="postContent" value="${post.postContent }"><br>
        <button type="submit">수정</button>
        
    </form>
</body>
</html>