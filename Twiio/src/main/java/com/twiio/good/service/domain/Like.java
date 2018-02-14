package com.twiio.good.service.domain;

public class Like {
	private int userNo;
	private int communityNo;
	private String like;
	private int likeNo;
	
	public Like() {
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Like [userNo=" + userNo + ", communityNo=" + communityNo + ", like=" + like + ", likeNo="
				+ likeNo +" ]";
	}
	
}
