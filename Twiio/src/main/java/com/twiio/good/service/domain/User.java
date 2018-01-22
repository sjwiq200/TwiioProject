package com.twiio.good.service.domain;

import java.util.Date;

public class User {
	
	private int userNo;
	private String userId;
	private String password;
	private String passwordConfirm;
	private String userName;
	private String userBirthday;
	private String userGender;
	private String userPhone;
	private String userEmail;
	private String userAccount;
	private int userType;
	private int userEval;
	private String userImage;
	private Date regDate;
	private boolean profilePublic;
	private String userRegisterType;
	private String userLeave;
	private String userBank;
	private boolean attendanceTnF;
	private boolean profileTnF;
	private int attendanceRate;
	private int profileCredibility;
	private int starEvalHost;
	private String reviewHost;
	
	/////////////////////// KakaoLogin Filed //////////////////////////	
    private String kaccount_email;    
    private String kaccount_email_verified;
    private Properties properties;
    ////////////////////// kakao/googleLogin Filed /////////////////////
    private String id;
    ////////////////////// GoogleLogin Filed ////////////////////////
    private String gender;
	private String name;
	private String link;	
	private String verified_email;
	private String given_name;
	private String locale;
	private String family_name;
	private String email;
	private String picture;

	public User() {
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public int getUserEval() {
		return userEval;
	}

	public void setUserEval(int userEval) {
		this.userEval = userEval;
	}

	public String getUserImage() {
		return userImage;
	}

	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public boolean isProfilePublic() {
		return profilePublic;
	}

	public void setProfilePublic(boolean profilePublic) {
		this.profilePublic = profilePublic;
	}

	public String getUserRegisterType() {
		return userRegisterType;
	}

	public void setUserRegisterType(String userRegisterType) {
		this.userRegisterType = userRegisterType;
	}

	public String getUserLeave() {
		return userLeave;
	}

	public void setUserLeave(String userLeave) {
		this.userLeave = userLeave;
	}

	public String getUserBank() {
		return userBank;
	}

	public void setUserBank(String userBank) {
		this.userBank = userBank;
	}

	public boolean isAttendanceTnF() {
		return attendanceTnF;
	}

	public void setAttendanceTnF(boolean attendanceTnF) {
		this.attendanceTnF = attendanceTnF;
	}

	public boolean isProfileTnF() {
		return profileTnF;
	}

	public void setProfileTnF(boolean profileTnF) {
		this.profileTnF = profileTnF;
	}

	public int getAttendanceRate() {
		return attendanceRate;
	}

	public void setAttendanceRate(int attendanceRate) {
		this.attendanceRate = attendanceRate;
	}

	public int getProfileCredibility() {
		return profileCredibility;
	}

	public void setProfileCredibility(int profileCredibility) {
		this.profileCredibility = profileCredibility;
	}
	
	public int getStarEvalHost() {
		return starEvalHost;
	}

	public void setStarEvalHost(int starEvalHost) {
		this.starEvalHost = starEvalHost;
	}

	public String getReviewHost() {
		return reviewHost;
	}

	public void setReviewHost(String reviewHost) {
		this.reviewHost = reviewHost;
	}

	///////////////////////////// kakaoLogin getter/setter /////////////////////////////
	public String getKaccount_email() {
		return kaccount_email;
	}

	public void setKaccount_email(String kaccount_email) {
		this.kaccount_email = kaccount_email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKaccount_email_verified() {
		return kaccount_email_verified;
	}

	public void setKaccount_email_verified(String kaccount_email_verified) {
		this.kaccount_email_verified = kaccount_email_verified;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}
	
	/////////////////////////////// googleLogin getter/setter ///////////////////////////////	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getVerified_email() {
		return verified_email;
	}

	public void setVerified_email(String verified_email) {
		this.verified_email = verified_email;
	}

	public String getGiven_name() {
		return given_name;
	}

	public void setGiven_name(String given_name) {
		this.given_name = given_name;
	}

	public String getLocale() {
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public String getFamily_name() {
		return family_name;
	}

	public void setFamily_name(String family_name) {
		this.family_name = family_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}	


	public String toString() {
		return "UserVO : [userId] "+userId+" [userName] "+userName+" [password] "+password+" [userBirthday] "+ userBirthday
				+" [userGender] "+userGender+" [userPhone] "+ userPhone	+" [userEmail] "+userEmail+" [userAccount] "+ userAccount
				+" [userType] "+userType+" [userEval] "+ userEval	+" [userImage] "+userImage+" [regDate] "+ regDate
				+" [profilePublic] "+profilePublic+" [userRegisterType] "+ userRegisterType	+" [userLeave] "+userLeave+" [userBank] "+ userBank
				+" [attendanceTnF] "+attendanceTnF+" [profileTnF] "+ profileTnF	+" [attendanceRate] "+attendanceRate+" [profileCredibility] "+ profileCredibility;
	}


}
