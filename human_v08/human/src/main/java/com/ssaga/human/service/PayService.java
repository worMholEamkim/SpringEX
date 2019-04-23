package com.ssaga.human.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.ssaga.human.dto.EmployeeDto;

public interface PayService {

	String payLogin(String comcode, String pid, String pwd, HttpSession session);

	List<EmployeeDto> empList();

	void empAdd(EmployeeDto employee);

	EmployeeDto viewEmp(String empno);

	EmployeeDto empforUpd(String empno, HttpSession session);

	void updEmployee(EmployeeDto employee);

	void empUpd2(EmployeeDto employee);

	void empDel(EmployeeDto employee);

	String addEmpFile(EmployeeDto employee, MultipartFile empFile, HttpSession session);

	void empCntrctUpd(EmployeeDto employee);





}
