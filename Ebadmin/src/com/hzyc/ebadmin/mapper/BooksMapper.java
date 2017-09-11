package com.hzyc.ebadmin.mapper;

import java.util.List;

import com.hzyc.ebadmin.bean.Book;
import com.hzyc.ebadmin.bean.Page;

public interface BooksMapper {
	//查询所有
	public List<Book> showBooks() throws Exception; 
	//增加
	public int addBooks(Book book) throws Exception;
	//删除
	public void delBooks(String IBSN) throws Exception;
	//按ISBN查询
	public Book showBooksByISBN(String IBSN) throws Exception;
	
	public void updateBookByISBN(Book book) throws Exception;
	
	public List<Book> queryBooksPage(Page page) throws Exception;
	
	public Page queryBooksCount() throws Exception;
}
