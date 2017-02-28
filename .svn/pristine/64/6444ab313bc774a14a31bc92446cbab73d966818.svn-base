package com.gh.greenhouse.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gh.core.dao.UserDao;
import com.gh.core.domain.User;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.dao.BaseDao;
import com.gh.greenhouse.dao.GreenhouseDao;
import com.gh.greenhouse.domain.Base;



@Controller
@RequestMapping("/basemgr")
public class BaseMgrController {
    
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private BaseDao baseDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private GreenhouseDao ghDao;
	
	/**
	 * 基地管理员首页，显示全部温室，分页
	 * @param baseId
	 * @param model
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/baseadmin")
	public String baseadminIndex(@RequestParam Integer baseId,Model model,
			@RequestParam(value="ps",required=false,defaultValue="20") Integer pageSize,
			@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber){
		model.addAttribute("pager", ghDao.findByBaseId(baseId, pageSize, pageNumber));
		return "basemgr/baseadmin/baseIndex";
	}
	/**
	 * 基地管理员查看基地详情
	 * @param userId
	 * @param model
	 * @return
	 */
	@RequestMapping("/baseadmin/detailbase")
	public String baseadmin_detail(@RequestParam Integer userId,Model model){
		model.addAttribute("base",baseDao.findByUserid(userId));
		return "basemgr/baseadmin/baseDetail";
	}
	/**
	 * 跳转到添加基地界面
	 * @return
	 */
	@RequestMapping("/sysadmin/addbase")
	public String sysadmin_addbase(){
		return "basemgr/sysadmin/addbase";
	}
	/**
	 * 系统管理员创建基地
	 * 同时创建基地管理员
	 * @return
	 */
	@RequestMapping("/sysadmin/savebase")
	public String sysadmin_savebase(Base base,User user,RedirectAttributes attributes){
		//获取父id
		User me = userDao.getCurrentUser(request);
		//创建基地管理员
		user.setUser_type(2);
		user.setPid(me.getUser_id());
		user.setDeleted("N");
		userDao.insert(user);
		User sysadmin=userDao.load(Cnd.where("username", "=", user.getUsername()));	
		//创建基地	
		base.setDeleted("N");
		base.setUser_id(sysadmin.getUser_id());
		baseDao.insert(base);
		attributes.addFlashAttribute("msg","添加成功");	
		return "redirect:listbase";
	}
	
    /**
     * 跳转到编辑基地界面
     * @return
     */
	@RequestMapping("/sysadmin/editbase")
	public String sysadmin_editbase(@RequestParam Integer baseId,Model model){
		model.addAttribute("base", baseDao.findByBaseid(baseId));
		model.addAttribute("user", userDao.findByUserid(baseDao.findByBaseid(baseId).getUser_id()));
		return "basemgr/sysadmin/editbase";
	}
	/**
	 * 更新基地信息
	 * @param baseId
	 * @param userId
	 * @param base
	 * @param user
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/sysadmin/updatebase")
	public String sysadmin_updatebase(@RequestParam Integer baseId,@RequestParam Integer userId,Base base,User user,RedirectAttributes attributes){
		        userDao.update(user, Cnd.where("User_id","=", userId));				
				baseDao.update(base,Cnd.where("Base_id", "=",baseId ));
				attributes.addFlashAttribute("msg","编辑成功");
				return "redirect:listbase";
	}
	
	/**
	 * 逻辑删除基地，同时删除基地管理员
	 * @param baseId
	 * @return
	 */
	@RequestMapping("/sysadmin/deletebase")
	public String sysadmin_deletebase(@RequestParam Integer baseId,RedirectAttributes attributes){
		baseDao.logicDelete(Cnd.where("Base_id","=",baseId));
		userDao.logicDelete(Cnd.where("User_id", "=", baseDao.load(Cnd.where("Base_id","=",baseId)).getUser_id()));
		attributes.addFlashAttribute("msg","删除成功");
		return "redirect:listbase";
	}
	
	/**
	 * 显示全部基地，分页
	 * @param model
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/sysadmin/listbase")
	public String sysadmin_listbase(Model model,
	@RequestParam(value="ps",required=false,defaultValue="5") Integer pageSize,
	@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber
	){
		model.addAttribute("pager", baseDao.listBase(pageSize, pageNumber));
		return "sysmgr/sysIndex";
	}
	
	
	
}
