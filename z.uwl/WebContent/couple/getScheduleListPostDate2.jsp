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
        <input type="text" name="userId" value="${userId}"><br>
        <c:forEach var="post" items="${list }">
        postDate <input type="text" name="postDate" value="${post.postDate}">
        postTitle <input type="text" name="postTitle" value="${post.postTitle}"><br>
        </c:forEach>
    </form>
</body>
</html>