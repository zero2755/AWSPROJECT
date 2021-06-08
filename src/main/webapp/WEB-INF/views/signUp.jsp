<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="./header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원 가입 창</title>
</head>
<body>
	<form role="form" action="/signUp" method="post">
		<div>
		
			<div class="form-group">
			<label>userid</label>
			<input name="userid">
			</div>
			<div class="form-group">
			<label>userpw</label>
			<input name="userpw">
			</div>
			<div class="form-group">
			<label>userName</label>
			<input name="userName">
			</div>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>    
			
			
			<button type="submit"  class="btn btn-default">회원가입하기</button>
			<button type="reset"  class="btn btn-default">reset</button>
		
			
		</div>
		
		 
	</form>
</body>
</html>