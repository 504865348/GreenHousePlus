package com.gh.core.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gh.core.dao.UserDao;
import com.gh.greenhouse.dao.ElementDao;
import com.gh.greenhouse.dao.GreenhouseDao;
import com.gh.greenhouse.dao.MonitorDao;
import com.gh.greenhouse.dao.SetupConDao;

/**页面跳转控制器
 * @author Danny
 *
 */
@Controller
@RequestMapping("/app")
public class FrontController {

	@Resource
	private UserDao userDao;
	@Resource
	private SetupConDao setupConDao;
	@Resource
	private ElementDao elementDao;
	@Resource
	private MonitorDao monitorDao;
	@Resource
	private GreenhouseDao greenhouseDao;
	@Resource
	private HttpServletRequest request;

}
