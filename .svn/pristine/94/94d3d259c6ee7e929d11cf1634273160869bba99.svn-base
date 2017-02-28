package com.gh.greenhouse.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.gh.core.dao.UserDao;
import com.gh.core.domain.User;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.core.utils.daoutils.Mapper;
import com.gh.greenhouse.dao.BaseDao;
import com.gh.greenhouse.dao.ControlmodeDao;
import com.gh.greenhouse.dao.CropDao;
import com.gh.greenhouse.dao.Crop_FertDao;
import com.gh.greenhouse.dao.Crop_PestDao;
import com.gh.greenhouse.dao.FertilizerDao;
import com.gh.greenhouse.dao.GreenhouseDao;
import com.gh.greenhouse.dao.PesticidesDao;
import com.gh.greenhouse.dao.RecordDao;
import com.gh.greenhouse.dao.SetupConDao;
import com.gh.greenhouse.dao.ShedCroplDao;
import com.gh.greenhouse.dao.SoilDao;
import com.gh.greenhouse.domain.Crop;
import com.gh.greenhouse.domain.Crop_Fert;
import com.gh.greenhouse.domain.Crop_Pest;
import com.gh.greenhouse.domain.Fertilizer;
import com.gh.greenhouse.domain.Greenhouse;
import com.gh.greenhouse.domain.Pesticides;
import com.gh.greenhouse.domain.Record;
import com.gh.greenhouse.domain.ShedCrop;
import com.gh.greenhouse.domain.Soil;

@RequestMapping("/ghmgr")
@Controller
public class GhMgrController {
	
	@Autowired
	private BaseDao baseDao;
	@Autowired
	private FertilizerDao fertilizerDao;
	@Autowired
	private ControlmodeDao controlmodeDao;
	@Autowired
	private GreenhouseDao greenhouseDao;
	@Autowired
	private RecordDao recordDao;
	@Autowired
	private PesticidesDao pesticidesDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private SetupConDao setupConDao;
	@Autowired
	private Crop_FertDao crop_FertDao;
	@Autowired
	private Crop_PestDao crop_PestDao;
	@Autowired
	private ShedCroplDao shedCroplDao;
	@Autowired
	private CropDao cropDao;
	@Autowired
	private SoilDao soilDao;
	@Autowired
	private HttpSession session;
	/**
	 * 跳转到添加温室界面
	 * 
	 * @return
	 */
	@RequestMapping("/addgh")
	public String addgh() {

		return "ghmgr/baseadmin/addgh";
	}

	/**
	 * 保存温室，跳转到温室详情界面
	 * @param greenhouse
	 * @return
	 */
	@RequestMapping("/savegh")
	public String savegh(Greenhouse greenhouse, User user,
			RedirectAttributes attributes, Model model) {	
		// 获取父id
		User me = userDao.getCurrentUser(request);
		// 判断用户是否存在
		User pre=userDao.load(Cnd.where("Username", "=", user.getUsername()));
		//若存在，直接插入user_id
		if(pre!=null){
		 greenhouse.setUser_id(pre.getUser_id());
		 model.addAttribute("user", pre);
		}
		else{
		// 若不存在，创建基地管理员
		user.setUser_type(1);
		user.setPid(me.getUser_id());
		user.setDeleted("N");
		userDao.insert(user);
		User ghadmin = userDao.load(Cnd.where("username", "=",
				user.getUsername()));
		greenhouse.setUser_id(ghadmin.getUser_id());
		model.addAttribute("user", ghadmin);
		}
		// 创建温室
		greenhouse.setDeleted("N");
		greenhouse.setBase_id(baseDao.findByUserid(
				userDao.getCurrentUser(request).getUser_id()).getBase_id());
		greenhouseDao.insert(greenhouse);
		attributes.addFlashAttribute("msg", "温室创建成功，请配置设备");
		Greenhouse gh = greenhouseDao.load(Cnd.where("GH_code", "=",
				greenhouse.getGH_code()));
		// 添加模型
		
		model.addAttribute("greenhouse", gh);
		//根据温室id初始化Control表，表名为con+GH_id,
		Integer id=gh.getGH_id();
		setupConDao.initialTable(id);
		return "ghmgr/baseadmin/ghdetail";
	}

	
	/**
	 * 跳转到编辑温室界面
	 * @param ghId
	 * @param model
	 * @return
	 */
	@RequestMapping("/editgh")
	public String editgh(@RequestParam Integer ghId,Model model) {
model.addAttribute("greenhouse", greenhouseDao.findByghid(ghId));
model.addAttribute("user", userDao.findByUserid(greenhouseDao.findByghid(ghId).getUser_id()));
session.setAttribute("ghId", ghId);
		return "ghmgr/baseadmin/editgh";
	}

