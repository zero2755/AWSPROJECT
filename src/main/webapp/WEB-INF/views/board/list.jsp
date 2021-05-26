<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3CDTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			<a  href='/board/readBoard?boardNum=<c:out value="${board.boardNum}"/>'>
			<c:out value="${board.boardTitle}" />
			</a>
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
		<button id='regBtn' type="button">Register New Board</button>
		
	</div>
	



<script type="text/javascript">
	
	$(document).ready(
			
			
			history.replaceState({},null,null);
			
		
			
			function(){
				
				$("#regBtn").on("click",function(){
					
					self.location="/board/createBoard";
					
				});
				
				
			 
			
			});



</script>
	
	
	
	
	
	
	
</body>
</html>