<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form action="" method="">
       <h3>네비게이션</h3>
        <input type="text" name="userId" value="${userId }"><br>
        <a href="/couple/getCoupleTimelinePostList?userId=${userId }">커플 타임라인 게시글 목록</a><br>
        
        <a href="/couple/getScheduleList?userId=${userId }">스케줄 목록</a><br>
        
        
        <a href="/couple/deleteCouple?userId=${userId }">매칭 끊기</a>
    </form>
</body>
</html>