package com.gh.greenhouse.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.dao.ModelBaseDao;
import com.gh.greenhouse.domain.ModelBase;

@Controller
@RequestMapping("/modellib")
public class ModellibController {
	
	@Resource
	private ModelBaseDao mbDao;
    //作物模型
	/**
	 * 列表显示模型，分页
	 * @param model
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/crop/list")
	public String cropmodel_list(Model model,
			@RequestParam(value="ps",required=false,defaultValue="5") Integer pageSize,
			@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber){
		
		model.addAttribute("pager", mbDao.listByType(3, pageSize, pageNumber));
		
		return "modellibmgr/cropmodel/list";
	}
	/**
	 * 添加模型
	 * @return
	 */
	@RequestMapping("/crop/add")
	public String cropmodel_add(){
		return "modellibmgr/cropmodel/add";
	}
	/**
	 * 保存模型
	 * @param modelbase
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/crop/save")
	public String cropmodel_save(ModelBase modelbase,RedirectAttributes attributes){
		modelbase.setMonitor_type(3);
		modelbase.setDeleted("N");
		mbDao.insert(modelbase);
		attributes.addFlashAttribute("msg","添加成功");	
		return "redirect:list";
	}
	/**
	 * 编辑模型
	 * @param Model_id
	 * @param models
	 * @return
	 */
	@RequestMapping("/crop/edit")
	public String cropmodel_edit(@RequestParam Integer Model_id,Model model){
		model.addAttribute("modelbase",mbDao.findByModelid(Model_id));
		return "modellibmgr/cropmodel/edit";
	}
	/**
	 * 更新模型
	 * @param Model_id
	 * @param modelbase
	 * @return
	 */
	@RequestMapping("/crop/update")
	public String cropmodel_update(@RequestParam Integer Model_id,ModelBase modelbase,RedirectAttributes attributes){
		mbDao.update(modelbase, Cnd.where("Model_id","=", Model_id));
		attributes.addFlashAttribute("msg","编辑成功");
		return "redirect:list";
	}
	
	/**
	 * 删除模型
	 * @param Model_id
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/crop/delete")
	public String cropmodel_delete(@RequestParam Integer Model_id,RedirectAttributes attributes){
		mbDao.logicDelete(Cnd.where("Model_id", "=", Model_id));
		attributes.addFlashAttribute("msg","删除成功");
		return "redirect:list";
	}
	
	
	//调控成本模型
	/**
	 * 列表显示模型，分页
	 * @param model
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/ctrlcost/list")
	public String ctrlcostmodel_list(Model model,
			@RequestParam(value="ps",required=false,defaultValue="5") Integer pageSize,
			@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber){
		model.addAttribute("pager", mbDao.listByType(0, pageSize, pageNumber));
		return "modellibmgr/ctrlcostmodel/list";
	}
	/**
	 * 添加模型
	 * @return
	 */
	@RequestMapping("/ctrlcost/add")
	public String ctrlcostmodel_add(){
		return "modellibmgr/ctrlcostmodel/add";
	}
	/**
	 * 保存模型
	 * @param modelbase
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/ctrlcost/save")
	public String ctrlcostmodel_save(ModelBase modelbase,RedirectAttributes attributes){
		modelbase.setMonitor_type(0);
		modelbase.setDeleted("N");
		mbDao.insert(modelbase);
		attributes.addFlashAttribute("msg","添加成功");	
		return "redirect:list";
	}
	/**
	 * 编辑模型
	 * @param Model_id
	 * @param model
	 * @return
	 */
	@RequestMapping("/ctrlcost/edit")
	public String ctrlcostmodel_edit(@RequestParam Integer Model_id,Model model){
		model.addAttribute("modelbase",mbDao.findByModelid(Model_id));
		return "modellibmgr/ctrlcostmodel/edit";
	}
	/**
	 * 更新模型
	 * @param Model_id
	 * @param modelbase
	 * @return
	 */
	@RequestMapping("/ctrlcost/update")
	public String ctrlcostmodel_update(@RequestParam Integer Model_id,ModelBase modelbase,RedirectAttributes attributes){
		mbDao.update(modelbase, Cnd.where("Model_id","=", Model_id));
		attributes.addFlashAttribute("msg","编辑成功");
		return "redirect:list";
	}
	/**
	 * 删除模型
	 * @param Model_id
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/ctrlcost/delete")
	public String ctrlcostmodel_delete(@RequestParam Integer Model_id,RedirectAttributes attributes){
		mbDao.logicDelete(Cnd.where("Model_id", "=", Model_id));
		attributes.addFlashAttribute("msg","删除成功");
		return "redirect:list";
	}

	//环境模型
	/**
	 * 列表显示模型，分页
	 * @param model
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/env/list")
	public String envmodel_list(Model model,
			@RequestParam(value="ps",required=false,defaultValue="5") Integer pageSize,
			@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber){
		
		model.addAttribute("pager", mbDao.listByType(2, pageSize, pageNumber));
		return "modellibmgr/envmodel/list";
	}
	/**
	 * 添加模型
	 * @return
	 */
	@RequestMapping("/env/add")
	public String envmodel_add(){
		return "modellibmgr/envmodel/add";
	}
	/**
	 * 保存模型
	 * @param modelbase
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/env/save")
	public String envmodel_save(ModelBase modelbase,RedirectAttributes attributes){
		modelbase.setMonitor_type(2);
		modelbase.setDeleted("N");
		mbDao.insert(modelbase);
		attributes.addFlashAttribute("msg","添加成功");	
		return "redirect:list";
	}
	/**
	 * 编辑模型
	 * @param Model_id
	 * @param model
	 * @return
	 */
	@RequestMapping("/env/edit")
	public String envmodel_edit(@RequestParam Integer Model_id,Model model){
		model.addAttribute("modelbase",mbDao.findByModelid(Model_id));
		return "modellibmgr/envmodel/edit";
	}
	/**
	 * 更新模型
	 * @param Model_id
	 * @param modelbase
	 * @return
	 */
	@RequestMapping("/env/update")
	public String envmodel_update(@RequestParam Integer Model_id,ModelBase modelbase,RedirectAttributes attributes){
		mbDao.update(modelbase, Cnd.where("Model_id","=", Model_id));
		attributes.addFlashAttribute("msg","编辑成功");
		return "redirect:list";
	}
	
