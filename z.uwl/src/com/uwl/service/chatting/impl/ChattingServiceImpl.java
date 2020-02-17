package com.uwl.service.chatting.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.uwl.service.chatting.ChattingDAO;
import com.uwl.service.chatting.ChattingService;
import com.uwl.service.domain.Chatting;

@Service
public class ChattingServiceImpl implements ChattingService {
	
	@Autowired
	@Qualifier("chattingDAOImpl")
	private ChattingDAO chattingDAO;
	public void setchattingDAO(ChattingDAO chattingDAO) {
		this.chattingDAO = chattingDAO;
	}
	
	@Override
	public void addChattingRoom(Chatting chatting) throws Exception {	//채팅방 개설
		chattingDAO.addChattingRoom(chatting);
	}

	@Override
	public void enterChattingRoom(Chatting chatting) throws Exception {
		chattingDAO.enterChattingRoom(chatting);
	}

}
