package com.ssaga.human.mongo;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssaga.human.dao.MongoUserDao;
import com.ssaga.human.dto.MongoUser;


@Controller
@RequestMapping(value = "/testMongo")
public class MongoController {

	@Autowired
	MongoUserDao mongoUserDao;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String mongoList(Model model) {
		List <MongoUser> list = mongoUserDao.list();
		model.addAttribute("list", list);
		return "/pages/userList";
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String mongoAdd() {
		return "/pages/userForm";
	}
	
	@RequestMapping(value = "/adding", method = RequestMethod.POST)
	public String mongoAdding(MongoUser user) {
		mongoUserDao.adding(user);
		return "redirect:list";
	}

	@RequestMapping(value = "/upd", method = RequestMethod.GET)
	public String mongoUpdate(@RequestParam("id") String id, Model model) {
		MongoUser user = mongoUserDao.findByid(id);
		model.addAttribute("user", user);
		return "/pages/userFormUpd";
	}
	
	@RequestMapping(value = "/upding", method = RequestMethod.POST)
	public String mongoUpding(MongoUser user) {
		mongoUserDao.Upding(user);
		return "redirect:list";
	}

	@RequestMapping(value = "/dlt", method = RequestMethod.GET)
	public String mongodDelete(@RequestParam("id") String id) {
		MongoUser user = mongoUserDao.findByid(id);
		mongoUserDao.remove(user);
		return "redirect:list";
	}
}
