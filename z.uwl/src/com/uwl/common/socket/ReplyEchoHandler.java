package com.uwl.common.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.uwl.service.domain.User;

public class ReplyEchoHandler extends TextWebSocketHandler {

	public ReplyEchoHandler() {
		System.out.println("ReplyEchoHandler()........");
	}

//	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();
	// Connection 연결 되었을 때 => Client가 서버에 접속했을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session);
//		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}

	// Socket에 Message를 보냈을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage  : " + session + "   :   " + message);
		String senderId = getId(session);

//		protocol : sender, receiver, notiOrigin, notiCode 

		String msg = message.getPayload();
		if (!msg.isEmpty()) {
			String[] strs = msg.split(",");
			if (strs != null && strs.length == 5) {
				String sender = strs[0];
				String receiver = strs[1];
				String senderName = strs[2];
				String notiOrigin = strs[3]; // 1. post 2.ask 3. timeline 4. friend 5. question
				String notiCode = strs[4]; // 1. comment 2. like 3.reply 4. requestFriend 5. acceptFriend 6. add

				WebSocketSession receiverSession = userSessions.get(receiver);
				WebSocketSession senderSession = userSessions.get(sender);
				System.out.println("receiver : " + receiverSession.getId() + "\t sender : " + senderSession.getId());
				System.out.println(receiverSession.equals(senderSession));
				
				//	자신에게 메시지 보내지 않기 위한 조건문
				if (!receiverSession.equals(senderSession)) {

					if ("post".equals(notiOrigin) && "comment".equals(notiCode) && receiverSession != null) {
						TextMessage tmpMsg = new TextMessage(senderName + "님이" + " 게시글에 댓글을 달았습니다.");
						System.out.println(tmpMsg);
						receiverSession.sendMessage(tmpMsg);
					}

					if ("post".equals(notiOrigin) && "like".equals(notiCode) && receiverSession != null) {
						TextMessage tmpMsg = new TextMessage(senderName + "님이" + " 게시글을 좋아합니다.");
						System.out.println(tmpMsg);
						receiverSession.sendMessage(tmpMsg);
					}

					if ("timeline".equals(notiOrigin) && "comment".equals(notiCode) && receiverSession != null) {

						TextMessage tmpMsg = new TextMessage(senderName + "님이" + " 타임라인에 댓글을 달았습니다.");
						System.out.println(tmpMsg);
						receiverSession.sendMessage(tmpMsg);
					}

					if ("ask".equals(notiOrigin) && "add".equals(notiCode) && receiverSession != null) {
						TextMessage tmpMsg = new TextMessage("ASK에 질문이 등록되었습니다.");
						System.out.println(tmpMsg);
						receiverSession.sendMessage(tmpMsg);
					}
					
					if ("friend".equals(notiOrigin) && "requestFriend".equals(notiCode) && receiverSession != null) {
						TextMessage tmpMsg = new TextMessage(senderName + "님이 친구신청을 보냈습니다.");
						System.out.println(tmpMsg);
						receiverSession.sendMessage(tmpMsg);
					}
					
					if ("friend".equals(notiOrigin) && "acceptFriend".equals(notiCode) && receiverSession != null) {
						TextMessage tmpMsg = new TextMessage(senderName + "님이 친구신청을 수락했습니다.");
						System.out.println(tmpMsg);
						receiverSession.sendMessage(tmpMsg);
					}
				}
			}
		}

	}

	private String getId(WebSocketSession session) {
		// WebSocketSesssion에 있는 httpSession을 Map에 저장
		Map<String, Object> httpSession = session.getAttributes();
		User loginUser = (User) httpSession.get("user");
		System.out.println("user : " + loginUser);
		if (loginUser == null) {
			// Login이 안된 유저는 WebSocekt Session Id로 저장
			return session.getId();
		} else {
			return loginUser.getUserId();
		}
	}

	// Connection이 Close 되었을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed  : " + session + "   :   " + status);
	}

}
