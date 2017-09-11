package com.hzyc.ebadmin.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.ebadmin.bean.Book;
import com.hzyc.ebadmin.bean.Page;
import com.hzyc.ebadmin.mapper.BooksMapper;
import com.hzyc.ebadmin.service.BooksServ;

@Service
public class BooksServImpl implements BooksServ{

	@Autowired
	private BooksMapper booksMapper;
	
	@Override
	public List<Book> showBooks() throws Exception {
		return booksMapper.showBooks();		
	}
	
	@Override
	public int addBooks(Book book) throws Exception{
		return booksMapper.addBooks(book);
	}

	@Override
	public void delBooks(String IBSN) throws Exception {
		// TODO Auto-generated method stub
		booksMapper.delBooks(IBSN);
	}

	@Override
	public Book showBooksByISBN(String IBSN) throws Exception {
		return booksMapper.showBooksByISBN(IBSN);
	}

	@Override
	public void updateBookByISBN(Book book) throws Exception {
		// TODO Auto-generated method stub
		 booksMapper.updateBookByISBN(book);
	}

	@Override
	public List<Book> queryBooksPage(Page page) throws Exception {
		// TODO Auto-generated method stub
		return booksMapper.queryBooksPage(page);
	}
	
	@Override
	public Page queryBooksCount() throws Exception {
		// TODO Auto-generated method stub
		return booksMapper.queryBooksCount();
	}

	
}
