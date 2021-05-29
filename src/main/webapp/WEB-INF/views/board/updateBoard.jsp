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
	
	<form role="form" action="/board/updateBoard" method="post">
		<div>
			
			<label>boardNum</label>
			<input name="boardNum" value="${board.boardNum}" readonly="readonly">
			
			<label>Title</label>
			<input name="boardTitle">
			
			<label>Text area</label>
			<textarea name="boardContent"></textarea>
			 
			
			<label>writer</label>
			<input name="boardWriter">
			
			
			<!-- 추가 -->
			<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
			<input type='hidden' name='amountPerPage' value='<c:out value="${cri.amountPerPage}"/>'>
			
			
			<button type="submit" data-oper="updateBoard">수정</button>
			<button type="reset">reset</button>
			<button type="submit" data-oper='list'>목록</button>
			<button type="submit" data-oper="deleteBoard">삭제</button>
		
		
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
	      
	    	
	    	  //기존의 처리 1페이지로
	    	  // self.location="/board/list";
	 	     // return;
	    	
	    	//move to list with cri정보
	      formObj.attr("action", "/board/list").attr("method","get");
	      
	      
	     
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amountPerPage']").clone();
	    //  var keywordTag = $("input[name='keyword']").clone();
	    //  var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	   //   formObj.append(keywordTag);
	   //   formObj.append(typeTag);	       
	    }
	    
	    formObj.submit();
	  });

});

</script>

</html>