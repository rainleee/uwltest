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
        <h3>��Ī ����</h3>
        
        <input type="text" name="userId" value="${userId }"><br>
        
        <c:if test="${!empty couple }">
        	<a href="/couple/deleteCouple2?userId=${userId }">��Ī����</a>
        </c:if>
        <c:if test="${empty couple }">
        	��Ī����
        </c:if>
    </form>
</body>
</html>