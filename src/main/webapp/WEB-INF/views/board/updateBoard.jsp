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
<title>Insert title here</title>
</head>
<body>
	
	<form role="form" action="/board/updateBoard" method="post">
		<div>
			
			<div class="form-group">
			<label>boardNum</label>
			<input name="boardNum" value="${board.boardNum}" readonly="readonly">
			</div>
			
			
			<div class="form-group">
			<label>Title</label>
			<input name="boardTitle">
			</div>
			
			<div class="form-group">
			<label>Text area</label>
			<textarea name="boardContent"></textarea>
			 </div>
			
			
			<div class="form-group">
			<label>writer</label>
			<input name="boardWriter" value="${board.boardWriter }" readonly="readonly">
			</div>
			
			<!-- 추가 -->
			
			 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
			
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type='hidden' name='amountPerPage' value='<c:out value="${cri.amountPerPage}"/>'>
			
			<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword'
					 value='<c:out value="${ pageMaker.cri.keyword }"/>'>
			
			
			
			<button type="reset" class="btn btn-default">reset</button>
			<button type="submit" data-oper='list' class="btn btn-default">게시글 목록</button>
			
	
	
	
	
<sec:authentication property="principal" var="pinfo"/>

<sec:authorize access="isAuthenticated()">

<c:if test="${pinfo.username eq board.boardWriter}">

  <button type="submit" data-oper="updateBoard" class="btn btn-default">수정하기</button>
 <button type="submit" data-oper="deleteBoard" class="btn btn-default">삭제</button>
</c:if>
</sec:authorize>	
				
		
		</div>
		
	
	</form>


</body>

<script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'deleteBoard'){
	      formObj.attr("action", "/board/deleteBoard");
	      
	    }else if(operation === 'list'){
	      
    	
	      formObj.attr("action", "/board/list").attr("method","get");
	      
	      
	     
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amountPerPage']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	   	  formObj.append(keywordTag);
	      formObj.append(typeTag);	       
	    }
	    
	    formObj.submit();
	  });

});

</script>

</html>