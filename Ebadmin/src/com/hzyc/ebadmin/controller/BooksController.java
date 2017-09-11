package com.hzyc.ebadmin.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hzyc.ebadmin.bean.Book;
import com.hzyc.ebadmin.bean.Page;
import com.hzyc.ebadmin.service.Impl.BooksServImpl;

@Controller
public class BooksController {
	
	@Autowired
	private BooksServImpl booksServImpl;
	
	@Autowired
	private Page page;
	
	@RequestMapping("showBook.do")
	public ModelAndView showBook() throws Exception{
		
		ModelAndView mav = new ModelAndView();
		List<Book> list = booksServImpl.showBooks();
		mav.addObject("list", list);
		mav.setViewName("show_book.jsp");
		return mav;
	}
	
	@RequestMapping("delBook.do")
	public String delBook(String ISBN) throws Exception{
		
		System.out.println(ISBN);
		booksServImpl.delBooks(ISBN);
		
		return "queryBooksPage.do";
	}
	
	@RequestMapping("delBooks.do")
	public String delBooks(String [] ISBN) throws Exception{
		
		System.out.println(ISBN);
		for (String item : ISBN) {
			booksServImpl.delBooks(item);
		}
		
		return "queryBooksPage.do";
	}
	/*@RequestMapping("addBook.do")
	public String addBooks(Book book) throws Exception{
		
		booksServImpl.addBooks(book);
		return "showBook.do";		
	}*/
	
	//显示书籍的详细信息
	@RequestMapping("showBookByISBN.do")
	protected ModelAndView showBookByISBN(String ISBN) throws Exception {
		Book book = new Book();
		book = booksServImpl.showBooksByISBN(ISBN);
		System.out.println(book);
		ModelAndView mav = new ModelAndView();
		mav.addObject("book", book);
		mav.setViewName("show_book_modal.jsp");
		return mav;
	}
	
	//更新书籍信息
	@RequestMapping("updateBookByISBN.do")
	protected ModelAndView updateBookByISBN(String ISBN) throws Exception {
		Book book = new Book();
		book = booksServImpl.showBooksByISBN(ISBN);
		System.out.println(book);
		ModelAndView mav = new ModelAndView();
		mav.addObject("book", book);
		mav.setViewName("update_book.jsp");
		return mav;
	}
	
	@RequestMapping("showBookByISBN1.do")
	protected void showBookByISBN11(String ISBN, HttpServletResponse response) throws Exception {
		//PrintWriter是个流  字符流
		System.out.println(ISBN);
		Book book = new Book();
		book = booksServImpl.showBooksByISBN(ISBN);
		System.out.println(book);
		PrintWriter out = response.getWriter();		
		Gson gson = new Gson();
		String bookinfo = gson.toJson(book);
		out.write(bookinfo);
		out.flush();//刷新，挂起
		out.close();
	}
	
	//将图片同时备份到客服端的服务器
	public  void copy(String name) throws IOException{
	    
		String base = "D:/Desk/DeskAA/hzyc/java_web_tem/.metadata/.me_tcat7/webapps/";
	    //1.读取数据输入字节流
	    //找到图片路径
	    File file  = new File(base+"Ebadmin/image/"+name);
	    
	    FileInputStream inputStream = new FileInputStream(file);
	    //2.写入数据输出字节流
	    File file1  = new File(base+"EbCus/image/"+name);
	    FileOutputStream outputStream = new FileOutputStream(file1);
	    
	    byte [] b = new byte[1024];
	    
	    while (inputStream.read(b)!=-1) {
	        
	        outputStream.write(b);
	        
	    }
	    //关闭流  关闭流原则：先开后关，后开先关。
	    
	    outputStream.close();
	    inputStream.close();
	      
	    
	    
	}
	/**
	 * 添加书籍
	 * @param image
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("addBook.do")
	public String upload(MultipartFile image,HttpServletRequest request) throws Exception{
		//ModelAndView mav = new ModelAndView();
		System.out.println("upload.....");
		String imageName = image.getOriginalFilename();//获取图片的名字
		System.out.println(imageName);
		
		//图片名字：时间戳，
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		imageName = date+imageName;
		
		/*
		 * 把图片写到本地
		 */
		String tomcatPath = request.getSession().getServletContext().getRealPath("/");
		System.out.println(tomcatPath);
		System.out.println(tomcatPath+"image/"+imageName);
		System.out.println(tomcatPath+"image\\"+imageName);
		File file = new File(tomcatPath+"image/"+imageName);
		//File file1 = new File("D:\Desk\DeskAA\hzyc\java_web_tem\.metadata\.me_tcat7\webapps\EbCus\image"+imageName);
		image.transferTo(file);//相当于对接
		//image.transferTo(file1);
		
