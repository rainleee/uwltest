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
            $('.addCoupleTimelineComment').on('click', function() {
                alert('클릭ㅋㅋ');
                var userId = $('.userId').val();
                var postNo = ${post.postNo};
                var commentContent = $('.commentContent').val();
                alert('userId : ' + userId);
                alert('postNo : ' + postNo);
                alert('commentContent : ' + commentContent);
                $.ajax({
                    url: '/couple/rest/addCoupleTimelineComment2',
                    method: 'POST',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: userId,
                        postNo: postNo,
                        commentContent: commentContent
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('성공ㅋㅋ');

                        var commentDate = data.commentDate;
                        var commentContent = data.commentContent;
                        var commentNo = data.commentNo;
                        var displayValue = '<p><input type="text" name="commentNo" value="' + commentNo + '">' +
                            ' <input type="text" name="userId" value="' + data.userId + '">' +
                            ' <input type="text" name="commentContent" value="' + commentContent + '">' +
                            ' <input type="text" name="commentDate" value="' + commentDate + '">' +
                            ' <a href="/couple/deleteCoupleTimelineComment?userId=' + userId + '&commentNo=' + commentNo + '">삭제</a><br></p>';

                        $('.coupleTimelineCommentList').after(displayValue);
                        $('.commentContent').val('');
                    },
                    error: function(request, status, error) {
                        alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                });
            });
            $('.deleteCoupleTimelineComment').on('click', function() {
                alert('클릭ㅋㅋ');
                var userId = $('.userId').val();
                var commentNo = $(this).parent().find('.commentNo').val();
                alert('userId : ' + userId);
                alert('commentNo : ' + commentNo);
                $.ajax({
                    url: '/couple/rest/deleteCoupleTimelineComment2/' + userId + '/' + commentNo,
                    method: 'GET',
                    dataType: 'json',
                    data: JSON.stringify({
                        userId: userId,
                        commentNo : commentNo
                    }),
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                    },
                    success: function(data) {
                        alert('성공ㅋㅋ');
                        alert('data.userId : ' + data.userId);
                        alert('data.commentNo : ' + data.commentNo);
                        $('.commentNo[value="' + data.commentNo + '"]').parent().remove();
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
        <h3>커플 타임라인 게시글 보기</h3>
        <input type="text" name="userId" value="${userId }" class="userId"><br>

        postNo : <input type="text" name="postNo" value="${post.postNo }"><br>
        userId : <input type="text" name="userId" value="${post.userId }"><br>
        postDate : <input type="text" name="postDate" value="${post.postDate }"><br>
        uploadFileName : <input type="text" name="uploadFileName" value="${post.uploadFileName }"><br>
        postTitle : <input type="text" name="postTitle" value="${post.postTitle }"><br>
        place : <input type="text" name="place" value="${post.place }"><br>
        postContent : <input type="text" name="postContent" value="${post.postContent }"><br>

        <a href="/couple/updateCoupleTimelinePost?userId=${userId }&postNo=${post.postNo }">수정</a>
        <a href="/couple/deleteCoupleTimelinePost?userId=${userId }&postNo=${post.postNo }">삭제</a>
    </form>

    <form action="" method="">
        <h3>커플 타임라인 댓글 등록</h3>

        <input type="text" name="userId" value="${userId }">
        <input type="text" name="postNo" value="${post.postNo }">

        <input type="text" name="commentContent" class="commentContent">

        <button type="button" class="addCoupleTimelineComment">등록</button>
    </form>
    <form action="" method="">
        <h3 class="coupleTimelineCommentList">커플 타임라인 댓글 목록</h3>




        <c:forEach var="comment" items="${list }">
            <p>
                <input type="text" name="commentNo" value="${comment.commentNo }" class="commentNo">
                <input type="text" name="userId" value="${comment.userId }">
                <input type="text" name="commentContent" value="${comment.commentContent }">
                <input type="text" name="commentDate" value="${comment.commentDate }">
                <a href="#" class="deleteCoupleTimelineComment">삭제</a><br>
            </p>
        </c:forEach>


    </form>
</body>

</html>
