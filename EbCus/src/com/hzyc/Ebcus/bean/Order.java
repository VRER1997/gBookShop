package com.hzyc.Ebcus.bean;

public class Order {
	
	private int id;
	
	private int userID;
	
	private int addressID;
	
	private String payment;
	
	private String express;
	
	private String booksISBN;
	
	private String booksnum;
	
	private String remark;
	
	private double totalprice;
	
	
	/**
	 * 订单的状态
	 * 0 待付款
	 * 1 待收货
	 * 2 待评价 
	 */
	private String orderstate;
	
	private String ordertime;

	@Override
	public String toString() {
		return "Order [id=" + id + ", userID=" + userID + ", addressID=" + addressID + ", payment=" + payment
				+ ", express=" + express + ", booksISBN=" + booksISBN + ", booksnum=" + booksnum + ", remark=" + remark
				+ ", totalprice=" + totalprice + ", orderstate=" + orderstate + ", ordertime=" + ordertime + "]";
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
	
	public int getAddressID() {
		return addressID;
	}

	public void setAddressID(int addressID) {
		this.addressID = addressID;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getExpress() {
		return express;
	}

	public void setExpress(String express) {
		this.express = express;
	}

	public String getBooksISBN() {
		return booksISBN;
	}

	public void setBooksISBN(String booksISBN) {
		this.booksISBN = booksISBN;
	}
	
	public String getBooksnum() {
		return booksnum;
	}

	public void setBooksnum(String booksnum) {
		this.booksnum = booksnum;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}

	public String getOrderstate() {
		return orderstate;
	}
	/**
	 * 订单的状态
	 * 0 待付款
	 * 1 待收货
	 * 2 待评价 
	 */
	public void setOrderstate(String orderstate) {
			this.orderstate = orderstate;
	}

	public String getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}
	
}