	/**
	 * 编辑温室
	 * @param ghId
	 * @param greenhouse
	 * @param user
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/updategh")
	public String device_update(@RequestParam Integer ghId,Greenhouse greenhouse,User user,RedirectAttributes attributes){
		userDao.update(user, Cnd.where("User_id", "=", greenhouseDao.findByghid(ghId).getUser_id()));
		greenhouseDao.update(greenhouse, Cnd.where("GH_id", "=", ghId));
		attributes.addFlashAttribute("msg","编辑成功");
		return "redirect:listgh";
		
	}
	/**
	 * 温室详情页
	 * @param ghId
	 * @param model
	 * @return
	 */
	@RequestMapping("/detailgh")
	public String ghdetail(@RequestParam Integer ghId,Model model) {
		model.addAttribute("greenhouse", greenhouseDao.findByghid(ghId));
		model.addAttribute("user", userDao.findByUserid(greenhouseDao.findByghid(ghId).getUser_id()));
		session.setAttribute("ghId", ghId);
		return "ghmgr/baseadmin/ghdetail";
	}

	/**
	 * 逻辑删除温室
	 * @param ghId
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/deletegh")
	public String sysadmin_deletebase(@RequestParam Integer ghId,RedirectAttributes attributes){
		greenhouseDao.logicDelete(Cnd.where("GH_id","=",ghId));
		attributes.addFlashAttribute( "msg","删除成功");
		return "redirect:listgh";
	}
	
	/**
	 * 显示全部温室，分页
	 * @param model
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/listgh")
	public String sysadmin_listbase(Model model,
	@RequestParam(value="ps",required=false,defaultValue="5") Integer pageSize,
	@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber
	){
		int baseId=baseDao.findByUserid(userDao.getCurrentUser(request).getUser_id()).getBase_id();
		model.addAttribute("pager", greenhouseDao.findByBaseId(baseId, pageSize, pageNumber));
		return "ghmgr/baseadmin/listgh";
	}

	/**
	 * 温室管理-控制模式-手工
	 * 
	 * @return
	 */
	@RequestMapping("/ghadmin/ctrl/manual")
	public String ctrlmodel_manaul(
			Model model,
			Integer ghId,
			@RequestParam(value = "ps", required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pageNumber) {
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = null;
		if(null == ghId){
			gh = greenhouseDao.findByUserId(u.getUser_id(),request); //
			ghId = gh.getGH_id();
		}
		else{
			gh = greenhouseDao.findByghid(ghId);
		}
		model.addAttribute("pager",
				setupConDao.findStatusByPage(ghId, pageSize, pageNumber));
		model.addAttribute("cons", setupConDao.findConMapByGhId(ghId));
		model.addAttribute("setupCons", setupConDao.findByGhId(ghId));
		model.addAttribute("gh", gh);
		return "ghmgr/ghadmin/ctrlmodel/manual";
	}
	
	/**
	 * 温室管理-控制模式-智能
	 * 
	 * @return
	 */
	@RequestMapping("/ghadmin/ctrl/smart")
	public String ctrlmodel_smart(Model model,Integer ghId) {
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = null;
		if(null == ghId){
			gh = greenhouseDao.findByUserId(u.getUser_id(),request); //
			ghId = gh.getGH_id();
		}
		else{
			gh = greenhouseDao.findByghid(ghId);
		}
		model.addAttribute("gh", gh);
		model.addAttribute("list", controlmodeDao.findByType(0));
		return "ghmgr/ghadmin/ctrlmodel/smart";
	}

	/**
	 * 温室管理-控制-设值
	 * 
	 * @return
	 */
	@RequestMapping("/ghadmin/ctrl/value_setting")
	public String ctrlmodel_value_setting(Model model,Integer ghId,
			@RequestParam(value = "ps", required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pageNumber) {
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = null;
		if(null == ghId){
			gh = greenhouseDao.findByUserId(u.getUser_id(),request); //
			ghId = gh.getGH_id();
		}
		else{
			gh = greenhouseDao.findByghid(ghId);
		}
		model.addAttribute("gh", gh);
		model.addAttribute("pager", controlmodeDao.findPageByGhId(gh.getGH_id(), pageSize, pageNumber));
		return "ghmgr/ghadmin/ctrlmodel/value-setting";
	}
	
	@RequestMapping("/ghadmin/ctrl/change-model")
	public String change_model_page(Model model,Integer ghId){
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = null;
		if(null == ghId){
			gh = greenhouseDao.findByUserId(u.getUser_id(),request); //
			ghId = gh.getGH_id();
		}
		else{
			gh = greenhouseDao.findByghid(ghId);
		}
		model.addAttribute("gh", gh);
		return "ghmgr/ghadmin/ctrlmodel/change-model";
	}
	
	@ExceptionHandler
	public String exceptionHandler(Exception e){
		return "redirect:../../login";
	}
	
	/**更换控制 模式
	 * @param modeType
	 * @param passord
	 * @return
	 */
	@RequestMapping("/ghadmin/ctrl/change_mode")
	@ResponseBody
	public Object changeMode(
			@RequestParam Integer modeType,
			@RequestParam String password){
		User u = userDao.getCurrentUser(request);
		
		String secPassword = userDao.getSecondPassword(u.getUser_id());
		if(password.equals(secPassword)){
			//更改控制模式
			Object ghId = WebUtils.getSessionAttribute(request, GreenhouseDao.CURRENT_GREENHOUSE);
			return greenhouseDao.getUtil().update(Mapper.make("control_mode", modeType).getMap(), Cnd.where("GH_id", "=", ghId));
		}
		//二级密码错误
		return false;
	}

	/**
	 * 温室管理-肥料-添加
	 * 
	 * @return
	 */
	@RequestMapping(value = "/ghadmin/fert/add", method = RequestMethod.GET)
	public String ghadmin_fert_add() {
		return "ghmgr/ghadmin/fertmgr/add";
	}

	/**
	 * 温室管理-肥料-添加表单提交
	 * 
	 * @param fertilizer
	 * @return
	 */
	@RequestMapping(value = "/ghadmin/fert/add", method = RequestMethod.POST)
	@ResponseBody
	public Object ghadmin_fert_add(Fertilizer fertilizer) {
		return fertilizerDao.insert(fertilizer);
	}

	/**
	 * 删除肥料
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/ghadmin/fert/delete", method = RequestMethod.GET)
	@ResponseBody
	public Object ghadmin_fert_delete(Integer id) {
		return fertilizerDao.logicDelete(Cnd.where("Fert_id", "=", id));
	}

	/**
	 * 温室管理-肥料-查看
	 * 
	 * @return
	 */
	@RequestMapping("/ghadmin/fert/list")
	public String ghadmin_fert_list(
			Model model,
			@RequestParam(value = "ps", required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pageNumber) {
		model.addAttribute("pager", fertilizerDao.listByPage(
				Cnd.where("deleted", "=", "N"), pageSize, pageNumber));
		return "ghmgr/ghadmin/fertmgr/list";
	}

	/**
	 * 温室管理-肥料-使用
	 * 
	 * @return
	 */
	@RequestMapping("/ghadmin/fert/use")
	public String ghadmin_fert_use(Model model,
			@RequestParam(value = "ps", required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pageNumber)
	{
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = greenhouseDao.findByUserId(u.getUser_id(),request);
		
		model.addAttribute("pager", crop_FertDao.listByPage(Cnd.where("deleted", "=", "N"), pageSize, pageNumber));
		model.addAttribute("shedCrop", shedCroplDao.findCropByGhId(gh.getGH_id()));
		model.addAttribute("fert", fertilizerDao.list());
		return "ghmgr/ghadmin/fertmgr/use";
	}
	
	/**添加肥料使用记录
	 * @param crop_Fert
	 * @return
	 */
	@RequestMapping("/ghadmin/fert/use/add")
	@ResponseBody
	public Object ghadmin_fert_use_add(Crop_Fert crop_Fert){
		crop_Fert.setDeleted("N");
		return crop_FertDao.insert(crop_Fert);
	}

	/**
	 * 温室管理-温室-详情
	 * 
	 * @return
	 */
	@RequestMapping("/ghadmin/gh/detail")
	public String ghadmin_gh_detail(Model model) {
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = greenhouseDao.findByUserId(u.getUser_id(),request);
		
		greenhouseDao.injectElements(gh, 1, 100);
		gh.setCrop(shedCroplDao.findCropByGhId(gh.getGH_id()));
		greenhouseDao.injectSetupCons(gh);
		model.addAttribute("data", gh);
		return "ghmgr/ghadmin/ghmgr/detail";
	}

	/**
	 * 温室管理-温室-概览
	 * 
	 * @return
	 */
	@RequestMapping("/ghadmin/gh/overview")
	public String ghadmin_gh_overview(Model model) {
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = greenhouseDao.findByUserId(u.getUser_id(),request);
		
		gh.setCrop(shedCroplDao.findCropByGhId(gh.getGH_id()));
		greenhouseDao.injectElements(gh, 1, 100);
		model.addAttribute("data", gh);
		model.addAttribute("pager", setupConDao.findByGhId(gh.getGH_id()));
		return "ghmgr/ghadmin/ghmgr/ghoverview";
	}
	
	/**
	 * 温室管理-温室-初始化
	 * 
	 * @return
	 */
	@RequestMapping(value="/ghadmin/gh/init",method=RequestMethod.GET)
	public String ghadmin_gh_init(Model model) {
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = greenhouseDao.findByUserId(u.getUser_id(),request);
		
		Greenhouse greenhouse = greenhouseDao.findByghid(gh.getGH_id());
		model.addAttribute("greenhouse", greenhouse);
		model.addAttribute("cropAdded", shedCroplDao.findCropByGhId(gh.getGH_id()));
		model.addAttribute("cropToAdd", cropDao.list());
		model.addAttribute("soil", soilDao.list());
		return "ghmgr/ghadmin/ghmgr/initialization";
	}
	/**提交温室初始化信息，交个作物信息来
	 * @return
	 */
	@RequestMapping(value="/ghadmin/gh/init",method=RequestMethod.POST)
	@ResponseBody
	public Object ghadmin_gh_init(ShedCrop shedCrop) {
		//update表示是否修改当前作物信息，
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = greenhouseDao.findByUserId(u.getUser_id(),request);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm");
		
		shedCrop.setCrop_no(gh.getGH_id()+""+shedCrop.getCrop_id()+sdf.format(new Date()));
		shedCrop.setCrop_time(new Date());
		shedCrop.setShed_id(gh.getGH_id());
		
		return shedCroplDao.insert(shedCrop);
	}
	
	/**温室更换作物
	 * @return
	 */
	@RequestMapping("/ghadmin/gh/changecrop")
	public String ghadmin_gh_changecrop(){
		return "ghadmin/ghmgr/changecrop";
	}
	
	/**添加温室和作物的关系
	 * @param cropIds
	 * @param ghId
	 * @return
	 */
	@RequestMapping("/ghadmin/gh/attachcrop")
	public Object attachGhCrop(@RequestParam ("cropids")Integer[] cropIds,Integer ghId){
		
		return null;
	}

	/**
	 * 温室管理-日志-添加
	 * 
	 * @return
	 */
	@RequestMapping(value = "/ghadmin/log/add", method = RequestMethod.GET)
	public String ghadmin_log_add(Model model) {
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = greenhouseDao.findByUserId(u.getUser_id(),request);
		
		model.addAttribute("shedCrop", shedCroplDao.findCropByGhId(gh.getGH_id()));
		return "ghmgr/ghadmin/logmgr/add";
	}

	/**
	 * 温室管理-日志-添加表单提交
	 * 
	 * @param record
	 * @return
	 */
	@RequestMapping(value = "/ghadmin/log/add", method = RequestMethod.POST)
	@ResponseBody
	public Object ghadmin_log_add(Record record) {
		record.setRecord_time(new Date());
		return recordDao.insert(record);
	}

	/**
	 * 温室管理-日志-查看
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/ghadmin/log/list")
	public String ghadmin_log_list(
			Model model,
			@RequestParam(value = "ps", required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pageNumber) {
		model.addAttribute("pager",
				recordDao.listByPage(Cnd.where("deleted", "=", "N"), pageSize, pageNumber));
		return "ghmgr/ghadmin/logmgr/list";
	}

	/**
	 * 温室管理-农药-添加
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/ghadmin/pestmgr/add", method = RequestMethod.GET)
	public String ghadmin_pest_add(Model model) {
		return "ghmgr/ghadmin/pestmgr/add";
	}

	@RequestMapping(value = "/ghadmin/pestmgr/add", method = RequestMethod.POST)
	@ResponseBody
	public Object ghadmin_pest_add(Pesticides pesticides) {
		return pesticidesDao.insert(pesticides);
	}

	/**
	 * 温室管理-农药-查看
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/ghadmin/pestmgr/list")
	public String ghadmin_pest_list(
			Model model,
			@RequestParam(value = "ps", required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pageNumber) {
		model.addAttribute("pager",
				pesticidesDao.listByPage(Cnd.where("deleted", "=", "N"), pageSize, pageNumber));
		return "ghmgr/ghadmin/pestmgr/list";
	}

	/**
	 * 温室管理-农药-使用
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/ghadmin/pestmgr/use")
	public String ghadmin_pest_use(Model model,
			@RequestParam(value = "ps", required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pageNumber) {
		User u = userDao.getCurrentUser(request);
		Greenhouse gh = greenhouseDao.findByUserId(u.getUser_id(),request);
		
		model.addAttribute("pager", crop_PestDao.listByPage(Cnd.where("deleted", "=", "N"), pageSize, pageNumber));
		model.addAttribute("shedCrop", shedCroplDao.findCropByGhId(gh.getGH_id()));
		model.addAttribute("pests", pesticidesDao.findList());
		return "ghmgr/ghadmin/pestmgr/use";
	}
	/**添加农药使用记录
	 * @param crop_Pest
	 * @return
	 */
	@RequestMapping(value="/ghadmin/pestmgr/use/add",method=RequestMethod.POST)
	@ResponseBody
	public Object ghadmin_pest_use_add(Crop_Pest crop_Pest){
		return crop_PestDao.insert(crop_Pest);
	}

	@RequestMapping(value="/ghadmin/soil/add",method=RequestMethod.GET)
	public String ghadmin_soil_add(){
		return "ghmgr/ghadmin/soilmgr/add";
	}
	@RequestMapping(value="/ghadmin/soil/add",method=RequestMethod.POST)
	@ResponseBody
	public Object ghadmin_soil_add(Soil soil){
		soil.setDeleted("N");
		return soilDao.insert(soil);
	}
	@RequestMapping("/ghadmin/soil/list")
	public String ghadmin_soil_list(Model model,
			@RequestParam(value = "ps", required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pageNumber){
		model.addAttribute("pager", soilDao.listByPage(Cnd.where("deleted", "=", "N"), pageSize, pageNumber));
		return "ghmgr/ghadmin/soilmgr/list";
	}
	
	@RequestMapping(value="/ghadmin/soil/update",method=RequestMethod.GET)
	public String ghadmin_soil_update(Model model,Integer soilId){
		model.addAttribute("data", soilDao.findById(soilId));
		return "ghmgr/ghadmin/soilmgr/edit";
	}
	
	@RequestMapping(value="/ghadmin/soil/update",method=RequestMethod.POST)
	@ResponseBody
	public Object ghadmin_soil_update(Soil soil){
		return soilDao.update(soil, Cnd.where("Soil_id", "=", soil.getSoil_id()));
	}
	
	@RequestMapping(value="/ghadmin/crop/add",method=RequestMethod.GET)
	public String ghadmin_crop_add(){
		return "ghmgr/ghadmin/cropmgr/add";
	}
	@RequestMapping(value="/ghadmin/crop/add",method=RequestMethod.POST)
	@ResponseBody
	public Object ghadmin_crop_add(Crop crop){
		crop.setDeleted("N");
		return cropDao.insert(crop);
	}
	@RequestMapping("/ghadmin/crop/list")
	public String ghadmin_crop_list(Model model,
			@RequestParam(value = "ps", required = false, defaultValue = "20") Integer pageSize,
			@RequestParam(value = "pn", required = false, defaultValue = "1") Integer pageNumber){
		model.addAttribute("pager", cropDao.listByPage(Cnd.where("deleted", "=", "N"), pageSize, pageNumber));
		return "ghmgr/ghadmin/cropmgr/list";
	}
}
