package com.ssaga.human.dao;

import java.util.List;

import com.ssaga.human.dto.MongoUser;

public interface MongoUserDao {

	List<MongoUser> list();

	void adding(MongoUser user);

	MongoUser findByid(String id);

	void remove(MongoUser user);

	void upding(MongoUser user);


}
