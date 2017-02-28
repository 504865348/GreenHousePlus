package com.gh.greenhouse.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.core.utils.daoutils.Mapper;
import com.gh.greenhouse.domain.SetupCon;

@Repository
public class SetupConDao extends BasicDao<SetupCon> {
	@Resource
	private ControlDao controlDao;

	public SetupConDao() {
		super("Setup_con", SetupCon.class);
	}

	
	/**根据设备id查找设备
	 * @param scId
	 * @return
	 */
	public SetupCon findByscId(Integer scId){
		return super.load(Cnd.where("Equip_id", "=", scId));
	}
	
	
	/**根据温室id查找设备
	 * @param ghId
	 * @return
	 */
	public List<SetupCon> findByGhId(Integer ghId){
		List<SetupCon> list = super.list(Cnd.where("GH_id", "=", ghId));
		for(SetupCon item:list){
			item.setStatus(controlDao.findByDeviceId(item.getEquip_id()));
		}
		return list;
	}
	
	/**查找机构温室表里的所有数据，因为字段是动态的所以返回Mapper
	 * @param ghId
	 * @return
	 */
	public List<Mapper> findConMapByGhId(Integer ghId){
		String originTableName = getUtil().getTbName();
		
		getUtil().setTbName("con_"+ghId);

		List<Mapper> result = getUtil().listMap(null);
		
		getUtil().setTbName(originTableName);
		
		return result;
	}
	
	/**根据温室id和类型查找室外设备，并将设备的检测元素和检测值注入
	 * @param ghId
	 * @param type
	 * @param ps 检测数据的分页信息
	 * @param pn
	 * @return
	 */
/*	public List<SetupCon> findOfOutdoorDevicesBy(Integer ghId,int ps ,int pn){
		List<SetupCon> list = super.list(Cnd.where("GH_id", "=", ghId).and("Type", "=", "2"));
		for(SetupCon item:list){
			item.setStatus(controlDao.findByDeviceId(item.getEquip_id()));
		}
		return list;
	}*/
	/**
	 * 根据类型和基地id显示设备，分页
	 * @param type
	 * @param ps
	 * @param pn
	 * @return
	 */
	public Pager<SetupCon> findByGidandtype(@RequestParam Integer type,@RequestParam Integer gid,Integer pageSize,Integer pageNumber){
		 Pager<SetupCon> list= super.listByPage(Cnd.where("GH_id", "=", gid).and("Type", "=", type).and("deleted", "=", "N"), pageSize, pageNumber);
			return list;
	}
	
	/**查找设备状态
	 * @param ghId
	 * @param pageSize
	 * @param pageNumber
	 * @return
	 */
	public Pager<SetupCon> findStatusByPage(Integer ghId,Integer pageSize,Integer pageNumber){
		Pager<SetupCon> list = listByPage(Cnd.where("ghId", "=", ghId), pageSize, pageNumber);
		for(SetupCon item:list.getList()){
			item.setStatus(controlDao.load(Cnd.where("Equip_id", "=", item.getEquip_id())));
		}
		return list;
	}
	/**
	 * 根据温室id初始化Control表，表名为con+GH_id,
	 * @param ghId
	 */
	public void initialTable(Integer ghId){
		String tableName="con_"+ghId;
		super.getUtil().createTable(tableName);
	}
	/**
	 * 根据Equip_id动态添加字段
	 * @param fieldName
	 */
	public void addColumn(String tbName,String fieldName){
	    super.getUtil().addField(tbName,fieldName);
	}
}
