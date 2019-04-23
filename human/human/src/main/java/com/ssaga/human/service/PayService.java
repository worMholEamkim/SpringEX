package com.ssaga.human.service;

import javax.servlet.http.HttpSession;

public interface PayService {

	String payLogin(String comcode, String pid, String pwd, HttpSession session);

}
