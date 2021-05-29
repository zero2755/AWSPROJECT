<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<style>

        li{
        	float:left;
        	width:30px;
        }

 </style>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



<title>Board List Page</title>
</head>


<body>
	<h1>LIST PAGE</h1>
	
	<table class="listTable">
		<tr>
			<th>보드번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>수정일</th>
		</tr>
		
		<c:forEach items="${list}" var="board">
		
		<tr>
			
			<td><c:out value="${board.boardNum}" /></td>
			<td>
				
				<!--  
				<a class='move' href='<c:out value="${board.boardNum}"/>'>
									<c:out value="${board.boardTitle}" />
					</a>
				-->
					
					<a href="/board/readBoard?boardNum=${board.boardNum}&pageNum=${pageMaker.cri.pageNum}&amountPerPage=${pageMaker.cri.amountPerPage}">
							<c:out value="${board.boardTitle}" /></a>
			 
			</td>
		
			<td><c:out value="${board.boardWriter}" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>
			
		</tr>
		
		</c:forEach>
		
	</table>
	
	
	<div>
		<ul>
					<c:if test="${pageMaker.prev}">
							<li class="linkC">
							
							<a href="/board/list?pageNum=${pageMaker.startPage -1}&amountPerPage=${pageMaker.cri.amountPerPage}">
							Prev</a>
								
								</li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							
							<li class="linkC">
								<a href="/board/list?pageNum=${num}&amountPerPage=${pageMaker.cri.amountPerPage}">${num}</a></li>
							
							
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="linkC">
							<a href="/board/list?pageNum=${pageMaker.endPage +1}&amountPerPage=${pageMaker.cri.amountPerPage}">
							Next</a>
								
								</li>
								
						</c:if>
		
		
		</ul>
	
	
	</div>
	
	
	<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amountPerPage' value='${pageMaker.cri.amountPerPage}'>
				<input type='hidden' name='boardNum' value='#'>	
		

	</form>
	
	
	
	
	
	
	
	
	<div>
		<button id='regBtn' type="button">Register New Board</button>
		
	</div>
	



<script type="text/javascript">
	
	$(document).ready(
			
			
			
			
		
			
			function(){
				
				history.replaceState({},null,null);
				
				
				$("#regBtn").on("click",function(){
					
					self.location="/board/createBoard";
					
				});
				
				
				$("#linkC").on(
						"click",
						function(e) {

							e.preventDefault();

							console.log('click');

							actionForm.find("input[name='pageNum']")
									.val($(this).attr("href"));
							actionForm.submit();
						});
				
				
				$(".move").on("click",function(e) {
				 
							e.preventDefault();
							
							
							
		
													
						
							actionForm.find("input[name='boardNum']")
							.val($(this).attr("href"));
							
							
							actionForm.submit();

					});
				
				
			 
			
			});
	
	
	
	


</script>
	
	
	
	
	
	
	
</body>
</html>