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
        
        div.alert {
            background-color: #f4cdad;
            border-color: #f4cdad;
        }
        
        div.card-body {
            border-color: #ebad7a;
            border: medium;
        }
        
        div.card-footer {
            background-color: #ebad7a;
            border-color: #ebad7a;
        }
        
        
    </style>
</head>
<body>
	<div class="container-md">
	
				<div class="col-11">
                   <br>
                    <h2>주간 도전과제 목록
                     	<span class="badge badge-danger">New</span>
                     </h2>
						
                     <br>
                     <div class="alert alert-secondary" role="alert">
					 	<b>주간도전과제를 수행하고 포인트(활동점수)를 획득하세요!</b> <br>
					 	획득한 점수는 아이템을 구매하거나 학교랭킹에 반영됩니다.<br>
					 	<small class="text-muted">주간도전과제는 매주 월요일 초기화됩니다.<br/></small>
					</div>
				</div>
				
                     <div class="col-11">
		                     	<c:forEach var="challenge" items="${list}">
						<div class="card-group">
								  <div class="card">
								    <div class="card-body">
								      <h5 class="card-title">${challenge.challTitle}  
									     <c:if test="${challenge.challCategory == '1'}">
									     	 <span class="badge badge-success">Map</span></h5>
										</c:if>
										<c:if test="${challenge.challCategory == '2'}">
											 <span class="badge badge-primary">Vision</span></h5>
										</c:if>
										<c:if test="${challenge.challCategory == '3'}">
											<span class="badge badge-warning">게시판활동</span></h5>
										</c:if>
								      <p class="card-text">${challenge.challContent}</p>
								    </div>
								    <div class="card-footer">
								  	  <h5><span class="badge badge-info">${challenge.challReward} 점 획득</span></h5>
								      <div class="challDate">
								     	 <small class="text-muted">(어차피 같으니 뺴서 하나로?)남은시간 - 03:00:28 고정값 수정되어야 합니다<br/></small>
								      </div>
								    </div>
								  </div>
						</div>
		                     	</c:forEach>
						</div>
						
						<br>
						<!-- progress 3단계로 나눠서 진행상황에 따라 상태가 표시되게만들기 -->
						<!-- 
						<p>
						  <a class="btn btn-primary" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">알아두세요!</a>
						</p>
						<div class="row">
						    <div class="col-6 col-md-7">
						    <div class="collapse multi-collapse" id="multiCollapseExample1">
						      <div class="card card-body">
						      	<b>하단의 상태바를 통해 주간도전과제의 진행상황을 볼 수 있습니다.</b>
						        3개의 도전과제를 다 수행했을 시 추가 포인트를 적립할 수 있습니다.
						      </div>
						    </div>
						  </div>
						</div>
												
						<br>
						하나도 수행 안했을 때
						<div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 1%"></div>
						</div>
						<br>
						
						하나만 깻을때 
						<div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%"></div>
						</div>
						<br>
						
						두개만 깻을떄
						<div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 65%"></div>
						</div>
						<br>
						
						전부다 수행했을떄
						<div class="progress">
						  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
						</div>
						<br>
						<br>
						<br> -->
						

						
						
	</div>		
</body>
</html>