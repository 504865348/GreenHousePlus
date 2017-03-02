package com.gh.core.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gh.core.dao.UserDao;
import com.gh.core.domain.User;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Base;

@RequestMapping("/user")
@Controller
public class UserController {
	@Autowired
	private HttpServletRequest request;
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
	
	@RequestMapping(value="/change", method = RequestMethod.POST)
	@ResponseBody
	public Object changeMode(
			@RequestParam String oldPass,
			@RequestParam String newPass
			){
		System.out.println("用户的password为"+oldPass +newPass );
		User u = userDao.getCurrentUser(request);
		System.out.println("用户的id为"+u.getUser_id());
		String firPassword = userDao.getFirstPassword(u.getUser_id());
		if(oldPass.equals(firPassword)){
			System.out.println(oldPass.equals(firPassword));
			return  userDao.updatePass(u.getUser_id(),newPass);
		}
		//二级密码错误
		return false;
	}
}
