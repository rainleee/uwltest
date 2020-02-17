<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--  CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
	<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>    
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
  	<script src="https://kit.fontawesome.com/4b823cf630.js" crossorigin="anonymous"></script>
  	<!-- 썸머노트 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
	<!-- Font Awesome CDN -->
	<script src="https://kit.fontawesome.com/376450b3c6.js" crossorigin="anonymous"></script>
  	
  	<script type="text/javascript">
	var postNo = null;
	var targetUserId = "${targetUserId}";
	var sessionId = "${user.userId}";
	var sessionName = "${user.name}";
	
	$(document).on("click", "button#addTimeline", function(evt) {
		var timelinePostContent =$(".timelinePostContent").val();
		
		if (timelinePostContent.length < 1 || timelinePostContent == null) {
			var pureAlert = $.pureAlert({
				title : "알림",
				content : "내용을 입력하세요."
			})
			
			pureAlert.pureAlert('show');
			
			return;
		}
		
		$("form#addTimelineForm")
		.attr("method", "post")
		.attr("action", "/social/addTimeline")
		.submit();		
		
	})
	
	$(document).on("click", ".commentBtn", function() {
		postNo = $(this).val();
		console.log("postNo", postNo);
		
		$.ajax({
			url : "/social/rest/getCommentList",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({searchCondition : "1", userId : "", postNo : postNo, searchKeyword : postNo}),
			success : function(d) {
				$(".addCommentDiv").remove();
				
				var html = "<div class='addCommentDiv'>";
				if (d.list.length != 0) {
					
					for (var i = 0; i < d.list.length; i++) {
						if (targetUserId == sessionId) {
							html += "<div class='c"+d.list[i].commentNo+"'><i class='fas fa-times deleteCommentBtn'><input type='hidden' value='"+d.list[i].postNo+"' id='postNoini'><input type='hidden' value='"+d.list[i].commentNo+"' id='commentNoini'></i>";
						}
						
						html += "<hr/><img src='/images/"+d.list[i].user.profileName+"' class='commentProfileName'><p class='commentPtag'>"+d.list[i].user.name+" &nbsp; "+d.list[i].commentContent+"</p></div>";
					}
					
					html += "<input type='text' class='form-control regCommentText' name='commentContent' placeholder='댓글입력 후 Enter'>";
				} else {
					html += "<input type='text' class='form-control regCommentText' name='commentContent' placeholder='댓글입력 후 Enter'>";
				}
							
				$("li."+postNo).append(html);
			}
		})
	});
	
	$(document).on("keypress", ".regCommentText", function(e) {
		var content = $(this).val();
		
		if (e.which == 13) {
			
			if (content.length < 1 || content == "" || content == null) {
				alert('내용을 입력하세요');
				return;
			} else {
				
			$.ajax({
				url : "/community/rest/addComment",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({commentContent : content, userId : sessionId, postNo : postNo}),
				success : function(d) {
					var html ="<div class='c"+d.commentNo+"'><i class='fas fa-times deleteCommentBtn'><input type='hidden' value='"+d.postNo+"' id='postNoini'><input type='hidden' value='"+d.commentNo+"' id='commentNoini'></i>"
							+"<hr/><img src='/images/"+d.user.profileName+"' class='commentProfileName'>"
							+"<p class='commentPtag'>"+d.user.name+" &nbsp; "+d.commentContent+"</p>"
							+"<input type='hidden' value='"+d.commentNo+"'></div>"
					
					$(".addCommentDiv").prepend(html);
					$("input.regCommentText").val("");
					
					//socket push
					socketMsg = sessionId + "," + targetUserId +"," + sessionName +"," + "timeline,comment";
					console.log(socketMsg)
					socket.send(socketMsg);
				}
			})
			}
		}
	});
		
	$(document).on("click", ".deleteCommentBtn", function() {
		//var commentNo = $(this).next().next().next().val();
		var commentNo = $(this).children("#commentNoini").val();
		console.log("commentNo", commentNo);
		var postNo = $(this).children("#postNoini").val();
		console.log("postNo", postNo)
		
		var pureAlert = $.pureAlert.confirm({
			title : "알림",
			content : "댓글을 삭제하시겠습니까?",
			okBtn : "삭제",
			cancelBtn : "취소",
			autoShow : true,
			closeButton : false
		});
		pureAlert.on('ok.pure-alert', function(e) {
			
		
		$.ajax({
			url : "/community/rest/deleteComment",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({commentNo : commentNo, postNo : postNo}),
			success : function() {
				$("div.c"+commentNo+"").remove();
			}
			
		});
		});
	});
	
	$(document).on("click", ".postUpdateBtn", function() {
		var postContent = $(this).prev().prev().text();
		console.log("postContent", postContent);
		postNo = $(this).parent().val();
		console.log("postNo", postNo);
		
		$(".textareaInModal").text(postContent);
	});
	
		$(document).on("click", ".confirmUpdateBtn", function() {
			var viewStatus = $(this).prev().prev().val();
			console.log("view", viewStatus);
			var newContent = $(".textareaInModal").val();
			console.log(newContent);
			console.log("postNo", postNo);
			
			$.ajax({
				url : "/social/rest/updateTimeline",
				method : "POST",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					postTitle : "yes",
					postContent : newContent,
					viewStatus : viewStatus,
					postNo : postNo
					
				}),
				success : function() {
					var veiw = null;
					if (viewStatus == 1) {
						view = "전체공개";
					} else {
						view = "나만보기";
					}
					
					$("div."+postNo+"").html(newContent);
					$("a.postViewStatus"+postNo+"").html(view);
					$(".textareaInModal").text("");
					$("#postUpdateModal").modal("hide");
				}
			});
			
		});
	
	//게시글 삭제
	$(document).on("click", "button.postDeleteBtn", function() {
		var postNo = $(this).val();
		
		var pureAlert = $.pureAlert.confirm({
			title : "알림",
			content : "게시글을 삭제하시겠습니까?",
			okBtn : "삭제",
			cancelBtn : "취소",
			autoShow : true,
			closeButton : false
		});
		pureAlert.on('ok.pure-alert', function(e) {
		
		$.ajax({
			url : "/social/rest/deleteTimeline",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				postNo : postNo
			}),
			success : function() {
				$("li."+postNo).remove();
			}
		})
	}) 
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
						url : "/social/rest/getTimelineList/",
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
								var html = "<li class='"+data.list[i].postNo+"' value='"+data.list[i].postNo+"'>"
											+"<a class='float-left text-monospace text-primary'>"+data.list[i].postDate+"</a>";
												if (data.list[i].viewStatus == '1') {
													html += "<a class='float-right font-weight-bold text-secondary postViewStatus"+data.list[i].postNo+"'>전체공개</a><br/>"; 
												}
												if (data.list[i].viewStatus == '2') {
													html += "<a class='float-right font-weight-bold text-secondary postViewStatus"+data.list[i].postNo+"'>나만보기</a><br/>";
												}
												html += "<div class='postContentDiv "+data.list[i].postNo+"'>"+data.list[i].postContent+"</div>";
												html += "<button class='btn btn-outline-primary btn-sm commentBtn' value='"+data.list[i].postNo+"'>댓글</button>";
												
												if (sessionId == targetUserId) {
													html += "<button class='btn btn-outline-secondary btn-sm postUpdateBtn' value='"+data.list[i].postNo+"' data-toggle='modal' data-target='#postUpdateModal'>수정</button>";
													html += "<button class='btn btn-outline-secondary btn-sm postDeleteBtn' value='"+data.list[i].postNo+"'>삭제</button>";
												}
												html += "</li>";
								$("ul.timeline").append(html);
							}
							$(window).data('ajaxready', true);
						}
					});
				}
				}
			})
		});
	
		//썸머노트--------------------------------------------------------------------------------
	$(document).ready(function() {
			$('#summernote').summernote({
				width : 550,
				height : 180,
				minHeight : 180,
				maxHeight : null,
				focus : true,
				toolbar: [
				    // [groupName, [list of button]]
				    ['toolbar', ['picture','bold']],	
				    ['remove',['clear']]
				  ],
				placeholder : '내용을 입력하세요',
				lang : 'ko-KR',
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
						sendFile(files[0], editor, welEditable);
						//editor가 누군지 welEditable이 누군지 알아보자 ㅅㅂㅋㅋ
					}
				}
			});
		});
	function sendFile(file, editor, welEditable) {
				data = new FormData();
				data.append("file", file);
				$.ajax({
					data : data,
					url : '/post/rest/addSummerNoteFile',	//리턴을 url로 해줘야함 ㅋㅋ
					type : "POST",
					cache : false,
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(data) {
						var file = "/images/"+data;
						$('#summernote').summernote('insertImage',file);
					},
					error : function(){
						alert("에러냐 ㅋㅋ");
					}
				});
			}
	
	
  	
  	</script>
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        li {
            list-style: none;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:hover {
            text-decoration: none;
            color: inherit;
        }

        body {
            
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        

        section#left {
            
            height: 100vh;
            width: 250px;
            float: left;
            border-right: 1px solid #eee;
        }

        section#work {
            width: calc(100% - 600px);
            float: left;
            height: 100vh;
            overflow-y: scroll;
        }

        section#right {
            
            height: 100vh;
            width: 350px;
            float: right;
            overflow-y: scroll;
            border-right: 1px solid #eee;
        }
        
        body {
	margin : 50px;
}
ul.timeline {
    list-style-type: none;
    position: relative;
}
ul.timeline:before {
    content: ' ';
    background: #d4d9df;
    display: inline-block;
    position: absolute;
    left: 29px;
    width: 2px;
    height: 100%;
    z-index: 400;
}
ul.timeline {
	margin-top: 60px;
}
ul.timeline > li {
    margin: 20px 0;
    padding-left: 20px;
}
ul.timeline > li:before {
    content: ' ';
    background: white;
    display: inline-block;
    position: absolute;
    border-radius: 50%;
    border: 3px solid #22c0e8;
    left: 20px;
    width: 20px;
    height: 20px;
    z-index: 400;
}	
.viewStatus {
	width : 110px;
	height : 40px;
}
.nononotext {
	display: none;
}
.regCommentText {
	margin-top: 5px; 
}
.deleteCommentBtn {
	margin-top : 22px;
	float: right;
	cursor: url;
	
}
.postUpdateBtn {
	float: right;
}
.postDeleteBtn {
	float: right;
}
.viewStatusInModal {
	float: left;
	width : 110px;
}
.postContentDiv {
	margin-bottom : 10px;
}

