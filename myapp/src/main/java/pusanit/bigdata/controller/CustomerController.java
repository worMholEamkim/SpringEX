package pusanit.bigdata.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import pusanit.bigdata.myapp.service.ICustomerService;

@Controller
public class CustomerController {
	@Autowired
	ICustomerService custService;

	public void setCustomerService(ICustomerService custService) {
		this.custService = custService;
	}

	public void run(String name) {
		System.out.println("HelloController : " + custService.run(name));
	}
}