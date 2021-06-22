<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>


 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
	


 <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	  <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

  

<title>Board List Page</title>
</head>


<body>
	<h1 id="listPageTitle"> LIST PAGE</h1>
	<div class="panel-body"> 
	<table class="table table-striped table-bordered table-hover">
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
	</div>
	
	<div id='pagDiv'>
		<ul class="pagination">
					<c:if test="${pageMaker.prev}">
							<li class="page-item">
							
							<a href="/board/list?pageNum=${pageMaker.startPage -1}&amountPerPage=${pageMaker.cri.amountPerPage}">
							Prev</a>
								
								</li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							
							<li class="page-item">
								<a href="/board/list?pageNum=${num}&amountPerPage=${pageMaker.cri.amountPerPage}">${num}</a></li>
							
							
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="page-item">
							<a href="/board/list?pageNum=${pageMaker.endPage +1}&amountPerPage=${pageMaker.cri.amountPerPage}">
							Next</a>
								
								</li>
								
						</c:if>
		
		
		</ul>
	
	
	</div>
	
	
	
					<div >
		
						<form id='searchForm' action="/board/list" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amountPerPage'
								value='<c:out value="${pageMaker.cri.amountPerPage}"/>' />
							<button >Search</button>
						</form>
						
	
	
		
		
	
	
					</div>
				
	
	
	<form id='actionForm' action="/board/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amountPerPage' value='${pageMaker.cri.amountPerPage}'>
				<input type='hidden' name='boardNum' value='#'>	
				<input type='hidden' name='type'
					value='<c:out value="${ pageMaker.cri.type }"/>'> 
				<input type='hidden' name='keyword'
					 value='<c:out value="${ pageMaker.cri.keyword }"/>'>
					 
		

	</form>
	
	<div id='Btns'> 
	<button id='regBtn' class="btn btn-primary" type="button">Register New Board</button>
	</div>
	

	 



<script type="text/javascript">
	
	$(document).ready(
			
			
			
			
		
			
			function(){
				
				history.replaceState({},null,null);
				
				
				$("#regBtn").on("click",function(){
					
					self.location="/board/createBoard";
					
				});
				
				
				$("#page-item").on(
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
				
				
				$("#searchForm button").on(
						"click",
						function(e) {

							if (!searchForm.find("option:selected")
									.val()) {
								alert("검색종류를 선택하세요");
								return false;
							}

							if (!searchForm.find(
									"input[name='keyword']").val()) {
								alert("키워드를 입력하세요");
								return false;
							}

							searchForm.find("input[name='pageNum']")
									.val("1");
							e.preventDefault();

							searchForm.submit();

						});
				
				
			 
			
			});
	
	
	
	


</script>
	


    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>	
	
	
	
	
	
</body>
</html>