	/**
	 * 删除模型
	 * @param Model_id
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/env/delete")
	public String envmodel_delete(@RequestParam Integer Model_id,RedirectAttributes attributes){
		mbDao.logicDelete(Cnd.where("Model_id", "=", Model_id));
		attributes.addFlashAttribute("msg","删除成功");
		return "redirect:list";
	}
	
	
	
	
	//优化控制模型
	/**
	 * 列表显示模型，分页
	 * @param model
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	@RequestMapping("/optctrl/list")
	public String optctrlmodel_list(Model model,
			@RequestParam(value="ps",required=false,defaultValue="5") Integer pageSize,
			@RequestParam(value="pn",required=false,defaultValue="1") Integer pageNumber){
		
		model.addAttribute("pager", mbDao.listByType(1, pageSize, pageNumber));
		return "modellibmgr/optctrlmodel/list";
	}
	/**
	 * 添加模型
	 * @return
	 */
	@RequestMapping("/optctrl/add")
	public String optctrlmodel_add(){
		return "modellibmgr/optctrlmodel/add";
	}
	/**
	 * 保存模型
	 * @param modelbase
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/optctrl/save")
	public String optctrlmodel_save(ModelBase modelbase,RedirectAttributes attributes){
		modelbase.setMonitor_type(1);
		modelbase.setDeleted("N");
		mbDao.insert(modelbase);
		attributes.addFlashAttribute("msg","操作成功");	
		return "redirect:list";
	}
	/**
	 * 编辑模型
	 * @param Model_id
	 * @param model
	 * @return
	 */
	@RequestMapping("/optctrl/edit")
	public String optctrlmodel_edit(@RequestParam Integer Model_id,Model model){
		model.addAttribute("modelbase", mbDao.findByModelid(Model_id));
		return "modellibmgr/optctrlmodel/edit";
	}
	/**
	 * 更新模型
	 * @param Model_id
	 * @param modelbase
	 * @return
	 */
	@RequestMapping("/optctrl/update")
	public String optctrlmodel_update(@RequestParam Integer Model_id,ModelBase modelbase,RedirectAttributes attributes){
		mbDao.update(modelbase, Cnd.where("Model_id","=", Model_id));
		attributes.addFlashAttribute("msg","编辑成功");
		return "redirect:list";
	}
	
	/**
	 * 删除模型
	 * @param Model_id
	 * @param attributes
	 * @return
	 */
	@RequestMapping("/optctrl/delete")
	public String optctrlmodel_delete(@RequestParam Integer Model_id,RedirectAttributes attributes){
		mbDao.logicDelete(Cnd.where("Model_id", "=", Model_id));
		attributes.addFlashAttribute("msg","删除成功");
		return "redirect:list";
	}
	
}
