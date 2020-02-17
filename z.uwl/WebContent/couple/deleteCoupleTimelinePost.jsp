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
        <h3>커플 타임라인 게시글 삭제 확인</h3>
        <input type="text" name="userId" value="${userId }">
        <input type="text" name="postNo" value="${postNo }"><br>
        커플 타임라인 게시글을 삭제하시겠습니까?<br>
        <a href="/couple/deleteCoupleTimelinePost2?userId=${userId }&postNo=${postNo}">삭제</a>
    </form>
</body>
</html>