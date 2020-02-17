package com.uwl.service.domain;

public class Chatting {
	
	private String master;	//개설자
	
	private String enterUser; //참가자
	
	private int roomNo;	//방 번호

	public Chatting() {
		
	}
	
	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	public String getEnterUser() {
		return enterUser;
	}

	public void setEnterUser(String enterUser) {
		this.enterUser = enterUser;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	@Override
	public String toString() {
		return "Chatting [master=" + master + ", enterUser=" + enterUser + ", roomNo=" + roomNo + "]";
	}
	
}
