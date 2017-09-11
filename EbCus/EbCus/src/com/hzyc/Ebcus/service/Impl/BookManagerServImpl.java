package com.hzyc.Ebcus.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.Ebcus.bean.Book;
import com.hzyc.Ebcus.mapper.BookManagerMapper;
import com.hzyc.Ebcus.service.BookManagerServ;

@Service
public class BookManagerServImpl implements BookManagerServ{

	@Autowired
	private BookManagerMapper bookManagerMapper;
	
	@Override
	public List<Book> queryBookByName(String meg) {
		// TODO Auto-generated method stub
		return bookManagerMapper.queryBookByName(meg);
	}

	@Override
	public List<Book> queryBookOrderByName(String lastmeg, String conditions) {
		// TODO Auto-generated method stub
		return bookManagerMapper.queryBookOrderByName(lastmeg, conditions);
	}

}
