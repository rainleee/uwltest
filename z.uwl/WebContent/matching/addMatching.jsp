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
        <h3>사람들 프로필</h3>
        <input type="text" name="userId" value="${userId }">
        <input type="text" name="secondUserId" value="${secondUserId }"><br><br>
        <input type="text" name="secondUserId" value="${secondUserId }">
        
        <c:if test="${userId ne secondUserId }">
	        <c:if test="${matching.secondUserId eq secondUserId}">
		        <a href="/matching/deleteMatching?userId=${userId }&secondUserId=${secondUserId}">
		        	꽃보내기취소
		        </a>
	        </c:if>
	        <c:if test="${matching.secondUserId ne secondUserId}">
	        	<a href="/matching/addMatching2?userId=${userId}&secondUserId=${secondUserId}">
	        		꽃보내기
	        	</a>
	        </c:if>
	        
	        
	        <a href="/matching/updateItem?userId=${userId}&secondUserId=${secondUserId}">
	        	찔러보기
	        </a>
        </c:if>
        <br>
        받은 꽃 개수 : <input type="text" name="totalMatching" value="${totalMatching}"><br>
        
        <c:if test="${userId eq secondUserId }">
        	창 개수 : <input type="text" name="totalItem1" value="${totalItem}"><br>
        	방패 개수 : <input type="text" name="totalItem2" value="${totalItem2}">
        </c:if>
        
        <h3 class="modal">모달</h3>
        
    </form>
</body>
</html>