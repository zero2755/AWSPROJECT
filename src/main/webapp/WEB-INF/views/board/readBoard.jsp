<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
			
			<div>
				<label>BoardNumber</label>
				<input name="boardNum" value='<c:out value="${board.boardNum }"/>' readonly="readonly">
			</div>
			
			<div>
				<label>TITLE</label>
				<input name="boardTitle" value='<c:out value="${board.boardTitle }"/>' readonly="readonly">
			</div>
			
			<div>
				<label>CONTENT</label>
				<input name="boardContent" value='<c:out value="${board.boardContent }"/>' readonly="readonly">
			</div>
			
			<div>
				<label>WRITER</label>
				<input name="boardWriter" value='<c:out value="${board.boardWriter }"/>' readonly="readonly">
			</div>


 
</div>

<div>

	<!--   
	<button data-oper='updateBoard'  onclick="location.href='/board/updateBoard?boardNum=<c:out value="${board.boardNum }"/>'">
	  게시글 수정
	</button>

	<button data-oper='list'
		onclick="location.href='/board/list'">
	
	게시글 목록</button>
	
	<button data-oper='deleteBoard'  onclick="location.href='/board/deleteBoard?boardNum=<c:out value="${board.boardNum }"/>'">
	  게시글 삭제
	</button>
	-->
	
	<!-- form형식 확장을 위해 -->
	
	<button data-oper='updateBoard' >게시글 수정</button>
	<button data-oper='list'>게시글 리스트</button>
	
	<form id='operForm' action="/board/updateBoard" method="get">
		<input type='hidden' id='boardNum' name='boardNum' value='<c:out value="${board.boardNum}"/>'>
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		<input type='hidden' name='amountPerPage' value='<c:out value="${cri.amountPerPage}"/>'>
	</form>
	
	
</div>


</body>

<script type="text/javascript">

$(document).ready(function(){
	
	
	var operForm=$("#operForm");
	
	  $("button[data-oper='updateBoard']").on("click", function(e){
		    
		    operForm.attr("action","/board/updateBoard").submit();
		    
		  });
		  
		    
	$("button[data-oper='list']").on("click", function(e){
		    
		    operForm.find("#boardNum").remove();
		    operForm.attr("action","/board/list")
		    operForm.submit();
		    
		 });  
});


</script>


</html>