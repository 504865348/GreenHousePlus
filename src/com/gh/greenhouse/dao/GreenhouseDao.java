package com.gh.greenhouse.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.web.util.WebUtils;

import com.gh.core.dao.BasicDao;
import com.gh.core.dao.UserDao;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Element_type;
import com.gh.greenhouse.domain.Greenhouse;
import com.gh.greenhouse.domain.TypeAndElements;
@Repository
public class GreenhouseDao extends BasicDao<Greenhouse> {
	public static final String CURRENT_GREENHOUSE = "ses.currgh";
	
	@Resource
	private ShedCroplDao shedCroplDao; 
	@Resource
	private ElementDao elementDao;
	@Resource
	private SetupConDao setupConDao;
	@Resource
	private Element_typeDao element_typeDao;
	@Resource
	private CropDao cropDao;
	@Resource
	private UserDao userDao;
	
	public GreenhouseDao(){
		super("Greenhouse",Greenhouse.class);
	}

	public int setup(){
		return 0;
	}
	
	/**
	 * 根据温室Id查看温室
	 * @param id
	 * @return
	 */
	public Greenhouse findByghid(Integer ghId){
		Greenhouse data = super.load(Cnd.where("GH_id","=",ghId));
		data.setCrop(shedCroplDao.findCropByGhId(data.getGH_id()));
		return data;
	}
	
	/**根据温室管理员id查找温室和当前session中存储的温室编号查找温室
	 * @param userId
	 * @return
	 */
	public Greenhouse findByUserId(Integer userId,HttpServletRequest request){
		Integer current_gh = (Integer)WebUtils.getSessionAttribute(request, CURRENT_GREENHOUSE);
		if(null == current_gh ) return null;
		return super.load(Cnd.where("User_id", "=", 
				userId).and("GH_id", "=", current_gh));
	}
	
	/**根据温室员id加载出一个温室
	 * @param userId
	 * @return
	 */
	public Greenhouse findByUserId(Integer userId){
		return super.load(Cnd.where("User_id", "=",userId));
	}
	
	/**根据基地用户的用户id查找温室
	 * @param userId
	 * @return
	 */
	public List<Greenhouse> findByBaseUserId(Integer userId){
		return super.getUtil().listBySql("select * from Greenhouse t1 left join user t2 on t1.GH_id=t2.User_id where t2.pid=?",userId);
	}
	
	/**
	 * 根据基地id查询全部温室，分页
	 * @param baseId
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	public Pager<Greenhouse> findByBaseId(Integer baseId,Integer pageSize,Integer pageNumber){
		Pager<Greenhouse> pager=super.listByPage(Cnd.where("Base_id","=",baseId).and("deleted","=","N"), pageSize, pageNumber);
		for(Greenhouse item:pager.getList()){
			 item.setUser(userDao.findByUserid(item.getUser_id()));	 
		 }
		 return pager;
	}
	
	/**给温室注入机构和检测元素
	 * @param greenhouse
	 * @param ps
	 * @param pn
	 * @return
	 */
	public Greenhouse injectElements(Greenhouse greenhouse,int ps,int pn){
		List<Element_type> types = element_typeDao.list(Cnd.where("GH_id", "=", greenhouse.getGH_id()));
		
		List<TypeAndElements> elements = new ArrayList<TypeAndElements>();
		for(Element_type type:types){
			elements.add(elementDao.findElementsBy(greenhouse.getGH_id(), ps, pn,type.getId(),false));
		}
		
		greenhouse.setTypeAndElements(elements);
		//greenhouse.setSetupCons(setupConDao.findByGhId(greenhouse.getGH_id()));
		return greenhouse;
	}
	
	/**给温室注入机构和检测元素，并注入最新的检测数据
	 * @param greenhouse
	 * @return
	 */
	public Greenhouse injectElementsAndCurrentValue(Greenhouse greenhouse){
		List<Element_type> types = element_typeDao.list(Cnd.where("GH_id", "=", greenhouse.getGH_id()));
		
		List<TypeAndElements> elements = new ArrayList<TypeAndElements>();
		for(Element_type type:types){
			elements.add(elementDao.findElementsBy(greenhouse.getGH_id(), 1, 100,type.getId(),true));
		}
		
		greenhouse.setTypeAndElements(elements);
		return greenhouse;
	}
	
	/**给温室对象注入设备
	 * @param greenhouse
	 * @return
	 */
	public Greenhouse injectSetupCons(Greenhouse greenhouse){
		greenhouse.setSetupCons(setupConDao.findByGhId(greenhouse.getGH_id()));
		return greenhouse;
	}
	
	/**
	 * 首页根据温室数量导航
	 * @param baseId
	 * @return
	 */
	public List<Greenhouse> findByBId(Integer baseId){
		 return super.list(Cnd.where("Base_id","=",baseId));		
	}
}
