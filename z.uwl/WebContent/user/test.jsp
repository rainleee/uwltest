<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css" 
integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv" crossorigin="anonymous">



<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="UTF-8">

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript"></script>

<script>



// $(function() {
// 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
// 		$("button").on("click", function() {
// 			self.location = "/user/test.jsp"
// 		});
// 	});
	
	
	//profile.jsp
	$(document).ready(function(){
		
// 		var weather;
		
		var data = {};
		  data["SKY1"] = $("#SKY1").val();
		  data["SKY3"] = $("#SKY3").val();
		  data["SKY4"] = $("#SKY4").val();
		  
		  data["PTY1"] = $("#PTY1").val();
		  data["PTY3"] = $("#PTY3").val();
		  data["PTY4"] = $("#PTY4").val();
		
		$.ajax({
			url: "/user/rest/getWeather", 
			type: 'GET',
			dataType: 'json',
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			data : JSON.stringify(data),
			success : function(data) {
					 { console.log("success")}
				if (data == SKY1) {
					var view = "<h1><a href='javascript:;'><i class='fas fa-sun' id='SKY1'>맑음</i></a></h1>";
					alert(view);					
					
				}
			}
		});
	});

	
// 	var SKY1 = $("a#SKY1").val();
// 	var SKY3 = $("a#SKY3").val();
// 	var SKY4 = $("a#SKY4").val();
	
// 	var PTY1 = $("a#PTY1").val();
// 	var PTY3 = $("a#PTY3").val();
// 	var PTY4 = $("a#PTY4").val();
	
	
</script>
</head>

<body>
	
<!-- 	<input type="text" id="weatherIcon" value= ""> -->
<%-- 	<c:if test="${SKY1 == '1' }"> --%>
<!-- 	<i class="fas fa-sun"  id="SKY1">맑음</i> -->
<%-- 	</c:if> --%>


	<input type="text" id="weatherIcon" value= "">


	<i class="fas fa-sun"  id="SKY1">맑음</i>
	<i class="fas fa-cloud" id="SKY3">구름 많음</i>
	<i class="fas fa-cloud-sun" id="SKY4">흐림</i>

	<i class="fas fa-cloud-showers-heavy" id="PTY1">비</i>
	<i class="far fa-snowflake"  id="PTY3">눈</i>
	<i class="fas fa-cloud-sun-rain"  id="PTY4">소나기</i>
	
<br><br>
	
	<div class="text-center">
	<button type="button" id="" class="btn btn-outline-info btn-lg">완료</button>
	</div>
</body>


</html>