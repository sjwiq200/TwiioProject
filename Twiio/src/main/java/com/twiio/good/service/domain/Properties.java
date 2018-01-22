package com.twiio.good.service.domain;

 

 

public class Properties {



///Field

private String profile_image;

private String nickname;

private String thumbnail_image;





@Override

public String toString() {

	return "Properties [profile_image=" + profile_image + ", nickname=" + nickname + ", thumbnail_image="

			+ thumbnail_image + "]";

}

public String getProfile_image() {

	return profile_image;

}

public void setProfile_image(String profile_image) {

	this.profile_image = profile_image;

}

public String getNickname() {

	return nickname;

}

public void setNickname(String nickname) {

	this.nickname = nickname;

}

public String getThumbnail_image() {

	return thumbnail_image;

}

public void setThumbnail_image(String thumbnail_image) {

	this.thumbnail_image = thumbnail_image;

}



 



}
