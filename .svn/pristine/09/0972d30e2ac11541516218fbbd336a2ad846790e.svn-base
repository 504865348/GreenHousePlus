package com.gh.greenhouse.dao;

import org.springframework.stereotype.Repository;

import com.gh.core.dao.BasicDao;
import com.gh.core.utils.Pager;
import com.gh.core.utils.daoutils.Cnd;
import com.gh.core.utils.daoutils.Mapper;
import com.gh.core.utils.daoutils.Strings;
import com.gh.greenhouse.domain.Monitor;

@Repository
public class MonitorDao extends BasicDao<Monitor> {

	public MonitorDao() {
		super("Monitor", Monitor.class);
	}

	/**根据检测元素查找检测数据，分页
	 * @param elementType
	 * @param elementId
	 * @param ghId
	 * @param pageSize
	 * @param pageNumber
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public Pager<Mapper> findPageByElementType(
			Integer elementType,
			Integer elementId,
			Integer ghId,
			Integer pageSize,
			Integer pageNumber,
			String startTime,
			String endTime
	){
		Cnd param = Cnd.where()
				;
		if(Strings.isNotBlank(startTime)){
			param = param.and("control_time", ">=", startTime);
		}
		if(Strings.isNotBlank(endTime)){
			param = param.and("control_time", "<=", endTime);
		}
		param = param.desc("control_time");
		String orignTableName = super.getUtil().getTbName();
		
		super.getUtil().setTbName("mon_"+ghId+"_"+elementType);
		Pager<Mapper> result = null;
		if(elementId != null){
			result = super.listMapByPage(new String[]{"eleid_"+elementId,"control_time","id"},param,pageSize, pageNumber);
		}
		else{
			result = super.listMapByPage(param, pageSize, pageNumber);
		}
		
		
		super.getUtil().setTbName(orignTableName);
		return result;
	}
	
	/**查找最新的数据
	 * @param elementType
	 * @param elementId
	 * @param ghId
	 * @return
	 */
	public Double findLatestData(Integer elementType,
			Integer elementId,
			Integer ghId){
		
		String orignTableName = super.getUtil().getTbName();
		
		super.getUtil().setTbName("mon_"+ghId+"_"+elementType);
		
		Mapper value = super.getUtil().loadMap(new String[]{"eleid_"+elementId},Cnd.where().desc("control_time"));
		
		super.getUtil().setTbName(orignTableName);
		
		return (Double)value.getMap().get("eleid_"+elementId);
	}
}
