<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- bootstrap 4.4 CDN -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<!-- jQuery Redirect CDN     https://github.com/mgalante/jquery.redirect  -->
<script
	src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->
<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
<!-- Font, Icon CDN -->
<script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
<script type="text/javascript">

$(function() {
	connectWS();
});
//////////////// WebSocket ////////////////// right.jsp와 합치면 삭제
var socket = null;

function connectWS() {
    console.log("tttttttttttttt")
    var ws = new WebSocket("ws://localhost:8080/replyEcho");
    socket = ws;

    ws.onopen = function () {
        console.log('Info: connection opened.');
    };

    ws.onmessage = function (event) {
        console.log("ReceiveMessage:", event.data+'\n');
    };

    ws.onclose = function (event) { 
        console.log('Info: connection closed.');
        //setTimeout( function(){ connectWS(); }, 1000); // retry connection!!
    };
    ws.onerror = function (err) { console.log('Error:', err); };
}
////////////////WebSocket //////////////////


var targetUserId = "${targetUserId}";
var sessionId = "${user.userId}";
var sessionName = "${user.name}";

$(document).on("click", ".addQuestionBtn", function(evt) {
	var content = $("textarea").val();
	console.log(content);
	
	if (content.length < 1 || content == null || content == "") {
		var pureAlert = $.pureAlert.alert({
			title : "알림",
			content : "내용을 입력하세요.",
			okBtn : "확인",
			autoShow : true,
			closeButton : false
		});
		
		return;
	}
	
	$.ajax({
		url : "/social/rest/addQuestion",
		method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			userId : targetUserId,
			questionContent : content,
			questionTitle : "ask"
		}),
		success : function() {
			$("textarea").val("");
			//socket push
			socketMsg = sessionId + "," + targetUserId +"," + sessionName +"," + "ask,add";
			console.log(socketMsg)
			socket.send(socketMsg);
		}
	});

})

$(document).on("click", ".replyQuestionBtn", function() {
	$.redirect("/social/getAskQuestionList",{userId : sessionId});
});


//스크롤 페이징
var page = 1;

 $(function() {
		$(window).data('ajaxready', true).scroll(function() {
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();
			var searchCondition = $("select[name='searchCondition']").val();
			var searchKeyword = $("input[name='searchKeyword']").val();
			var listing = $("input[name='listing']").val();
			
			if($(window).data('ajaxready') == false) return;
			if (maxHeight <= currentScroll) {
			if (page <= ${map.resultPage.maxPage}) {
				$(window).data('ajaxready', false);
				page++;
				console.log('page : ' + page);
					
				$.ajax({
					url : "/social/rest/getAskList/",
					method : "POST",
					dataType : "json",
					data : JSON.stringify({
						currentPage : page,
						targetUserId : targetUserId
					}),
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success: function(data) {
						for (var i = 0; i < data.list.length; i++) {
							console.log("hello");
							var html = "<div class='ask'>"
							                +"<p>"+data.list[i].questionContent+"</p>"
							                +"<p><span>익명</span> ｜ <span>"+data.list[i].questionDate+"</span></p>"
							                +"<p>"+data.list[i].answerContent+"</p>"
							                +"<p><span>"+data.list[i].user.name+"</span> ｜ <span>"+data.list[i].answerDate+"</span></p>"
							            +"</div>";
							$(html).appendTo("div.askList");
						}
						$(window).data('ajaxready', true);
					}
				});
			}
			}
		});
	});

</script>

<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: 0;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:hover,
        a:focus {
            color: inherit;
            text-decoration: none;
        }

        body {
            font-size: 16px;
            color: #898989;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        img,
        i,
        input {
            vertical-align: middle;
        }

        div.wrap {
            background-color: rgb(121, 134, 203);
            padding: 10px;
        }

        div.header {
            background-color: #fff;
            border-radius: 40px;
            text-align: center;
            padding: 50px 25px 5px;

        }

        div.header p:nth-child(1) {
            font-weight: bold;
            font-size: 21px;
            margin-bottom: 15px;
        }

        div.header p:nth-child(2) {
            margin-bottom: 15px;
            font-size: 13px;
        }

        div.header p:nth-child(3) {
            margin-bottom: 15px;
            font-size: 18px;
        }

        textarea {
            width: 100%;
            height: 55px;
            resize: none;
            padding: 2px;
        }

        div.header p:nth-child(5) a {
            background-color: rgb(121, 134, 203);
            line-height: 38px;
            display: inline-block;
            width: 100px;
            color: #fff;
            margin-bottom: 30px;
        }

        div.header p:nth-child(6) {
            font-size: 18px;
            margin-bottom: 40px;
        }

        div.header p:nth-child(6) input {
            line-height: 34px;
            border: 1px solid #e3e3e3;
            text-indent: 5px;
            font-size: 14px;
            width: 245px;
        }

        div.header p:nth-child(7) a {
            background-color: rgb(121, 134, 203);
            line-height: 38px;
            display: inline-block;
            width: 100px;
            color: #fff;
            margin-bottom: 30px;
        }

        

        div.ask {
            background-color: #fff;
            margin-top: 10px;
            border-radius: 40px;
            padding: 20px 20px 10px;
        }
        div.ask p:nth-child(2),
        div.ask p:nth-child(4) {
            
            font-size: 12px;
            text-indent: 5px;
            margin-bottom: 28px;
            margin-top: 2px;
        }

        div.ask p:nth-child(3),
        div.ask p:nth-child(4) {
            
            text-indent: 30px;
            margin-bottom: 0;
        }

        .wrap>div:last-child {
            background-color: #fff;
            line-height: 60px;
            border-radius: 16px;
            text-align: center;
            margin-top: 10px;
        }
        
    </style>
<title>어울림</title>
</head>
<body>
	<div class="wrap">
        <div class="header">
        <form>
            <p>ASK - 질문&amp;답변</p>
            <p>답변완료 : ${map.totalCount}개</p>
            <p>${targetUser.name}님에게 질문합니다.</p>
            <p>
                <textarea name="questionContent" cols="30" rows="10" placeholder="성희롱 및 욕설은 처벌대상입니다."></textarea>
                <input type="hidden" name="userId" value="${targetUserId}">
                <input type="hidden" name="questionTitle" value="ask">
            </p>
            <p>
                <a href="#" class="addQuestionBtn">질문하기</a>
                <c:if test="${targetUserId eq user.userId }">
                <a href="#" class="replyQuestionBtn">답변하기</a>
                </c:if>
            </p>
        </form>
            <p>주소 : <input type="text" value="http://localhost:8080/social/getAskList/${targetUserId}" readonly="readonly"></p>
        </div>
        <div class="askList">
            <c:forEach var="ask" items="${map.list}">
            <div class="ask">
                <p>${ask.questionContent}</p>
                <p><span>익명</span> ｜ <span>${ask.questionDate}</span></p>
                <p>${ask.answerContent}</p>
                <p><span>${ask.user.name}</span> ｜ <span>${ask.answerDate}</span></p>
            </div>
            </c:forEach>
        </div>
        <div><a href="#">맨 위로 <i class="fas fa-caret-up"></i></a></div>
    </div>
</body>
</html>