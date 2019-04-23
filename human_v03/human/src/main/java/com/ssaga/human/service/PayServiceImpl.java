package com.ssaga.human.service;

import java.awt.List;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaga.human.dao.PayDao;
import com.ssaga.human.dto.EmployeeDto;

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

	@Override
	public List<EmployeeDto> empList() {
		
		return null;
	}

	@Override
	public com.ssaga.human.service.List<EmployeeDto> empList() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
