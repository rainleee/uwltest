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
       <h3>��Ī Ȯ��</h3>
        <input type="text" name="userId" value="${userId }"><br><br>
        ��Ī�Ǿ����ϴ�. �����Ͻðڽ��ϱ�?<br>
        <a href="/matching/updateMatching2?userId=${userId}">����</a>
        <a href="/matching/updateMatching3?userId=${userId}">����</a>
    </form>
</body>
</html>