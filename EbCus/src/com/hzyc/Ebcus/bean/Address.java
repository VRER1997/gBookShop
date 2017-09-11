package com.hzyc.Ebcus.bean;

public class Address {
	
	private int ID;
	
	private int userID;
	
	private String name;
	
	private String province;
	
	private String city;
	
	private String area;
	
	private String details;
	
	private String phonenum;
	
	private String is_moren;

	@Override
	public String toString() {
		return "Address [ID=" + ID + ", userID=" + userID + ", name=" + name + ", province=" + province + ", city="
				+ city + ", area=" + area + ", details=" + details + ", phonenum=" + phonenum + ", is_moren=" + is_moren
				+ "]";
	}
	
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getUserID() {
		return userID;
	}



	public void setUserID(int userID) {
		this.userID = userID;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getIs_moren() {
		return is_moren;
	}

	public void setIs_moren(String is_moren) {
		this.is_moren = is_moren;
	}
	
	

}
