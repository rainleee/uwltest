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
       <h3>�׺���̼�</h3>
        <input type="text" name="userId" value="${userId }"><br>
        <a href="/couple/getCoupleTimelinePostList?userId=${userId }">Ŀ�� Ÿ�Ӷ��� �Խñ� ���</a><br>
        
        <a href="/couple/getScheduleList?userId=${userId }">������ ���</a><br>
        
        
        <a href="/couple/deleteCouple?userId=${userId }">��Ī ����</a>
    </form>
</body>
</html>