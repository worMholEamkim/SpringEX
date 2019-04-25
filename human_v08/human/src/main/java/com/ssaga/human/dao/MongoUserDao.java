package com.ssaga.human.dao;

import java.util.List;

import com.ssaga.human.dto.MongoUser;

public interface MongoUserDao {

	List<MongoUser> list();


	MongoUser findByid(String id);

	void remove(MongoUser user);



	void adding(MongoUser user);


	void Upding(MongoUser user);

}
