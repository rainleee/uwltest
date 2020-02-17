package com.uwl.service.chatting;

import com.uwl.service.domain.Chatting;

public interface ChattingService {

	//채팅방 개설 (1:1 채팅)
	public void addChattingRoom(Chatting chatting) throws Exception;
	
	//채팅방 참가 (1:1 채팅)
	public void enterChattingRoom(Chatting chatting) throws Exception;
}
