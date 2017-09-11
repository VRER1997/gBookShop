package com.hzyc.ebadmin.service;

import java.util.List;

import com.hzyc.ebadmin.bean.Book;
import com.hzyc.ebadmin.bean.Page;

public interface BooksServ {

	public List<Book> showBooks() throws Exception;
	public int addBooks(Book book) throws Exception;
	public void delBooks(String IBSN) throws Exception;
	public Book showBooksByISBN(String IBSN) throws Exception;
	public void updateBookByISBN(Book book) throws Exception;
	public List<Book> queryBooksPage(Page page) throws Exception;
	public Page queryBooksCount() throws Exception;
}
