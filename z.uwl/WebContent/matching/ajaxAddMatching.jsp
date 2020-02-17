<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
        $(function() {
            $('.addMatching').on('click', function() {
                alert('Ŭ������');
                var userId = $('.userId').val();
                var secondUserId = $('.secondUserId').val();
                alert('userId : ' + userId);
                alert('secondUserId : ' + secondUserId);
                $.ajax({
                    url: '/matching/rest/addMatching2/' + userId + '/' + secondUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: userId,
                        secondUserId: secondUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('��������');
                        var secondUserId2 = data.secondUserId;
                        alert('secondUserId2 : ' + secondUserId2);
                        var displayValue = '';
                        if(secondUserId == secondUserId2) {
                            
						    displayValue = '<form action="">'
						        + ' <h3>�� �����°� Ȯ��</h3>'
						         + ' <input type="text" name="userId" value="' + userId + '">'
						         + ' <input type="text" name="secondUserId" value="' + secondUserId + '"><br><br>'
						         + ' <input type="text" name="secondUserId" value="' + secondUserId + '">�Կ��� ���� �����ðڽ��ϱ�? 30�� �� ��Ұ� �����մϴ�.<br>'
						         + ' <a href="#" class="check">Ȯ��</a>'
						     + ' </form>';
                            alert(displayValue);
                        } else {
                        	displayValue = '<form action="">'
                        	       + ' <h3>�� ������ ��� Ȯ��</h3>'
                        	        + ' <input type="text" name="userId" value="' + userId + '">'
                        	        + ' <input type="text" name="secondUserId"value="' + secondUserId2 + '"><br><br>'
                        	        + ' <input type="text" name="secondUserId" value="' + secondUserId2 + '">�Կ��� ���� ���� ����Ͻðڽ��ϱ�?<br>'
                        	        + ' <a href="#" class="check2">Ȯ��</a>'
                        	    + ' </form>';
                            alert(displayValue);
                        }
                        $('form').after(displayValue);
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
            
            $(document).on('click', '.check', function() {
                alert('Ŭ������');
                var userId = $('.userId').val();
                var secondUserId = $('.secondUserId').val();
                alert('userId : ' + userId);
                alert('secondUserId : ' + secondUserId);
                $.ajax({
                    url: '/matching/rest/addMatching3/' + userId + '/' + secondUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: userId,
                        secondUserId: secondUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('��������');
                        var displayValue = '<h3>�� ����</h3>'
    + '���� ���½��ϴ�.';
                        $('.check').parent().remove();
                        $('.modal').after(displayValue);
                        $('.totalMatching').val(data);
                        $('.addMatching').text('�ɺ��������');
                        $('.addMatching').removeClass('addMatching').addClass('deleteMatching');
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
                
                $(document).on('click', '.check2', function() {
                alert('Ŭ������');
                var userId = $('.userId').val();
                var secondUserId = $('.secondUserId').val();
                alert('userId : ' + userId);
                alert('secondUserId : ' + secondUserId);
                $.ajax({
                    url: '/matching/rest/deleteMatching2/' + userId + '/' + secondUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: userId,
                        secondUserId: secondUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('��������');
                        var displayValue = '';
                        if(data.result == false) {
                            displayValue = '<h3>�� ������ 30�� �� ����</h3>'
    + '�� ������ 30�� �� ��Ұ� �����մϴ�.';
                        } else {
                            displayValue = '<h3>�� ������ �����</h3>'
    + '���� ���� ����߽��ϴ�.';
                        }
                        $('.check').parent().remove();
                        $('.check2').parent().remove();
                        $('.modal').after(displayValue);
                        var totalMatching = data.totalMatching;
                        alert('totalMatching : ' + totalMatching);
                        $('.totalMatching').val(totalMatching);
                        $('.deleteMatching').text('�ɺ��������');
                        $('.deleteMatching').removeClass('deleteMatching').addClass('addMatching');
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
                
                $('.deleteMatching').on('click', function() {
                alert('Ŭ������');
                var userId = $('.userId').val();
                var secondUserId = $('.secondUserId').val();
                alert('userId : ' + userId);
                alert('secondUserId : ' + secondUserId);
                $.ajax({
                    url: '/matching/rest/deleteMatching/' + userId + '/' + secondUserId,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: userId,
                        secondUserId: secondUserId
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('��������');
                        var displayValue = '<form action="">'
       + '<h3>�� ������ ��� Ȯ��</h3>'
        + '<input type="text" name="userId" value="${userId }">'
        + '<input type="text" name="secondUserId"value="${secondUserId }"><br><br>'
        + '<input type="text" name="secondUserId" value="${secondUserId}">�Կ��� ���� ���� ����Ͻðڽ��ϱ�?<br>'
        + '<a href="#" class="check2">Ȯ��</a>'
    + '</form>';
                        $('form').after(displayValue);
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
        });
    </script>
</head>

<body>
    <form action="">
        <h3>����� ������</h3>
        <input type="text" name="userId" value="${userId }" class="userId">
        <input type="text" name="secondUserId" value="${secondUserId }" class="secondUserId"><br><br>
        <input type="text" name="secondUserId" value="${secondUserId }">

        <c:if test="${userId ne secondUserId }">
            <c:if test="${matching.secondUserId eq secondUserId}">
                <a href="#" class="deleteMatching">
                    �ɺ��������
                </a>
            </c:if>
            <c:if test="${matching.secondUserId ne secondUserId}">
                <a href="#" class="addMatching">
                    �ɺ�����
                </a>
            </c:if>


            <a href="/matching/updateItem?userId=${userId}&secondUserId=${secondUserId}">
                �񷯺���
            </a>
        </c:if>
        <br>
        ���� �� ���� : <input type="text" name="totalMatching" value="${totalMatching}" class="totalMatching"><br>

        <c:if test="${userId eq secondUserId }">
            â ���� : <input type="text" name="totalItem1" value="${totalItem}"><br>
            ���� ���� : <input type="text" name="totalItem2" value="${totalItem2}">
        </c:if>

        <h3 class="modal">���</h3>

    </form>
</body>

</html>
