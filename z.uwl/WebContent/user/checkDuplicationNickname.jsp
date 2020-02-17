<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============  "중복확인"  Event 처리 =============
		
		
$(function() {
			
			$("#nickname").focus();
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button#checkNick").on("click" , function() {
				
				// Form 유효성 검증
				if( $("#nickname").val() != null && $("#nickname").val().length >0) {
					$("form").attr("method" , "POST");
				    $("form").attr("action" , "/user/checkDuplicationNickname");
				    $("form").submit();
				}else {
					alert('닉네임은 반드시 입력하셔야 합니다.');
				}
				$("#nickname").focus();
			});
		});
		
		
	
		//=============  "사용"  Event 처리 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button.btn.btn-success").on("click" , function() {
				
				if(opener) {
					opener.$("input[name='nickname']").val("${nickname}");
					opener.$("input[name='school']").focus();
				}
				
				window.close();
			});
		});
		
		
		//=============   "닫기"  Event  처리 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button.btn.btn-primary").on("click" , function() {
				window.close();
			});
		});

	</script>
	
</head>

<body>
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<br/><br/>
		
		 <!-- form Start /////////////////////////////////////-->
		<form class="form-inline">
		
		    <div class="form-group">
		    <label for="nickname">닉 네 임</label>
		    <input type="text" class="form-control" name="nickname" id="nickname"  placeholder="닉네임"
		    																		value="${ ! empty result && result ? nickname : '' }" >
		  </div>
		  <button type="button" class="btn btn-info" id="checkNick">중복확인</button>
		  
		  <c:if test="${ ! empty result }">
		  	<c:if test="${ result =='true' }">
		  		<button type="button" class="btn btn-success" >사 용</button>
		  	</c:if>
		  </c:if>
		  
		  <button type="button" class="btn btn-primary" >닫 기</button>
		  
		  <c:if test="${ empty result }">
		  	<span class="text-info glyphicon glyphicon-ok">입력후중복확인</span>
		  </c:if>
		  
		  <c:if test="${ ! empty result }">
		  	<c:if test="${ result =='true' }">
				<span class="text-success glyphicon glyphicon-ok">사용가능 &nbsp;</span>
			</c:if>
			<c:if test="${ result=='false' }">
		 		<span class="text-danger glyphicon glyphicon-remove">사용불가능</span>
			</c:if>
		  </c:if>
		 
		</form>
		<!-- form Start /////////////////////////////////////-->
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->

</body>

</html>