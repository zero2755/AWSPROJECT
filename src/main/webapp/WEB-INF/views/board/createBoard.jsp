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
	
	<form role="form" action="/board/createBoard" method="post">
		<div>
			<label>Title</label>
			<input name="boardTitle">
			
			<label>Text area</label>
			<textarea name="boardContent"></textarea>
			 
			
			<label>writer</label>
			<input name="boardWriter">
			
			
			<button type="submit">submit</button>
			<button type="reset">reset</button>
		
		
		</div>
		
	
	</form>


</body>




</html>