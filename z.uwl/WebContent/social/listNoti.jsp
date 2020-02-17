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
        
        .card-header, .card-footer {
        	background-color: #fbebde;
        }
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
			<div class="container">
				<c:forEach items="${map.list}" var="noti">
					<div class="card text-left">
					  <div class="card-header">
					    ${noti.notiNo}
					  </div>
					  <div class="card-body">
					    <h5 class="card-title"></h5>
					    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
					    <a href="#" class="btn btn-primary">Go somewhere</a>
					  </div>
					  <div class="card-footer text-muted">
					    2 days ago
					  </div>
					</div>
				</c:forEach>
			</div>
        </section>
        <section id="right">
			<jsp:include page="/layout/right.jsp" />
        </section>
    </main>
</body></html>