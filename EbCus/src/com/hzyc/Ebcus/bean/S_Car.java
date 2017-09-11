package com.hzyc.Ebcus.bean;

public class S_Car {
	private int userID;
	
	private String bookISBN;
	
	private double price;
	
	private int num;
	
	private double discount = 1;

	@Override
	public String toString() {
		return "S_Car [userID=" + userID + ", bookISBN=" + bookISBN + ", price=" + price + ", num=" + num
				+ ", discount=" + discount + "]";
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}
}
