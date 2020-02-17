<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html>
	
<head>
	<meta charset="UTF-8">
		
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
    <!-- Bootstrap Dropdown Hover JS -->
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method","POST").attr("action","/schoolRank/getSchoolRankingList").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 
			 $("input[name=searchKeyword]").focus();
			 	
				$("input[name=searchKeyword]").keydown(function(key){
			    	if(key.keyCode == 13){
		    			fncGetList(1);
			    	}
			    } );
			 $( ".btn-default:contains('검색')" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
					fncGetList(1);
				});
			 
			 $( ".page-header h2" ).on("click" , function() {
					//Debug..
					console.log("sds");
					self.location ="/schoolRank/getSchoolRankingList/";
				});
			 
			 
		 });
		
		
		
		//============= 무한스크롤 처리 %page크기만 달라질뿐 내용이 들어오거나 하진 않음.(정보는 들어오지만 뿌려주는걸 하지못하고있음. )% =============
		var page = 1;
		
		$(function(){
			$(window).data('ajaxready', true).scroll(function(){
				var maxHeight = $(document).height();
				var currentScroll = $(window).scrollTop() + $(window).height();
				var searchCondition = $("select[name='searchCondition']").val();
				var searchKeyword = $("input[name='searchKeyword']").val();
				
				if($(window).data('ajaxready') == false) return;
				if(maxHeight <= currentScroll){
					if(page <= ${resultPage.maxPage}){
					$(window).data('ajaxready', false);
					page++;
					console.log('page : ' + page);
					
					$.ajax({
						url : "/schoolRank/rest/getSchoolRankingList",
						method : "POST",
						dataType : "json",
						data : JSON.stringify({
							searchCondition : searchCondition,
							searchKeyword : searchKeyword,
							currentPage : page
						}),
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(data){
							console.log(data);
							
							 for (var i = 0; i < data.list.length; i++) {
								console.log("학교이름 : " + data.list[i].schoolName);
								
								var addData = "<td align='center'>" + ${schoolRank.ranking} + "</td>"
												+ "<td></td>"
												+ "<td align='left'><input type='hidden' value='" + ${schoolRank.schoolNo} + "'>" +  ${schoolRank.schoolName} + "</td>"
												+ "<td></td>"
												+ "<td align='left'>" + ${schoolRank.schoolAddress} + "</td>"
												+ "<td></td>"
												+ "<td align='left'>" + ${schoolRank.totalActivityPoint} + "</td>"
												+ "<td></td>";
								
								$(addData).appendTo("#loadList");
							} 
							
							$(window).data('ajaxready', true);
						}
					});
						
					}
				}
			})
			
		})
	</script>
	
</head>

<body>
	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
		<!-- role에 따른 admin user 분류 할것 -->
			<h2>학교랭킹 리스트</h2>
		<%-- <c:if test="${param.menu == 'manage'}">
	       <h3>상품 관리</h3>
       </c:if> --%>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    	
		    	
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="1" ${!empty searchCondition && searchCondition == "1" ? "selected" : ""} >학교이름</option>
						
						<option value="2" ${!empty searchCondition && searchCondition == "2" ? "selected" : ""} >주소</option>
					
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어입력하셈 ㅋㅋ"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  <br/>
				  <br/>
				  <br/>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
		<tbody>
			
		
		<div class="container">
		<div class="row">
			<tr class="ct_list_pop">
						<td align="center">랭킹</td>
						<td></td>
						<td align="left">학교이름</td>
						<td></td>
						<td align="left">주소</td>
						<td></td>
						<td align="left">총 점수</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="12" bgcolor="D6D7D6" height="1"></td>
					</tr>
		   <c:set var="i" value="0" />
				<c:forEach var="schoolRank" items="${list}">
						
					<tr id="loadList" class="ct_list_pop">
						<td align="center">${schoolRank.ranking}</td>
						<td></td>
	
						<td align="left"><input type="hidden" value="${schoolRank.schoolNo}"> ${schoolRank.schoolName}</td>
					
						<td></td>
						<td align="left">${schoolRank.schoolAddress}</td>
						<td></td>
						<td align="left">${schoolRank.totalActivityPoint}</td>
						<td></td>
				</tr>
				<tr>
					<td colspan="12" bgcolor="D6D7D6" height="1"></td>
				</tr>
			</c:forEach>
		</div>
		</div>
			
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
	
</body>

</html>