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
        <h3>스케줄 목록</h3>
        <input type="text" name="userId" value="${userId }"><br>
        
        <a href="/couple/addSchedule?userId=${userId }">스케줄 등록</a><br>
        
        <c:forEach var="post" items="${list }">
	        postNo : <input type="text" name="postNo" value="${post.postNo }"><br>
	        secondUserId : <input type="text" name="secondUserId" value="${post.userId }"><br>
	        postDate : <input type="text" name="postDate" value="${post.postDate }"><br>
	        postTitle : <input type="text" name="postTitle" value="${post.postTitle }"><br>
	        <a href="/couple/getSchedule?userId=${userId }&postNo=${post.postNo }">보기</a><br>
        </c:forEach>
        
        
    </form>
</body>
</html>