package com.gh.greenhouse.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.greenhouse.domain.Element;
import com.gh.greenhouse.domain.TypeAndElements;
@Repository
public class ElementDao extends BasicDao<Element> {
	@Resource
	private MonitorDao monitorDao; 
	@Resource
	private Element_typeDao element_typeDao;
	
	public ElementDao(){
		super("Element",Element.class);
	}

	/**根据温室id查找检测元素
	 * @param ghId
	 * @return
	 */
	public List<Element> findByGhId(Integer ghId){
		return super.list(Cnd.where("Shed_id", "=", ghId));
	}
	public List<Element> findByElementType(Integer elementType){
		return super.list(Cnd.where("Element_type", "=", elementType));
	}
	
	/**查找设备的检测参数，并将检测值注入
	 * @param deviceId
	 * @return
	 */
/*	public Element findByDeviceId(Integer deviceId,int ps,int pn){
		Element ele = super.load(Cnd.where("Device_id", "=", deviceId));
		if(null == ele) return null;
		ele.setDatas(monitorDao.findPageByElementId(ele.getElement_id(), ps, pn,null,null));
		return ele;
	}*/
	/**
	 * 查找设备的检测参数
	 * @param deviceId
	 * @return
	 */
	public Element findByDeviceIdOnly(Integer deviceId){
		return super.load(Cnd.where("Device_id", "=", deviceId));
	}
	
	/**根据温室id和查找检测元素，并将值插入
	 * @param ghId
	 * @param ps
	 * @param pn
	 * @return
	 */
	public List<Element> findElementsBy(Integer ghId,int ps ,int pn){
		List<Element> list = super.list(Cnd.where("Shed_id", "=", ghId));
		/*for(Element item:list){
			//item.setDatas(monitorDao.findPageByElementId(item.getElement_id(), ps, pn,null,null));
		}*/
		return list;
	}
	/**查找元素
	 * @param ghId
	 * @param ps
	 * @param pn
	 * @param elementType
	 * @param needData 是否需要显示最新数据
	 * @return
	 */
	public TypeAndElements findElementsBy(Integer ghId,int ps ,int pn,int elementType,boolean needData){
		TypeAndElements elements = new TypeAndElements();
		elements.setElement_type(element_typeDao.findById(elementType));
		
		List<Element> list = super.list(Cnd.where("Shed_id", "=", ghId).and("Element_type", "=", elementType));
		if(needData){
			for(Element item:list){
				item.setCurrent_value((monitorDao.findLatestData(item.getElement_type(), item.getElement_id(), ghId)));
			}
		}
		elements.setElements(list);
		return elements;
	}
	/**
	 * 根据温室id显示element
	 * @param ghId
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	public Pager<Element> findByGid(@RequestParam Integer ghId,Integer pageSize,Integer pageNumber){
		 return super.listByPage(Cnd.where("Shed_id", "=", ghId).and("deleted", "=", "N"), pageSize, pageNumber);
	}
	/**
	 * 根据元素Id查找元素
	 * @param elementId
	 * @return
	 */
	public Element findByElementId(@RequestParam Integer elementId){
		return super.load(Cnd.where("Element_id", "=", elementId));
	}
	/**查找制定元素的数据，分页，带条件
	 * @param elementId
	 * @param ps
	 * @param pn
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public Element findDataByElementId(Integer elementId,int ps ,int pn,String startTime,String endTime){
		Element ele = super.load(Cnd.where("Element_id", "=", elementId));
		//ele.setDatas(monitorDao.findPageByElementId(elementId, ps, pn, startTime, endTime));
		return ele;
	}
	/**
	 * 根据ghid和element_type创建表
	 * @param ghId
	 * @param maxId
	 */
	public void initialTable(Integer ghId,Integer maxId){
		String tableName="mon_"+ghId+"_"+maxId;
		super.getUtil().createTable(tableName);
	}
	/**
	 * 添加elementid添加字段
	 * @param tbName
	 * @param fieldName
	 */
	public void addColumn(String tbName,String fieldName){
	    super.getUtil().addField(tbName,fieldName);
	}
}
