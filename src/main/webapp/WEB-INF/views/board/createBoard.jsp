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
<title>게시글 작성</title>
</head>
<body>
	
	<form role="form" action="/board/createBoard" method="post">
		<div>
		
			<div class="form-group">
			<label>Title</label>
			<input name="boardTitle">
			</div>
			
			<div class="form-group">
			<label>Text area</label>
			<textarea name="boardContent"></textarea>
			 </div>
			
			
			
			 <div class="form-group">
            <label>Writer</label> <input class="form-group" name='boardWriter' 
                value='<sec:authentication property="principal.username"/>' readonly="readonly">
        	  </div>
			
			<button type="submit"  class="btn btn-default">게시글 등록하기</button>
			<button type="reset"  class="btn btn-default">reset</button>
		
			
		</div>
		
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>    
	</form>


</body>




</html>