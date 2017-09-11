package com.hzyc.Ebcus.service;

import java.util.List;

import com.hzyc.Ebcus.bean.Book;

public interface BookManagerServ {
	public List<Book> queryBookByName(String meg);
	public List<Book> queryBookOrderByName(String lastmeg, String conditions);
}
