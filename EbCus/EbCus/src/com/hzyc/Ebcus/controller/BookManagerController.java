package com.hzyc.Ebcus.controller;

import java.util.List;

import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hzyc.Ebcus.bean.Book;
import com.hzyc.Ebcus.service.Impl.BookManagerServImpl;
@Controller
public class BookManagerController {
	
	@Autowired
	private BookManagerServImpl bookManagerServImpl;
	
	@RequestMapping("queryBookByName.do")
	public ModelAndView queryBookByName(String meg){
		System.out.println("123");
		String lastmeg = meg;
		ModelAndView maView = new ModelAndView();
		List<Book> list = bookManagerServImpl.queryBookByName(meg);
		maView.addObject("list", list);
		maView.addObject("meg",meg);
		maView.addObject("lastmeg", lastmeg);
		maView.setViewName("SelectByName.jsp");
		return maView;
	}
	
	@RequestMapping("queryBookOrderByName.do")
	public ModelAndView queryBookOrderByName(String lastmeg, String conditions){
		System.out.println("123");
		ModelAndView maView = new ModelAndView();
		List<Book> list = bookManagerServImpl.queryBookOrderByName(lastmeg, conditions);
		maView.addObject("list", list);
		maView.setViewName("SelectByName.jsp");
		return maView;
	}
}
