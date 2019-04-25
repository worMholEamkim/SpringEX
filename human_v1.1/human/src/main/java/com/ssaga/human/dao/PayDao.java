package com.ssaga.human.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.ssaga.human.dto.ContractInfoDto;
import com.ssaga.human.dto.EmployeeDto;

public interface PayDao {

	String payLogin(HashMap<String, String> hmForPayLogin);

	List<EmployeeDto> empList();

	void empAdd(EmployeeDto employee);

	EmployeeDto viewEmp(String empno);

	EmployeeDto empforUpd(HashMap<String, String> hmForempUpd);

	void updEmployee(EmployeeDto employee);

	void empUpd2(EmployeeDto employee);

	void empDel(EmployeeDto employee);

	void saveFileEmpInDB(EmployeeDto employee);

	void empCntrctUpd(EmployeeDto employee);

	List<ContractInfoDto> contractInfo(HashMap<String, String> hmForContract);

	
}
