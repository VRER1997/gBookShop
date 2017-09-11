package com.hzyc.Ebcus.bean;

public class UserBook {
	private int userID;
	
	private String bookISBN;

	@Override
	public String toString() {
		return "UserBook [userID=" + userID + ", bookISBN=" + bookISBN + "]";
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getBookISBN() {
		return bookISBN;
	}

	public void setBookISBN(String bookISBN) {
		this.bookISBN = bookISBN;
	}
	
}
