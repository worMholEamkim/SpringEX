package com.ssaga.human.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssaga.human.dto.EmployeeDto;
import com.ssaga.human.service.PayService;


@Controller
@RequestMapping("/")
public class PayController {
	
	private static final Logger logger = LoggerFactory.getLogger(PayController.class);
	
	@Autowired
	PayService payService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		return "pages/index";
	}
	
	//Login
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "pages/login";
	}
	
	//LogIn.. 
	@RequestMapping(value="/payLogin", method=RequestMethod.POST)
	public String payLogin(@RequestParam("comcode") String comcode,
			@RequestParam("pid") String pid, @RequestParam("pwd") String pwd,
			HttpSession session ) {
		return payService.payLogin(comcode, pid, pwd, session);
	}
	
	@RequestMapping(value="tblEmpList", method=RequestMethod.GET)
	public String tblEmpList(Model model) {
		List<EmployeeDto> emplist = payService.empList();
		model.addAttribute("emplist", emplist);
		return "pages/tblEmpList";
	}
	
}
