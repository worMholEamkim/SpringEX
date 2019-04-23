package com.ssaga.human.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public EmployeeDto empforupd(HashMap<String, String> hmForUpd) {
		return sqlsession.selectOne(nameSpace+".empView", hmForUpd);
	}

	@Override
	public EmployeeDto viewEmp(String empno) {
		return sqlsession.selectOne(nameSpace+".empView", empno);
	}

	@Override
	public void updEmployee(EmployeeDto employee) {
		sqlsession.update(nameSpace+".empUpd", employee);
	}

	@Override
	public void updEmployee2(EmployeeDto employee) {
		sqlsession.update(nameSpace+".empUpd2", employee);
	}


	@Override
	public void empDel(EmployeeDto employee) {
		sqlsession.delete(nameSpace+".delEmployee", employee);
	}

	@Override
	public void saveFileEmpInDB(EmployeeDto employee) {
		sqlsession.selectOne(nameSpace+".saveFileEmpInDB", employee);
	}

}
