package com.uwl.service.chatting.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.uwl.service.chatting.ChattingDAO;
import com.uwl.service.domain.Chatting;

@Repository("chattingDAOImpl")
public class ChattingDAOImpl implements ChattingDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public ChattingDAOImpl() {
		super();
	}
	
	@Override
	public void addChattingRoom(Chatting chatting) throws Exception {	//채팅방 개설
		sqlSession.insert("CommunityMapper.addChattingRoom", chatting);
	}

	@Override
	public void enterChattingRoom(Chatting chatting) throws Exception {
		sqlSession.update("CommunityMapper.enterChattingRoom", chatting);
	}

}
