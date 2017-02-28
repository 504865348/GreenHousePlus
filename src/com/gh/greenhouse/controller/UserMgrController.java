package com.gh.greenhouse.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gh.core.dao.UserDao;
import com.gh.core.domain.User;
import com.gh.core.utils.daoutils.Cnd;

@RequestMapping("/usermgr")
@Controller
public class UserMgrController {
	
	@Resource
	private UserDao userDao;
	@Resource
	private HttpServletRequest request;
	
	/**
	 * 跳转到添加访客界面
	 * @return
	 */
	@RequestMapping("/add")
	public String add(){
		return "usermgr/add";
	}
	/**
	 * 保存访客
	 * @param user
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/save")
	public String save(User user,RedirectAttributes attributes){
		User me = userDao.getCurrentUser(request);
		user.setUser_type(0);
		user.setPid(me.getUser_id());
		user.setDeleted("N");
		userDao.insert(user);
		attributes.addFlashAttribute("msg", "添加成功");
		return "redirect:list";
	}
	/**
	 * 跳转到编辑界面
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping("/edit")
	public String edit(@RequestParam Integer userId,Model model){
		model.addAttribute("user", userDao.findByUserid(userId));
		return "usermgr/edit";
	}
	/**
	 * 编辑用户
	 * @param userId
	 * @param user
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/update")
	public String save(@RequestParam Integer userId,User user,RedirectAttributes attributes){
        userDao.update(user, Cnd.where("User_id","=", userId));	
        attributes.addFlashAttribute("msg","编辑成功");
		return "redirect:list";
	}
	/**
	 * 逻辑删除访客
	 * @param userId
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(@RequestParam Integer userId,RedirectAttributes attributes){
		userDao.logicDelete(Cnd.where("User_id", "=", userId));
		attributes.addAttribute("msg", "删除成功");
		return "redirect:list";
	}
	/**
	 * 显示下级用户，分页
	 * @param model
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/list")
	public String list(Model model,
			@RequestParam(value="ps",required=false,defaultValue="5") Integer pageSize,
			@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber){
		int pid=(int)userDao.getCurrentUser(request).getUser_id();
		model.addAttribute("pager", userDao.listByPid(pid, pageSize, pageNumber));
		return "usermgr/list";
	}
}
