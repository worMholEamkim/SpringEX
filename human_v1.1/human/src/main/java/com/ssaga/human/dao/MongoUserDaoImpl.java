package com.ssaga.human.dao;

import java.util.List;

import org.springframework.data.mongodb.MongoDbFactory;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.SimpleMongoDbFactory;
import org.springframework.stereotype.Repository;

import com.mongodb.MongoClient;
import com.ssaga.human.dto.MongoUser;

@Repository
public class MongoUserDaoImpl implements MongoUserDao {
	
	private static final String CollectionName = "ssaga";
	
    MongoDbFactory mongoDbFactory = new SimpleMongoDbFactory(new MongoClient("localhost", 27017),"ssaga");
    MongoTemplate mongoTemplate = new MongoTemplate(mongoDbFactory);

    @Override
	public List<MongoUser> list() {
		return mongoTemplate.findAll(MongoUser.class, CollectionName);
	}

	@Override
	public void adding(MongoUser user) {
		if (!mongoTemplate.collectionExists(MongoUser.class)){
			mongoTemplate.createCollection(MongoUser.class);
		}
		mongoTemplate.insert(user,CollectionName);
		
	}

	@Override
	public MongoUser findByid(String id) {
		return mongoTemplate.findById(id, MongoUser.class, CollectionName);
	}

	@Override
	public void remove(MongoUser user) {
		mongoTemplate.remove(user, CollectionName);
		
	}

	@Override
	public void upding(MongoUser user) {
		mongoTemplate.save(user, CollectionName);
		
	}
    
}
