package com.gh.greenhouse.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.gh.core.dao.UserDao;
import com.gh.core.domain.User;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.dao.BaseDao;
import com.gh.greenhouse.dao.GreenhouseDao;
import com.gh.greenhouse.domain.Greenhouse;

@Controller
@RequestMapping("/nav")
public class NavigateController {

	@Resource
	private BaseDao baseDao;
	@Resource
	private UserDao userDao;
	@Resource
	private HttpServletRequest request;
	@Resource
	private GreenhouseDao greenhouseDao;
	
	
	/**系统管理员首页
	 * @return
	 */
	@RequestMapping("/sysadmin")
	public String sysadmin(){
		return "navigate/sysadmin/index";
	}
	
	/**
	 * 基地管理员首页
	 * @return
	 */
	@RequestMapping("/baseadmin")
	public String baseadmin(Model model){
		int baseId=baseDao.findByUserid(userDao.getCurrentUser(request).getUser_id()).getBase_id();
		model.addAttribute("list", greenhouseDao.findByBId(baseId));
		return "navigate/baseadmin/index";
	}
	
	/**
	 * 温室管理员首页
	 * @return
	 */
	@RequestMapping("/ghadmin")
	public String ghadmin(Model model,Integer gh){
		User u = userDao.getCurrentUser(request);
		Greenhouse house = null;
		if(gh == null){
			house = greenhouseDao.findByUserId(u.getUser_id());
			gh = house.getGH_id();
		}
		else{
			house = greenhouseDao.findByghid(gh);
		}
		WebUtils.setSessionAttribute(request, GreenhouseDao.CURRENT_GREENHOUSE, gh);
		model.addAttribute("ghs", greenhouseDao.list(new String[]{"GH_id","GH_code"}, Cnd.where("User_id", "=", u.getUser_id())));
		model.addAttribute("control_mode", house.getControl_mode());
		return "navigate/ghadmin/index";
	}
	
	/**
	 * 访客首页
	 * @return
	 */
	@RequestMapping("/visitor")
	public String visitor(){
		return "navigate/visitor/index";
	}
}
