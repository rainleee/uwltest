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
                alert('클릭ㅋㅋ');
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
                        alert('성공ㅋㅋ');
                        var secondUserId2 = data.secondUserId;
                        alert('secondUserId2 : ' + secondUserId2);
                        var displayValue = '';
                        if(secondUserId == secondUserId2) {
                            
						    displayValue = '<form action="">'
						        + ' <h3>꽃 보내는거 확인</h3>'
						         + ' <input type="text" name="userId" value="' + userId + '">'
						         + ' <input type="text" name="secondUserId" value="' + secondUserId + '"><br><br>'
						         + ' <input type="text" name="secondUserId" value="' + secondUserId + '">님에게 꽃을 보내시겠습니까? 30일 후 취소가 가능합니다.<br>'
						         + ' <a href="#" class="check">확인</a>'
						     + ' </form>';
                            alert(displayValue);
                        } else {
                        	displayValue = '<form action="">'
                        	       + ' <h3>꽃 보내기 취소 확인</h3>'
                        	        + ' <input type="text" name="userId" value="' + userId + '">'
                        	        + ' <input type="text" name="secondUserId"value="' + secondUserId2 + '"><br><br>'
                        	        + ' <input type="text" name="secondUserId" value="' + secondUserId2 + '">님에게 보낸 꽃을 취소하시겠습니까?<br>'
                        	        + ' <a href="#" class="check2">확인</a>'
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
                alert('클릭ㅋㅋ');
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
                        alert('성공ㅋㅋ');
                        var displayValue = '<h3>꽃 보냄</h3>'
    + '꽃을 보냈습니다.';
                        $('.check').parent().remove();
                        $('.modal').after(displayValue);
                        $('.totalMatching').val(data);
                        $('.addMatching').text('꽃보내기취소');
                        $('.addMatching').removeClass('addMatching').addClass('deleteMatching');
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
                
                $(document).on('click', '.check2', function() {
                alert('클릭ㅋㅋ');
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
                        alert('성공ㅋㅋ');
                        var displayValue = '';
                        if(data.result == false) {
                            displayValue = '<h3>꽃 보내고 30일 안 지남</h3>'
    + '꽃 보내기 30일 후 취소가 가능합니다.';
                        } else {
                            displayValue = '<h3>꽃 보내기 취소함</h3>'
    + '보낸 꽃을 취소했습니다.';
                        }
                        $('.check').parent().remove();
                        $('.check2').parent().remove();
                        $('.modal').after(displayValue);
                        var totalMatching = data.totalMatching;
                        alert('totalMatching : ' + totalMatching);
                        $('.totalMatching').val(totalMatching);
                        $('.deleteMatching').text('꽃보내기취소');
                        $('.deleteMatching').removeClass('deleteMatching').addClass('addMatching');
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
                
                $('.deleteMatching').on('click', function() {
                alert('클릭ㅋㅋ');
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
                        alert('성공ㅋㅋ');
                        var displayValue = '<form action="">'
       + '<h3>꽃 보내기 취소 확인</h3>'
        + '<input type="text" name="userId" value="${userId }">'
        + '<input type="text" name="secondUserId"value="${secondUserId }"><br><br>'
        + '<input type="text" name="secondUserId" value="${secondUserId}">님에게 보낸 꽃을 취소하시겠습니까?<br>'
        + '<a href="#" class="check2">확인</a>'
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
        <h3>사람들 프로필</h3>
        <input type="text" name="userId" value="${userId }" class="userId">
        <input type="text" name="secondUserId" value="${secondUserId }" class="secondUserId"><br><br>
        <input type="text" name="secondUserId" value="${secondUserId }">

        <c:if test="${userId ne secondUserId }">
            <c:if test="${matching.secondUserId eq secondUserId}">
                <a href="#" class="deleteMatching">
                    꽃보내기취소
                </a>
            </c:if>
            <c:if test="${matching.secondUserId ne secondUserId}">
                <a href="#" class="addMatching">
                    꽃보내기
                </a>
            </c:if>


            <a href="/matching/updateItem?userId=${userId}&secondUserId=${secondUserId}">
                찔러보기
            </a>
        </c:if>
        <br>
        받은 꽃 개수 : <input type="text" name="totalMatching" value="${totalMatching}" class="totalMatching"><br>

        <c:if test="${userId eq secondUserId }">
            창 개수 : <input type="text" name="totalItem1" value="${totalItem}"><br>
            방패 개수 : <input type="text" name="totalItem2" value="${totalItem2}">
        </c:if>

        <h3 class="modal">모달</h3>

    </form>
</body>

</html>
