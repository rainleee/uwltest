<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form action="">
        <h3>커플 타임라인 게시글 보기</h3>
        <input type="text" name="userId" value="${userId }"><br>
        
        postNo : <input type="text" name="postNo" value="${post.postNo }"><br>
        userId : <input type="text" name="userId" value="${post.userId }"><br>
        postDate : <input type="text" name="postDate" value="${post.postDate }"><br>
        uploadFileName : <input type="text" name="uploadFileName" value="${post.uploadFileName }"><br>
        postTitle : <input type="text" name="postTitle" value="${post.postTitle }"><br>
        place : <input type="text" name="place" value="${post.place }"><br>
        postContent : <input type="text" name="postContent" value="${post.postContent }"><br>
        
        <a href="/couple/updateCoupleTimelinePost?userId=${userId }&postNo=${post.postNo }">수정</a>
        <a href="/couple/deleteCoupleTimelinePost?userId=${userId }&postNo=${post.postNo }">삭제</a>
        
        <h3>커플 타임라인 댓글 목록</h3>
        
        
        <a href="/couple/addCoupleTimelineComment?userId=${userId }&postNo=${post.postNo}">커플 타임라인 댓글 등록</a><br>
        
        <c:forEach var="comment" items="${list }">
	        <input type="text" name="commentNo" value="${comment.commentNo }">
	        <input type="text" name="userId2" value="${comment.userId }"><br>
	        <input type="text" name="commentContent" value="${comment.commentContent }">
	        <input type="text" name="postDate" value="${comment.commentDate }">
	        <a href="/couple/deleteCoupleTimelineComment?userId=${userId }&commentNo=${comment.commentNo }">삭제</a><br>
    	</c:forEach>
    	
    	
    </form>
</body>
</html>