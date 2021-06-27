<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>환영합니다!</title>
			<style>
		.home-wrap {
	width: 1065px;
	height:940px;
	left:10%;
	top:5%;
	
	position: relative;
	
	margin-top:10px;
}
.home-wrap img {
	width: 100%;
	height:50%;
	vertical-align: middle;
}
.home-text {
	padding: 5px 10px;
	
	text-align: center;
	position: absolute;
	top: -11%;
	left: 29%;
	font-family:Sans-Serif;
	font-size:25px;
	
}
#skills{
	font-family:Malgun Gothic;
	font-size:40px;
}
#portfolio{
	font-family:Malgun Gothic;
	font-size:80px;
}
#home-button{
	top:10%;
	left:70%;
	padding: 5px 10px;
	position: absolute;
	z-index:3;
}



		</style>
	


 <script src="/resources/dist/js/sb-admin-2.js"></script>
 <link href="/resources/mycss/mycss.css" rel="stylesheet">



</head>
<body> 

	

	
	 
			<div class="home-wrap">
				<div class="home-image">
					<img src="https://cdn.pixabay.com/photo/2016/11/29/08/41/apple-1868496_960_720.jpg" >
					</div>
						<div class="home-text">
						<p id='portfolio'>PORTFOLIO</p>
						<p id='skills'>Skills</p>
						
						<p>Spring Framework<br/>
						ORACLE RDBMS<br/>
						JSP & SERVLET</p>
						
						
						</div>
						
						<div id='home-button'>
						<button type="button" class="orangebt"
						onclick="location.href='board/list'">게시판으로 이동</button>
						</div>
						
			</div>
		
</body>
</html>