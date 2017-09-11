package com.hzyc.Ebcus.controller;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.Ebcus.bean.Address;
import com.hzyc.Ebcus.bean.Book;
import com.hzyc.Ebcus.bean.Downlist;
import com.hzyc.Ebcus.bean.Message;
import com.hzyc.Ebcus.bean.Order;
import com.hzyc.Ebcus.bean.Page;
import com.hzyc.Ebcus.bean.S_Car;
import com.hzyc.Ebcus.bean.User;
import com.hzyc.Ebcus.bean.UserBook;
import com.hzyc.Ebcus.service.Impl.BookManagerServImpl;
@Controller
//@RequestMapping("book")
public class BookManagerController {
	
	@Autowired
	private BookManagerServImpl bookManagerServImpl;
	@Autowired
	private Page page;
	@Autowired
	private User user;
	@Autowired
	private Order order;
	
	//向筛选页进行跳转
	@RequestMapping("queryBookByName.do")
	public String queryBookByName(String meg) throws Exception{
		return "queryBooksPage.do?meg="+meg;
	}
	
	//根据指定的条件(比如价格)进行现有的书籍进行排序
	//TODU http://localhost:8080/EbCus/queryBookOrderByName.do?message=java&con=price
	@RequestMapping("queryBookOrderByName.do")
	public ModelAndView queryBookOrderByName(String message, String con) throws Exception{
		page = bookManagerServImpl.queryBooksCount(page);
		page.setMessage(message);
		page.setConditions(con);
		System.out.println(page.getConditions());
		ModelAndView maView = new ModelAndView();
		page.initStartPosition();
		List<Book> list = bookManagerServImpl.queryBookOrderByName(page);
		page.pageNum();
		page.setMessage(message);
		maView.addObject("list", list);
		maView.addObject("page", page);
		maView.setViewName("SelectByName.jsp");
		return maView;
	}
	
