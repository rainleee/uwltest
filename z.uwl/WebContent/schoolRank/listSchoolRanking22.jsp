<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
     
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/fb8ae6e812.js" crossorigin="anonymous"></script>
	<!-- 나눔고딕 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    
    <style>
        
        div.challDate{
        	text-align: right;
        }
        
        body{
	        font-family: 'Nanum Gothic', sans-serif;
			font-family: 'Noto Sans KR', sans-serif;
        }
        
       /*  div.top{
       		background-color: gray;
        }
        
        #v-pills-tabContent{
        	background-color: blue;
        } */
        /* 포인트들의 내용 */
        /* .tab-pane {
        	border: 1px solid grey;
        } */
        
        /* 아이콘 색 지정*/
        .fa-coins {
        	color: #ffc811;
        }
        .fa-running {
        	color: #28aa10;
        }
        .fa-credit-card {
        	color: #1e291b;
        }
        .fa-calendar-check {
        	color: #a72644;
        }
        .fa-map-marked-alt {
        	color: #168641;
        }
        .fa-piggy-bank {
        	color: #ffb8c6;
        }
        .fa-camera {
        	color: rgb(12, 98, 183);
        }
        .fa-clipboard {
        	color: rgb(4, 4, 5);
        }
        .fa-medal {
        	color: #ffc811;
        }
        
         /* 등록 하기위해 내가 추가한 것 */
        div.addChallenge div.list {
            text-align: right;
        }
        div.addChallenge div.list a {
            background-color: #EBAD7A;
            display: inline-block;
            line-height: 40px;
            padding: 0 65px;
            color: #fff;
            font-weight: bold;
            margin: 20px 0;
        }
    </style>
    
    <script type="text/javascript">
    
	    $(function() {
			
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( ".list-group-item" ).on("click" , function() {
				var challNo = $(this).children('div').children("input[type='hidden']").val();
				console.log("challNo : "+ challNo); 
				self.location ="/challenge/getChallengeAdmin?challNo="+challNo;  
			});
			
			
						
		});	
	    
	   	/* 페이지네비게이션 */
	    function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			/* alert("currPage"+currentPage); */
			$("form").attr("method","POST").attr("action","/challenge/listAdminChallenge").submit();
		}
    
    </script>
</head>
<body>
	 <form class="form-inline">
	<div class="container-md">
                   <br>
                    <h2><i class="fas fa-medal"></i> 학교랭킹 리스트</h2>
                     <br>
                     <div class="alert alert-secondary" role="alert">
					 	<font style="font-size: 20px">
					 		학교의 랭킹을 확인할 수 있습니다.<br>
					 		랭킹은 활동점수를 합산한 결과로 이루어집니다.
					 	</font>
					</div>
                    		<div class="alert alert-info" role="alert" style="text-align: center;">
	                    		<span class="col-5" style="background-color: red">
	                    			aaaa
	                    		</span>
	                    		<span class="col-5">
	                    			bbbb
	                    		</span>
	                    		<span class="col-5" style="background-color: red">
	                    			cccc
	                    		</span>
	                    		<span class="col-5" >
	                    			dddd
	                    		</span>
							</div>
						<c:set var="i" value="0" />
							<c:forEach var="schoolRank" items="${list}">
							<div>
							 	<div class="alert alert-secondary" role="alert">
								 	<span>${schoolRank.ranking}</span>
								 	<span>${schoolRank.schoolName}</span>
								 	<span>${schoolRank.schoolAddress}</span>
								 	<span>${schoolRank.totalActivityPoint}</span>
								</div>
							</div>
						</c:forEach>
						
							 <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
							 <input type="hidden" id="currentPage" name="currentPage" value=""/>
						</form>
						
						<!-- PageNavigation Start... -->
						<jsp:include page="../common/pageNavigator_new.jsp"/>
						<!-- PageNavigation End... -->

						
						
	</div>		
</body>
</html>