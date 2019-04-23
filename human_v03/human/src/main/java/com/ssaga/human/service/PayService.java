package com.ssaga.human.service;



import javax.servlet.http.HttpSession;

import com.ssaga.human.dto.EmployeeDto;

public interface PayService {

	String payLogin(String comcode, String pid, String pwd, HttpSession session);

	List<EmployeeDto> empList();

}
