<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    
    <style>
    	body {
    		overflow: hidden;
    	}
    	div.work {
    		overflow-y: scroll;
    		height: calc(100vh - 56px);
    	}
    </style>
</head>
<body>
	<div class="header">
		<jsp:include page="/matching/commonTop.jsp" />
	</div>
	<div class="main">
		<div class="row">
			<div class="col-2">
				<jsp:include page="/matching/commonLeft.jsp" />
			</div>
			<div class="col-8">
				<div class="work">
					
				</div>
			</div>
			<div class="col-2">
				<jsp:include page="/matching/commonRight.jsp" />
			</div>
		</div>
	</div>
</body>
</html>