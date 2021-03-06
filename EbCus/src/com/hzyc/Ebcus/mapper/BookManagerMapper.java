package com.hzyc.Ebcus.mapper;

import java.util.List;

import com.hzyc.Ebcus.bean.Address;
import com.hzyc.Ebcus.bean.Book;
import com.hzyc.Ebcus.bean.Downlist;
import com.hzyc.Ebcus.bean.Message;
import com.hzyc.Ebcus.bean.Order;
import com.hzyc.Ebcus.bean.Page;
import com.hzyc.Ebcus.bean.S_Car;
import com.hzyc.Ebcus.bean.User;
import com.hzyc.Ebcus.bean.UserBook;

public interface BookManagerMapper {
	
	/**
	 * 书籍操作
	 * @param meg
	 * @return
	 * @throws Exception
	 */
	//通过名字进行模糊查询
	public List<Book> queryBookByName(String meg) throws Exception;
	//进行条件排序
	public List<Book> queryBookOrderByName(Page page) throws Exception;
	//根据ISSN查询书籍的详细内容
	public Book queryInfoByISBN(String ISBN);
	//分页
	public List<Book> queryBooksPage(Page page) throws Exception;
	//查询符合条件 书籍的总数
	public Page queryBooksCount(Page page) throws Exception;
	
	/**
	 * 购物车操作
	 * @param s_car
	 * @throws Exception
	 */
	//向购物车里添加书籍
	public void addBookToCar(S_Car s_car) throws Exception;
	//查询购物车
	public List<S_Car> selectBooksByUserID(int userID) throws Exception;
	//删除购物车的一件书
	public void deleteBookFormCar(UserBook userbook) throws Exception;
	
	/**
	 * 收货地址操作
	 * @param userID
	 * @return
	 * @throws Exception
	 */
	//根据用户查找收货地址
	public List<Address> selectAddressByUserID(int userID) throws Exception;
	//增加用户的收货地址
	public int addAddress(Address address) throws Exception;
	//删除收货地址
	public int deleteAddress(int id) throws Exception;
	//设置为默认地址
	public void updateAddressAsOne(int id) throws Exception;
	//取消设置为默认地址
	public void updateAddressAsZero(int id) throws Exception;
	//根据收货地址id查找收货地址
	public Address selectAddressByAddressID(int id) throws Exception;
	/**
	 * 订单操作
	 * @param order
	 * @throws Exception
	 */
	//添加订单
	public int addBooksToOrder(Order order) throws Exception;
	//获取用户的所有订单
	public List<Order> getAllOrder(User user) throws Exception;
	//查询订单
	public Order selectOrderByid(int id) throws Exception;
	//更新订单的状态
	public int updateOrderStutas(Order order) throws Exception;
	/**
	 * 登录操作
	 */
	//查询用户名是否存在
	public User selectUserByName(String name) throws Exception;
	//更新用户的信息
	public int updateUser(User user) throws Exception;
	//用户注册
	public int addUser(User user) throws Exception;
	
	/**
	 * 通知信息操作
	 */
	public int inserMessage(Message message) throws Exception;
	public List<Message> selectMessageForm(User user) throws Exception;
	//添加到降价通知列表
	public int addBookToDownlist(Downlist downlist) throws Exception;
	//根据用户名查找降价列表
	public  List<Downlist> selectDownListByUser(int id) throws Exception;
	//调整价钱
	public void changePrice(Downlist downlist) throws Exception;
}
