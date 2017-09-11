package com.hzyc.Ebcus.bean;

public class User {
	
	private int userID;
	
	private String username;
	
	private String realname;
	
	private String password;
	
	/**
	 *  0 man
	 *  1 woman 
	 *  2 secret
	 */
	private String sex;
	
	private String phone;
	
	private String birthday;
	
	private String role;

	@Override
	public String toString() {
		return "User [userID=" + userID + ", username=" + username + ", realname=" + realname + ", password=" + password
				+ ", sex=" + sex + ", phone=" + phone + ", birthday=" + birthday + ", role=" + role + "]";
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
}
