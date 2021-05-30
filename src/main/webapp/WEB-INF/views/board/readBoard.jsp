<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
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

	
	
	<!-- form형식 확장을 위해 -->
	
	<button data-oper='updateBoard' >게시글 수정</button>
	<button data-oper='list'>게시글 리스트</button>
	
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


<!-- 댓글목록 -->

<div class='row'>

  <div class="col-lg-12">

    <!-- /.panel -->
    <div class="panel panel-default">
<!--       <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> -->
      
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
      </div>      
      
      
      <!-- /.panel-heading -->
      <div class="panel-body">        
      
        <ul class="chat">

        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->

	<div class="panel-footer"></div>


		</div>
  </div>
  <!-- ./ end row -->
</div>



<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='replyer' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2021-03-01 15:00'>
              </div>
      
            </div>
<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">Update</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Delete</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->






</body>

<script type="text/javascript" src="../../resources/js/reply.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	  
	  var boardNumValue = '<c:out value="${board.boardNum}"/>';
	  var replyUL = $(".chat");
	  
	    showList(1);
	    
	function showList(page){
		
		  console.log("show list " + page);
	    
	    replyService.getList({boardNum:boardNumValue,page: page|| 1 }, function(replyCnt, list) {
	      
	    console.log("replyCnt: "+ replyCnt );
	    console.log("list: " + list);
	    console.log(list);
	    
	    if(page == -1){
	      pageNum = Math.ceil(replyCnt/10.0);
	      showList(pageNum);
	      return;
	    }
	      
	     var str="";
	     
	     if(list == null || list.length == 0){
	       return;
	     }
	     
	     for (var i = 0, len = list.length || 0; i < len; i++) {
	       str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
	       str +="  <div><div class='header'><strong class='primary-font'>["
	    	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
	       str +="    <small class='pull-right text-muted'>"
	           +replyService.displayTime(list[i].replyDate)+"</small></div>";
	       str +="    <p>"+list[i].reply+"</p></div></li>";
	     }
	     
	     replyUL.html(str);
	     
	     showReplyPage(replyCnt);

	 
	   });//end function
	     
	 }//end showList
	    
	    var pageNum = 1;
	    var replyPageFooter = $(".panel-footer");
	    
	    function showReplyPage(replyCnt){
	      
	      var endNum = Math.ceil(pageNum / 10.0) * 10;  
	      var startNum = endNum - 9; 
	      
	      var prev = startNum != 1;
	      var next = false;
	      
	      if(endNum * 10 >= replyCnt){
	        endNum = Math.ceil(replyCnt/10.0);
	      }
	      
	      if(endNum * 10 < replyCnt){
	        next = true;
	      }
	      
	      var str = "<ul class='pagination pull-right'>";
	      
	      if(prev){
	        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
	      }
	      
	      for(var i = startNum ; i <= endNum; i++){
	        
	        var active = pageNum == i? "active":"";
	        
	        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	      }
	      
	      if(next){
	        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
	      }
	      
	      str += "</ul></div>";
	      
	      console.log(str);
	      
	      replyPageFooter.html(str);
	    }
	     
	    replyPageFooter.on("click","li a", function(e){
	       e.preventDefault();
	       console.log("page click");
	       
	       var targetPageNum = $(this).attr("href");
	       
	       console.log("targetPageNum: " + targetPageNum);
	       
	       pageNum = targetPageNum;
	       
	       showList(pageNum);
	     });     


	   
	    var modal = $(".modal");
	    var modalInputReply = modal.find("input[name='reply']");
	    var modalInputReplyer = modal.find("input[name='replyer']");
	    var modalInputReplyDate = modal.find("input[name='replyDate']");
	    
	    var modalModBtn = $("#modalModBtn");
	    var modalRemoveBtn = $("#modalRemoveBtn");
	    var modalRegisterBtn = $("#modalRegisterBtn");
	    
	    $("#modalCloseBtn").on("click", function(e){
	    	
	    	modal.modal('hide');
	    });
	    
	    $("#addReplyBtn").on("click", function(e){
	      
	      modal.find("input").val("");
	      modalInputReplyDate.closest("div").hide();
	      modal.find("button[id !='modalCloseBtn']").hide();
	      
	      modalRegisterBtn.show();
	      
	      $(".modal").modal("show");
	      
	    });
	    

	    modalRegisterBtn.on("click",function(e){
	      
	      var reply = {
	            reply: modalInputReply.val(),
	            replyer:modalInputReplyer.val(),
	            boardNum:boardNumValue
	          };
	      replyService.add(reply, function(result){
	        
	        alert(result);
	        
	        modal.find("input").val("");
	        modal.modal("hide");
	        
	        //showList(1);
	        showList(-1);
	        
	      });
	      
	    });


	  //댓글 조회 클릭 이벤트 처리 
	    $(".chat").on("click", "li", function(e){
	      
	      var rno = $(this).data("rno");
	      
	      replyService.get(rno, function(reply){
	      
	        modalInputReply.val(reply.reply);
	        modalInputReplyer.val(reply.replyer);
	        modalInputReplyDate.val(replyService.displayTime( reply.replyDate))
	        .attr("readonly","readonly");
	        modal.data("rno", reply.rno);
	        
	        modal.find("button[id !='modalCloseBtn']").hide();
	        modalModBtn.show();
	        modalRemoveBtn.show();
	        
	        $(".modal").modal("show");
	            
	      });
	    });
	  
	    
	

	    modalModBtn.on("click", function(e){
	    	  
	   	  var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
	   	  
	   	  replyService.update(reply, function(result){
	   	        
	   	    alert(result);
	   	    modal.modal("hide");
	   	    showList(pageNum);
	   	    
	   	  });
	   	  
	   	});


	   	modalRemoveBtn.on("click", function (e){
	   	  
	   	  var rno = modal.data("rno");
	   	  
	   	  replyService.remove(rno, function(result){
	   	        
	   	      alert(result);
	   	      modal.modal("hide");
	   	      showList(pageNum);
	   	      
	   	  });
	   	  
	   	});

	 
	});
	
	

</script>





<script type="text/javascript" >

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