		//将图片进行转存处理
		copy(imageName);
		//UUID
		Book book = new Book();
		book.setISBN(request.getParameter("ISBN"));
		book.setName(request.getParameter("name"));
		book.setPrice(request.getParameter("price"));
		book.setType(request.getParameter("type"));
		book.setKeywords(request.getParameter("keywords"));
		book.setPulichouse(request.getParameter("pulichouse"));
		book.setBrands(request.getParameter("brands"));
		book.setPackages(request.getParameter("packages"));
		book.setFormat(request.getParameter("format"));
		book.setPublictime(request.getParameter("publictime"));
		book.setPaper(request.getParameter("paper"));
		book.setPagenum(request.getParameter("pagenum"));
		book.setLang(request.getParameter("lang"));
		book.setImagepath(imageName);
		book.setShortcontent(request.getParameter("shortcontent"));
		book.setShortauth(request.getParameter("shortauth"));
		book.setTitle(request.getParameter("title"));
		System.out.println(book);
		int ans = booksServImpl.addBooks(book);
		/*if(i>0){
			List<Image> list = uploadServImpl.selImage();
			//mav.addObject("list", list);
			//mav.setViewName("show_image.jsp");
		}*/
		System.out.println(ans);
		return "queryBooksPage.do";
	}
	//更新书籍
	@RequestMapping("updateBook.do")
	public void updateBookByISBN(HttpServletRequest request) throws Exception{
		
		Book book = booksServImpl.showBooksByISBN(request.getParameter("ISBN"));
		System.out.println("update....");
		System.out.println(book);
		book.setName(request.getParameter("name"));
		book.setPrice(request.getParameter("price"));
		book.setType(request.getParameter("type"));
		book.setKeywords(request.getParameter("keywords"));
		book.setPulichouse(request.getParameter("pulichouse"));
		book.setPackages(request.getParameter("packages"));
		book.setFormat(request.getParameter("format"));
		book.setPublictime(request.getParameter("publictime"));
		/*book.setPaper(request.getParameter("paper"));*/
		book.setPagenum(request.getParameter("pagenum"));
		book.setLang(request.getParameter("lang"));
		book.setShortcontent(request.getParameter("shortcontent"));
		book.setShortauth(request.getParameter("shortauth"));
		book.setTitle(request.getParameter("title"));
		book.setNum(request.getParameter("num"));
		
		booksServImpl.updateBookByISBN(book);
	}
	/**
	 * 分页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("queryBooksPage.do")
	public ModelAndView queryGoodsPage() throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println("当前页1"+page.getNowPage());
		System.out.println(page);
		page.initStartPosition();
		List<Book> list = booksServImpl.queryBooksPage(page);
		int temp = page.getNowPage();
		page = booksServImpl.queryBooksCount();
		page.setNowPage(temp);
		page.pageNum();
		System.out.println("当前页2"+page.getNowPage());
		mav.addObject("list", list);
		mav.addObject("page", page);
		mav.setViewName("show_book.jsp");
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
		return "queryBooksPage.do";
	}
	//向下翻页
	@RequestMapping("pageDown.do")
	public String pageDown(String nowPage) throws Exception {
		int nPage = Integer.parseInt(nowPage);
		System.out.println("翻页..");
		if(page.getNowPage() < page.getPageNum()) 
			nPage++;
		page.setNowPage(nPage);
		
		return "queryBooksPage.do";
	}
	
}
