<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <style>
        div.wrap {
            height: 100vh;
            overflow: hidden;
        }
        div.left {
            overflow-y: scroll;
            height: calc(100vh - 70px);
        }
        div.right {
            overflow-y: scroll;
            height: calc(100vh - 70px);
        }
        div.work {
            overflow-y: scroll;
            height: calc(100vh - 70px);
        }
    </style>
</head>
<body>

    
        
			<jsp:include page="/matching/commonTop.jsp" />
        
        
            <div class="row">
                <div class="col-2">
                    <div class="left">
						<jsp:include page="/matching/left.jsp" />
                    </div>
                </div>
                <div class="col-8">
                    <div class="work">


                    </div>
                </div>
                <div class="col-2">
                    <div class="right">
						<jsp:include page="/matching/right.jsp" />
                    </div>
                </div>
            </div>
        

</body>
</html>