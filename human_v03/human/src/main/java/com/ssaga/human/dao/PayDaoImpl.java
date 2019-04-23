package com.ssaga.human.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<EmployeeDto> empList(){
		return sqlsession.selectList(nameSpace+" .empList");
	}
}
