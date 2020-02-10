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
                alert('適遣せせ');
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
                        alert('失因せせ');
                        var secondUserId2 = data.secondUserId;
                        alert('secondUserId2 : ' + secondUserId2);
                        var displayValue = '';
                        if(secondUserId == secondUserId2) {
                            
						    displayValue = '<form action="">'
						        + ' <h3>寡 左鎧澗暗 溌昔</h3>'
						         + ' <input type="text" name="userId" value="' + userId + '">'
						         + ' <input type="text" name="secondUserId" value="' + secondUserId + '"><br><br>'
						         + ' <input type="text" name="secondUserId" value="' + secondUserId + '">還拭惟 寡聖 左鎧獣畏柔艦猿? 30析 板 昼社亜 亜管杯艦陥.<br>'
						         + ' <a href="#" class="check">溌昔</a>'
						     + ' </form>';
                            alert(displayValue);
                        } else {
                        	displayValue = '<form action="">'
                        	       + ' <h3>寡 左鎧奄 昼社 溌昔</h3>'
                        	        + ' <input type="text" name="userId" value="' + userId + '">'
                        	        + ' <input type="text" name="secondUserId"value="' + secondUserId2 + '"><br><br>'
                        	        + ' <input type="text" name="secondUserId" value="' + secondUserId2 + '">還拭惟 左浬 寡聖 昼社馬獣畏柔艦猿?<br>'
                        	        + ' <a href="#" class="check2">溌昔</a>'
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
                alert('適遣せせ');
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
                        alert('失因せせ');
                        var displayValue = '<h3>寡 左蛙</h3>'
    + '寡聖 左蛎柔艦陥.';
                        $('.check').parent().remove();
                        $('.modal').after(displayValue);
                        $('.totalMatching').val(data);
                        $('.addMatching').text('寡左鎧奄昼社');
                        $('.addMatching').removeClass('addMatching').addClass('deleteMatching');
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
                
                $(document).on('click', '.check2', function() {
                alert('適遣せせ');
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
                        alert('失因せせ');
                        var displayValue = '';
                        if(data.result == false) {
                            displayValue = '<h3>寡 左鎧壱 30析 照 走害</h3>'
    + '寡 左鎧奄 30析 板 昼社亜 亜管杯艦陥.';
                        } else {
                            displayValue = '<h3>寡 左鎧奄 昼社敗</h3>'
    + '左浬 寡聖 昼社梅柔艦陥.';
                        }
                        $('.check').parent().remove();
                        $('.check2').parent().remove();
                        $('.modal').after(displayValue);
                        var totalMatching = data.totalMatching;
                        alert('totalMatching : ' + totalMatching);
                        $('.totalMatching').val(totalMatching);
                        $('.deleteMatching').text('寡左鎧奄昼社');
                        $('.deleteMatching').removeClass('deleteMatching').addClass('addMatching');
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
                
                $('.deleteMatching').on('click', function() {
                alert('適遣せせ');
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
                        alert('失因せせ');
                        var displayValue = '<form action="">'
       + '<h3>寡 左鎧奄 昼社 溌昔</h3>'
        + '<input type="text" name="userId" value="${userId }">'
        + '<input type="text" name="secondUserId"value="${secondUserId }"><br><br>'
        + '<input type="text" name="secondUserId" value="${secondUserId}">還拭惟 左浬 寡聖 昼社馬獣畏柔艦猿?<br>'
        + '<a href="#" class="check2">溌昔</a>'
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
        <h3>紫寓級 覗稽琶</h3>
        <input type="text" name="userId" value="${userId }" class="userId">
        <input type="text" name="secondUserId" value="${secondUserId }" class="secondUserId"><br><br>
        <input type="text" name="secondUserId" value="${secondUserId }">

        <c:if test="${userId ne secondUserId }">
            <c:if test="${matching.secondUserId eq secondUserId}">
                <a href="#" class="deleteMatching">
                    寡左鎧奄昼社
                </a>
            </c:if>
            <c:if test="${matching.secondUserId ne secondUserId}">
                <a href="#" class="addMatching">
                    寡左鎧奄
                </a>
            </c:if>


            <a href="/matching/updateItem?userId=${userId}&secondUserId=${secondUserId}">
                托君左奄
            </a>
        </c:if>
        <br>
        閤精 寡 鯵呪 : <input type="text" name="totalMatching" value="${totalMatching}" class="totalMatching"><br>

        <c:if test="${userId eq secondUserId }">
            但 鯵呪 : <input type="text" name="totalItem1" value="${totalItem}"><br>
            号鳶 鯵呪 : <input type="text" name="totalItem2" value="${totalItem2}">
        </c:if>

        <h3 class="modal">乞含</h3>

    </form>
</body>

</html>
