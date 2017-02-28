package com.gh.greenhouse.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gh.core.dao.UserDao;
import com.gh.core.domain.User;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Mapper;
import com.gh.greenhouse.dao.BaseDao;
import com.gh.greenhouse.dao.CropDao;
import com.gh.greenhouse.dao.ElementDao;
import com.gh.greenhouse.dao.Element_typeDao;
import com.gh.greenhouse.dao.GreenhouseDao;
import com.gh.greenhouse.dao.MonitorDao;
import com.gh.greenhouse.dao.SetupConDao;
import com.gh.greenhouse.dao.ShedCroplDao;
import com.gh.greenhouse.domain.Element_type;
import com.gh.greenhouse.domain.Greenhouse;

@Controller
@RequestMapping("/stat")
public class StatisticController {

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
	@Resource
	private BaseDao baseDao;
	@Resource
	private CropDao cropDao;
	@Resource
	private ShedCroplDao shedCroplDao;
	@Resource
	private Element_typeDao element_typeDao;
	/**实时数据页面
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonGenerationException 
	 */
	@RequestMapping("/livedata")
	public String livedata(Model model,
			@RequestParam(value="ps",required=false,defaultValue="20") Integer pageSize,
			@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber,
			Integer ghId) throws JsonGenerationException, JsonMappingException, IOException{
		User u = userDao.getCurrentUser(request);
		
		//如果是访客则访问其pid指定的用户
		
		Greenhouse gh = null;
		if(null == ghId){
			if(u.isVisitor()){
				User parentUsr = userDao.findByUserid(u.getPid());
				gh = greenhouseDao.findByUserId(parentUsr.getUser_id()); 
			}
			else{
				gh = greenhouseDao.findByUserId(u.getUser_id(),request); //
			}
			ghId = gh.getGH_id();
		}
		//if(u.getUser_type())用户类型判断，若不是则跳转至登录
		
		//查找温室的设备setup_con，查找设备的检测元素element和检测值monitor
		
		//如果是基地管理员，则查找属于这个基地的所有温室
		//给温室注入作物信息，室内检测数据等
			
		else{
			gh = greenhouseDao.findByghid(ghId);
		}
		gh.setCrop(shedCroplDao.findCropByGhId(gh.getGH_id()));
		greenhouseDao.injectElementsAndCurrentValue(gh);
		
		List<Element_type> types = element_typeDao.findByGhId(ghId);
		model.addAttribute("types", types);
		model.addAttribute("cons", setupConDao.findConMapByGhId(ghId));
		model.addAttribute("setupCons", setupConDao.findByGhId(ghId));
		model.addAttribute("gh", gh); 
		model.addAttribute("ghjson", new ObjectMapper().writeValueAsString(gh)); 
		
		return "statistic/livedata";
	}
	
	/**历史数据页面
	 * @param model
	 * @param type outdoor和indoor之分
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonGenerationException 
	 */
	@RequestMapping(value="/historydata")
	public String historydata(Model model,Integer elementType,Integer ghId,Integer elementId
			,@RequestParam(value="ps",required=false,defaultValue="20") Integer pageSize,
			@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber,
			String startTime,String endTime) throws JsonGenerationException, JsonMappingException, IOException{
		User u = userDao.getCurrentUser(request);
		if(null == ghId) ghId = greenhouseDao.findByUserId(u.getUser_id(),request).getGH_id(); //
		
		/*Greenhouse house = greenhouseDao.findByUserId(ghId);
		model.addAttribute("houses", house);*/
		
		List<Element_type> types = element_typeDao.findByGhId(ghId);
/*		if(elementType == null){
			elementType = types.get(0).getId();
		}*/
		/*if(elementId!=null && !"".equals(elementId)){
			Element element = elementDao.findByElementId(elementId);
			model.addAttribute("data", element); 
			
		}*/
		
		model.addAttribute("types", types);
		model.addAttribute("elementId", elementId);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		model.addAttribute("ghId", ghId);
		model.addAttribute("elementType", elementType);
		
		if(null == elementType){
			return "statistic/historydata";
		}
		
		Pager<Mapper> mons = monitorDao.findPageByElementType(elementType,elementId, ghId, pageSize, pageNumber, startTime, endTime);
		ObjectMapper mapper = new ObjectMapper();
		model.addAttribute("jsonData",mapper.writeValueAsString(mons.getList()));
		model.addAttribute("eles", elementDao.findByElementType(elementType));
		model.addAttribute("mons",mons);
		
		return "statistic/historydata";
	}
/*	@RequestMapping(value="/historydata",method=RequestMethod.GET)
	public String historydata(Model model,String type,Integer ghId){
		User u = userDao.getCurrentUser(request);
		
		List<Greenhouse> houses = greenhouseDao.findByBaseUserId(u.getUser_id());
		List<SetupCon> devices = null;
		if("outdoor".equals(type)){
			devices = setupConDao.list(Cnd.where("GH_id", "=", ghId).and("Type", "=", "2"));
		}
		else{
			devices = setupConDao.list(Cnd.where("GH_id", "=", ghId).and("Type", "=", "1"));
		}
		model.addAttribute("houses", houses);
		return "statistic/historydata";
	}*/
	
	/**查找数据，如果elementId是null则返回所有的elementIds，否则返回数据
	 * @return
	 */
	@RequestMapping("/livedataAjax")
	@ResponseBody
	public Object livedataAjax(
			Model model,
			Integer ghId,
			Integer elementType,
			Integer elementId){
		User u = userDao.getCurrentUser(request);
		if(null == ghId) ghId = greenhouseDao.findByUserId(u.getUser_id(),request).getGH_id();
		
		if(elementId == null && elementType!=null){
			return elementDao.findByElementType(elementType);
		}
		
		return monitorDao.findPageByElementType(elementType,elementId, ghId, 1, 1, null, null);
	}
}
