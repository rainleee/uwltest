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
       <h3>��Ī ���� Ȯ��</h3>
       
        <input type="text" name="userId" value="${userId }"><br>
        <input type="text" name="secondUserId" value="${secondUserId }">�԰� ��Ī�� �����ðڽ��ϱ�?<br>
        
        <a href="/couple/deleteCouple3?userId=${userId }&secondUserId=${secondUserId}">Ȯ��</a>
    </form>
</body>
</html>