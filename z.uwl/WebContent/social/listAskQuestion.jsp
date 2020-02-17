<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	var questionPostNo = null;
	var targetUserId = "${targetUserId}";
	var sessionId = "${user.userId}";

	
	$(document).on("click", ".addQuestionBtn", function() {
		var content = $("textarea[name='questionContent']").val();
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
				userId : sessionId,
				questionContent : content,
				questionTitle : "ask"
			}),
			success : function() {
				$.redirect("/social/getAskQuestionList", {userId : sessionId}, "POST");
			}
		})

	})
	
	//	거절하기 버튼
	$(document).on("click", ".rejectBtn", function() {
		questionPostNo = $(this).parent().next().val();
		console.log("questionPostNo", questionPostNo);
		var pureAlert = $.pureAlert.confirm({
			title : "알림",
			content : "답변을 거절하시겠습니까? <br/> 거절된 질문은 삭제됩니다.",
			okBtn : "거절",
			cancelBtn : "취소",
			autoShow : true,
			closeButton : false
		});
		pureAlert.on('ok.pure-alert', function(e){
			$.ajax({
				url : "/social/rest/rejectQuestion",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					questionPostNo : questionPostNo
				}),
				success : function(d) {
					console.log("hello world!")
					console.log(questionPostNo);
					$("."+questionPostNo+"").remove();
				}
				
			});
		})
	})
	
	
	// NEW
            $(document).on("click" ,"a.regBtn", function() {
            	questionPostNo = $(this).parent().next().val();
            	console.log(questionPostNo);
            	$("div.commentForm").remove();
            	
                var displayValue = '<div class="commentForm">'
							       + '<textarea name="" id="" cols="30" rows="10" placeholder="성희롱 및 욕설은 처벌대상입니다." class="comment">'
							        + '</textarea>'
							        + '<p>최대 1000자까지 입력가능합니다.'
							        + '</p>'
							        + '<p><a class="replyBtn"><i class="fas fa-pen"></i> 답하기</a></p>'
							    + '</div>';
                $(this).parent().append(displayValue);
            });
	
                $(document).on("click", "a.replyBtn", function() {
					var content = $("textarea.comment").val();
					console.log("content", content);
					
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
						url : "/social/rest/replyQuestion",
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							userId : sessionId,
							questionPostNo : questionPostNo,
							answerContent : content,
							questionTitle : "ask"
						}),
						success : function(d) {
							$("div."+questionPostNo+"").remove();
						}
					})
				})
	
	//	답변완료목록 버튼
	$(document).on("click", ".listAskBtn", function() {
		$.redirect("/social/getAskList/"+sessionId,{}, "GET");
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
						url : "/social/rest/getAskQuestionList",
						method : "POST",
						dataType : "json",
						data : JSON.stringify({
							currentPage : page
						}),
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success: function(data) {
							for (var i = 0; i < data.list.length; i++) {
								var html = "<div class='ask "+data.list[i].questionPostNo+"'>"
							                +"<p><span>익명</span> · <span>"+data.list[i].questionDate+"</span></p>"
							                +"<p><a href='#'><i class='fas fa-ellipsis-h'></i></a></p>"
							                +"<p>"+data.list[i].questionContent+"</p>"
							                +"<p><a class='rejectBtn'>거절하기</a><a class='regBtn'><i class='fas fa-pen'></i> 답하기</a></p>"
							                +"<input type='hidden' value='"+data.list[i].questionPostNo+"'>"
							            +"</div>";
							            
							    $("div.addAsk").append(html);
							}
							$(window).data('ajaxready', true);
						}
					});
				}
				}
			})
		})

</script>

<style type="text/css">

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
            border-radius: 40px 40px 0 0;
            text-align: center;
            padding: 50px 25px 5px;
            box-shadow: 0 5px 5px #cccccc;
            z-index: 1;
            position: relative;

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

        

        div.addAsk {
            
            background-color: rgb(248, 249, 251);
        }
        div.addAsk div.ask {
            background-color: #fff;
            
            padding: 15px 10px 43px;
            margin-bottom: 6px;
        }
        div.addAsk div.ask p:nth-child(1) {
            
            font-size: 13px;
            float: left;
        }
        div.addAsk div.ask p:nth-child(2) {
            float: right;
        }
        div.addAsk div.ask p:nth-child(3) {
            clear: both;
            margin-bottom: 10px;
            font-weight: bold;
            font-size: 15px;
        }
        div.addAsk div.ask p:nth-child(4) a {
            display: inline-block;
            
            line-height: 30px;
            font-size: 12px;
            width: 80px;
            text-align: center;
            border-radius: 40px;
            border: 1px solid;
            color: rgb(121, 134, 203);
        }
        div.addAsk div.ask p:nth-child(4) {
            margin-left: 5px;
        }
        div.addAsk div.ask > p:nth-child(4) a:nth-child(1) {
            color: #c6c6c6;
        }
        textarea.comment {
            width: 100%;
            resize: none;
            height: 120px;
            background-color: #f8f8f8;
        }
        div.commentForm p:nth-child(2) {
            padding: 5px;
            float: left;
        }
        div.commentForm p:nth-child(3) {
            float: right;
            padding: 5px;
            
        }
        div.commentForm p:nth-child(3) a {
            display: inline-block;
            
            line-height: 30px;
            font-size: 12px;
            width: 80px;
            text-align: center;
            border-radius: 40px;
            border: 1px solid;
            color: rgb(121, 134, 203);
        }
        div.commentForm {
            background-color: #fff;
            height: 160px;
            padding-top: 15px;
        }
        
        .wrap>div:last-child {
            background-color: #fff;
            line-height: 60px;
            border-radius: 16px;
            text-align: center;
            margin-top: 10px;
        }
        
        .btn-default {
        	border: 1px solid black;
        }
    </style>

<title>어울림</title>
</head>
<body>
	
	
	<div class="wrap">
        <div class="header">
        <form>
            <p>ASK - 질문&amp;답변</p>
            <p>새 질문 : ${map.totalCount}개</p>
            <p>${user.name}님에게 질문합니다.</p>
            <p>
                <textarea name="questionContent" cols="30" rows="10" placeholder="성희롱 및 욕설은 처벌대상입니다."></textarea>
                <input type="hidden" name="userId" value="${targetUserId}">
                <input type="hidden" name="questionTitle" value="ask">
            </p>
            <p>
                <a href="#" class="addQuestionBtn">질문하기</a>
                <a href="#" class="listAskBtn">답변완료목록</a>
            </p>
        </form>
            <p>주소 : <input type="text" value="http://localhost:8080/social/getAskList/${user.userId}" readonly="readonly"></p>
        </div>
        <div class="addAsk">
        	<c:forEach var="ask" items="${map.list}">
            <div class="ask ${ask.questionPostNo}">
                <p><span>익명</span> · <span>${ask.questionDate}</span></p>
                <p><a href="#"><i class="fas fa-ellipsis-h"></i></a></p>
                <p>${ask.questionContent}</p>
                <p><a class="rejectBtn">거절하기</a><a class="regBtn"><i class="fas fa-pen"></i> 답하기</a></p>
                <input type="hidden" value="${ask.questionPostNo}">
            </div>
            </c:forEach>
        </div>
        <div><a href="#">맨 위로 <i class="fas fa-caret-up"></i></a></div>
    </div>
	
</body>
</html>