package com.gh.greenhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.dao.ElementDao;
import com.gh.greenhouse.dao.Element_typeDao;
import com.gh.greenhouse.dao.SetupConDao;
import com.gh.greenhouse.domain.Element;
import com.gh.greenhouse.domain.Element_type;
import com.gh.greenhouse.domain.SetupCon;
@RequestMapping("/device")
@Controller
public class DeviceController {
	
		@Autowired
		private SetupConDao scDao;
		@Autowired
		private ElementDao elementDao;
		@Autowired
		private Element_typeDao element_typeDao;
		
		//-------------------------------------------控制设备-----------------------------------------
		
		/**
		 * 跳转到创建设备界面
		 * @return
		 */
		@RequestMapping("/gh/device_create")
		public String device_create(){
			return "ghmgr/baseadmin/device/gh/create";
		}
		/**
		 * 保存设备
		 * @param device
		 * @param attributes
		 * @return
		 */
		@RequestMapping("/gh/device_save")
		public String device_save(@RequestParam Integer ghId,SetupCon device,RedirectAttributes attributes){
			device.setGH_id(ghId);
			device.setDeleted("N");
			scDao.insert(device);
			//获取最大ID
			String maxId ="eqipid_"+scDao.getUtil().loadObjectBySql("select max(Equip_id) from setup_con", Integer.class);
			//添加con+ghId表中的字段
			String tbName="con_"+ghId;
			scDao.addColumn(tbName,maxId);
			attributes.addFlashAttribute("msg", "添加成功");
			return "redirect:device_list?ghId="+ghId+"";
		}
		/**
		 * 挑战到编辑设备界面
		 * @param deviceId
		 * @param model
		 * @return
		 */
		@RequestMapping("/gh/device_edit")
		public String device_edit(@RequestParam Integer deviceId,Model model){
			model.addAttribute("Setup_Con", scDao.findByscId(deviceId));
			return "ghmgr/baseadmin/device/gh/edit";
		}
		/**
		 * 编辑设备
		 * @param deviceId
		 * @param sc
		 * @param attributes
		 * @return
		 */
		@RequestMapping("/gh/device_update")
		public String device_update(@RequestParam Integer deviceId,SetupCon sc,RedirectAttributes attributes){
			scDao.update(sc, Cnd.where("Equip_id", "=", deviceId));
			attributes.addFlashAttribute("msg","编辑成功");
			int ghId=scDao.findByscId(deviceId).getGH_id();
			return "redirect:device_list?ghId="+ghId+"";
			
		}
		/**
		 * 删除设备
		 * @param deviceId
		 * @param attributes
		 * @return
		 */
		@RequestMapping("/gh/device_delete")
		public String device_delete(@RequestParam Integer deviceId,RedirectAttributes attributes){
			int ghId=scDao.findByscId(deviceId).getGH_id();
			scDao.logicDelete(Cnd.where("Equip_id", "=", deviceId));
			attributes.addAttribute("msg", "删除成功");
			return "redirect:device_list?ghId="+ghId+"";
		}
		/**
		 * 列表显示设备，分页
		 * @param model
		 * @param pageSize
		 * @param pageNumber
		 * @param type
		 * @return
		 */
		@RequestMapping("/gh/device_list")
		public String device_list(Model model,
				@RequestParam(value="ps",required=false,defaultValue="20") Integer pageSize,
				@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber,
				@RequestParam Integer ghId){
			model.addAttribute("pager", scDao.findByGidandtype(0,ghId, pageSize, pageNumber));	
			return "ghmgr/baseadmin/device/gh/list";
		}
		
		//-------------------------------------------检测参数-----------------------------------------
		/**
		 * 跳转到创建设备界面
		 * @return
		 */
		@RequestMapping("/element/device_create")
		public String element_create(){
			return "ghmgr/baseadmin/device/element/create";
		}
		/**
		 * 保存设备
		 * @param device
		 * @param attributes
		 * @return
		 */
		@RequestMapping("/element/device_save")
		public String element_save(@RequestParam Integer ghId,Element element,Element_type type,RedirectAttributes attributes){	
			//根据type和ghid判断
			Element_type element_type=element_typeDao.load(Cnd.where("Type", "=", type.getType()).and("GH_id", "=", ghId));
			//如果element_type表中没有该类型，插入新type
			if(element_type==null){
			type.setGH_id(ghId);
			element_typeDao.insert(type);
			int maxId =(Integer) element_typeDao.getUtil().loadObjectBySql("select max(id) from Element_type", Integer.class);
			//保存检测元素
			element.setElement_type(maxId);
			element.setDeleted("N");
			element.setShed_id(ghId);
			elementDao.insert(element);
			//创建con+ghId+type表
			elementDao.initialTable(ghId, maxId);
			//插入第一条数据
			String tbName="mon_"+ghId+"_"+maxId;
			String elementId ="eleid_"+elementDao.getUtil().loadObjectBySql("select max(Element_id) from element", Integer.class);
			elementDao.addColumn(tbName, elementId);
			}
			//如果该类型已经存在，则直接插入id
			else{
				element.setElement_type(element_type.getId());
				element.setDeleted("N");
				element.setShed_id(ghId);
				elementDao.insert(element);
				//在con+ghId+type表中插入新的字段
				Integer eid=element_type.getId();
				String tbName="mon_"+ghId+"_"+eid;
				String elementId ="eleid_"+elementDao.getUtil().loadObjectBySql("select max(Element_id) from element", Integer.class);
				elementDao.addColumn(tbName, elementId);
			}
			//跳转
			attributes.addFlashAttribute("msg", "添加成功");
			return "redirect:device_list?ghId="+ghId+"";

		}
		/**
		 * 挑战到编辑设备界面
		 * @param deviceId
		 * @param model
		 * @return
		 */
		@RequestMapping("/element/device_edit")
		public String element_edit(@RequestParam Integer elementId,Model model){
			model.addAttribute("Element", elementDao.findByElementId(elementId));
			return "ghmgr/baseadmin/device/element/edit";
		}
		/**
		 * 编辑设备
		 * @param deviceId
		 * @param sc
		 * @param attributes
		 * @return
		 */
		@RequestMapping("/element/device_update")
		public String element_update(@RequestParam Integer elementId,Element element,RedirectAttributes attributes){
			elementDao.update(element, Cnd.where("Element_id", "=", elementId));
			attributes.addFlashAttribute("msg","编辑成功");
			int ghId=elementDao.findByElementId(elementId).getShed_id();
			return "redirect:device_list?ghId="+ghId+"";
			
		}
		/**
		 * 删除设备
		 * @param deviceId
		 * @param attributes
		 * @return
		 */
		@RequestMapping("/element/device_delete")
		public String element_delete(@RequestParam Integer elementId,RedirectAttributes attributes){
			elementDao.logicDelete(Cnd.where("Element_id", "=", elementId));
			attributes.addAttribute("msg", "删除成功");
			int ghId=elementDao.findByElementId(elementId).getShed_id();
			return "redirect:device_list?ghId="+ghId+"";
		}
		/**
		 * 列表显示设备，分页
		 * @param model
		 * @param pageSize
		 * @param pageNumber
		 * @param type
		 * @return
		 */
		@RequestMapping("/element/device_list")
		public String element_list(Model model,
				@RequestParam(value="ps",required=false,defaultValue="20") Integer pageSize,
				@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber,
				@RequestParam Integer ghId){
			model.addAttribute("pager", elementDao.findByGid(ghId, pageSize, pageNumber));
			return "ghmgr/baseadmin/device/element/list";
			
		}
		
		
		
}

