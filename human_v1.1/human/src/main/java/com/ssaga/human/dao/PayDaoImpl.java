package com.ssaga.human.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaga.human.dto.ContractInfoDto;
import com.ssaga.human.dto.EmployeeDto;

@Repository
public class PayDaoImpl implements PayDao {

	final String nameSpace ="com.ssaga.human.dao.PayDao";
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public String payLogin(HashMap<String, String> hmForPayLogin) {
		return sqlsession.selectOne(nameSpace+".payLogin", hmForPayLogin);
	}

	@Override
	public List<EmployeeDto> empList() {
		return sqlsession.selectList(nameSpace+".empList");
	}

	@Override
	public void empAdd(EmployeeDto employee) {
		sqlsession.insert(nameSpace+".empAdd", employee);
		
	}

	@Override
	public EmployeeDto viewEmp(String empno) {
		return sqlsession.selectOne(nameSpace+".empView", empno);
	}

	@Override
	public EmployeeDto empforUpd(HashMap<String, String> hmForempUpd) {
		
		return sqlsession.selectOne(nameSpace+".empforUpd", hmForempUpd);
	}

	@Override
	public void updEmployee(EmployeeDto employee) {
		sqlsession.update(nameSpace+".empUpd", employee);
		
	}

	@Override
	public void empUpd2(EmployeeDto employee) {
		sqlsession.update(nameSpace+".empUpd2", employee);
		
	}

	@Override
	public void empDel(EmployeeDto employee) {
		sqlsession.update(nameSpace+".empDel", employee);
		
	}

	@Override
	public void saveFileEmpInDB(EmployeeDto employee) {
		sqlsession.insert(nameSpace+".saveFileEmpInDB", employee);
		
	}

	@Override
	public void empCntrctUpd(EmployeeDto employee) {
		sqlsession.update(nameSpace+".empCntrctUpd", employee);
		
	}

	@Override
	public List<ContractInfoDto> contractInfo(HashMap<String, String> hmForContract) {
		return sqlsession.selectList(nameSpace+".contractInfo", hmForContract);	}


}
