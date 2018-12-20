<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("email");
MemberDAO mdao=new MemberDAO();
MemberBean mb=mdao.getMember(id); %>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/chat.css">
	<title>L'harmonie</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script type="text/javascript">
		var lastID = 0;
		function submitFunction() {
			
			var chatName = $('#chatName').val();
			var chatContent = $('#chatContent').val();
			$.ajax({
				type: "POST",
				url: "../chatSubmitServlet",
				data: {
					chatName: encodeURIComponent(chatName),
					chatContent: encodeURIComponent(chatContent)
				},
				success: function(result) {
					if(result == 1) {
						/* alert('전송에 성공했습니다.'); */
						autoClosingAlert('#successMessage', 2000);
					} else if(result == 0) {
						/* alert('이름과 내용을 정확히 입력하세요.'); */
						autoClosingAlert('#dangerMessage', 2000);
					} else {
						/* alert('오류'); */
						autoClosingAlert('#warningMessage', 2000);
					}
				}
			});
			/* $('#chatName').val(''); */
			$('#chatContent').val('');
		}
	
		
		function autoClosingAlert(selector, delay) {
			var alert = $(selector).alert();
			alert.show();
			window.setTimeout(function() {alert.hide()}, delay);
		}
		
		
		function chatListFunction(type) {
			$.ajax({
				type: "POST",
				url: "../chatListServlet",
				data: {
					listType: type,
				},
				success: function(data) {
					if(data == "") return;
					var parsed = JSON.parse(data);
					var result = parsed.result;
					for(var i = 0; i < result.length; i++) {
						addChat(result[i][0].value, result[i][1].value, result[i][2].value);
					}
					lastID = Number(parsed.last);
					/* alert(lastID); */
				}
			});		
		}
		
		
		function addChat(chatName, chatContent, chatTime) {
			var icon="";
			if(chatName=="관리자"){
				icon="../images/adminIcon.png";
			} else {
				icon="../images/myIcon.png";
			}			
			$('#chatList').append('<div class="row">' + 					
						'<div class="col-lg-12">' + 
						'<div class="media">' + 
						'<a class="pull-left" href="#">' +  						
						'<img class="media-object img-circle" src="'+icon+'" width="30px" height="30px" alt="">' +					
						'</a>' + 
						'<div class="media-body">' + 
						'<h4 class="media-heading">' + 
						chatName + 
						'<span class="small pull-right">' + 
						chatTime + 
						'</span>' + 
						'</h4>' + 
						'<p>' + 
						chatContent + 
						'</p>' + 
						'</div>' +
						'</div>' + 
						'</div>' + 
						'</div>' +						
						'<hr>');	
			$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
		}
		
		
		function getInfiniteChat() {
			setInterval(function() {
				chatListFunction(lastID);
			}, 1000);
		}
	</script>
</head>
<body>
<% 
if(id == null){
	%>
	<script>
				alert("로그인 후 이용해주세요.");
				window.opener = window.location.href; self.close();			 
	</script>
	<% 
}
%>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>실시간 한 줄 문의</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 500px;"></div>								
							<div class="portlet-footer">						
								<div class="row">																	
									<div class="form-group col-xs-4">
										<input style="height: 40px;" type="hidden" id="chatName" class="form-control" placeholder="이름" maxlength="8" value="<%=mb.getName() %>">																
									</div>
								</div>
								<div class="row" style="height: 90px;">
									<div class="form-group col-xs-10">
										<!-- <textarea style="height: 40px;" id="chatContent" class="form-control" placeholder="메세지를 입력하세요." maxlength="100"></textarea> -->
										<input style="height: 40px;" type="text" id="chatContent" class="form-control" placeholder="메세지를 입력하세요." maxlength="100">
									</div>
									<div class="form-group col-xs-2">
										<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
										<div class="clearfix"></div>
									</div>
		<div class="alert alert-success" id="successMessage" style="display: none;">
			<strong>전송완료</strong>
		</div>
		<div class="alert alert-danger" id="dangerMessage" style="display: none;">
			<strong>내용을 입력해주세요.</strong>
		</div>
		<div class="alert alert-warning" id="warningMessage" style="display: none;">
			<strong>오류</strong>
		</div>										
								</div>																
							</div>												
						</div>
					</div>
				</div>
			</div>
		</div>
<!--  -->
	</div>			
	<!-- <button type="button" class="btn btn-default pull-right" onclick="chatListFunction('today');">추가</button> -->
	<!-- <button type="button" class="btn btn-default pull-right" onclick="chatListFunction('ten');">추가</button> -->
	<script type="text/javascript">
		$(document).ready(function() {
			chatListFunction('ten');
			getInfiniteChat();
		});
	</script>
</body>
</html>