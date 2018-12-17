<%@page import="net.member.db.MemberBean"%>
<%@page import="net.member.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
<%
request.setCharacterEncoding("utf-8");
String id=(String)session.getAttribute("email");
MemberDAO mdao=new MemberDAO();
MemberBean mb=mdao.getMember(id);
%>
	<fieldset> 
		<textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea> 
        <br/> 
        <input id="inputMessage" type="text"/> 
        <input type="submit" value="send" onclick="send()" /> 
	</fieldset> 
</body> 
    <script type="text/javascript"> 
		var textarea = document.getElementById("messageWindow"); 
        var webSocket = new WebSocket('ws://localhost:8080/Chat/broadcasting'); 
        var inputMessage = document.getElementById('inputMessage'); 
      
        webSocket.onerror = function(event) { 
        	onError(event) 
      	}; 
   
      	webSocket.onopen = function(event) { 
        	onOpen(event) 
      	}; 
   
      	webSocket.onmessage = function(event) { 
        	onMessage(event) 
      	}; 
   
      	function onMessage(event) { 
			textarea.value += "상대 : " + event.data + "\n"; 
      	} 
   
      	function onOpen(event) { 
			textarea.value += "연결 성공\n"; 
      	} 
   
      	function onError(event) { 
        	alert(event.data); 
      	} 
   
      	function send() { 
          	textarea.value += "나 : " + inputMessage.value + "\n";       
          	webSocket.send(inputMessage.value); 
          	inputMessage.value = ""; 
      	} 
    </script> 
</html> 