	//根据ISBN码查询书籍的详细信息,并且向图书详情页进行跳转
	@RequestMapping("queryInfoByISBN.do")
	public ModelAndView queryInfoByISBN(String ISBN) throws Exception{
		
		ModelAndView modelAndView =  new ModelAndView();
		Book book = bookManagerServImpl.queryInfoByISBN(ISBN);
		System.out.println(book);
		modelAndView.addObject("user", user);
		modelAndView.addObject("book", book);
		modelAndView.setViewName("book_info.jsp");
		return modelAndView;
	}
	/**
	 * 查询书籍详细信息,并且向购物车页面进行跳转
	 * @param ISBN
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("queryInfoByISBNToCar.do")
	public ModelAndView queryInfoByISBNToCar(String ISBN) throws Exception{
		
		ModelAndView modelAndView =  new ModelAndView();
		Book book = bookManagerServImpl.queryInfoByISBN(ISBN);
		System.out.println(book);
		modelAndView.addObject("user", user);
		modelAndView.addObject("book", book);
		modelAndView.setViewName("shopping_car.jsp");
		return modelAndView;
	}
	/**
	 * 分页
	 * @param meg
	 * @return
	 * @throws Exception
	 */
	//http://localhost:8080/EbCus/queryBooksPage.do?meg=java
	@RequestMapping("queryBooksPage.do")
	public ModelAndView queryGoodsPage(String meg) throws Exception {
		System.out.println(meg);
		page.setMessage(meg);
		ModelAndView mav = new ModelAndView();
		System.out.println("当前页1"+page.getNowPage());
		System.out.println(page);
		page.initStartPosition();
		List<Book> list = bookManagerServImpl.queryBooksPage(page);
		int temp = page.getNowPage();
		page = bookManagerServImpl.queryBooksCount(page);
		page.setNowPage(temp);
		page.pageNum();
		System.out.println("当前页2"+page.getNowPage());
		page.setMessage(meg);
		System.out.println(page.getMessage());
		mav.addObject("list", list);
		mav.addObject("page", page);
		mav.setViewName("SelectByName.jsp");
		return mav;
	}
	//向上翻页
	@RequestMapping("pageUp.do")
	public String pageUp(String nowPage) throws Exception {
		System.out.println(nowPage);
		int nPage = Integer.parseInt(nowPage);
		nPage = (nPage==1)?1:(nPage-1);
		
		page.setNowPage(nPage);
		System.out.println("上一页之后"+nPage);
		return "queryBooksPage.do?meg="+page.getMessage();
	}
	//向下翻页
	@RequestMapping("pageDown.do")
	public String pageDown(String nowPage) throws Exception {
		int nPage = Integer.parseInt(nowPage);
		System.out.println("翻页..");
		if(page.getNowPage() < page.getPageNum()) 
			nPage++;
		page.setNowPage(nPage);
		System.out.println(page.getMessage());
		return "queryBooksPage.do?meg="+page.getMessage();
	}
	/**
	 * 添加商品到购物车
	 * @param s_car
	 * @param response
	 * @throws Exception
	 */
	//public void addBookToCar(S_Car s_car) throws Exception;
	@RequestMapping("addBookToCar.do")
	public void addBookToCar(S_Car s_car,HttpServletResponse response) throws Exception{
		bookManagerServImpl.addBookToCar(s_car);
		s_car.setUserID(user.getUserID());
		PrintWriter printWriter = response.getWriter();
		printWriter.write("Yes");
		//System.out.println("Yes, add success!!!");
	}
	/**
	 * 显示购物车内的商品
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("selectBooksByUserID.do")
	public ModelAndView selectBooksByUserID() throws Exception{
		ModelAndView mav = new ModelAndView();
		List<S_Car> cars = bookManagerServImpl.selectBooksByUserID(user.getUserID());
		List<Book> books = new ArrayList<Book>();
		for (S_Car car : cars) {
			Book book = bookManagerServImpl.queryInfoByISBN(car.getBookISBN());
			System.out.println(book);
			books.add(book);
		}
		//System.out.println(books);
		mav.addObject("cars", cars);
		mav.addObject("books", books);
		mav.setViewName("shopping_car.jsp");
		return mav;
	}
	/**
	 * 删除购物车的某一项
	 * @param userbook
	 * @param response
	 * @throws Exception
	 * 
	 */
	//public void deleteBookFormCar(S_Car s_car) throws Exception;
	//http://localhost:8080/EbCus/deleteBookFormCar.do?userID=1&bookISBN=9787111255833
	@RequestMapping("deleteBookFormCar.do")
	public void deleteBookFormCar(UserBook userbook,HttpServletResponse response) throws Exception{
		bookManagerServImpl.deleteBookFormCar(userbook);
		PrintWriter printWriter = response.getWriter();
		printWriter.write("Yes");
		//System.out.println("Yes, add success!!!");
	}
	/**
	 * 批量删除购物车的几项
	 * @param userbooks
	 * @param response
	 * @throws Exception
	 */
	//http://localhost:8080/EbCus/deleteBooksFormCar.do?booksISBN=9787111547426&booksISBN=9787111213826                                   
	@RequestMapping("deleteBooksFormCar.do")
	public void deleteBooksFormCar(String [] booksISBN, HttpServletResponse response) throws Exception{
		System.out.println(booksISBN.length);
		for (String bookISBN : booksISBN) {
			System.out.println(bookISBN);
			UserBook userBook = new UserBook();
			userBook.setBookISBN(bookISBN);
			userBook.setUserID(user.getUserID());
			bookManagerServImpl.deleteBookFormCar(userBook);
		}
		PrintWriter writer = response.getWriter();
		writer.write("Yes");
		//System.out.println("Yes, add success!!!");
	}
	/**
	 * 跳转结算页面的操作
	 * @param booksISBN
	 * @param booksnum
	 * @return
	 * @throws Exception
	 */
	//public List<Address> selectAddressByUserID(int userID) throws Exception; 
	//public void addBooksToOrder(Order order) throws Exception;
	@RequestMapping("ToTotalPage.do")
	public ModelAndView ToTotalPage(String booksISBN, String booksnum) throws Exception{
		ModelAndView mav = new ModelAndView();
		order.setUserID(user.getUserID());
		
		//寻找默认地址
		List<Address> addresses = new ArrayList<Address>();
		//保存非默认的地址
		List<Address> otheraddresses = new ArrayList<Address>();
		addresses = bookManagerServImpl.selectAddressByUserID(user.getUserID());
		int addressID = 0;
		Address morenAddress = new Address();
		for (Address address : addresses) {
			if(address.getIs_moren().equals("1")){
				addressID = address.getID();
				morenAddress = address;
			}
			else {
				otheraddresses.add(address);
			}
		}
		order.setAddressID(addressID);
		order.setBooksISBN(booksISBN);
		order.setBooksnum(booksnum);
		
		//查询加入订单的书籍
		String [] isbns = booksISBN.split(";");
		List<Book> books = new ArrayList<Book>();
		for (int i = 0; i < isbns.length; i++) {
			System.out.println(isbns[i]);
			books.add(bookManagerServImpl.queryInfoByISBN(isbns[i]));
		}
		System.out.println(books);
		System.out.println(order.toString());
		//计算总价
		double totalPrice = 0.0;
		//解析书籍数目
		String [] booksN = booksnum.split(";");
		List<Integer> booksNum = new ArrayList<Integer>();
		for (int i = 0; i < booksN.length; i++) {
			int num = Integer.parseInt(booksN[i]);
			booksNum.add(num);
			totalPrice += books.get(i).getPrice()*num;
		}
		System.out.println(booksNum);
		//保留两位小数
		DecimalFormat dFormat = new DecimalFormat("######0.00");
		double ans = Double.parseDouble(dFormat.format(totalPrice));
		System.out.println(ans);
		
		//计算运费
		double cost = 0.0;
		if(ans<79) cost = 10.0;
		
		System.out.println(otheraddresses.size());
		mav.addObject("otheraddresses", otheraddresses);
		mav.addObject("booksISBN", booksISBN);
		mav.addObject("booksnumString", booksnum);
		mav.addObject("morenAddress", morenAddress);
		mav.addObject("order", order);
		mav.addObject("books", books);
		mav.addObject("booksnum", booksNum);
		mav.addObject("totalPrice", ans);
		mav.addObject("cost", cost);
		mav.setViewName("total_page.jsp");
		return mav;
	}
	/**
	 * 添加收货地址
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	//public int addAddress(Address address) throws Exception;
	@RequestMapping("addAddress.do")
	public void addAddress(HttpServletResponse response, HttpServletRequest request) throws Exception{
		//获取表单数据
		System.out.println(123);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("consigneeName");
		String cmbProvince = request.getParameter("cmbProvince");
		String cmbCity = request.getParameter("cmbCity");
		String cmbArea = request.getParameter("cmbArea");
		String consigneeAddress = request.getParameter("consigneeAddress");
		String consigneeMobile = request.getParameter("consigneeMobile");
		
		//生成地址对象
		Address address = new Address();
		address.setArea(cmbArea);
		address.setCity(cmbCity);
		address.setDetails(consigneeAddress);
		address.setIs_moren("0");
		address.setName(name);
		address.setPhonenum(consigneeMobile);
		address.setProvince(cmbProvince);
		address.setUserID(user.getUserID());
		
		PrintWriter writer = response.getWriter();
		int result = bookManagerServImpl.addAddress(address);
		
		if (result > 0) {
			writer.print("添加成功!!!");
		}
		else {
			writer.print("添加失败!!!");
		}
	}
	
	/**
	 * 删除收货地址
	 */
	@RequestMapping("deleteAddress.do")
	public String deleteAddress(int id) throws Exception{
		int result = bookManagerServImpl.deleteAddress(id);
		if(result>0){
			return "getTourl.do?url=address_form.jsp";
		}
		return "";
	}
	/**
	 * 设置为默认地址
	 */
	@RequestMapping("setAsMoren.do")
	public String setAsMoren(int id) throws Exception{
		List<Address> addresses = bookManagerServImpl.selectAddressByUserID(user.getUserID());
		for (int i = 0; i < addresses.size(); i++) {
			if(addresses.get(i).getID() == id){
				bookManagerServImpl.updateAddressAsOne(id);
			}else {
				bookManagerServImpl.updateAddressAsZero(id);
			}
		}
		return "getTourl.do?url=address_form.jsp";
	}
	/**
	 * 更改订单的状态
	 */
	@RequestMapping("changeOrderStatus.do")
	public String changeOrderStatus(int id) throws Exception{
		Order anOrder = bookManagerServImpl.selectOrderByid(id);
		String now = anOrder.getOrderstate();
		if(now.equals("待付款")){
			anOrder.setOrderstate("待收货");
		}else if (now.equals("待收货")) {
			anOrder.setOrderstate("待评价");
		}else {
			anOrder.setOrderstate("完成");
		}
		int result = bookManagerServImpl.updateOrderStutas(anOrder);
		if(result>0){
			return "getOrderTo.do?url=order_form.jsp";
		}
		return "";
	}
	/**
	 * 添加订单
	 */
	@RequestMapping("addOrder.do")
	public void addOrder(HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println(123);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String addressID = request.getParameter("addressID");
		String payment = request.getParameter("payment");
		String express = request.getParameter("express");
		String remark = request.getParameter("remark");
		String totalprice = request.getParameter("totalPrice");
		
		order.setAddressID(Integer.parseInt(addressID));
		order.setExpress(express);
		order.setPayment(payment);
		order.setRemark(remark);
		order.setTotalprice(Double.parseDouble(totalprice));
		order.setOrderstate("待付款");
		
		//获取当前时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String ordertime = df.format(new Date());// new Date()为获取当前系统时间
		order.setOrdertime(ordertime);
		System.out.println(order);
		PrintWriter writer = response.getWriter();
		int result = bookManagerServImpl.addBooksToOrder(order);
		if(result>0){
			writer.print("订单生成成功，请在24小时内付款");
		}else {
			writer.print("订单生成失败,请稍后重试");
		}
	}
	/**
	 * 登录校验
	 * @param name
	 * @param pw
	 * @param response
	 * @throws Exception
	 */
	//public int selectUserByName(String name) throws Exception;
	@RequestMapping("checkNameIsExit.do")
	public void checkNameIsExit(String name, String pw, HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		User a_user = bookManagerServImpl.selectUserByName(name);
		if(a_user!=null){
			if (pw.equals(a_user.getPassword())) {
				user = a_user;
				writer.print("登录成功");
			}else {
				writer.print("用户名错误或者密码错误");
			}
			
		}else {
			writer.print("用户名不存在");
		}
	}
	/**
	 * 查看用户名的唯一性
	 */
	@RequestMapping("isExit.do")
	public void isExit(String name,  HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		User a_user = bookManagerServImpl.selectUserByName(name);
		if(a_user!=null){
			writer.print("no");	
		}else {
			writer.print("yes");
		}
	}
	/**
	 * 用户信息操作
	 */
	//获取用户信息
	@RequestMapping("getUserInfo.do")
	public User getUser() throws Exception{
		return user;
	}
	//获取登录信息并且进行跳转
	@RequestMapping("getTourl.do")
	public ModelAndView getTourl(String url) throws Exception{
		System.out.println(user);
		
		//寻找默认地址
		List<Address> addresses = new ArrayList<Address>();
		List<Address> othersAddresses = new  ArrayList<Address>();
		addresses = bookManagerServImpl.selectAddressByUserID(user.getUserID());
		Address morenAddress = new Address();
		for (Address address : addresses) {
			if(address.getIs_moren().equals("1")){
				morenAddress = address;
			}
			else {
				othersAddresses.add(address);
			}			
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", user);
		mav.addObject("addresses", addresses);
		mav.addObject("morenAddress", morenAddress);
		mav.addObject("othersAddresses", othersAddresses);
		mav.setViewName(url);
		return mav;
	}
	//更新用户的信息
	@RequestMapping("updateUser.do")
	public void updateUser(HttpServletResponse response, HttpServletRequest request) throws Exception{
		//System.out.println(123);
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String sexString = request.getParameter("sexUser");
		String birthdayYear = request.getParameter("birthdayYear");
		String birthdayMonth = request.getParameter("birthdayMonth");
		String birthdayDay = request.getParameter("birthdayDay");
		String realnameString = request.getParameter("realName");
		
		user.setBirthday(birthdayYear+"-"+birthdayMonth+"-"+birthdayDay);
		user.setSex(sexString);
		user.setRealname(realnameString);
		PrintWriter writer = response.getWriter();
		int result = bookManagerServImpl.updateUser(user);
		if(result>0){
			writer.print("保存成功");
		}else{
			writer.print("保存失败,请稍后重试");
		}
	}
	/**
	 * 注册用户
	 */
	@RequestMapping("addUser.do")
	public void addUser(/*String name, String pw, String phone*/ HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println(123);
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("regName");
		String pw = request.getParameter("pwd");
		String phone = request.getParameter("phone");
		
		User anuser = new User();
		anuser.setUsername(name);
		anuser.setPassword(pw);
		anuser.setPhone(phone);
		System.out.println(anuser);
		int result = bookManagerServImpl.addUser(anuser);
		PrintWriter writer = response.getWriter();
		if(result > 0){
			writer.print("yes");
		}else {
			writer.print("no");
		}
	}
	/**
	 * 信息操作
	 */
	@RequestMapping("getMessageTo1.do")
	public ModelAndView selectMessageForm1(String url) throws Exception{
		//查看是否有降价的商品
		List<Downlist> downlists = bookManagerServImpl.selectDownListByUser(user.getUserID());
		//System.out.println(downlists.size());
		for (Downlist downlist : downlists) {
			Book book = bookManagerServImpl.queryInfoByISBN(downlist.getBookISBN());
			if(book.getPrice() < downlist.getOldprice()){
				Message message = new Message();
				message.setContent("您的一件商品已经降价了,快去看看吧!!!");
				message.setFromname("admin");
				message.setIs_read("0");
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
				message.setSend_time(df.format(new Date()));
				message.setTitle("降价通知");
				message.setToname(user.getUsername());
				message.setUrlstring("queryInfoByISBN.do?ISBN="+book.getISBN());
				int result = bookManagerServImpl.inserMessage(message);
				if(result>0);
				Downlist newdDownlist = new Downlist();
				newdDownlist = downlist;
				newdDownlist.setOldprice(book.getPrice());
			}
		}
		List<Message> messages = bookManagerServImpl.selectMessageForm(user);
		ModelAndView mav = new ModelAndView();
		//查询未读的消息
		int totals = 0;
		for (int i = 0; i < messages.size(); i++) {
			if(messages.get(i).getIs_read().equals("0")){
				totals++;
			}
		}
		System.out.println(url);
		String total = "";
		if(totals == 0) total="无";
		else total = ""+totals+"条";
		mav.addObject("user", user);
		mav.addObject("total", total);
		mav.addObject("messages", messages);
		mav.setViewName(url);
		return mav;	
	}
	/**
	 * 信息操作
	 */
	@RequestMapping("getMessageTo.do")
	public ModelAndView selectMessageForm(String url) throws Exception{
		
		List<Message> messages = bookManagerServImpl.selectMessageForm(user);
		ModelAndView mav = new ModelAndView();
		int totals = 0;
		for (int i = 0; i < messages.size(); i++) {
			if(messages.get(i).getIs_read().equals("0")){
				totals++;
			}
		}
		String total = "";
		if(totals == 0) total="无";
		else total = ""+totals+"条";
		mav.addObject("user", user);
		mav.addObject("total", total);
		mav.addObject("messages", messages);
		mav.setViewName(url);
		return mav;	
	}
	/**
	 * 向订单列表进行跳转
	 */
	@RequestMapping("getOrderTo.do")
	public ModelAndView getOrderTo(String url) throws Exception{
		//订单
		List<Order> orders = bookManagerServImpl.getAllOrder(user);
		//书籍
		List<List<Book>> bookss = new ArrayList<List<Book>>();
		//数量
		List<List<Integer>> numss = new ArrayList<List<Integer>>();
		//收货地址
		List<Address> addresses = new ArrayList<Address>();
		for (Order theOrder : orders) {
			//书籍
			List<Book> books = new ArrayList<Book>();
			//数目
			List<Integer> booksnum = new ArrayList<Integer>();		
			//解析书籍ISBN
			String[] isbnStrings = theOrder.getBooksISBN().split(";");
			//解析书籍num
			String[] numStrings = theOrder.getBooksnum().split(";");
			
			for (String string : isbnStrings) {
				books.add(bookManagerServImpl.queryInfoByISBN(string));
			}
			for (String numString : numStrings) {
				booksnum.add(Integer.parseInt(numString));
			}
			
			bookss.add(books);
			numss.add(booksnum);
			addresses.add(bookManagerServImpl.selectAddressByAddressID(theOrder.getAddressID()));
		}
		/*List<List<Book>> otherbookss = new ArrayList<List<Book>>();
		List<List<Integer>> othernumss = new ArrayList<List<Integer>>();*/
		List<List<Integer>> indexss = new ArrayList<List<Integer>>();
		for (int i = 0; i < bookss.size(); i++) {
			List<Integer> indexs = new ArrayList<Integer>();
			for(int j = 0; j < bookss.get(i).size(); j++){
				if(j > 0){
					indexs.add(j);
				}
			}
			indexss.add(indexs);
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("addresses", addresses);
		mav.addObject("size", orders.size());
		mav.addObject("orders", orders);
		mav.addObject("bookss", bookss);
		mav.addObject("numss", numss);
		mav.addObject("indexss", indexss);
		/*mav.addObject("otherbookss", bookss);
		mav.addObject("othernumss", numss);*/
		mav.setViewName(url);
		return mav;		
	}
	//public int addBookToDownlist(Downlist downlist) throws Exception;
	@RequestMapping("addBookToDownlist.do")
	public void addBookToDownlist(String ISBN, double price, HttpServletResponse response) throws Exception{
		PrintWriter writer = response.getWriter();
		Downlist downlist = new Downlist();
		downlist.setUserID(user.getUserID());
		downlist.setBookISBN(ISBN);
		downlist.setOldprice(price);
		System.out.println(downlist);
		int result = bookManagerServImpl.addBookToDownlist(downlist);
		if(result>0){
			writer.print("yes");
		}else {
			writer.print("no");
		}
	}
}
