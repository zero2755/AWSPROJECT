<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
 
<meta charset="UTF-8">
<title>Reading Board Page</title>
</head>
<body>




<div class="list-group">
			<div class="list-group-item">
				<label>BoardNumber</label>
				<input name="boardNum" value='<c:out value="${board.boardNum }"/>' readonly="readonly">
			</div>
			
			<div class="list-group-item">
				<label>TITLE</label>
				<input name="boardTitle" value='<c:out value="${board.boardTitle }"/>' readonly="readonly">
			</div>
			
			<div class="list-group-item">
				<label>CONTENT</label>
				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"  readonly="readonly">
				<c:out value="${board.boardContent }"/>
				</textarea>
				
			</div>
			
				<div class="list-group-item">
				<label>WRITER</label>
				<input name="boardWriter" value='<c:out value="${board.boardWriter }"/>' readonly="readonly">
			</div>
</div>
		

 

<div >
	<table id='listTable' class="table table-striped table-bordered table-hover" text-align:'center'>
		<tr>
			<th>리플번호</th>
			<th>리플내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>수정일</th>
			<th>댓글삭제하기</th>
		</tr>
		
		<c:forEach items="${replyList}" var="replyVO">
	
		<tr >
		 
			 
			<td><c:out value="${replyVO.rno}" /></td>
			<td>
				
				
					
								<c:out value="${replyVO.reply}" />
			 
			</td>
		
			<td><c:out value="${replyVO.replyer}" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${replyVO.replyDate}" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${replyVO.updateDate}" /></td>
			<td>
			
				<form action="/replies/${replyVO.rno}/${board.boardNum}"  method="post">
  					
  					
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
					<input type='hidden' name='amountPerPage' value='<c:out value="${cri.amountPerPage}"/>'>
  					<input type="hidden" name="boardNum" value="${board.boardNum }">
  					<button type="submit" class="btn btn-default">댓글삭제</button>
  					
  					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
				</form>
			
			
			</td>
			
			
		</tr>
		
		</c:forEach>
		
	</table>

	</div>




			
<div class="list-group">
<div class="list-group-item">
<form name="replyForm" action="/reply/new" method="post">
		
			 
			<input type='hidden' id='boardNum' name='boardNum' value='<c:out value="${board.boardNum}"/>'>
			
			
			<label>Reply</label>
			<input type='text' name='reply' />
			 
			 
			<label>Replyer</label>
			<sec:authentication property="principal" var="pinfo"/>
			 <sec:authorize access="isAuthenticated()">
			   <input type ='text' name='replyer' value='${pinfo.username}' readonly='readonly'/>
			 </sec:authorize>
			 
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
			
		 	

	
	</form>
	<div class='readBtns'>
	
	

       
      <sec:authorize access="isAuthenticated()">
       <button data-oper='createReply' class="btn btn-default">새 댓글 등록</button>
      </sec:authorize>
       
       
	
	
	
	 
	<button data-oper='list' class="btn btn-default">게시글 리스트</button>
	
	
	 
	
	  <sec:authentication property="principal" var="pinfo"/>

        <sec:authorize access="isAuthenticated()">

        <c:if test="${pinfo.username eq board.boardWriter}">
        
        <button data-oper='updateBoard' class="btn btn-default">게시글 수정</button>
        
        </c:if>
      </sec:authorize>
      
	
	</div>
</div>
</div>








<div>

	
	
	
	
	
	
	
	
	 
	
	<form id='operForm' action="/board/updateBoard" method="get">
		<input type='hidden' id='boardNum' name='boardNum' value='<c:out value="${board.boardNum}"/>'>
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		<input type='hidden' name='amountPerPage' value='<c:out value="${cri.amountPerPage}"/>'>
		
		<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword'
					 value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		
		
	</form>
	
	
</div>


 



</body>



<script type="text/javascript" >

$(document).ajaxSend(function(e, xhr, options) { 
	 var csrfHeaderName ="${_csrf.headerName}"; 
	 var csrfTokenValue="${_csrf.token}";
    xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
 }); 

$(document).ready(function(){
	
	
	var operForm=$("#operForm");
	
	var replyForm=$("#replyForm");
	
	
	
	  $("button[data-oper='updateBoard']").on("click", function(e){
		    
		    operForm.attr("action","/board/updateBoard").submit();
		    
		  });
		  
		    
	$("button[data-oper='list']").on("click", function(e){
		    
		    operForm.find("#boardNum").remove();
		    operForm.attr("action","/board/list")
		    operForm.submit();
		    
		 });  
	
	
	$("button[data-oper='createReply']").on("click", function(e){
	  	
		//var test1 = document.replyForm.getElementByName('reply');
		var replyVal =document.replyForm.reply.value;
		var replyerVal= document.replyForm.replyer.value;
		var boardNumVal=document.replyForm.boardNum.value;
	
		
		
		
		var replyJSON={
				reply: replyVal,
	            replyer: replyerVal,
	            boardNum: boardNumVal
				
		}
		
		 
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(replyJSON),
			contentType : "application/json; charset=utf-8",
		
			success : function() {
				
				alert("enroll good");
				
				
				window.location.reload();
				
			},
			error : function() {
				
				alert("enroll fail");
			}
		})
		
	
	 }); 
	 
	 
});


</script>


</html>