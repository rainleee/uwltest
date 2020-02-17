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
    
        <script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Roboto&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
    
    <script type="text/javascript">
    
    </script>
    
    
    
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

        input:focus {
            outline: none;
        }
        body {
            color: #333;
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            font-family: 'Nanum Gothic', sans-serif;
        }

        div.left {
            background-color: #EBAD7A;
            width: 50%;
            height: 100vh;
            position: relative;
            float: left;
        }

        div.intro {

            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #fff;
            line-height: 1.5;
        }

        div.intro div+div {

            margin-top: 30px;
        }

        div.intro div span:nth-child(1) {

            display: inline-block;
            font-size: 23px;
            width: 30px;
            text-align: center;
            vertical-align: middle;
            margin-right: 10px;
        }

        div.intro div:nth-child(2) span:nth-child(1) {
            vertical-align: top;
        }

        div.intro div span:nth-child(2) {

            font-size: 19px;
            font-weight: bold;
            width: 310px;
            display: inline-block;
        }

        div.right {

            width: 50%;
            height: 100vh;
            float: right;
            position: relative;
        }

        div.rightTop {
            text-align: center;
        }

        div.loginForm {


            display: inline-block;
            text-align: left;
            padding-top: 15px;
        }

        div.id {

            width: 210px;
            display: inline-block;
            margin-right: 10px;
        }

        div.password {

            width: 210px;
            display: inline-block;
            vertical-align: top;
            margin-right: 10px;
        }

        div.loginForm div p:nth-child(1) {
            background-color: #f0f0f0;
            padding: 2px 8px 0;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            color: #656565;
        }

        div.loginForm div p:nth-child(2) input {
            width: 100%;
            line-height: 30px;
            border: none;
            border-bottom: 2px solid;
            padding: 0 10px 2px;
            font-size: 19px;
            background-color: #f0f0f0;
        }

        div.password p:nth-child(3) a {

            color: #EBAD7A;
            font-size: 14px;
            display: block;
            margin-top: 5px;
            
            margin-left: 8px;
        }

        div.loginForm div:nth-child(3) {

            display: inline-block;
            vertical-align: top;
            padding: 7px 0;
        }

        div.loginForm div:nth-child(3) a {

            line-height: 37px;
            display: inline-block;
            padding: 0 17px;
            border-radius: 20px;
            border: 1px solid;
            color: #EBAD7A;
            font-size: 15px;
        }

        div.right>div:nth-child(2) {

            width: 380px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        div.logo {

            margin-bottom: 10px;
        }

        div.right>div:nth-child(2) div:nth-child(2) {

            font-size: 28px;
            font-weight: bold;
            line-height: 1.5;
            margin-bottom: 65px;
        }

        div.right>div:nth-child(2) div:nth-child(3) {

            font-size: 14px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        div.right div:nth-child(2) div:nth-child(4) a {
            background-color: #EBAD7A;
            ;
            display: block;
            text-align: center;
            line-height: 40px;
            border-radius: 20px;
            font-weight: bold;
            color: #fff;
        }

        div.right div:nth-child(2) div:nth-child(4) a:nth-child(2) {
            background-color: #fff;
            border: 1px solid;
            margin-top: 15px;
            color: #EBAD7A;
        }
        p {
        	margin-bottom: 0;
        }
    </style>
    <script type="text/javascript">
    	$(document).ready(function(){
    		 $('#login').on("click",function(){
    			 /*	var userId = $('#userId').val();
    			$.ajax({
    				data : userId,
					url : "/user/rest/checkReport",
					type : "POST",
					data : JSON.stringify({
						userId : userId
					}),
					headers : {
						"Accept" : "application/json",
						"content-Type" : "application/json"
					},
					success : function(data){
						console.log(data);
						console.log("zz")
					},
					error : function(){
						console.log('실패')
					}
    			});*/ 
    			
    			$("form").attr("method","POST").attr("action","/user/login").submit();	
    		});
    	});
    	
    	 $(document).ready(function(){
    		var reportDate = "${stopDate}";
    		var reportStatus = "${stopStatus}";
    		if(reportStatus == 'true'){
	    		Swal.fire({
					  icon: 'error',
					  title: reportDate+'까지 정지되셨어요..',
					  showConfirmButton: true,
					  confirmButtonText : '알겠습니다...',
					  confirmButtonColor: '#FF0000'
					}).then((result) => {
						delete reportDate;
						delete reportStatus;
					});
    		}
    	}); 
    </script>

<title>어울림</title>
</head>
<body>
<form>
     <div class="index">
        <div class="left">
            <div class="intro">
                <div>
                    <span><i class="fas fa-search"></i></span>
                    <span>관심사를 팔로우하세요.</span>
                </div>
                <div>
                    <span><i class="fas fa-user-friends"></i></span>
                    <span>사람들이 무엇에 대해 이야기하고 있는지 알아보세요.</span>
                </div>
                <div>
                    <span><i class="far fa-comment"></i></span>
                    <span>대화에 참여하세요.</span>
                </div>
            </div>
        </div>
        <div class="right">
            <div class="rightTop">
                <div class="loginForm">
                    <div class="id">
                        <p>휴대폰, 이메일, 사용자 아이디</p>
                        <p><input type="text" name="userId" id="userId"></p>
                    </div>
                    <div class="password">
                        <p>비밀번호</p>
                        <p><input type="password" name="password"></p>
                        <p><a href="#">비밀번호를 잊으셨나요?</a></p>
                    </div>
                    <div><a href="#" id="login">로그인</a></div>
                </div>
            </div>
            <div>
                <div class="logo">
                    <img src="/images/twitter_header_photo_1-removebg-preview.png" width="100px" alt="">
                </div>
                <div>지금 전 세계에서 무슨 일이 일어나고 있는지 알아보세요</div>
                <div>
                    오늘 어울림에 가입하세요.
                </div>
                <div>
                    <a href="http://192.168.0.23:8080/user/addUserView.jsp" id="addUser">가입하기</a>
                    <a href="login.jsp" id="login2">로그인</a>
                </div>
            </div>
        </div>
    </div>
  </form>
</body></html>