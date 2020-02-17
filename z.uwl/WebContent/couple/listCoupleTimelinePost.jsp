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
        <h3>Ŀ�� Ÿ�Ӷ��� �Խñ� ���</h3>
        <input type="text" name="userId" value="${userId }"><br>
        <a href="/couple/addCoupleTimelinePost?userId=${userId }">Ŀ�� Ÿ�Ӷ��� �Խñ� ���</a><br>
        
        <c:forEach var="post" items="${list }">
	        postNo : <input type="text" name="postNo" value="${post.postNo }"><br>
	        userId : <input type="text" name="userId" value="${post.userId }"><br>
	        uploadFileName : <input type="text" name="uploadFileName" value="${post.uploadFileName }"><br>
	        postDate : <input type="text" name="postDate" value="${post.postDate }"><br>
	        place : <input type="text" name="place" value="${post.place }"><br>
	        postTitle : <input type="text" name="postTitle" value="${post.postTitle }"><br>
	        <a href="/couple/getCoupleTimelinePost?userId=${userId }&postNo=${post.postNo }">����</a><br><br>
        </c:forEach>
        
        
    </form>
</body>
</html>