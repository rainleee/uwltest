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
        <h3>������ ���� Ȯ��</h3>
        <input type="text" name="userId" value="${userId }">
        <input type="text" name="postNo" value="${postNo }"><br>
        �������� �����Ͻðڽ��ϱ�?<br>
        <a href="/couple/deleteSchedule2?postNo=${postNo}">����</a>
    </form>
</body>
</html>