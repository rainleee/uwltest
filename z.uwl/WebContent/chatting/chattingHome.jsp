<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소켓 서버</title>
 
<style>
#chat_box {
    width: 800px;
    min-width: 800px;
    height: 500px;
    min-height: 500px;
    border: 1px solid black;
}
#msg {
    width: 700px;
}
#msg_process {
    width: 90px;
}
</style>
</head>
<body>
    <div id="chat_box"></div>
    <input type="text" id="msg">
    <button id="msg_process">전송</button>
 
    <script src="http://localhost:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script>
    
    
    var senderId = null;
    
            $(document).ready(function(){
            	
                var socket = io("http://localhost:82"); //82번 포트와 소켓을 연다
                var chattingRoomNo = '10004';	//82번포트와 연결됨과 동시에 채팅방 번호를 넘겨준다.
                var enterUserId = "${user.userId}";	//입장 회원의 정보
                socket.emit("enterUserId", enterUserId);	//입장 회원 정보 전송
                socket.emit("chattingRoomNo", chattingRoomNo);	//채팅방 번호 전송
                
                
                //msg에서 키를 누를떄
                $("#msg").keydown(function(key){
                    //해당하는 키가 엔터키(13) 일떄
                    if(key.keyCode == 13){
                        //msg_process를 클릭해준다.
                        msg_process.click();
                    }
                });
                
                //msg_process를 클릭할 때
                $("#msg_process").click(function(){
	                var userId = "${user.userId}";	//전송을 누를때 세션에 있는 유저 아이디를 같이 보낸다.	
                     socket.emit("sender", userId);	//보낸 유저아이디와 메세지는 몽고디비에 저장한다.
                     socket.emit("send_msg", $("#msg").val());	
                    //#msg에 벨류값을 비워준다.
                    $("#msg").val("");
                    
                });
                
                
                socket.on('sender', function(sender){
                	senderId = sender;
                });
                
                socket.on('send_msg', function(msg) {
                    $('<div></div>').text(senderId+" : "+msg).appendTo("#chat_box");	//채팅 내용을 계속 붙인다.
                    	//수정해야 할 점은 내가 채팅한거면 왼쪽에 어펜드 시키고 상대방이 보낸건 오른쪽에 어펜트 시켜준다.
                });
                
                //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
            });
        </script>
</body>
</html>
