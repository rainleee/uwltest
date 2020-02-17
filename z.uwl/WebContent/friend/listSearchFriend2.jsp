
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/css/mainMain.css">
<!-- <link rel="stylesheet" href="/css/mainLeft.css"> -->
<link rel="stylesheet" href="/css/mainRight.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="/javascript/jquery.bootstrap-pureAlert.js"></script>
<script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
<script src="https://cdn.rawgit.com/mgalante/jquery.redirect/master/jquery.redirect.js"></script>
<!-- Modal Alert https://github.com/PureOpenSource/pureAlert  -->

<script src="/javascript/common.js"></script>
<script src="/javascript/mainLeft.js"></script>
<script src="/javascript/mainRight.js"></script>

<script type="text/javascript">

$(function() {
	var sessionId = $("input#sessionId").val();
	console.log("sessionId", sessionId);
	
	$("span#userId").on("click", function() {
		var userId = $(this).html();
		self.location = "/user/getProfile/"+userId;
	})
	
	$("img#profileName").on("click", function() {
		var userId = $(this).next().html();
		self.location = "/user/getProfile/"+userId;
	})
	
	friendBtn();
	askedBtn();
	requestBtn();
	
})

$(document).on("click","#applyBtn", function() {
	var sessionId = $("input#sessionId").val();
	console.log("sessionId", sessionId);
	var userId = $(this).next().val();
	console.log("userId", userId);
	
	$.ajax({
		url : "/friend/rest/requestFriend",
		method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			firstUserId : sessionId,
			secondUserId : userId
		}),
		success : function() {
			var html = "<button type='button' class='btn btn-secondary "+userId+"' id='cancelBtn'>신청취소</button>"
			+"<input type='hidden' value='"+userId+"'>";
			$("."+userId+"").remove();
			$(html).appendTo("#"+userId+"");
		}
})
})

$(document).on("click", "#cancelBtn", function() {
	var sessionId = $("input#sessionId").val();
	console.log("sessionId", sessionId);
	var userId = $(this).next().val();
	console.log("userId", userId);
	$.ajax({
		url : "/friend/rest/deleteFriend",
		method : "post",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			firstUserId : sessionId,
			secondUserId : userId
		}),
		success : function() {
			var html = "<button type='button' class='btn btn-primary "+userId+"' id='applyBtn'>친구신청</button>"
			+"<input type='hidden' value='"+userId+"'>"
			$("."+userId+"").remove();
			$(html).appendTo("#"+userId+"");
		}
	})
})

function friendBtn() {
	var sessionId = $("input#sessionId").val();
	console.log("sessionId", sessionId);
	
	$.ajax({
		url : "/friend/rest/getFriendListForSearch",
		method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			userId : sessionId
		}),
		success : function(d) {
			for (var i = 0; i < d.list.length; i++) {
									
			var html = "<button type='button' class='btn btn-success'>친구</button>";
			$("."+d.list[i].userId+"").remove();
			$(html).appendTo("#"+d.list[i].userId+"");
			}
		}
	})
}		
	
function askedBtn() {
		var sessionId = $("input#sessionId").val();
		$.ajax({
			url : "/friend/rest/getAskedList",
			method : "POST",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				userId : sessionId
			}),
			success : function(d) {
				for (var i = 0; i < d.list.length; i++) {
				var html = "<button type='button' class='btn btn-primary "+d.list[i].userId+"' id='acceptButton'>수락</button>"
							+"<button type='button' class='btn btn-danger "+d.list[i].userId+"' id='deleteButton'>거절</button>"
							+"<input type='hidden' value='"+d.list[i].userId+"'/>";
				$("."+d.list[i].userId+"").remove();
				$(html).appendTo("#"+d.list[i].userId+"");
												
			
				}	
			}
		})
	}

function requestBtn() {
	var sessionId = $("input#sessionId").val();
	$.ajax({
		url : "/friend/rest/getRequestList",
		method : "POST",
		headers : {
			"Accept" : "application/json",
			"Content-Type" : "application/json"
		},
		data : JSON.stringify({
			userId : sessionId
		}),
		success : function(d) {
			for (var i = 0; i < d.list.length; i++) {
			var html = "<button type='button' class='btn btn-secondary "+d.list[i].userId+"' id='cancelBtn'>신청취소</button>"
						+"<input type='hidden' value='"+d.list[i].userId+"'/>";
			$("."+d.list[i].userId+"").remove();
			$(html).appendTo("#"+d.list[i].userId+"");
											
			}	
		}
	})
}


</script>
<style type="text/css">

img#searchProfileName {
	width : 100px;
	height: 100px;
	border-radius: 100px;
}

</style>
</head>

<body>
<div id="wrap">
    <div id="left">
        <jsp:include page="/mainTest/mainLeft.jsp" />
    </div>
    <div id="main">
		<div class="container">
			<input type="hidden" name="sessionId" id="sessionId" value="${user.userId}">
			<div class="page-header text-info">
				<h3>검색 목록</h3>	
			</div>
			<div class="row">
				<c:forEach var="friendUser" items="${map.list}">
			<div class="col-sm-12">
				<div id="${friendUser.userId}">
					<img src="../../images/${friendUser.profileName}" id="searchProfileName"/>&nbsp; 
					<span id="userId">${friendUser.userId}</span> &nbsp; 
					<span id="name">${friendUser.name}</span> &nbsp; 
					<span>${friendUser.schoolName}</span> &nbsp;
					<!-- 곧 버튼 삭제 -->
					 <button type="button" class="btn btn-primary ${friendUser.userId}" id="applyBtn">친구신청</button>
					 <input type="hidden" value="${friendUser.userId}"/>
				</div>
			</div>
				</c:forEach>
				<c:if test="${empty map.list}">
				검색된 회원이 없습니다.
				</c:if>
			</div>
			
		</div>

        
    </div>
    <div id="right">
        <jsp:include page="/mainTest/mainRight.jsp" />
    </div>
</div>
</body>

</html>
