package com.hzyc.Ebcus.mapper;

import java.util.List;

import com.hzyc.Ebcus.bean.Book;

public interface BookManagerMapper {
	public List<Book> queryBookByName(String meg);
	public List<Book> queryBookOrderByName(String lastmeg, String conditions);
}
