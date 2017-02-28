package com.gh.core.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gh.core.dao.UserDao;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@Autowired
	private UserDao userDao;
/**
 * 返回用户信息
 * @param userId
 * @param model
 * @return
 */
	@RequestMapping("/detail")
	public String detail(@RequestParam Integer userId,Model model){
		model.addAttribute("user", userDao.findByUserid(userId));
		return "core/center";
	}
	
	
}
