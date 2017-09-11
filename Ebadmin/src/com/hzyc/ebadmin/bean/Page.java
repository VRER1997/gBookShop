package com.hzyc.ebadmin.bean;

public class Page {

	//当前页
	private int nowPage = 1;	
	//每页显示的行数
	private int perPageLine = 15;
	//起始位置
	private int startPosition;
	//总记录数
	private int total;
	//总页数
	private int pageNum;

	public void initStartPosition(){
		startPosition = (nowPage-1)*perPageLine;
	}
	
	public void pageNum(){
		pageNum = ((total%perPageLine)!=0)?((total/perPageLine)+1):(total/perPageLine);
	}
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getPerPageLine() {
		return perPageLine;
	}

	public void setPerPageLine(int perPageLine) {
		this.perPageLine = perPageLine;
	}

	public int getStartPosition() {
		return startPosition;
	}

	public void setStartPosition(int startPosition) {
		this.startPosition = startPosition;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	@Override
	public String toString() {
		return "Page [nowPage=" + nowPage + ", perPageLine=" + perPageLine + ", startPosition=" + startPosition
				+ ", total=" + total + ", pageNum=" + pageNum + "]";
	}
	
	
	
}
