package com.hzyc.Ebcus.bean;

public class Message {
	
	private int id;
	
	private String fromname;
	
	private String toname;
	
	private String title;
	
	private String content;
	
	private String urlstring;
	
	private String send_time;

	private String is_read;
	
	@Override
	public String toString() {
		return "Message [id=" + id + ", fromname=" + fromname + ", toname=" + toname + ", title=" + title + ", content="
				+ content + ", urlstring=" + urlstring + ", send_time=" + send_time + ", is_read=" + is_read + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFromname() {
		return fromname;
	}

	public void setFromname(String fromname) {
		this.fromname = fromname;
	}

	public String getToname() {
		return toname;
	}

	public void setToname(String toname) {
		this.toname = toname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSend_time() {
		return send_time;
	}

	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}

	public String getIs_read() {
		return is_read;
	}

	public void setIs_read(String is_read) {
		this.is_read = is_read;
	}

	public String getUrlstring() {
		return urlstring;
	}

	public void setUrlstring(String urlstring) {
		this.urlstring = urlstring;
	}
	
}
