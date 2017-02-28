package com.gh.greenhouse.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gh.greenhouse.dao.BaseDao;

@RequestMapping("/sysmgr")
@Controller
public class SystemMgrController {
	
	@Resource
	private BaseDao baseDao;

	@RequestMapping("/index")
	public String index(Model model,
			@RequestParam(value="ps",required=false,defaultValue="20") Integer pageSize,
			@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber){
		
		model.addAttribute("pager", baseDao.listByPage(null, pageSize, pageNumber));
		return "sysmgr/sysIndex";
	}
}
