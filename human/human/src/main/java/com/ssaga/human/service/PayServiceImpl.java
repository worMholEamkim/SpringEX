package com.ssaga.human.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaga.human.dao.PayDao;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	PayDao payDao;

	@Override
	public String payLogin(String comcode, String pid, String pwd, HttpSession session) {

		HashMap<String,String> hmForPayLogin = new HashMap<>();
		hmForPayLogin.put("comcode", comcode);
		hmForPayLogin.put("pid", pid);
		String dbPass = payDao.payLogin(hmForPayLogin);
		String view = null;

		if (dbPass == null) {
			view ="pages/login";
		}else { 
			if(dbPass.equals(pwd)) {
				//session.invalidate(); HttpServletRequest
				session.setAttribute("comcode", comcode);
				session.setAttribute("pid", pid);
				view ="pages/index";
			}else {
				view = "pages/login";
			}
		}
		return view;
	}

}
