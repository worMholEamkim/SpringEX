package com.ssaga.human.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.ssaga.human.dto.EmployeeDto;

public interface PayDao {

	String payLogin(HashMap<String, String> hmForPayLogin);

	List<EmployeeDto> empList();

	void empAdd(EmployeeDto employee);

	EmployeeDto viewEmp(String empno);

	EmployeeDto empforupd(HashMap<String, String> hmForUpd);

	void updEmployee(EmployeeDto employee);

	void updEmployee2(EmployeeDto employee);

	void empDel(EmployeeDto employee);

	void saveFileEmpInDB(EmployeeDto employee);




}
