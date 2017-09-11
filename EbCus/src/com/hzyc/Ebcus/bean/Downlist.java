package com.hzyc.Ebcus.bean;

public class Downlist {
	private int id;
	private int userID;
	private String bookISBN;
	private double oldprice;
	@Override
	public String toString() {
		return "Downlist [id=" + id + ", userID=" + userID + ", bookISBN=" + bookISBN + ", oldprice=" + oldprice + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public double getOldprice() {
		return oldprice;
	}
	public void setOldprice(double oldprice) {
		this.oldprice = oldprice;
	}
	
}
