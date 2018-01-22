package com.twiio.good.service.domain;

public class Friend {
	private int userNo;
	private int friendNo;
	private int no;
	
	
	
	public Friend() {
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public int getFriendNo() {
		return friendNo;
	}



	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
	}



	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Friend [userNo=" + userNo + ", friendNo=" + friendNo + ", No=" + no +" ]";
	}
	
	
}
