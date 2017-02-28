package com.gh.core.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.gh.core.dao.UserDao;
import com.gh.core.domain.User;


/**
 * 登陆控制器
 * @author 吴奇俊
 * 2015-10-18 下午4:15:26
 */
@Controller
@RequestMapping("/login")
public class LoginController{
	/**
	 * 登录用户session key
	 */
	public static final String ME="me";
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private HttpServletRequest request;

	/**登录页面跳转
	 * @return
	 */
	@RequestMapping(value="",method=RequestMethod.GET)
	public String login(){
		return "core/login";
		
	}
	
	/**登录表单提交
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping(value="",method=RequestMethod.POST)
	public String login(String username,String password,RedirectAttributes attributes){
		User u = userDao.login(request,username,password);
		if(null == u){
			attributes.addFlashAttribute("msg", "用户名或密码错误");
			return "redirect:login";
		}
		if(u.getUser_type()==0){
			return "redirect:stat/livedata";
		}
		if(u.getUser_type()==1){
			return "redirect:/nav/ghadmin";
		}
		if(u.getUser_type()==2){
			return "redirect:/nav/baseadmin";
		}
		if(u.getUser_type()==3){
			return "redirect:/nav/sysadmin";
		}
		return null;
		
	}
	
	/**退出登录页面跳转
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(){
		WebUtils.setSessionAttribute(request, LoginController.ME, null);
		return "redirect:/login";
	}
	
}
