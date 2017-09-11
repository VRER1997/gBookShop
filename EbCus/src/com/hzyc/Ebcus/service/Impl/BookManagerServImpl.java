package com.hzyc.Ebcus.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.Ebcus.bean.Address;
import com.hzyc.Ebcus.bean.Book;
import com.hzyc.Ebcus.bean.Downlist;
import com.hzyc.Ebcus.bean.Message;
import com.hzyc.Ebcus.bean.Order;
import com.hzyc.Ebcus.bean.Page;
import com.hzyc.Ebcus.bean.S_Car;
import com.hzyc.Ebcus.bean.User;
import com.hzyc.Ebcus.bean.UserBook;
import com.hzyc.Ebcus.mapper.BookManagerMapper;
import com.hzyc.Ebcus.service.BookManagerServ;

@Service
public class BookManagerServImpl implements BookManagerServ{

	@Autowired
	private BookManagerMapper bookManagerMapper;
	
	@Override
	public List<Book> queryBookByName(String meg) throws Exception{
		// TODO Auto-generated method stub
		return bookManagerMapper.queryBookByName(meg);
	}


	@Override
	public Book queryInfoByISBN(String ISBN) throws Exception{
		// TODO Auto-generated method stub
		return bookManagerMapper.queryInfoByISBN(ISBN);
	}

	@Override
	public List<Book> queryBooksPage(Page page) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.queryBooksPage(page);
	}

	@Override
	public Page queryBooksCount(Page page) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.queryBooksCount(page);
	}


	@Override
	public List<Book> queryBookOrderByName(Page page) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.queryBookOrderByName(page);
	}


	@Override
	public void addBookToCar(S_Car s_car) throws Exception {
		// TODO Auto-generated method stub
		bookManagerMapper.addBookToCar(s_car);
	}


	@Override
	public List<S_Car> selectBooksByUserID(int userID) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.selectBooksByUserID(userID);
	}


	@Override
	public void deleteBookFormCar(UserBook userbook) throws Exception {
		// TODO Auto-generated method stub
		bookManagerMapper.deleteBookFormCar(userbook);
	}


	@Override
	public int addBooksToOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.addBooksToOrder(order);
	}


	@Override
	public List<Address> selectAddressByUserID(int userID) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.selectAddressByUserID(userID);
	}


	@Override
	public int addAddress(Address address) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.addAddress(address);
	}


	@Override
	public User selectUserByName(String name) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.selectUserByName(name);
	}


	@Override
	public int updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.updateUser(user);
	}


	@Override
	public int deleteAddress(int id) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.deleteAddress(id);
	}


	@Override
	public List<Message> selectMessageForm(User user) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.selectMessageForm(user);
	}


	@Override
	public List<Order> getAllOrder(User user) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.getAllOrder(user);
	}


	@Override
	public int addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.addUser(user);
	}


	@Override
	public void updateAddressAsOne(int id) throws Exception {
		// TODO Auto-generated method stub
		 bookManagerMapper.updateAddressAsOne(id);
	}


	@Override
	public void updateAddressAsZero(int id) throws Exception {
		// TODO Auto-generated method stub
		bookManagerMapper.updateAddressAsZero(id);
	}


	@Override
	public Address selectAddressByAddressID(int id) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.selectAddressByAddressID(id);
	}


	@Override
	public Order selectOrderByid(int id) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.selectOrderByid(id);
	}


	@Override
	public int updateOrderStutas(Order order) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.updateOrderStutas(order);
	}


	@Override
	public int addBookToDownlist(Downlist downlist) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.addBookToDownlist(downlist);
	}


	@Override
	public List<Downlist> selectDownListByUser(int id) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.selectDownListByUser(id);
	}


	@Override
	public int inserMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		return bookManagerMapper.inserMessage(message);
	}


	@Override
	public void changePrice(Downlist downlist) throws Exception {
		// TODO Auto-generated method stub
		bookManagerMapper.changePrice(downlist);
	}

	
	

}