.commentProfileName {
	width : 30px;
	height : 30px;
	border-radius: 30px;
}

p.commentPtag {
	display: inline-block;
}

body {word-break:break-all;}
        
    </style>
</head>

<body>
<!--  여기서부터 챗봇  -->
<div id="frogue-container" class="position-right-bottom" data-chatbot="4626e9e6-320e-4c99-afe8-c196f85db573" data-user="akxorb1234" data-init-key="value"></div>


<script>
(function(d, s, id){
var js, fjs = d.getElementsByTagName(s)[0];
if (d.getElementById(id)) {return;}
js = d.createElement(s); js.id = id;
js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script> 
<!--   여기까지 ㅋㅋ  -->

    <main>
        <section id="left">
			<jsp:include page="/layout/left.jsp" />
        </section>
        <section id="work">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<h4>${user.name}님의 Timeline</h4>
			<c:if test="${targetUserId eq user.userId }">
				<div class="addFormDiv">
				<form id="addTimelineForm" enctype="multipart/form-data">
					<div class="input-group">
						<textarea class="form-control timelinePostContent" id="summernote" name="postContent"></textarea>
						<input type="text" class="nononotext">
						<input type="text" class="nononotext">
					</div>
			            <div class="float-right" >
							<button class="btn btn-outline-primary btn-rt " id="addTimeline">등록</button>
			            </div>
					<input type="hidden" name="userId" value="${user.userId}">
			           	<select class="custom-select float-right viewStatus" name="viewStatus">
			              <option value="1" selected="selected">전체공개</option>
			              <option value="2">나만보기</option>
			            </select>
				</form>
				</div>
			</c:if>
				<ul class="timeline">
				<c:forEach var="post" items="${map.list}">
					<li class="${post.postNo}" value="${post.postNo}">
						<a class="float-left text-monospace text-primary">${post.postDate}</a> 
						
						<c:if test="${post.viewStatus == 1 }">
						<a class="float-right font-weight-bold text-secondary postViewStatus${post.postNo}">전체공개</a><br/> 
						</c:if>
						<c:if test="${post.viewStatus == 2 }">
						<a class="float-right font-weight-bold text-secondary postViewStatus${post.postNo}">나만보기</a><br/> 
						</c:if>
						
						<div class="postContentDiv ${post.postNo}">${post.postContent}</div>
						<button class="btn btn-outline-primary btn-sm commentBtn" value="${post.postNo}">댓글</button>
						<c:if test="${user.userId eq targetUserId }">
						<button class="btn btn-outline-secondary btn-sm postUpdateBtn" value="${post.postNo}" data-toggle="modal" data-target="#postUpdateModal">수정</button>
						<button class="btn btn-outline-secondary btn-sm postDeleteBtn" value="${post.postNo}">삭제</button>
						</c:if>
					</li>
				</c:forEach>
				</ul>
				<c:if test="${empty map.list}">
					<h3>표시할 타임라인이 없습니다.</h3>
				</c:if>
			</div>
		</div>
	
<!-- Modal -->
<div class="modal fade" id="postUpdateModal" tabindex="-1" role="dialog" aria-labelledby="postUpdateModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="postUpdateModalLabel">수정</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <textarea class="form-control textareaInModal" rows="6"></textarea>
      </div>
      <div class="modal-footer">
      	<select class="custom-select float-right viewStatusInModal" name="viewStatus">
	        <option value="1" selected="selected">전체공개</option>
	        <option value="2">나만보기</option>
		</select>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary confirmUpdateBtn">수정</button>
      </div>
    </div>
  </div>
</div>
        </section>
        <section id="right">
			<jsp:include page="/layout/right.jsp" />
        </section>
    </main>
</body></html>